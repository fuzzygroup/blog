---
layout: post
title: When Gems Won't Install - The mkmf.log Problem
category: rails
tags: ["rails", "ruby", "gems"]
description: When a gem won't install due to a build error, you need the mkmf.log file -- but how do you find that file?
---
Computing is rich enough and deep enough as a profession that you can spent literally over a decade at something and still learn new things.  And, as frustrating as this is, I find that one of the best parts.   Personally I've been using Ruby now since 2006 and one of the things that is absolutely bedeviling is when a gem won't install.  

**Upfront Disclaimer**: This problem was one of my own making but it proved to be an interesting exercise as I waited for someone to arrive for a meeting.  Far better than simply surfing the web or playing on my phone.

I was trying to get the [FeedBin](https://github.com/feedbin/feedbin) aggregator to install so I did the usual open source Rails dance:

* fork it
* clone it
* bundle install 

And, WHAM, this gave me the wonderfulness below:

    Gem::Ext::BuildError: ERROR: Failed to build gem native extension.

        current directory: /Users/sjohnson/.rvm/gems/ruby-2.3.1@feedbin/gems/nio4r-2.1.0/ext/nio4r
    /Users/sjohnson/.rvm/rubies/ruby-2.3.1/bin/ruby -r ./siteconf20170828-91881-jc70x3.rb extconf.rb
    --with-cflags=-std=c99
    checking for unistd.h... *** extconf.rb failed ***
    Could not create Makefile due to some reason, probably lack of necessary
    libraries and/or headers.  Check the mkmf.log file for more details.  You may
    need configuration options.
    
Nothing like an abstractly referenced log file **WITHOUT A FULL PATH** to be completely unhelpful.  I've been seeing references to mkmf.log about as long as Gems have been in common usage and I've never understood exactly where that persnickety file was located.  Normally a quick Google or Stack Overflow gives me the answer but this time those just weren't helpful.  What I did [discover](https://stackoverflow.com/questions/20379274/when-a-gem-fails-where-do-i-find-the-mkmf-log-file) was that the mkmf.log file is bundled with the gem where it is built.  Given that I use RVM, the example was to look in a path like this:

> ~/.rvm/gems/ruby-1.9.3-p194/gems/some-cool-gem-name/ext/mkmf.log

I started with this find command:

> find ~/.rvm -name mkmf.log

and that produced a huge number of results, 995 to be specific (a decade or more of hacking Ruby stuff will do that).

This took me into adding a grep to the end:

>  find ~/.rvm -name mkmf.log | grep nio4r

which still gave me a full page of output so I added feedbin as a secondary grep:

>  find ~/.rvm -name mkmf.log | grep nio4r | grep feedbin

which finally produced:

> /Users/sjohnson/.rvm/gems/ruby-2.3.1@feedbin/extensions/x86_64-darwin-15/2.3.0/nio4r-2.1.0/mkmf.log

Digging into that file revealed this error:

    xcrun: error: active developer path ("/Applications/Xcode.app/Contents/Developer") does not exist, use `xcode-select --switch path/to/Xcode.app` to specify the Xcode that you wish to use for command line developer tools (or see `man xcode-select`)
    
So somehow XCode is missing and I'm certain that's my fault (this isn't my primary dev box so perhaps it got deleted at some point to save disc space).  