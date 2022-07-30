---
layout: post
title: Processing Large Datasets On AWS Using Ruby, Rails and SideKiq
tags: ["ruby", "rails", "sidekiq", "aws"]
category: rails
---
{% pizzaforukraine  %}

Two days ago I did a data processing task which previously took me a week -- overnight.  I did this using the following technology stack:

* Ruby
* Rails
* AWS
* Sidekiq

My platform was a "cluster" of 40 m3.large AWS ec2 instances.  We all see a lot about cloud computing and using AWS / Azure / Google Cloud to do these types of large jobs but you rarely see what I think of as the hard details:

* How do you get code deployed?
* How do you fix bugs?
* How do you deal with Capistrano failures when a box isn't available and Capistrano doesn't give you good feedback?
* How do you get things coordinated?
* How do you kick off the overall job?
* How do you know when it is done?

In this blog post I'm going to illustrate how I managed these things.  I'm not saying that what I did was the only way to do this.  I'm not even saying that what I did was the best way to do this.  What I am saying is that this is a practical approach to ad hoc large data processing jobs using a ruby / rails / sidekiq approach.  And I'm going to describe how I did this without using cloud formation or another large, complicated AWS or third party API.  The only external tool I used was Ansible and even that was optional.

For obvious reasons of company confidentiality I can't go into the details of what the job was.  Suffice it to say:

* a "lot" of data had to be "processed"
* the actions were time consuming including deliberate sleep calls to avoid being blocked on the remote end
* about 35,000 discrete data items needed to be processed.  With sleep calls at a randomized 10 to 15 seconds between each call that's 350,000 to 525,000 seconds in aggregate compute time (less if threaded but too many threads and we get blocked)

So, with that said, here's how I went about this:

* build an ec2 instance as a template
* deploy the current code onto it
* test
* make an image
* launch the job on the template box
* launch more copies of the image

Each of these is described below.

