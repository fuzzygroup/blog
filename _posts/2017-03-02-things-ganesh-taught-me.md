---
layout: post
title: Things Ganesh Taught Me
category: learning
tags: ["terminal", "podcasting", "screen_recording", "keep"]
description: Any fellow nerd you sit down and work with can teach you N things where N can be surprisingly large. Here's what Ganesh taught me last week.
image: http://d2l5v8ibvnnoh9.cloudfront.net/assets/screenflick/darken-4a4f14e94a7bba4d3a51486e8bed54cb4b48ed56513ee89089cd41de29a3b4d4.png
---
{% pizzaforukraine  %}

I am an engineer and I've worked with other engineers from all over the world.  People can talk about cultural differences all they want but the bottom line is that software engineering is a very binary profession -- either the code compiles or it doesn't.  And this simple truism generally tends to make engineers far more similar than they are different.  One of my favorite things about working with a new engineer is watching their tooling and then saying "Hey - what's that you just did / please show me how".  And if its any good, I try hard to incorporate it into my daily workflow.  

Last week I had the privilege of pairing with [Ganesh from Imaginea](https://www.linkedin.com/in/itsgg/) all week long and I picked up some good tricks documented below.  Tomorrow or early next week, I'll document what I picked up from [Winston](http://winstonkotzan.com/).

# Keep

This is an interesting command line tool which lets you designate particular command line strings as things to be "kept":

![keep](https://raw.githubusercontent.com/OrkoHunter/keep/master/data/keep.gif)

Install it with:

> pip install keep

Save a command with:

> keep YOUR_COMMAND

List your saved commands with:

> keep list

[More on Keep](https://github.com/orkohunter/keep)

# ScreenFlick

I was meeting with Ganesh as part of a transition plan so there was a lot of screen recording to capture knowledge.  While I have traditionally used ScreenFlow, he was using [ScreenFlick](http://www.araelium.com/screenflick) which:

* Is only $29
* Works natively in MP4
* Has a cool remote feature so you can use your phone to pause a recording, make some changes and then get back to the recording

I haven't tried this yet so no clue about noise reduction or other key issues but this is *interesting*.

![ScreenFlick](http://d2l5v8ibvnnoh9.cloudfront.net/assets/screenflick/darken-4a4f14e94a7bba4d3a51486e8bed54cb4b48ed56513ee89089cd41de29a3b4d4.png)

[Araelium](http://www.araelium.com/) the company offering ScreenFlick has a number of cool apps.  Definitely worth checking out.  Even I find their [MySQL Query tool](http://www.araelium.com/querious) interesting.

https://github.com/orkohunter/ping-me

# Filmora

I can't fully remember if I found [Filmora](https://filmora.wondershare.com/mac-os-x-el-capitan/) through Ganesh but it showed up on my box at that time so I think so.  I'm still digging into this one.

# Prompt Envy

I didn't get this from Ganesh but looking at his bash prompt and seeing it show git commit status gave me a case of *prompt envy*.  I've had this in and out over the years like 20 different times but it always breaks.  This time around I looked for someone else's version and found it as a brew package:

> brew install bash-git-prompt 

[Source](https://gist.github.com/trey/2722934).  And it is awesome!  I now have a prompt which shows me branch, status and number of files waiting to be committed.

# Color Coded Terminal Login

The best trick that Ganesh showed me was that his ssh logins to remote boxes actually change the background color of the terminal.  He's doing it using AppleScript with the standard OSX Terminal.  Unfortunately I wasn't able to pull off making that work with my preferred terminal client -- iTerm.  But I've wanted this for so many years now that I'm going to keep at it until it works.

# Thanks!

Thank you Ganesh!  Hugely appreciated.