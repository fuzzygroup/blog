---
layout: post
title: Sidekiq - Graceful Versus Forceful
category: ruby
tags: ["rails", "ruby", "sidekiq", "unix"]
---
So now that I'm using Sidekiq for background processes, I need to be able to start it up, shut it down and I need to understand the difference between forceful and graceful.  

# Running Sidekiq Interactively

This is easy and we all should know this:

    cd /my_rails_app/where_ever_that_is
    bundle exec sidekiq
    
This will run Sidekiq interactively.  Now if you want it to run even if your connection to the remote box drops then you need to use Tmux or something similar.

# Running it as a Service

See my last blog post on using Ansible to configure Sidekiq and I think that will become clear.

# Forceful versus Graceful

Forceful versus Graceful defines how you want Sidekiq to shut down and it basically boils down to the speed of the shutdown.  Sidekiq runs "jobs" which basically means "long running methods" and here's the difference:

* forceful -- shut down NOW; abandon all work in process
* graceful -- tell sidekiq to shut down when each of its threads is done processing
  
Let's use an analogy here to make this clear.  Imagine that sidekiq was a hitchhiker you picked up on the side of the road.  Forceful would be you opening the door and kicking the hitchhiker out while the car is still moving.  Graceful would be you saying "I think you need to get out at the next exit and the hitchhiker saying - *I'm sorry but I need a bit more time; I'll get out when I'm ready*".

There isn't a right answer here whether or not to use Forceful or Graceful -- it really depends on your context.  If you use Sidekiq to handle short lived asynchronous tasks like, say, sending a welcome email then you probably want to use Graceful since it shouldn't take that long for each thread to idle down.  I, on the other hand, use sidekiq to handle tasks that might take hours or even a whole day to finish so I usually use Forceful.  Given that my tasks have their own journal, this isn't terrible.  It isn't great but it isn't terrible.

Here's an example of a Forceful shutdown:

    ps -ef | grep sidekiq | grep -v grep | awk '{print $2}' | xargs kill -9

Here's an example of a Graceful shutdown:

    ps auwwx | grep sidekiq  # and give the pid value to the next command where <pid> is
    sidekiqctl stop <pid> 

My thanks to the fine community at [Stack Overflow](http://www.sidekiq.com/) for these [Sidekiq Graceful answers](http://stackoverflow.com/questions/12143350/gracefully-shutting-down-sidekiq-processes).