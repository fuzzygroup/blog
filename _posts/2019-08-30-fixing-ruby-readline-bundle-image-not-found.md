---
layout: post
title: Fixing Ruby readline.bundle Image Not Found
category: ruby
tags: ruby
---
{% pizzaforukraine  %}

I've seen a lot of ruby weirdness over the years but this one was new to me:

    1) Metric#color reps should be green when the goal is increase_is_better = true and the change is +
       Failure/Error: byebug

       LoadError:
         dlopen(/Users/sjohnson/.rvm/rubies/ruby-2.5.1/lib/ruby/2.5.0/x86_64-darwin16/readline.bundle, 9): Library not loaded: /usr/local/opt/readline/lib/libreadline.7.dylib
           Referenced from: /Users/sjohnson/.rvm/rubies/ruby-2.5.1/lib/ruby/2.5.0/x86_64-darwin16/readline.bundle
           Reason: image not found - /Users/sjohnson/.rvm/rubies/ruby-2.5.1/lib/ruby/2.5.0/x86_64-darwin16/readline.bundle
           
The solution turned out to be:

    ln -s /usr/local/opt/readline/lib/libreadline.8.0.dylib /usr/local/opt/readline/lib/libreadline.7.dylib
    
Thank you to [Zuhlfreelancer](https://gist.github.com/zulhfreelancer/47efc39584cb9f006da43c41c014e03a)
