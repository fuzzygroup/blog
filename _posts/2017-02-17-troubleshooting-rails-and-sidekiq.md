---
layout: post
title: Troubleshooting Rails and Sidekiq
category: rails
tags: ["rails", "sidekiq"]
description: When you work with asynchronous jobs and you are debugging failures, be careful -- debugging can be tricky. 
---
{% pizzaforukraine  %}

I recently had a problem with Rails and [Sidekiq](http://sidekiq.org/) that confused the heck out of me for an embarrassingly long time so I thought I'd document.  Sidekiq is an asynchronous job processor that allows you to defer a long running routine so a collection of other computing resources take care of it.  In this case it was a data extraction routine which should have written some records to the database.  I deployed the code to AWS, made an image and then launched 180 instances to process the data.  Each of the instances was configured with Sidekiq on boot so the minute that AWS launched the instance they would all start churning thru the data with the very best threading that [Mike Perham](http://www.mikeperham.com/) can bring to bear on the problem.  Mike is the author of Sidekiq, a great member of the Open Source community and the best threaded programmer I've ran across in years and years.

This all started with a bug where the data sharding call was being made but data was ending up in the wrong table.  The error, naturally, was in my application code but the true error was in my debugging approach.  I fixed the code, verified it locally and locally via Sidekiq and then deployed.  Then I tried it on the box where I made the AMI from.  And I got back a hash from the async call indicating that SideKiq got it -- but nothing happened.  *blink*  More changes and debugging calls and such were made and I still never saw the data flow into the database tables.  Then I got the bright idea -- take Sidekiq out and call the method directly without the async and lo and behold it worked.  Sigh.

At this point I went away from the screen and worked on documentation for a while while I just thought about it.  A second debugging session finally solved it.  Here's what was going on:

* 1 box, the source of the AMI, is being used to load the data into SideKiq
* 180 other boxes are sitting idly saying "Got something for me to do?  No -- I want to do it!  Me too!"
* The bug was STILL in the 180 boxes because I never shut them down and relaunched them from the AMI
* Even though I was working on a box that was shoving the data into Sidekiq and had the **right, working** code, one of the other boxes was simply picking it up first

The solution was to shut down the 180 boxes, re-make the AMI, relaunch the 180 boxes and feed Sidekiq the data again.
