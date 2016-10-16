---
layout: post
title: Understanding Systems By Observation - Dropbox
category: software_engineering
tags: ["software_engineering"]
---
One of the best bits of computer science I ever learned, I learned in 1989 from my first business partner, Brian Giedt.  We were at a Society for Technical Communications (stc) conference on Technical Documentation and my partner was trying to impress a pretty girl.  And I watch him look at an animation product and pretty much instantly **grok** how it was doing the animation.  Where I saw a pretty flow of images, he looked at it and understood how the animation was being done.  That was the very first time I saw someone really understand something about the *internals* from its *externals*.  And once I knew it was possible -- I've striven to do it as often as I can.  Very often, if you set up the right set of circumstances, you'll realize exactly how something has to be implemented internally.

Let's use Dropbox as an example.  We all know that Dropbox transfers the content you put in it to all other machines you have hooked up to it.  And that's a simple 1 to many transfer.  But how does Dropbox work when you already have content in it and you re-arrange it?  Does it resend everything or does it figure out what it has to do and send a command stream to do it instead?

A few minutes ago I:

* created a folder within a folder in Dropbox
* moved about 15 gb of video files in initial folder to the new folder
* checked on my iPad about a minute later

And all the files I moved were in the new folder already.  Here's what this tells me

* There's no way that Dropbox deleted and re-transmitted the files in that time; it is simply impossible
* What Dropbox has to be doing is sending commands that amount to move THIS from HERE to THERE

The best I've seen to do this is you set up conditions that you know can't be argued with by physical constraints.  I knew that 15 gb of video data was a big arse chunk of data.  If I had used say a megabyte, well, I wouldn't have really known if it was a full bandwidth re-arrange or a command stream.  By setting up such a large test, well, I knew something smarter had to be going on.