---
layout: post
title: Software Can Always Be Better - An Amazon Example
category: software_engineering
tags: ["software_engineering"]
---
One of the hardest things to grasp about software is that it can ***always*** be made better. Even a mature, established bit of software with literally tens upon tens of millions of users can still have fundamental issues.  We're in the tenth year of the iPhone and I've been using the Amazon app on my iPhone for at least 8 of those years.  And yet I can still pick up my iPhone, try something from the Amazon app and find a critical issue.

The problem at hand was really, really simple - I just wanted to buy something.  I saw this [tweet from Jason Kottke](https://twitter.com/jkottke/status/811593510746984452) and that's a hilarious gift idea so I figured that I would buy 2, one for my wife and one for her friend (they are wine buddies).  So I picked up my iPhone and searched up the product.  I selected 2 and clicked the Buy Now with 1 Click button.  

So at this point I've told Amazon:

* What I want
* How many I want
* That I want it now

The interesting thing was that this time my Amazon app had some kind of a password glitch and couldn't process the transaction.  I did the login dance and ended up back at the product page.  My initial thought was "Great! The order went through" but then I realized that wasn't the case at all, I was just back on the product page.  I checked the Orders feature in the Amazon app and, sure enough, no order had been created.  Now wouldn't you think that in an application who's **sole purpose** is to make transactions that in the event of a password problem that the order would somehow be persisted?  Password and authentication issues are a constant thing in all kinds of user centric systems.  And saving a user's input, particularly on mobile, where making input is hard should be damn near sacred.