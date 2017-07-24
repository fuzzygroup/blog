---
layout: post
title: Rails Sys Admin When Puma Won't Run But Its Not Running
category: rails
tags: ["rails", "puma", "sysadmin"]
---
I use Puma for local Rails development and I'm running a stack of roughly 7 related Rails apps on a series of varying ports starting from 3200 going up by increments of 10.  I run all development using Tmux as a way to launch all the resources for a single "app" in one shot.  

I recently ran into the situation where Puma would not start even though I had exited all sessions and killed all instances of Tmux.  But, even so, I could not get Puma to start.  I kept getting the bind error like this:

    bundle exec rails s -p3220
    => Booting Puma
    => Rails 5.0.0.1 application starting in development on http://localhost:3220
    => Run `rails server -h` for more startup options
    Puma starting in single mode...
    * Version 3.6.0 (ruby 2.3.1-p112), codename: Sleepy Sunday Serenity
    * Min threads: 5, max threads: 5
    * Environment: development
    * Listening on tcp://localhost:3220
    Exiting
    /Users/sjohnson/.rvm/gems/ruby-2.3.1/gems/puma-3.6.0/lib/puma/binder.rb:266:in `initialize': Address already in use - bind(2) for "::1" port 3220 (Errno::EADDRINUSE)

I did a bunch of digging and found this [Stack Overflow answer] (https://stackoverflow.com/questions/39505675/ruby-on-rails-server-isnt-starting):

Step 1 is to run lsof on the offending port and find the PID associated with the port. In my case somehow vpnkit picked up this port and wouldn't release it:

    lsof -i :3220

    COMMAND   PID     USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
    vpnkit  99947 sjohnson   27u  IPv4 0x8a1799bf7e1441df      0t0  TCP *:xnm-ssl (LISTEN)
    vpnkit  99947 sjohnson   28u  IPv6 0x8a1799bf93a6e2d7      0t0  TCP localhost:xnm-ssl (LISTEN)

Step 2 was a kill -9 on the offending port:

    kill -9 99947
    
  And then Puma ran like a champ:
  
    bundle exec rails s -p3220
    => Booting Puma
    => Rails 5.0.0.1 application starting in development on http://localhost:3220
    => Run `rails server -h` for more startup options
    Puma starting in single mode...
    * Version 3.6.0 (ruby 2.3.1-p112), codename: Sleepy Sunday Serenity
    * Min threads: 5, max threads: 5
    * Environment: development
    * Listening on tcp://localhost:3220
    Use Ctrl-C to stop