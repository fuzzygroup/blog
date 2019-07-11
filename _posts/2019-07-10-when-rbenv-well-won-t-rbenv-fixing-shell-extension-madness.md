---
layout: post
title: When RbEnv, well, Won't RbEnv - Fixing Shell Extension Madness
category: ruby
tags: ["ruby", "rbenv", "rails"]
---
If you have ever used Ruby's [rbenv](https://github.com/rbenv/rbenv), or [rvm](https://rvm.io/) or [Python's virtual env](https://virtualenv.pypa.io/en/latest/) or any of the different approaches to managing multiple editions of the same language binary on a machine, this post is for you.

All of these tools tend to work the same way -- they inject their own pathing in front of the system path so that the correct version of a binary gets called.  Here's an example from my development system when rbenv wasn't working:

    which ruby
    /usr/bin/ruby
    
    ruby --version
    ruby 2.3.7p456 (2018-03-28 revision 63024) [universal.x86_64-darwin18]
  
And when I made rbenv work, here's what I got:

    which ruby
    /Users/sjohnson/.rbenv/shims/ruby
    
    ruby --version
    ruby 2.6.2p47 (2019-03-13 revision 67232) [x86_64-darwin18]

Technically I should have been able to fix this issue by using this rbenv command:

    rbenv local 2.6.2

And if that didn't work then this should have:

    rbenv rehash

And either of those should have made things work by injecting into my path the correct values.  Sadly, albeit not surprisingly, it did not.  My personal development style seems to have a high entropy value and I suspect that's why but that's a different argument regarding excessive uptime, an abject refusal to reboot my machine, etc.  

Anyway here's the work around:

    cd /to/my/development/directory
    export PATH=/Users/sjohnson/.rbenv/shims:/Users/sjohnson/.rbenv/bin:$PATH

My pairing partner [Sean Kennedy](https;//csphere.github.io/) corrected this to be:

    export PATH=$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH

And while he's almost certainly right, I haven't tested his version so both are here.  Pick and choose as you like.

The bottom line here is that shell extensions -- which is what rbenv, rvm and virtualenv actually are -- are fragile.  And if you understand what's going on underneath them, fixing the issue actually is pretty simple.
