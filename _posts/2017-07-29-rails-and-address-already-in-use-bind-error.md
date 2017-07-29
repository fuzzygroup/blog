---
layout: post
title: Rails and Address Already In Use - Bind Error
category: rails
tags: ["rails", "sysadmin", "bind"]
---
Lately I've seen this error come up quite a few times:

  /Users/sjohnson/.rvm/gems/ruby-2.3.1@seira_watch_web_app_api/gems/puma-3.9.1/lib/puma/binder.rb:269:in `initialize': Address already in use - bind(2) for "::1" port 3220 (Errno::EADDRINUSE)
  
I'm running a fairly complex stack that mirrors an 8 micro service application where things are expected to be on certain points in development so having port 3220 not working means that one of my APIs isn't available -- and that's **unacceptable**.  So I dug into it a bit and with the help of [this StackOverflow](https://stackoverflow.com/questions/10261477/tcpserver-error-address-already-in-use-bind2), I found the answer was to locate the offending process and then kill it dead:

> lsof -wni tcp:3220

That gives the process id or PID and then you can just kill it:

> kill -9 12345 (or whatever)
