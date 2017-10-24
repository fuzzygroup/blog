---
layout: post
title: If I Was a Traveling Musician
category: music
tags: ["music", "random", "echo", "alexa", "10x", "david_rovics]
description: If I was a traveling musician, here's how I would make money from touring...
---
My friend David Rovics, on his blog and email newsletter, [laments the loss of CDs as a revenue stream for the traveling musician](http://songwritersnotebook.blogspot.com/2017/01/why-do-they-keep-begging.html).  I'm not a traveling musician but I suspect that he is absolutely right.  As I gaze across my desk of computing hardware:

![my_desk.jpg](/blog/assets/my_desk.jpg)

there is only 1 device capable of playing CDs and it is a 2010 era MacBook Pro (it is actually in a stand behind everything so even tho it can play CDs, I can't reach the slot easily).  

If you're at all interested in the indie music scene / folk music / songs of protest then [David](http://songwritersnotebook.blogspot.com/) is a fascinating read.  

**Disclaimer**: David is a friend and he and I grew up together.  We don't share a wit of political ideology - he is as far left as it gets and I'm a staunch startup / technology believer but America was built on people being allowed to disagree and it all making us stronger.  If I want to be able to believe what I hold dear then he **has** to be able to believe as he chooses.  In these divisive times it feels like this has been forgotten.

Anyway, David is making the point that CDs don't sell like they used to and that makes his touring much, much harder since a key revenue source has diminished.  He terms it a post-CD reality and, yep -- that makes sense.  People aren't buying the discs, I suspect, because outside of the car they don't have a way to play them.  Why should you buy them if you can't play them?  And I know the feeling because I belong to [David's Community Supported Art (CSA)](http://www.davidrovics.com/subscribe/) program and I just got a batch of CDs recently.  And I know that I put them right in the car.  But even there, they **may not** get played - most of my music in the car comes from either a USB stick or XM Radio.

**Note**: I think that a touring musician offering a physical artifact like a CD for sale is a great thing.  People do spend money for physical artifacts to support an artist but I suspect that they won't spend money when they flat out can't use it at all.  Just for example, there's only 1 other CD player in our whole house.

# Sidebar: The Miracle of Things Being 10x Easier

One of the tenets of the technology world that I've always believed is that when you make something literally *10x easier to use* then it is a f*undamentally different* thing.  As an example, I've recently been experimenting quite a bit with the [Amazon Echo](https://www.amazon.com/Amazon-Echo-Bluetooth-Speaker-with-WiFi-Alexa/dp/B00X4WHP5E) / Alexa service.  My test case for it is actually playing music and even though I'm not really a music person, with Alexa, the simple fact that: 

* I don't have to mess with my phone
* I don't have to fight with BlueTooth pairing
* I don't have to screw with iTunes
* I don't have to plug in a cable
* I don't have to pick from a library of thousands of tracks
* I can say "Alexa play the doors"

makes a music playing experience that is literally **10x easier than a CD** (CDs get lost, damaged, don't always have metadata, need to be imported into iTunes, etc).

# So What is Easier than a CD?

The answer here to my mind is simple -- **a USB stick** dramatically improves on the listening experience:

* It works in almost any computer out of the box (with new Macintoshes it needs a dongle)
* Even a cheap 4 gig USB stick can hold tons of music
* There is an advertising / promotion opportunity to lower your costs by allowing other artists music to be on there
* Songs can be easily dragged into iTunes
* Metadata and album art could actually be correct

The problem with a USB stick is that it is **static** and indie musicians are constantly making new music -- even I know that's part of the attraction.  A low volume artist like David doesn't want to invest in say 100 usb sticks and then find that they are out of date.

And that brings us to the next section, My Proposal. 

# My Proposal for Touring Musicians

I think what touring musicians should sell is a USB stick which has the following features:

* A Small Music Archive like a Best of David Rovics album
* A program which updates the USB stick from the Internet
* A readme file that basically amounts to "Run the update program"

The update program would be a small executable that connects to a source on the Internet and downloads a full archive complete with album art and metadata.  People could the plug that into their computer, take that to their car, etc.  

You could call this *USB Stick as Platform* perhaps.  The software could easily be written in JavaScript using the [Electron](http://electron.atom.io/) toolkit.  If [Slack](https://slack.com/downloads/) can ship versions of their app for OSX, Windows and Linux off the same code base and [Atom](http://www.atom.io) can do the same then there should be no problem developing a pretty simple downloader.  All it has to do is:

* Read a config file which determines the source url to read from
* Start downloading songs
* Store the songs in a rational file hierarchy 
* Display a progress bar

If you wanted to you could get fancy like embed an encrypted token in the config file that limits how many downloads but I wouldn't recommend it.  I think Simple is better here.  I would allow for it pulling down some advertising style content since that would give a musician the ability to promote an upcoming concert, cross promote another artist, etc.

The end result of this is that the musician could give to a manufacturer like [FlashBay](http://www.flashbay.com/usb-music-distribution) a master USB stick and get back say 100.  I don't know the prices on them but if you promoted it properly like "David Rovics USB Library" and it could perpetually update itself then you'd have something that actually might have  dramatically higher price than a single CD.  You'd need to test pricing but my gut says that a USB stick of this nature could easily fetch $20 or more.  

# A Final Note

In my last [post](http://fuzzyblog.io/blog/rant/2016/12/20/david-rovics-community-supported-art-or-a-tale-of-paywoe.html) that referenced David, I failed to define some terms: 

* UI - user interface -- the look, feel and interactions a user has with a product
* UX - user experience -- the overall experience that a user has with a given product
* UI/UX - the fusion of the two

My apologies for leaving these out.  As a card carrying member of the technology tribe, I do exist in a world of acronyms and I sometimes don't realize that they are not clear to others.