---
layout: post
title: Linux Tip of the Day inotifywait
category: linux
tags: ["linux_tip_of_the_day", "linux", "git", "sys_admin"]
description: Linux Tip of the Day - Use inotifywait to view all file access across a given directory structure
image: http://fuzzyblog.io/blog/assets/inotifywait.png
---
My podcast listening, which has always been on the nerdy side, has recently taken a trip down the far, far nerdier rabbit hole.  Whereas I used to listen to things with at least some connection to pop culture such as [Major Spoilers](http://majorspoilers.com/category/podcast/), I now find myself listening to the [Ubuntu Podcast](http://ubuntupodcast.org/), a British podcast covering the Ubuntu community.  It was there that I learned about inotifywait and I had a feeling it was brilliant.  I tried it out and it is brilliant!

To install on Linux, use:

> sudo apt-get install inotify-tools

Since inotify is a Linux api this doesn't exist for OSX but you can use an open source tool called notifywait available [here](https://github.com/ggreer/fsevents-tools).  Alternatively there is fswatch which can be easily installed with **brew fswatch**.  Please note that I didn't try either.

The inotifywait utility takes a few command line parameters and then tells you all file accesses that go on in that directory.  This sounds a bit obscure but here's how I tested it last night: 

> inotifywait ~ -mr

This tells inotifywait to run on the ~ or home directory and monitor it forever (the m flag) and r tells it to monitor recursively on all directories below the current.

Here's an example of its output:

![inotifywait.png](/blog/assets/inotifywait.png)

Not only is this useful for sysadmin / devops work but I can see it being highly useful for application developers. Sometimes the files you are touching or your io access patterns are not always apparent.  Using inotifywait makes them obvious.

Different events can even be monitored with the --e flag.  Here's what you can monitor for:

    Events:
    	access		file or directory contents were read
    	modify		file or directory contents were written
    	attrib		file or directory attributes changed
    	close_write	file or directory closed, after being opened in
    	           	writable mode
    	close_nowrite	file or directory closed, after being opened in
    	           	read-only mode
    	close		file or directory closed, regardless of read/write mode
    	open		file or directory opened
    	moved_to	file or directory moved to watched directory
    	moved_from	file or directory moved from watched directory
    	move		file or directory moved to or from watched directory
    	create		file or directory created within watched directory
    	delete		file or directory deleted within watched directory
    	delete_self	file or directory was deleted
    	unmount		file system containing file or directory unmounted


