---
layout: post
title: Blog as Well as Automate
category: software_development
tags: ["books", "monolith", "automation", "blogging"]
---
This morning I was reading [The Effective Engineer](https://www.amazon.com/Effective-Engineer-Engineering-Disproportionate-Meaningful/dp/0996128107/ref=sr_1_1?ie=UTF8&qid=1500632263&sr=8-1&keywords=Effective+Engineer) by Edmond Lau, an excellent read, and I hit on the section where he talks about how important it is to automate things that you do more than twice -- and he's right.  

The very first thing I did on my current side project was dramatically reduce the amount of effort it is to build applications with Rails that aren't monoliths and it absolutely has paid off.  I do think that there is a related aspect to automation -- writing it down or blogging.  

There are things that you do somewhat regularly that don't merit automation but are often a pain in the arse to figure out.  The example this morning was I wrote the first test coverage on a new bit of greenfield code and RSpec ever so helpfully told me: 

    An error occurred while loading ./spec/models/subscription_common_spec.rb.
    Failure/Error: require 'rails_helper' 

This particular "app" has 8 separate git repos so, yes, I've done this more than twice but it isn't amenable to automation since its an oddball step that I only do N times where N is the number of repos (its a setup task).  Now, in the age of monolithic Rails apps, this wasn't a big deal -- you only ever had one repo so you did it once and then you forgot about it.  Now I've already hit this more than twice so I made sure to write it down -- on my [blog](http://fuzzyblog.io/blog/rails/2017/02/26/setting-up-rails-with-rspec-from-the-start.html).  All I had to do was hit my [blog home page](http://fuzzyblog.io/blog/) and search for RSpec and there it was.  If you've ever wondered why my blog page is a long, long list of 600+ titles, that's why -- I want a single searchable thing that I can zoom through.  My blog gets very little traffic but it is incredibly useful l -- to **me**.  Anything that I expect to do more than twice, if I don't think its worth automating, I write it down.

So, to me, the corollary to automate things you do more than twice is if you can't automate it then write it down (preferably blog it) and make sure its searchable.

And you should buy The Effective Engineer by [Raymond Lau](https://twitter.com/edmondlau).  It really is good.

Oh and my tests passed, first time out of the gate.  w00t!