---
layout: post
title: When rails g won't generate a Model
category: rails
tags: ["rails", "model", "spring", "listen", "hyde"]
---
I just saw about an hour of precious, early morning development time disappear because this failed:

    bundle exec rails g model TextCommon    

All that would happen was I'd get a cryptic:

> Running via Spring preloader in process 19539

And then nothing.  No model file was generated, no spec file was generated.  

This was a newly created Rails 5 api application and I had already used rails g to create my first controller.   So I knew it was working -- I knew it.  Here was my trouble shooting process:

1.  I started my troubleshooting by stopping my Tmux session and trying without it -- **NOPE**.
2.  Being a cranky programmer who is often distrustful of newer things, I figured that spring might be the problem so I did a ps auwwx | grep hyde_api_ruby and found a truly disturbing number of processes.  I went through a number of p*kill -f hyde_api_ruby * gyrations (more on [pkill](https://fuzzygroup.github.io/blog/unix/2016/11/23/pkill-rocks.html)) and still no luck.  
3.  Next up was to try this on an El Capitan machine because I've had enough issues with Sierra to, well, think it sucks monkey chunks.  Nope.  Same issues.
4.  My next thought was to revert to my spring theory and disable spring and listen at the Gemfile level.  Apparently you can't do that because if you don't have listen then the rails command dies with an exception.
5.  So I added back listen but not spring and got another version of the same error.

At this point I thought to myself -- **wait** -- you generated this app with **--skip-active-record.**  Is that why model generation is failing?  So I tried rails g controller Foo as a test and that worked just fine.

The bottom line is that if you don't have persistent storage configured at the Rails level, rails g model just won't work.  That's a pity because:

* PORO (plain old ruby objects) are really, really nice 
* Storing them in app/models gives you the benefits of reload!
* The rails g process ensures that a spec file is generated correctly

I added this to the Spring issues tracker [here](https://github.com/rails/spring/issues/486).