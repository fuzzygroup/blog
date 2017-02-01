---
layout: post
title: Linux Tip Of The Day - lsblk
category: linux
tags: ["linux_tip_of_the_day", "linux", "sys_admin", "aws"]
description: Linux Tip of the Day - Use lsblk to view all the block storage devices attached to your system
image: http://fuzzyblog.io/blog/assets/lsblk.png
---
I suspect a lot of these tips are going to end up being about storage -- even today storage is such a pain point.  The lsblk command shows you what block storage devices are hooked up to your Linux system.  This is really useful for when you attach a new device and need to write a mount statement for /etc/fstab.  Personally I use this a lot when I'm using different AWS volumes for organizing my storage.

There's nothing to install -- lsblk appears to be a standard command for most *nix systems.

Here's an example of lsblk without any options:

![http://fuzzyblog.io/blog/assets/lsblk.png](http://fuzzyblog.io/blog/assets/lsblk.png)

Personally I find the -l option most useful:

![http://fuzzyblog.io/blog/assets/lsblk-l.png](http://fuzzyblog.io/blog/assets/lsblk-l.png)

Also useful is the -m option which shows permissions:

![http://fuzzyblog.io/blog/assets/lsblk-m.png](http://fuzzyblog.io/blog/assets/lsblk-m.png)

