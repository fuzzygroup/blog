---
layout: post
title: Friends Don't Let Friends Bundle Under Tmux
category: ruby
tags: ["ruby", "rails", "gem", "bundle", "bundler", "tmux"]
---
So I had one of those crazy bundler errors on thursday that just drives you insane.  Among the errors were:

* the git source not yet checked out. Please run `bundle install` before trying to start your application - Google Search
* could not find a valid gem

It was a unending session of **suck** -- so bad that I finally asked [Dv](http://www.dasari.me) to pair with me on it. And he and I tried a number of things and nothing worked.  Then things started to feel oh so [familiar](https://fuzzygroup.github.io/blog/ruby/2016/10/15/brew-xz-and-nokogiri-and-tmux-an-unmitigated-disaster.html).

Quick summary if you don't follow the link -- if you're running RVM inside a Tmux session and something happens to the underlying Tmux session, everything can go absolutely crazy at the core Ruby layer.  And if that happens then Bundler will have its own set of issues.

So, honestly, I give you this:

    Friends Don't Let Friends Bundle Under Tmux

