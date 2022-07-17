---
layout: post
title: A Shorty But a Goody, Sorting mdfind Results by Date or Size
date: 2020-08-12 01:48 -0400
category: osx
tags: ["osx", "mdfind"]
---
{:.center}
![IMG_9390.jpeg](/blog/assets/IMG_9390.jpeg)

mdfind is an OSX  executable which taps into the underlying spotlight index to find files quickly.  However if you want to quickly sort results you need to pipe its output (the | symbol i.e. shift key + forward slash) into another program.  The program we are going to send its results to is xargs which then handles integrating the results from mdfind with another command and organizing the results.

**Note**: I regard xargs as "Unix Dark Magic"; I've never fully understood it but it is one of those things that when I need a powerful command line incantation, I tend to think "Hm.... Needs Me Some xargs Here".

## Sorting by File Date

To sort files by name, make a variant of this:

    mdfind -name url_common.rb -0 | xargs -0 ls -lt

## Sorting by File Size

To sort files by file size, make a variant of this:

    mdfind -name url_common.rb -0 | xargs -0 du -hc | sort -g
    
This one is interesting because it pipes from mdfind to xargs running du -hc and then to sort.

## See Also

* [Apple.com](https://discussions.apple.com/thread/3890518)
* [Hacks for Macs](https://hacksformacs.wordpress.com/2015/01/12/spotlight-on-the-command-line-part-1-introducing-mdfind-and-xargs/)