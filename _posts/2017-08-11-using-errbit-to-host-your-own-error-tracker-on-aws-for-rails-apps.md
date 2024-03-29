---
layout: post
title: Using Errbit To Host Your own Error Tracker on AWS for Rails Apps
category: aws
tags: ["rails", "aws", "errbit"]
description: A hosted error tracking service is a great development tool but at $29+ per month, they can be expensive if what you're building is just a side project.  Here I document how to install the Errbit project on an AWS instance using Docker.
---
{% pizzaforukraine  %}

In this tutorial, I walk you through using [the Errbit project](https://github.com/errbit/errbit), an open source error tracker to host your own error tracker.  Errbit is a competitor to [HoneyBadger](http://www.honeybadger.io), [BugSnag](http://www.bugsnagcom/), [AirBrake](http://www.airbrake.io) and other similar hosted error tracking tools that generally cost $29 to $49 / month or more.  Using Errbit means you only pay for infrastructure capacity and end up with a solution you can maintain yourself.

I've written about HoneyBadger [previously](http://fuzzyblog.io/blog/containers/2016/08/26/in-the-world-of-containers-honeybadger-will-reign-supreme-bye-bye-airbrake.html) and it really is an excellent, excellent tool but I'm cheap and I wanted to experiment with an open source project that I've known about for years and never had the opportunity.  Although Errbit really is excellent, I found the getting started documentation lacking hence this post.

I initially tried to get this running on Heroku but that resulted in what I termed [Heroku Fail](http://fuzzyblog.io/blog/fail/2017/08/08/utter-and-complete-heroku-fail.html).

# Step 1: Getting it Running Locally Using Docker

Errbit is a modern Rails app and it requires: 

* Rails
* Mongo

The easiest way to get this running locally is to just pull down the docker-compose.yml file from the github repo and use docker-compose to run it.  If you don't have Docker installed then you need to [install it now](http://www.docker.com/) for development and on your server for production use.  After that:

    mkdir errbit
    cd errbit
    wget https://github.com/errbit/errbit/blob/master/docker-compose.yml
    docker-compose up 

Once that is running, in a separate terminal window you need to bootstrap the installation and generate an admin user.  Do that with: 

     docker-compose exec errbit bundle exec rake errbit:bootstrap

The default errbit port is 8080 and you can access it by going to http://localhost:8080 where you can use the credentials you generated by bootstrapping it to log in.  

Once you've logged in, you need to add your app by clicking on the Add a new App button and then setting: 

* app name
* github repo
* issue tracker
* notification service

Once this is done, Errbit will generate you instructions for what to add to your Gemfile and what to configure in the errbit.rb initializer.  Generally this looks something like this:

    # Require the airbrake gem in your App.
    # ---------------------------------------------
    #
    # Ruby - In your Gemfile
    # gem 'airbrake', '~> 5.0'
    #
    # Then add the following to config/initializers/errbit.rb
    # -------------------------------------------------------

    Airbrake.configure do |config|
      config.host = 'http://localhost:8080'
      config.project_id = 1 # required, but any positive integer works
      config.project_key = '2020e526a09c78462f0f9d45010efc6c'

      # Uncomment for Rails apps
      # config.environment = Rails.env
      # config.ignore_environments = %w(development test)
    end

If you want to test Errbit's integration then you can use this rake task:

    rake airbrake:test
    
Once you've confirmed that this works, you can proceed to Step 2 and move it a server.

# Step 2: Moving it to a Server

Installing Errbit on a docker enabled server really is exactly the same as you did above.  Here's the quick recap:

1.  Log into your server.
2.  Make an errbit directory where you want it.
3.  wget https://raw.githubusercontent.com/errbit/errbit/master/docker-compose.yml
4.  Run **docker-compose up** 
5.  In another terminal window, run **docker-compose exec errbit bundle exec rake errbit:bootstrap** and make note of the credentials.

At this point you have an http service running errbit on port 8080 which your AWS security group likely isn't configured for and that brings us to step 3.

# Step 3: AWS Configuration

Our goal in this step is to configure a domain name like errbit.foo.com where foo.com is your base domain name.  I'm assuming that you are using the standard AWS tools including Route 53 for DNS and an ALB for load balancing.  Here are the things we need to do to make this work on AWS: 

1. Create a dns name for it.
2. Open a security group port for it.
3. Add it to our load balancer.
4. Add it to our monitoring tool

## Creating a DNS Name for It

Here are the steps to follow:

1.  Go into AWS console for Route 53.
2.  Select your main domain name, the "foo.com" from above.
3.  Select Create Record Set.
4.  In the name field enter errbit and then choose that it is type A and that it is an alias.
5.  In the alias target select your load balancer.
6.  Click the Create button.

This has created the domain name errbit.foo.com and assigned it to your load balanced AWS stack.  

## Opening a Security Group Port

Your AWS security group is really nothing more than a firewall and to let traffic through you need to expose a hole for the port 8080.

1.  Go into the AWS console for EC2 instances.
2.  Select Security Groups from the left hand pane.
3.  Click the Inbound tab and then click the Edit button.
4.  Scroll all the way down to the bottom and click Add Rule.
5.  Enter 8080 into the Port Range field as a custom TCP rule accessible to everywhere and then click the Save button.

## Adding Errbit to Your AWS ALB Load Balancer

At this point we just need to add Errbit to our AWS load balancer.  Please note that if you aren't using a load balancer then at this point you would actually be done but since I have one, I should go through all the way to the end.

The first step is to define a Target Group for your load balancer.  This allows you to map a service on a given port to an AWS instance.

1. Go into the AWS console for EC2 instances.
2. Select Target Groups from the left hand pane.
3. Click the Create Target Group button.
4. Enter errbit as the Target group name and specify /robots.txt as the health check path and then click Create.

Once you have a Target Group then you need to add an actual Target for the group to serve traffic to:

1.  Select the errbit Target Group in the list of target groups on the top.
2.  Select the Targets tab on the bottom.
3.  Click the Edit button.
4.  **IMPORTANT**: This next step is confusing so please pay attention.  You are now adding from a list on the bottom of the screen to a list on the top and then saving your work with a button on the bottom.  Honestly this is kind of a *shite show* as far as UI design goes but it does work; it is just tricky and unintuitive.
5.  Select your instance where errbit is installed from the list of instances on the bottom and then check its box on the far left.  Enter 8080 in the port field and then click the Add to registered button.  
6.  Now click the Save button.

You now have both a target group and a target which means you can now create a load balancer rule to process the traffic.

1.  Go into the AWS console for EC2 instances.
2.  Select Load Balancers from the left hand pane
3.  Select your load balancer from the list of load balancers at the top.
4.  Select Listeners from the bottom grouping of tabs.
5.  Out of the box, Errbit only supports http not https so on the http listener select View/edit rules.
6.  Select the + icon to add a rule.
7.  At the top of the load balancer select the Insert Rule link.
8.  Add errbit.foo.com (make sure you specify your correct base domain) to the Host field in the **IF** section of the rule.
9.  Select your target group from the Forward to section of the **THEN** section of the rule.
10. Click the Save button.

# Conclusion

At this point you should goto your url, something like http://errbit.foo.com/ and you should get a login screen where you can use the credentials you generated earlier.

Your first tasks now need to be:

1.  Add yourself as a user so your email address is supported for notifications (note I still need to configure email sending and that will happen but likely in a later blog post).
2.  Add any other team members.
3.  You need to add all of your applications to Errbit and then configure your applications accordingly.
4. Use the Rake task above to test each of your applications and verify that they are connected to errbit.

# If You Need to Learn Docker

All my Docker knowledge came from [Nick Janetakis' Dive into Docker course](https://diveintodocker.com/) and he does a great job teaching about Docker.  Strongly recommended.