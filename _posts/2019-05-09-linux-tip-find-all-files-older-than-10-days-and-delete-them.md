---
layout: post
title: Linux Tip - Find All Files Older than 10 Days and Delete Them
category: Linux
tags: ["linux"]
---
{% pizzaforukraine  %}

It is easy to forget at times just how powerful simple Linux shell commands here.  Here’s one I used recently that finds all files in a single directory that are older than 25 days and deletes them:

    find /apps/foo/shared/tmp/ -mtime +25 -maxdepth 1 -exec rm {} \;

The -mtime param takes a number of days.  The maxdepth takes the number of directories below this to look (1 means the specified directory).  The exec takes the list of files produced and runs rm on each of them.  For reference, this was discovered from [ServerFault](https://serverfault.com/questions/122824/linux-using-find-to-locate-files-older-than-date/122854#122854).

Just in case you’re curious, I tested this on a system with more than 11,000 files in a single directory and it executed flawlessly — no problems at all and it cleaned up more than 5 gigs of disc space.

And you don’t just have to delete files of course.  If you wanted to say find all the files older than 25 days and list them out with the date and time stamp then you could use:

    find /apps/cas-seas3/shared/tmp/ -mtime +10 -maxdepth 1 -exec ls -al {} \;

This was how we debugged this courtesy of a [Stack Overflow post](https://stackoverflow.com/questions/20893022/how-to-display-modified-date-time-with-find-command/20893429#20893429).
