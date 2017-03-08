---
layout: post
title: Side Project Validation - Finally
category: cartazzi
tags: ["cartazzi"]
description: When you develop a d
---
Note: I wrote this blog post a number of weeks ago when this happened (about 1 minute after) but there was no point to publishing it until the product launched.

Developing a side project is a damn lonely thing.  You sit in front of a blank code editor with no code to start and then you literally **will** it into existence.  Often you don't even discuss it with the people in your life -- perhaps the idea is too ludicrous or perhaps past side projects haven't panned out and you don't want the scrutiny.  Or perhaps you have kids in which case how the kids did in school the previous day is far, far more relevant than minor code triumphs.  But there is always that spark when you realize "Oh man -- this might really work".  That just happened for me.  It was 3:07 am on Tuesday March 7th.

Cartazzi, as you know by now, is a personal analytics dashboard that helps you succeed online with one click analytics.  Like any data centric product I've ever built, Cartazzi is built from real world data.  I was looking at the home page for my friend [David Rovics](http://www.davidrovics.com) and noticed that he was a [SongKick user](http://www.songkick.com/artists/152746-david-rovics).  I had no idea what SongKick was but Cartazzi is built to support the analytics sources people actually use and someone linking to something on their home page is a strong signal to us to support it.  So I follow the link and discover that David has 847 fans.  Ok then -- that's a metric and that's something I should be able to support.  So I go through my "build a new parser dance" for Cartazzi and scaffold together a new parser.  At this point I've implemented 42 of these things comprising almost 4K lines of code so I'm pretty good at it.  About 5 minutes later I have a new PageSongKickArtist parser object and it works out of the gate.  These things working the first time wasn't a surprise by this point.

I do my normal testing dance:

* start with the data I began with and confirm that it works
* find another instance of this type of data - I found the band [HoundMouth](http://www.songkick.com/artists/5183683-houndmouth) by just randomly clicking around SongKick
* I notice that HoundMouth has 39,058 fans
* I build a parser object in Rails console and verify the data -- and it increased to 39,059!

That's not a glitch.  It is absolute confirmation that what I built for Cartazzi is on point and will work.

And then I bandsintown
