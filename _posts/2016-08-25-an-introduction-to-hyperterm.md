---
layout: post
title: An Introduction to HyperTerm
category: hyperterm
tags: ["betty", "hyperterm", "node"]

---

[Pickhardt / Betty](https://github.com/pickhardt/betty) introduced me to the concept of [HyperTerm](https://hyperterm.org/) and I have to admit that I was initially dismissive.  HyperTerm is a terminal built on top of Node and features web standards at the level of the terminal itself.  It has some interesting features:

* url support - type in a url and press enter and it opens in the terminal.  Damn.  Impressive.  Weird.  Impressive.
* better colors - yes it is minor but surprisingly pleasant
* better sounds - again minor but very nice.

There's also some bad:

* sluggish - clicking on a terminal tab just groans with slowness.  
* it doesn't go far enough - if this is ever going to succeed then it needs to do more than the hat trick of opening google in the terminal; it needs to be composable, pipeable, etc.  

A solid discussion of HyperTerm can be found on [Hacker News](https://news.ycombinator.com/item?id=12102100).

## Installation

Installation is a bit tedious so here are all the steps:

* brew update
* brew tap caskroom/cask
* brew cask update
* brew cask install hyperterm

Very, very interesting.  I've used it on and off all day long and for an early release piece of open source, it has been *pleasant to use*.  That's a decent statement to make abouti