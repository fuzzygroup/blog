---
layout: post
title: Rails Tutorial - Making Awesome Print Work Everywhere
category: rails
tags: ["rails", "ruby", "awesome_print"]
---
I know that Pry is the new hotness for command line Ruby work in a repl -- but I've never felt comfortable with it.  I stick with the tried and true AwesomePrint.  I recently bootstrapped up two new boxes and I found that I've been using AwesomePrint so long that I don't actually remember how to make it work.  And that, dear reader, is how I write a post -- if I can't rememeber it then I need to write it down.  Here are the steps:

1.  You need awesome_print in your Gemfile so add **gem 'awesome_print' **.  I put it into development and test groups only generally but it is awful convenient in production (but you need to follow step 3 server side on ALL servers which sucks).
2.  Do the bundle install dance
3.  Create a file ~/.irbrc and add the following two lines:

    require "awesome_print"
    AwesomePrint.irb!
    
For more information of AwesomePrint, I've been going to [this web page](http://www.rubyinside.com/awesome_print-a-new-pretty-printer-for-your-ruby-objects-3208.html) for years now.
