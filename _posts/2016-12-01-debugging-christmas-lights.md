---
layout: post
title: Debugging Christmas Lights
category: debugging
tags: ["debugging", "christmas", "software_engineering"]
---
In any family, over time, you specialize in your roles.  This is similar to a work environment where one person gets good at an aspect of the code base and then that person gets tasked with it on a regular basis.  In an ideal world everyone would always be 100% capable at all aspects of the code but we all know that's generally not the case.  In our family, Dad (me) puts up the Christmas lights.  Part of it is that I don't mind heights terribly, not the same as saying I like them but you get it but the other part of it is that *debugging crap that doesn't work* is really my very job definition.  And, a few days ago I wanted this:

![debugging_xmas_lights.jpg](/blog/assets/debugging_xmas_lights.jpg)

but after 10 minutes or so I got this instead:

![debugging_xmas_lights2.jpg](/blog/assets/debugging_xmas_lights2.jpg)

And while I was initially reminded of the Bob Rivers / Twisted Christmas album - "I plug in one light and THEY ALL #$#(*$*#) go OUT", that wasn't this.  Everything worked perfectly -- until it all stopped.  Sigh.

The very essence of debugging is the quest for understanding and your key tool is *persistence*.  I've worked with a lot of smart people in my life, many of them dramatically smarter than I am but I haven't worked with many people who are as persistent.  Whether you are debugging software, hardware or even christmas lights, *persistence* is what you want.  If you just think of yourself as a dog with a bone, that's the right image.  

Ok then.  The first step was to get out the tools.  Happily I recently bought a [non-contact AC voltage tester from Amazon](https://www.amazon.com/gp/product/B019EJXUJU/ref=oh_aui_search_detailpage?ie=UTF8&psc=1):

![debugging_xmas_lights2.jpg](/blog/assets/non_contact_tester.jpg)

What this does is essentially *sniff* electricity.  I'm not enough of a hardware guy to really understand it but I tried it and it works!  Given that I was doing this on a rainy day, not having to manipulate two test leads or a digital volt ohm meter was a huge, huge win.  This little gadget is actually sensitive enough that you can touch it to the end of a lightning cable and it will detect the voltage there so, apparently, it does both DC and AC.  Oh and did I mention it has an LED pen light built into it?  This thing rocks!

Whenever you have something, related to electricity, that happens after a period of latency, the natural suspect is somehow thermal or load related.  But here was the aggregate load:

* 1 power strip
* 4 strings of relatively low voltage lights
* 1 [Christmas Laser Projector](https://www.amazon.com/gp/product/B01JBTO16E/ref=oh_aui_search_detailpage?ie=UTF8&psc=1)

Two of the strings and the projector were all plugged into a contractor grade, 20 amp, thick as hell extension cord coming from a GFCI outlet.  Call this one Big Green.  The remaining two strings were plugged into a separate contractor grade cord but one that was only 15 amp.  And call this Little Orange.  Both of these have served me thru tree house building, home remodeling, etc.

This isn't sufficient load to trip a breaker.  I grew up doing AC wiring stuff so I have no issues stating that as a fact.

So if we think of this in terms of debugging here are the different components at hand:

* power strip
* light string 1
* light string 2
* light string 3
* light string 4
* extension cord 1 - Big Green
* extension cord 2 - Little Orange
* GFCI outlet

Any one of these, or any combination of these, could be leading to this problem.  And since it only happened after 10 minutes, I knew that at a worst case I was looking at N * 10 minutes in terms of potential maximum time that I'd be trouble shooting this where N was the number of components, 8.  So this was potentially at least a 90 minute plus exercise.  Given that the amount of time involved was now known to be non trivial, it was time to start by eliminating things outright.

Note: My worst case estimate was actually incorrect.  If the problem was combinatorial in nature like string 1 interacting with string 3 and causing the outage, well, I'm glad I didn't realize this -- its a lot more options.

My first task was to remove the power strip.  My wife had wanted to add more lasers to the mix so that was there to support the end goal -- but we don't have them yet so it was a case of over-engineering.  So, remove powerstrip, rejigger wires, try again.  **10 minute and darkness!**

My next step was to look at this in terms of overall complexity.  The most complex component is generally the one most likely to fail.  That meant that I should pull the laser projector from the mix.  Even though it was brand, stinking new, it is definitely more complex than christmas lights so out it goes.  And, once again, **10 minute and darkness!**

The lights are only a year old but they are very poorly made.  Even though they are a name brand, Sylvania, they seem to epitomize the term *shite quality*.  Some of the time just screwing a bulb in blows out the bulb due to poor socket quality.  But my wife loves the visual so the chances of my being able to route these strands of lights to /dev/null approximates zero.  Given that I have issues with the light quality, the next step is to alternately remove each string of lights in turn:

*  **10 minute and darkness!**
*  **10 minute and darkness!**
*  **10 minute and darkness!**
*  **10 minute and darkness!**

*Grumble*.  Ok then so what's left.  At this point we're down to two extensions cords.  Little Orange isn't as robust as big green so let's take that out of the loop - **10 minute and darkness!**

Hm... The message seems clear -- we're down to Big Green so let's un plug it and substitute another one: 

* **10 minute and LIGHT!**
* **10 more minute and still LIGHT!**
* **10 more minute and still LIGHT!**

So we're good now but what went wrong?  To some extent if you debug something and you don't actually understand the failure cause at the end then you may have won the battle but you have perhaps lost the war as the real goal should always be understanding.

When I look a more detailed look at my Big Green extension cord I saw this:

![big_green_big_culprit.jpg](/blog/assets/big_green_big_culprit.jpg)

Apparently I've fixed this extension cord in the past -- and then it all made sense.  If you remember I have this all going into a GFCI outlet and I also mentioned that I was doing all this in the rain.  And that was the vital clue.  GFCI stands for Ground Fault Circuit Interrupter and it is a way for an electrical outlet to automatically shut down in dangerous conditions.  Since a GFCI outlet is more expensive than a standard outlet you don't see them everywhere but they are **required** for use in commercial bathrooms due to the potential issues with respect to water and electricity.  And if your home builder was any good you likely have them in your home bathrooms for the same reason.

So what seems to have been happening was that moisture was slowly affecting the Big Green extension cord.  After about 10 minutes it caused a GFCI issue which led to a power shut down.  Strangely it seemed to clear itself up almost immediately.  Odder still is that when I checked the extension cord with a circuit tester designed to catch GFCI wiring errors it reported just fine.  

The morals of the story seem to be:

* Don't fix your extension cord -- just replace it
* Debugging is the same when its software, hardware or christmas mights -- it call comes down to persistence
* Anything can be debugged, you just have to take it step by step, bit by bit

Merry Christmas!