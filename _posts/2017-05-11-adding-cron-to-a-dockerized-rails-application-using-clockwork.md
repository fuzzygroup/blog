---
layout: post
title: Adding Cron to a Dockerized Rails Application Using Clockwork
category: rails
tags: ["rails", "docker", "cron", "clockwork"]
description: It isn't obvious how to make Docker handle scheduled tasks for a Rails application.  In this blog post I walk through the process of scheduling tasks in a containerized application and then explore the issues associated with performance and deploy.
---
{% pizzaforukraine  %}

If you talk to any computer scientist they will easily tell you that 50 plus years into the computer age, scheduling is NOT a solved problem.  Even something as simple as cron which is decades old can still be challenging under different environments (example - cron and RVM is a bloody nightmare).  And then when you add containers into the mix, well ...  In this blog post I outline how I'm handling a daily scheduled process using Docker and Clockwork (a cron like gem for Ruby).

# Why is Cron and Docker a Problem

Docker represents a simplified computing environment where you generally don't have a full Linux stack -- instead the model is generally a single root process.  Now there are people who challenge that approach, notably the good folks at Phusion, but this is generally regarded as a best practice.  So you're not your own application stack and then cron as well.

# Enter Clockwork

Clockwork is a long standing Ruby gem which acts as a persistent daemon with its own scheduler that executes a simple DSL allow your models to be easily executed.  Here's an example:

    every(1.day, 'Midnight.job -- PageArchive.update_everything', :at => '00:00') do |job|
      PageArchive.update_everything
    end
    
Unlike traditional cron syntax, I've never found an issue with reading the Clockwork dsl, this says:

* every day
* execute at midnight
* run PageArchive.update_everything

# Adding Clockwork to your Rails Application

Here are the steps to add clockwork to your Rails application:

Add the clockwork gem to your Gemfile: 

> gem 'clockwork'

Create a clock.rb file in lib:

> touch lib/clock.rb

Write one or more clockwork expressions in clock.rb.  Here's an example from my application:

    require 'clockwork'
    include Clockwork

    require File.expand_path('../../config/boot', __FILE__)

    require File.expand_path('../../config/environment', __FILE__)

    require 'clockwork'

    include Clockwork

    module Clockwork

      every(1.day, 'Midnight.job -- PageArchive.update_everything', :at => '03:58') do |job|
        PageArchive.update_everything
      end

      every(1.week, 'Weekly Job -- PageArchive.update_bing', :at => '00:00') do |job|
        PageArchive.update_bing
      end

    end
    
To test this you can just use the command line:

> bundle exec clockwork lib/clock.rb

Once you set that running then you need to simply watch it to make sure that tasks execute.  Yes, provided that your syntax is correct, they certainly should but I've seen enough scheduled jobs fail over the years that I always feel better when I actually see them run.

**Note:** If you were previously using a Rake task to run your daily jobs then you need to refactor that as something like a class method that can be called from the Rake task.  This allows you to continue using the Rake task but also make your code easily executable from Clockwork.

# The Dockerfile

In this example I have a simple Rails app which exists to populate a page archive database consisting of data harvested daily from the Internet.  Here's the Dockerfile:

    FROM ruby:2.3.1-alpine

    RUN apk update && apk add build-base nodejs mariadb-dev tzdata

    RUN mkdir /app
    WORKDIR /app

    COPY Gemfile Gemfile.lock ./
    RUN bundle install --binstubs

    COPY . .

    CMD bundle exec clockwork lib/clock.rb
    
The secret to making the scheduling work is to execute the clockwork executable as the root command in the container. This causes the Clockwork executable to be launched when the container initializes.  At that point Clockwork will run the command until it finishes and then remain running, waiting for its next invocation.

# Conclusion and Issues

As you can see, when you have a scheduling process as the root process in your container, it provides an easy way to handle your scheduled job needs and Clockwork really does make it easy.  Still this doesn't mean that scheduling for your application is necessarily solved:

* What if your needs are large enough that you have to have multiple machines?
* How do you log issues with the scheduled jobs?
* What happens when a deploy occurs while your container is running a job?  How do you ensure that the day's work actually got processed?

## Multiple Machines

If I needed to have multiple machines involved, I would likely implement some kind of a work queue where they scheduler is solely responsible for setting up a queue of the work to be done and then containers on other machines are responsible for processing the data in the queue.  This approach is also useful for the deploy issue covered below.

## Logging Issues with Scheduled Jobs

There are enough issues with containers and logs that addressing it here is really out of the scope of this blog post.  I did want to point it out, however, as logging around scheduled jobs is usually necessary and needs to be thought through.

## Deploy Conflicts

There are at least three strategies that I'd use for handling deploy conflicts:

1. Start your jobs early and simply don't deploy while they are running.  This is the least desirable strategy but it does actually work provided the execution time of the job is only a few hours (i.e. until when people need to deploy).  Obviously this works poorly with a globally distributed labor pool and a CI server that deploys code automatically.
2. Change the code so that jobs become idempotent i.e. the job knows that a particular data item can be processed, for example, only once per day and then allow the scheduled process to be run multiple times per day.  This decreases the chance of a deploy shutting things down fully for an entire day since statistically it becomes less likely that you'll conflict with something every single time that it is running allowing at least one of the runs to complete.
3. Use the multiple machines strategy mentioned above so that you have a work queue and multiple asynchronous processing engines on the data.  As long as the queue is atomic in nature this avoids duplication issues and the additional parallelism that multiple containers bring should process the data more quickly thereby leading to fewer deploy conflicts.

Of each of these strategies, the third is likely the best but incurs the most application level changes.  Please keep in mind that you can iteratively evolve your application towards the right strategy for your needs.