My thanks go out to [Nick](http://www.nickjanetakis.com/) who was a consultant on this and paired on it throughout the process.  I also have to say thank you to [Mike Perham](http://www.mikeperham.com) who built [Sidekiq](http://www.sidekiq.org) which is at the heart of this.  

# Step 1 - Build an EC2 "Template" Instance

The first step is that like with everything AWS you need an instance.  Picking the right instance type isn't a topic that I'm going to cover here.  I did know that I needed a reduced thread count so I wasn't terribly worried about memory.  We had already arranged with Amazon for up to 200 m3.large instances so that's what I went with.  I didn't worry terribly about whether not not I had the perfect instance type -- I just used what was available.  

A m3.large is 7.5 gb of RAM and 8 gigs of storage so that's perfectly fine for a Rails app of even large size.

After I created the box I provisioned to run my Rails app as [per all the things I've written about using Ansible](https://fuzzygroup.github.io/blog/category.html#ansible).

Once we get this machine built out we're going to be using it as a template for making more machines later hence my referring to this as a "template" instance.

# Step 2 - Deploy the Current Code Base with Capistrano

The next step was to get my code base onto the box using Capistrano.  I just added this box to my ~/.ssh/config file and then dropped the hostname into my config/deploy/production.rb file and did a normal deploy.

# Step 3 - Test, Test, Test

At this point we have a single instance running our rails application.  We need to make very, very sure that this is working correctly because our next step is to make an **image** of this instance and then use AWS to launch N copies of the image.  Here's what you want to test:

* connectivity to your database
* connectivity to your redis
* that the job process code works
* that sidekiq works
* that your thread count is tuned properly
* that sidekiq starts on boot

This last point, that sidekiq starts on boot, is the key thing that you need to ascertain.  Since sidekiq is what's going to run our jobs and we don't want to manually ssh into each machine, we need a way for the job to start.  If sidekiq starts on boot then job processing begins automatically when the machine starts up.  

The only real way to verify this is:

    /sbin/reboot
    log back into machine
    ps auwwx | grep side

If you see sidekiq running then you have things configured correctly and sidekiq is starting on boot.

# Step 4 - Make an Image

At this point you know that things work and you might be thinking - "Ok I now create a bunch more boxes; provision them and deploy with capistrano."  That's absolutely correct from a classical hosting perspective and absolutely wrong in a cloud environment.  The far easier, far faster approach is to make an *image*. An image is simply a full disk copy of the instance that you can use to replicate the machine.  If you're an old school PC guy then think of this as ghosting the machine.  Where installing things from scratch or even provisioning from ansible takes hours or minutes, cloning takes only a few minutes and then AWS can launch your instance in parallel so 40 machines might come up in just a minute or two.  

On your EC2 instance list select the instance and then on the Actions menu select Image, Create Image.  You'll need to give it a name and the more descriptive, the better  It will take a minute or two but Amazon will make it just fine.

Note: Making an instance shuts down the machine fully to make sure that any open files are backed up.  Keep this in mind since you'll need to re-login to the machine for Step 5.

# Step 5 - Launch the Job Using Sidekiq and Re-test to be Sure

At this point you're ready to actually launch the job using sidekiq and start processing on one instance.  You can do this with the Rails console or a Rake task.  I prefer a rake task. Here's what my rake task looked like:

    task :some_large_job => :environment do
      search_urls = MiscClass.large_urls_collection
      search_urls.each do |search_url|
        MiscCkassWorker.perform_async(search_url)
      end
    end

That built a redis queue and gave each method to sidekiq as an asynchronous call to be processed.  Check your sidekiq log file to make sure that things are going ok.  

**NOTE:** If You find that there are changes you need to make then you'll need to re-create the image as per Step 4.

As long as things are looking fine then it is time for Step 6 -- launching more copies of the image.

# Step 6 - Launch N More Copies of the Image

The final step is to launch more copies of the image.  Because the job is already queued into redis and running, as soon as you launch any more instances the copy of sidekiq which runs on boot will start pulling jobs and processing them.  

Launch an instance the way you create any instance, only this time you'll select that you want to make the instance from "My AMIs"] and then pick the image that you created in Step 4.  You can then tell AWS how many copies of the image you want made.  I specified 40 and then it is the normal AWS instance creation options like security groups and such.  Sadly all of these options aren't defined solely in the instance itself.

Note: The AWS command line tools or ansible code can be used to automate this further.

# Step 7 - Make Your Wife a Margarita

Well you can celebrate how you want but that's what I did.  I checked the sidekiq queue the next morning and it was at 0.  I checked the database and we had generated 2,500 new records which was about what I expected.

# Epiphany - Realize You're Making an Appliance!

I'm writing this blog post now having done this a dozen times or more. What finally made all this click in my head is the realization that what I'm doing here is making an *appliance* or actually a *farm* of appliances. An appliance is a tool which does one thing and does it well.  If you think about what we've done here is that we've made a ruby appliance in the form of an AWS image which eats data and (presumably) excretes some type of database record.

# Circling Back to The Hard Questions Mentioned Earlier

At the start of this piece I mentioned a number of hard questions like deployment, bug fixing, etc.  Each of these is addressed below.

* How do you get code deployed?  Capistrano is currently our tool for code deployment.  If we need to get a code fix onto the boxes we built off the template we add the ec2 host name into our SSH config and then just do a deploy.  We are currently writing a simple deployer in Ansible to make deploy easier and more integral with the entire process.  Hopefully I'll be able to open source that at some point.  Yes we looked at [Anistrano](https://github.com/ansistrano/deploy) but Anistrano lacks critical rails features like bundle install which I find to be an absolute show stopper on using it.
* How do you fix bugs?  We try very hard to test up front to avoid having to fix bugs on a long running job.  We streamlined our testing and focused hard on it before the jobs began deliberately to minimize bugs.
* How do you deal with Capistrano failures when a box isn't available and Capistrano doesn't give you good feedback?  This remains an issue.  When Capistrano fails on a multiple box deploy it often isn't clear why and Capistrano is specifically designed to stop when a single box in a deploy fails.  This contrasts nicely with Ansible which is specifically designed to continue despite failing.
* How do you get things coordinated?  Coordination is always, always hard.  I have some interesting ideas on management tools for pulling this together but it isn't time yet to implement them.
* How do you kick off the overall job?  We use a Rake task which is my default for automation and is documented above.
* How do you know when it is done? We don't have a great answer yet on this.   Again I have some interesting ideas but we're not yet at the implementation stage yet. 


