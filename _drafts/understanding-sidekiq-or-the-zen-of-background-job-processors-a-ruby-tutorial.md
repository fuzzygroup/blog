---
layout: post
title: Understanding Sidekiq or the Zen of Background Job Processors - a Ruby Tutorial
category: ruby
tags: ["ruby", "rails"]
---
As I've blogged in the past I am a huge, unreserved fan of the technical work of Mike Perham, the author of Sidekiq.  Sidekiq is a *background job processor* for Ruby and Rails that takes long running tasks and runs them in an asynchronous fashion so your function executes immediately returning control to your main application.  

The classical example of this is that you want to send an email and since the time of the connection to the email sending process is generally unknown, you instead treat this as a *job* that gets executed via Sidekiq.  

I haven't used Sidekiq now for about six months so I thought I'd write a soup to nuts tutorial since I had to relearn all this stuff again (o)

# Three Components - Worker, Sidekiq, Redis

# A Bit of Strong Advice

> WRITE TEST COVERAGE ON ANY METHODS YOU WANT TO USE WITH SIDEKIQ


class UploadWorker
  def perform
  
  end
end

