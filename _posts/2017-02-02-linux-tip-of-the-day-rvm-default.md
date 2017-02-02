---
layout: post
title: Linux Tip of the Day rvm --default
category: linux
tags: ["ruby", "rails", "linux", "rvm"]
---
I normally don't intersect Ruby and Linux Tip of the Day but I just used this and it is really, really useful. The rvm or Ruby Version Manager tool manages your installed rubies makes ruby development, well, just plain easier.  

To install rvm on Linux, use:

    sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    sudo \curl -sSL https://get.rvm.io | bash -s stable --ruby

To install on OSX, you can use the commands above but generally omit the sudo (depending on your system).

A real problem with RVM is you often don't know what Ruby you're going to get when you start a new terminal window.  You can solve this with:

    rvm --default use 2.3.1
    
You can find your available rubies with: 

    rvm list rubies
    
And then use one of the installed rubies as the argument to rvm --default use.


