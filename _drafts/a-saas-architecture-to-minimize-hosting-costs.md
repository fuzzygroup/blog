---
layout: post
title: An AWS SAAS Architecture to Minimize Hosting Costs
category: AWS
tags: ["hyde", "saas", "rails", "software_engineering"]
---
My last AWS bill was well over $6,000 -- per **month**.  I've managed to cut it down pretty dramatically by being, well, **less stupid** and in the process I've learned quite a bit:

* Even a t2.micro is actually expensive when its a full time dynamic instance -- $105.12 / year roughly (0.012 per hour)
* The bigger the instance the more you are charged
* The more storage volumes you happen to have lying around the more you are charged

None of these are rocket science observations -- as I said I mostly reduced my costs by being less stupid.

Now that bill mentioned above is for a large legacy app which was originally built for a classical data center and then was brute force pushed onto AWS -- no rethink, no rewrite, etc.  

I'm in the conceptual design stage of a side project -- it might not amount to anything or it might be mildly successful (I was going to type *wildly* but I think that's unlikely).  But it occurs to me that since I have a clean slate structure in front of me, I can actually *design* to minimize costs.  So here are my constraints for building a SAAS app in 2017 based on what I care about:

* **AWS**.  I remain firmly committed to AWS as a platform.  At this point in my life AWS is approaching the status of a constant.  I know there are cheaper solutions but there aren't better solutions.
* **Minimal Hosting Costs**.  I don't ever -- in my life -- want to see a hosting bill that approaches a more than comfortable living wage in America.
* **Instance Isolation**.  I'm so damn sick of security issues that it makes me want to llama.  I'd really like very customer running in an isolated stack / server / container / whatever.
* **Data Isolation**.  Same.  I don't ever want to have to bother with "this migration will take 24 hours to run so I'm not going to bother with it"; I want the ability to have each customer's data separate from every other customer's data.  I learned this lesson from [Matt](https://fuzzygroup.github.io/blog/startup/2016/09/01/what-matt-mullenweg-taught-me.html).  I learned this less from Chris O'Meara at [StreamSend](http://www.streamsend.com/) where I worked on large scale email marketing tools.  Time to apply it here.
* **Database Backups**.  I have systems that I have run for years that I haven't backed up -- ever.  I know that's heretical but it can be done.  Still it makes me feel *dirty*.  I should probably avoid that this time.
* **No Idling Boxes**.  The history of Internet development has generally been one of idled resources - you can't anticipate load well so you over build.  Not only is that dumb but it is both costly and energy inefficient.  Not doing it this time around.
* **Debuggability**.  I am so, so, so tired of debugging problems where the log data for user 1 is interleaved with the log data for users 2 thru 1000.  Wouldn't it be absolutely delightful to have all of a user's data in one damn place?

I know some people out there are thinking: **Lambda**.  Not a chance -- I'm a full stack Ruby / Rails / Elixir / Phoenix guy and that isn't going to change.  I suspect I'd leave the industry before I tried a significant server side development project with JavaScript in an asynchronous fashion.

# SAAS Economics 101 When You are a Solo Entrepreneur

I am, once again, a solo entrepreneur -- I don't have any intentions of taking funding, seeking funding, walking the alleys of [Sand Hill Road](https://en.wikipedia.org/wiki/Sand_Hill_Road), darkening the halls of silicon valley's various and sundry funding sources.  Now don't get me wrong, I was treated very well by capital sources the last time I did this but times are different now: 

