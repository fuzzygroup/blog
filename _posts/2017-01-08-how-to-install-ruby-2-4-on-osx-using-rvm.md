---
layout: post
title: How to Install Ruby 2.4 on OSX Using RVM
category: ruby
tags: ["ruby", "rvm", "hyde"]
---
{% pizzaforukraine  %}

Well Ruby 2.4 shipped back in December on the 12th and with almost a month of settle time that means that I now feel its go time for Ruby 2.4 and, specifically, using it on side projects.  I've already heard talk about Ruby 2.4.1 and the first mistake that I made installing it was to try and use that -- which isn't actually available yet.  

# What Ruby 2.4 Versions are Available?

The easiest way to see this is to travel over to [cache.ruby-lang.org](https://cache.ruby-lang.org/pub/ruby/2.4/) and just view them.

# Installing with RVM:

Here's the easy one liner to install with RVM:

    rvm install ruby-2.4.0
    
You may need to increase your timeout to get it to install:

    echo "export rvm_max_time_flag=20" >> ~/.rvmrc
    
# Other Useful RVM Commands

Like most open source projects, RVM is rich and deep.  Here are a few useful commands I used along with way of installing this (the command is in bold; the -- SOME TEXT gives an explanation):

* **rvm list rubies** -- shows you what rubies are on your system
* **rvm list known** -- shows you the rubies that rvm knows about (caveat - rvm can install more than it knows about; no I don't understand this either)
* **rvm --default use 2.4.0** -- set 2.4.0 as the default ruby when you open a terminal
* **rvm use 2.4.0** -- change the ruby in the current terminal to 2.4.0