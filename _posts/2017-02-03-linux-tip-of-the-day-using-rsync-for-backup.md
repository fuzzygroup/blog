---
layout: post
title: Linux Tip Of The Day - Using rsync for Backup
category: linux
tags: ["linux", "sysadmin", "devops", "backup", "linux_tip_of_the_day"]
---
Once upon a time when I had complex file copying to handle, I used **xcopy**.  It has been a lot of years since DOS and xcopy and as of late, I reach for rsync.  Yesterday I had the situation where I wanted to make a command line which would take the contents of two drives and backup from drive A to drive B -- full copy.  It was enough files that, well, I just wouldn't trust any gui operation with it (hundreds of gigs if not a terabyte).

This is a problem that I've tried before to tackle and actually failed at so I grabbed [Nick](http://www.nickjanetakis.com/blog/) via [Google Hangouts](http://hangouts.google.com/) and he and I whipped it together easily.  We started with:

> rsync --help

And then we went thru the options one by one.  I've given the example with the long form versions of the arguments so it is a little bit more understandable:

> rsync --archive --recursive --inplace --progress SRC DEST

So when you replace SRC with the actual source of the files and DEST with the destination you get this command line:

> rsync --archive --recursive --inplace --progress /Volumes/Plex/ /Volumes/PlexBackup

There are an absolutely enormous set of rsync options, too many to go into here but if you have to move lots and lots of files around, rsync can generally do it.

The rsync tool is powerful enough that there is a whole company devoted to supporting and extending it -- [rsync.net](http://www.rsync.net).