* Infrastructure costs are markedly less than they used to be.  Even AWS which is the most expensive of the cloud hosting options is still incredibly affordable.
* My technical skills are much, much better.  I don't or hopefully don't need technical assistance; time will tell.  My big weakness has always been devops and clearly my [Ansible](https://fuzzygroup.github.io/blog/category.html#ansible) / [AWS](https://fuzzygroup.github.io/blog/aws.html) work has addressed that.  I've been very deliberately addressing this technical deficiency for some time now.
* This is a paid service from day 1.  Even my personal account will be paid to force development of the recurring billing front end.  It will almost certainly be [Stripe](https://stripe.com/) rather than [BrainTree](https://www.braintreepayments.com/) this time around but that's ok.

**Note**: I understand that one of the very real reasons for taking on capital is marketing / business building.  This time around I am building a service that I personally want.  Hopefully people other than myself feel the same way; I think they will.

So what is the very essence of SAAS Economics when you are a solo entrepreneur?  Well, in my mind, it is very, very simple:

> Everything you spend comes out of **your own pocket**.  An inefficient architecture? Well that is $$$ out of your kids college fund (remember them?).  Watch every dime, every nickel, every penny.

This time around I intend to be so damn cheap that I bloody well squeak.  In particular I want to make a profit on **every single account** from **Day 1**.  Here's what that means:

1.  If a t2.micro is the minimum instance I want to use (and, yes, I'm aware of the CPU issues on the whole t2 class of instances) then that means that if the instance is *continually running* I need to charge more than 105.12 per year for an account.
2.  There will be overhead that needs to get allocated across all accounts so that $105.12 isn't actually the minimum.
3.  Use of the standard set of services that startups use like MailChimp, New Relic, Exception Monitoring, etc all raise the cost I'd need to charge particularly when there are only a few signups as things always are at the beginning.  If I need a particular service then I'm going to have to build it myself or find it from the Open Source world and run it myself.

You'll notice that I emphasized *continually running* in point #1 above and that's at the heart of the internal infrastructure I'm building.  I'm looking at SAAS apps and a dynamically provisioned architecture where a node that a paying user needs is built **on demand** from an image.  Deploy will basically consist of creating an instance, deploying code onto it, imaging it and then shutting it down.  The next user in will get a new instance created from that image.  As long as the user's persistent data is stored separately from this and their database connection is generated dynamically then that 0.012 / hour cost metric above should apply.  So if a user uses the service for 10 hours per month then the cost is 10 * 0.012 + the fixed overhead.

## What is the Fixed Overhead?

So the fixed overhead essentially boils down to three things: 

* A persistent web presence aka a web site.  This is going to be written in Rails; actually it is a key part of the architecture so it is already written.  Initially this can be a t2.micro instance.  
* Data storage.  This is going to be a MySQL / MariaDB server.  If I properly define the storage as an external volume in AWS I could run the db server on the same instance as the web site.  This box isn't ever going down anyway.
* A worker box.  For this product there will be a need for on going job execution.  I suspect I'll be using [Sidekiq](http://www.sidekiq.org) at least initially

I'm a very, very, very strong believer that you run one and only one Ruby code base per instance.  [Rails Machine](http://www.railsmachine.com) taught me this back in the day and I detoured for a long time into the dreadful world of server side RVM.  I've thankfully recovered from that and now I'll never, ever do it again.  Without server side RVM then I'm limited to one Ruby code base per server so we now have fixed overhead costs of: 

* Web Presence - 105.12
* Worker - 105.12
* Storage Volume; Hard to compute

For now let's call the fixed overhead cost of the business say $250 per year.  That should likely cover storage, Route 53 DNS and some level of traffic.  

## But Ruby is Slow

You are so, so damn right about this.  In nearly 30 years of computing Ruby is the first *language* that I actually fell in love with; I am now going into my second decade in this long term relationship and I still love it.  And that's why I'm prototyping this in Ruby / Rails.  But I have a pretty clearly defined api that I can substitute Elixir in for when the intersection between gems I need ([RMagick](http://rmagick.rubyforge.org/)) and [Elixir](http://elixir-lang.org/) and my personal Elixir skills intersect.  I hope to be attending the Elixir conference circuit this year to help address my skills.

# A Challenge for Those Reading

So let me place a challenge out there -- if you're planning a 2016 side project then have you thought and thought hard about how **cheaply** you can run it?  If you are cutting an all new code base in 2017 then you are likely in a position to not make your traditional assumptions about cost and heavy weight architecture.  Once I posed the question in my head: *How cheaply can I do this?* then it absolutely crystalized my thinking along the right lines.

For me I think the right cost assumptions are: 

* Eliminate expensive instance costs
* Eliminate continuously running instances
* Minimize overhead

For whatever you are planning to build in 2017 then I suspect these will be different for you but there is likely a sweet spot for cost reduction.