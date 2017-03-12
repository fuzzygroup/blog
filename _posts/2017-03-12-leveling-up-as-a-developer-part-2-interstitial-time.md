---
layout: post
title: Leveling Up as a Developer Part 2 - Interstitial Time
category: software_engineering
tags: ["software_engineering", "learning"]
description: Taking advantage of interstitial time, the time between times, is one of the best ways for you to level up your skills as a developer by learning while you do something else.
image: https://softwareengineeringdaily.com/wp-content/uploads/2015/08/sed_logo_updated.png
---
I recently wrote about [Leveling Up as a Developer](http://fuzzyblog.io/blog/software_engineering/2017/02/24/leveling-up-as-a-developer.html).  Leveraging Interstitial Time is another approach to improve your skills.  As a developer there are at least two very different types of learning that you have to do:

* **Deep, Focused Learning**.  The classic example here is the syntax of a language.  Some of us can do that by simply reading a book but most of us need the focused, "muscle memory" effort of actually doing it.  
* **Awareness Learning**.  A huge part of the IT or Information Technology space is simply being aware that something exists.  Whether it is a tool, a particular library, an algorithm or merely a way to approach a problem, awareness is often all you need.

We all know how to do deep focused learning -- you sit, generally alone, in a quiet space with a computer and lots of time and you work at it.  Some of us have a set of problems that we like to solve to teach ourselves.  Others focus on working through tutorials.  And there are certainly other approaches.

But how do you tackle *awareness learning*?  Given how vast the world of IT is in 2017, how can you possibly be aware of everything you need to know to be an effective software engineer?

The remainder of this post talks about awareness learning and my approach to it.

# Understanding Interstitial Time

Just as an interstitial ad is the ad that shows up between page transitions, I view interstitial time as the *time between times*.  A good example of this came up last night -- I had to peel two pounds of shrimp for dinner.  This was easily 30 minutes of time when my hands were occupied and I really couldn't do much.  Given that my hands were nasty dirty, I couldn't even turn the pages of a book while I did it.  To me that's interstitial time -- normally it would be entirely wasted.  What I do, however, is turn interstitial time into awareness learning because while I can't do much, I can **listen** -- and that's at the heart of awareness learning.

# Required Items

These are the things you need:

![smart_phone](/blog/assets/smart_phone.jpg)

Some type of smart phone; doesn't have to be iOS, android is just fine.

![bluetooth_headset.jpg](/blog/assets/bluetooth_headset.jpg)

A bluetooth headset.  Personally I favor the [Plantronics M180](https://www.amazon.com/Plantronics-Universal-Cancelling-Wireless-Bluetooth/dp/B010XDJTWS) but any one will work.  This one has good volume, easy pairing and a 7 hour battery.

[![icatcher.jpg](/blog/assets/icatcher.jpg)](https://itunes.apple.com/us/app/icatcher-podcast-player/id414419105?mt=8)

You need some kind of podcasting listening tool.  Personally I Use [iCatcher](https://itunes.apple.com/us/app/icatcher-podcast-player/id414419105?mt=8) on iOS but [OverCast](https://itunes.apple.com/us/app/overcast-podcast-player/id888422857?mt=8) by Marco Arment is also excellent and I recently bought [Castro](https://itunes.apple.com/app/apple-store/id1080840241?mt=8&ign-mpt=uo%3D4) but haven't used it as well.  There are great ones on Android as well but none that I have personally used.

![podcast_feed.jpg](/blog/assets/podcast_feed.jpg)

The most important thing is some podcast feed that's going to download new things to learn right into your phone on an ongoing basis.  Thankfully, in 2017, that essentially means any podcast on the planet -- since they pretty much all have an RSS feed.

From top to bottom this is a smart phone, a bluetooth headset and a podcast feed or podcast feeds of things that for your type of software engineering you should be aware.  I'm a generalist with a focus on web and back end so I find [Software Engineering Daily](https://softwareengineeringdaily.com/) to be outstanding.  But here are some more great learning sources by category:

* DevOps - [Datanaughts](http://packetpushers.net/datanauts-podcast/)
* Big Data - [Drill to Detail](https://www.drilltodetail.com/) 
* Online Marketing - [Noah Kagan Presents](http://okdork.com/podcast/)
* Machine Learning - [Talking Machines](http://www.thetalkingmachines.com/)
* Data Science - [Data Skeptic](https://dataskeptic.com/podcast)
* JavaScript - [JavaScript Jabber](https://devchat.tv/js-jabber)
* Ruby - [5by5](http://5by5.tv/rubyonrails)
* Elixir - [Elixir Fountain](https://soundcloud.com/elixirfountain)

I think you can see that there is a podcast for almost any time of IT learning.  For example I just googled for Embedded System podcast and found [Embedded.fm](http://embedded.fm/) which is 189 episodes long on Embedded Systems and is currently covering Soft Robotics.

Just google for what you need to learn about and then "podcast" and you're very likely to find something.

# Pulling Off Awareness Learning On an Ongoing Basis

The key to this is that you need to develop a **habit** around applying interstitial time to learning.  Here's all you need to do:

* Get the things above
* Keep your headset and phone regularly charged
* Whenever you've got at least 5 minutes doing something crappy -- commuting, dishes, peeling shrimp, raking leaves, building your kids tree house, widening your driveway with a pickaxe, sitting with your kids while the fall asleep -- it can be anything, you **listen** and **learn**.  And, yes, I did build a tree house while listening to Ruby podcasts and I widened a driveway doing the same thing.
* Keep at it!

The last one, Keeping at it, is the hard part.  If you work in IT then your days tend to be long and there are times that your brain just hurts and you don't want to listen to, well, YMITC (yet more IT crap).  It doesn't matter, this only works if you stick with it.  So you suck it up and build it into a habit where you just keep at it.

And that's pretty much it but let me finish up with a concrete example.

# An Example

I was recently listening to Software Engineering Daily, their podcast on [Heroku AutoScaling](https://softwareengineeringdaily.com/2017/02/28/heroku-autoscaling-with-andrew-gwozdziewycz/) and Andrew Gwozdziewycz gave their algorithm for determining when to auto scale.  He described it this way:

> Time point: 35:40 Autoscaling like I said is a little bit more complicated.  The only data we use for auto scaling is your response time, the p95 response time, the number of requests that you're serving be it errors or successful requests and the number of dynos that you currently have.  And what we do is utilize Little's Law, this thing from queueing theory that basically  says (gives example of bank tellers and queues) - think of the arrival rate as through put and think of the latency as the time a teller takes to make a deposit or withdrawal.  These things are interrelated into this relationship -- Little's Law.  We look at the actual number of bank tellers versus the theoretical number if the latency is zero.  If you're app starts responding greater than that latency then we'll scale it up to get that latency down.  We put that into an exponential weighted moving average and we plot a regression line and the slope of that regression line gives us whether or not its ok to scale up or scale down.  (Time point: 38:50)

**Note:** I may have munged the description a bit but if you start listening at minute 35 and go thru it once or twice, you'll pick it up.

Just having heard that much, I can think of about a dozen different ways to apply that algorithm to my daily work as I'm sure you can.  

And that's why I listen to podcasts so avidly -- trying to come up with something like this on your own is truly hard but just knowning that this exists often gives you the critical first step to solving this type of problem. 