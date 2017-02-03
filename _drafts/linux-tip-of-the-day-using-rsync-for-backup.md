---
layout: post
title: Linux Tip Of The Day - Using rsync for Backup
category: linux
tags: ["linux", "sysadmin", "devops", "backup"]
---
Once upon a time when I had complex file copying to handle, I used xcopy.  It has been a lot of years since DOS and xcopy and as of late, I reach for rsync.  Yesterday I had the situation where I wanted to make a command line which would take the contents of two drives and backup from drive A to drive B -- full copy.  It was enough files that, well, I just wouldn't trust any gui operation with it (hundreds of gigs if not a terabyte).

This is a problem that I've tried before and actually failed at so I grabbed [Nick](http://www.nickjanetakis.com/blog/) via [Google Hangouts](http://hangouts.google.com/) and he and I whipped it together easily.  We started with:

> rsync --help

And then we went thru the options one by one.  I've given the example with the long form versions of the arguments so it is a little bit more understandable:

> rsync --archive --recursive --inplace --progress /Volumes/Plex/ /Volumes/PlexBackup

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


