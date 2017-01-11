---
layout: post
title: Electron Development is Like Mos Eisley
category: electron
tags: ["javascript", "electron", "hyde"]
---
So for my side project there is, for the first time in years, a client side component.  I already have 3 target users in mind and one of them uses Windows exclusively so that rules out any type of Mac development tool.  And because I really do believe that we are now in a [postmac](http://fuzzygroup.github.io/blog/category.html#postmac) world, I also need to support Linux.  All of that rolls up into the nigh inescapable conclusion that I'm going to have to use [Electron](http://electron.atom.io/) for development.

Given that the Atom editor and Slack are both based on Electron and run across OSX, Windows and Linux you really can't argue against Electron at this point.  Atom and Slack are both best of breed applications and my only objection to them is resource usage.  And arguing against resource usage is a sucker's bet -- you always, always, always build for tomorrow's platform because machines get faster (or at least stay the same) and memory gets larger.

The crying shame of electron development is the abysmal state of documentation and examples.  Honestly it is like [Mos Eisley](https://en.wikipedia.org/wiki/Mos_Eisley) -- a wretched hive of scum and villainy or really a **wretched hive of things that don't actually work *anymore***.  I've been working for the past two hours on nothing more than trying to follow top ranked tutorials and the only thing I've been able to make is a [Hello World](https://github.com/fuzzygroup/HelloWorldElectron01) app of my own. 

The core problem here is that the JavaScript / Node world which vomited all this technology onto us is changing more rapidly than anything I've seen before.  And when that happens people don't tend to go back and fix their samples.  And I get it, I really do.  But the taste that it leaves in your developer mind is, well, Mother Johnson told me never to use words like those.  ;-) 

I think my only reliable advice if you're trying to learn electron is the following:

1.  If you're trying to learn from a code sample on the net, git clone it to your machine IMMEDIATELY and try and run it with the normal electron . process from the checkout directory
2.  If it dies as seems to be the norm then abort and move on.
3.  Check the dates on sample apps carefully; older then a year and I wouldn't even try anymore.
4.  Personally I learn better from examples and I tend to avoid API documentation.  I think in this case I need to make a beeline for the [official electron docs](http://electron.atom.io/docs/).
5.  The docs are actually very good.  Because I'm trying to make a standard desktop app, I looked at the [Electron Menu](http://electron.atom.io/docs/api/menu/) docs and it was very helpful.  Integrating this into an overall app skeleton -- not helpful; sigh.  Getting the [menu to show up at all](http://stackoverflow.com/questions/34840026) in development -- entirely unhelpful.

