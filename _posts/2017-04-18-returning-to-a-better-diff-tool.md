---
layout: post
title: Returning to a Better Diff Tool
tags: ["software_engineering", "diff"]
category: software_engineering
description: I look back to the past to find a better diff tool
image: http://fuzzyblog.io/blog/assets/meld_diff.png
---
So this morning I needed to diff some fairly complex html and see the differences. This is part of a page archiver I'm building and the command:

> diff 2094f14b81ddd5d6cf8eab7a487e97e4f34935c8.html 68e0f2de414da40d33a1728d6c5c592d12fc54ae.html

just didn't give me anything really intelligible (or I'm too dumb to read raw diff output; its possible).  I've always maintained that the reason I write a blog is to capture my own knowledge so I turned to a [post](http://fuzzyblog.io/blog/software_engineering/2017/02/07/on-merging-files-diff-alternatives-on-the-mac.html) I wrote a few months ago on this very topic.

Ah Ha!  I need to use OpenDiff, a part of Xcode.  Unfortunately this gave me:

    opendiff 2094f14b81ddd5d6cf8eab7a487e
    97e4f34935c8.html 68e0f2de414da40d33a1728d6c5c592d12fc54ae.html
    xcode-select: error: tool 'opendiff' requires Xcode, but active developer directory '/Library/Developer/CommandLineTools' is a com
    mand line tools instance
    
Messing around with an Xcode install always seems to mean rebooting your machine and I have an active crawl going on my development box so that was out of the question.  Looking back to my diff article, one of the other tools was Meld which is a part of [HomeBrew](https://brew.sh/).  The beauty of anything HomeBrew is always the installation model.  Brew even helpfully tells you when the installation model changes which it did this time so I now needed to use:

> brew install caskroom/cask/meld

A very, very quick command:

>  meld 2094f14b81ddd5d6cf8eab7a487e97e4
f34935c8.html 68e0f2de414da40d33a1728d6c5c592d12fc54ae.html

gave me exactly the info I needed:

![meld_diff.png](/blog/assets/meld_diff.png)
