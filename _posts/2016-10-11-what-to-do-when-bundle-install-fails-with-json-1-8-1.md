---
layout: post
title: What to Do When Bundle Install Fails with JSON 1.8.1
category: ruby
tags: ["ruby", "rails", "json", "gem", "bundle", "things_that_make_me_postal"]
---
I cannot express my abject frustration at times with the Ruby ecosystem in general and bundler in particular.  When you hit this bug:

    Gem::Ext::BuildError: ERROR: Failed to build gem native extension.

        current directory: /usr/local/rvm/gems/ruby-2.3.1/gems/json-1.8.1/ext/json/ext/generator
    /usr/local/rvm/rubies/ruby-2.3.1/bin/ruby -r ./siteconf20161011-22175-140avvd.rb extconf.rb
    creating Makefile

    current directory: /usr/local/rvm/gems/ruby-2.3.1/gems/json-1.8.1/ext/json/ext/generator
    make "DESTDIR=" clean

    current directory: /usr/local/rvm/gems/ruby-2.3.1/gems/json-1.8.1/ext/json/ext/generator
    make "DESTDIR="
    compiling generator.c
    In file included from generator.c:1:0:
    ../fbuffer/fbuffer.h: In function ‘fbuffer_to_s’:
    ../fbuffer/fbuffer.h:175:47: error: macro "rb_str_new" requires 2 arguments, but only 1 given
         VALUE result = rb_str_new(FBUFFER_PAIR(fb));
                                                   ^
    ../fbuffer/fbuffer.h:175:20: warning: initialization makes integer from pointer without a cast [enabled by default]
         VALUE result = rb_str_new(FBUFFER_PAIR(fb));
                        ^
    make: *** [generator.o] Error 1

    make failed, exit code 2

    Gem files will remain installed in /usr/local/rvm/gems/ruby-2.3.1/gems/json-1.8.1 for inspection.
    Results logged to /usr/local/rvm/gems/ruby-2.3.1/extensions/x86_64-linux/2.3.0/json-1.8.1/gem_make.out

    An error occurred while installing json (1.8.1), and Bundler cannot continue.
    Make sure that `gem install json -v '1.8.1'` succeeds before bundling.

I've hit this error, I suspect, a few hundred times and I always forget the solution.  And I'm not the only one.  [Dv](http://dasari.me) and I hit this together today and we shot about 20 minutes today to need this:

    gem install json -v1.8.3

Thank you [Stack Overflow](http://stackoverflow.com/questions/21095098/why-wont-bundler-install-json-gem) for this answer.  Even if it was buried so deep in the thread that I almost missed it.

