---
layout: post
title: A Stupid Mac Performance Optimization for 2019
category: mac
tags: ["mac", "osx"]
---
It is 2019 people, 2019.  And this is the stupidest performance optimization thing that I've seen in years.  I take screenshots quite a bit and I've recently noticed that it was taking a considerable amount of time from the point when I pressed the OSX screenshot key (command + shift + 4 and then enter) to the screenshot becoming available on the Desktop -- something like 20 to 30 seconds.  

What I did this morning was create a single folder on the desktop called "old" and then I moved almost everything into "old".  Then I took a screenshot and it appeared in almost real time.  

Now before you say "Oh it is just Scott -- he has a ton of things on his desktop" -- there were only 654 files on my Desktop.  And, sure, 654 sounds like a lot but this is 2019 and computers are **FAST** so *WHAT THE HELL APPLE?*

Now I've seen this type of filesystem slowdown before but usually it is at the N thousands of files per folder (remember "Desktop" is just a folder):

* [Stack Overflow](https://stackoverflow.com/questions/466521/how-many-files-can-i-put-in-a-directory)
* [8 Million Files Per Directory](http://be-n.com/spw/you-can-list-a-million-files-in-a-directory-but-not-with-ls.html)

And yes I am running Mojave and this is the new [Apple File System](https://en.wikipedia.org/wiki/Apple_File_System) on a 2015 Mac Pro with 16 gigs of ram.  There is no excuse for this kind of slow down.  Sigh.

Oh yes and the Downloads folder gets faster when you move everything into a folder so this seems to be a generalized Apple File System issue.
