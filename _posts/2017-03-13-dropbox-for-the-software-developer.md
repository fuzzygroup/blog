---
layout: post
title: Dropbox for the Software Developer
category: dropbox
tags: ["dropbox"]
description: Dropbox provides an easy to use tool for making your data available across all your computing devices.
image: http://fuzzyblog.io/blog/assets/Dropbox.png
---
An old friend asked me a great question recently:

> I saw you mentioning your use of Dropbox the other day. I’ve been using GitHub as my “cloud device”: when would I find Dropbox a better option?

One of the single best decisions that I made in 2016 was to adopt [Dropbox](http://www.dropbox.com/) as the key part of my personal computing environment.  I last talked about this back on [November](http://fuzzyblog.io/blog/postmac/2016/11/05/life-in-a-postmac-world.html), see the section "Conclusion - A Synchronized Computing Environment For Me" but it really does bear further description.

My use for Dropbox is exactly what it is designed for -- synchronization.  I've always had multiple machines but one has always been my "primary"" machine.  Since all my code was on Github, I could generally get to my code from any machine but what about my spreadsheets?  Or my documents?  Or just about any other file that I needed.  Here's what I did:

1.  Signup for a 1 Terabyte Dropbox account (roughly $50 / year so dirt cheap).
2.  Install Dropbox on all my machines including my ChromeBook, my Linux box, my iPhone and iPad.
3.  Symlink ~/Dropbox to ~/me so I have an easier path to type.
4.  Move all the files that matter to me into ~/me under a logical file structure related to my usage context - ~/me/blogging for all my blogs, ~/me/Documents for Documents, ~/me/consulting for consulting work, ~/me/fuzzygroup for anything I do online and so on.
5.  Move important things like SSH keys under ~/me and then use symlinks to insert them back into their correct location.
6.  Create a ~/me/transfer directory to copy transitory data from one machine to anther.  
7.  Move all the git repos that matter underneath ~/me.

My working set of data for Dropbox is about 40 gigabytes and I suspect that could be made smaller but I haven't seen the need.  This approach has meant that literally no matter what computing device I am on, I always have access to the data that actually matters to me.  True I don't have, for example, my iTunes music synchronized or my Photos but in terms of the data that I, as a software developer, actually rely on, this is about as perfect an environment as I could dream up.  The only objection I have is that on one of my machines, oddly the most powerful, Dropbox refuses to fully sync, always stalling out on two files that never complete.  Since there are no user facing logs on Dropbox for OSX, well, I have no idea what they are.  And, worse, it spikes my CPU past 100% always running up the fan and down the battery life.  But, other than that, I'm ridiculously happy with this as an approach.

I know that this was supposed to be what Apple was going to give us with iCloud but iCloud:

* Doesn't seem to work particularly well
* Removes local file storage of documents into the cloud solely thus absolutely screwing you over if you don't have internet access
* Has no cross platform support -- I really wanted all my data on my ChromeBook and my Linux box 

It is astonishing to me that the cross machine synchronization environment that I've been searching for most of my professional life is nothing more than a simple Dropbox subscription but that's all it took.

I still do full OS level backups periodically but I don't generally worry about it terribly since the data that matters is always safe being mirrored across all my computing devices and into the Dropbox cloud.
