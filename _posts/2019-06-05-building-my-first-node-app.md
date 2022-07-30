---
layout: post
title: Building My First Node App
category: node
tags: ["node", "javascrpt"]
---
{% pizzaforukraine  %}

As anyone who reads this blog knows, I am a Ruby / Rails guy.  Yes I flirt with other things from time to but but, at heart, I am a ruby guy and specifically of the Rails flavor.  Part of the reason for that is that I adore the set of choices that Rails as a whole makes for me. I look at other communities, say Python or Node, and I always think "Man do I really want to figure out a collection of libraries for Task X, Task Y and Task Z and then figure out if they work together?".  I adore that Rails has put together a set of defaults that just plain work together.

Now, that said, sometimes you do have to go farther afield than Rails and this week I found myself needing to put together a basic Node app for [one of my students](http://fuzzyblog.io/blog/how_to_be_a_developer/2017/07/02/how-to-be-a-developer-001.html) to run with.

# Problem Description

What I need to build is effectively a two page web site - a form which a nodejs backend which calls an API and then generates a page of results for the user.  It is effectively a specialized travel calculator.  This isn't very much but when you don't really know anything about a platform, even the tiniest thing can be problematic.

# Things I Read

Here are the articles I looked at:

* [Hackathon Starter][https://github.com/sahat/hackathon-starter]
* [AirPair NodeJS Tutorial](https://www.airpair.com/javascript/node-js-tutorial)
* [Building A Simple NodeJS API] (https://medium.freecodecamp.org/building-a-simple-node-js-api-in-under-30-minutes-a07ea9e390d2)

# A Starting Point

The best starting point I found was [hackathon-starter](https://github.com/sahat/hackathon-starter).  It is absolutely more than necessary and needs to be cut back but what I got with this was:

* a modern looking starter app 
* done in an MVC style fashion
* complete with CSS that doesn't suck 

# Useful Commands

These were useful commands:

To create a bare bones, basic Node app:

> npm init

To install the nodemon package which lets changes be reloaded dynamically without restarting the app server:

> npm install nodemon -g

[Stack Overflow on Installing Nodemon](https://stackoverflow.com/questions/28517494/nodemon-not-found-in-npm)

To run the app via nodemon:

> nodemon app.js

And that's about all I have time for right now but it is a real start on the process.  The next step is to write the application specific code.