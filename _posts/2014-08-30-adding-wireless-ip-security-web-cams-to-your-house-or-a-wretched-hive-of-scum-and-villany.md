---
layout: post
title: Adding Wireless IP Security Web Cams to Your House or a Wretched Hive of Scum and Villany
category: home_security
tags: ["home_security", "wifi", "web cam", "security"]

---
Due to a recent attempted break in at our home -- when my wife and kids were all in the house -- I've taken the steps of hardening our home security.  This has included:

1. Digital keypad locks
2. Upgraded key based deadbolts
3. Door reinforcement 
4. Physical (non key deadbolts)
5. Secondary alarm system via the new Lowe's IRIS
6. Panic button next to my wife's bed tied to a text message to my cell phone
7. Wireless IP cameras monitoring critical access points
8. Upgraded existing motion detector security lights to use LED bulbs so they can be left on more freely
9. Added always on LED bulb over front door (the incursion point) so if you're breaking in then you're at least well lit
10. Added B R I G H T flash lights to my and my wife's bedside tables so there will never, ever be a "where's the damn flashlight moment".  I went for a Rayovac Pistol grip light and my wife went for a 300 lumen 3D cell light from Fry's.
11. Added a master lock security door bar.

The bulk of this blog post will talk about networked / wireless IP cameras and the first thing is a Star Wars reference: 

"Mos Eisley Spaceport. You will never find a more wretched hive of scum and villainy. We must be cautious."
―Obi-Wan Kenobi, to Luke Skywalker[src]

To me the world of networked security camera is Mos Eisley Spaceport.  The day I started getting into this (the day after the break in), I went to Fry's, brought an iPad with me and went to the three aisles of networked security cameras and tried to grok the space and you know what -- an hour later, my wife and kids were frustrated and ready to leave and I still didn't know what to buy.  I ended up with a D-Link Cloud Camera for $200; not because I actually wanted it but I felt that I should buy something and I've had good luck with D-Link in the past.  I later returned it but that's another story entirely...

Here's an example of just how bloody well confusing all this is:

The FI9805E improves on the FI8905E in the following respects: ...

Now you might that that this piece of crap verbiage is from a vendor's website.  Nope.  Its from the amazon page for a leading camera.  Overall this is as confusing a section of the high tech market space as I've ever seen.  Once configured the products seem to work well but the out of the box experience honestly is horrid (and I strongly censored the first three things I wrote to describe it).

##Product Overview

What you want to buy is what's called a "Wireless IP Camera".  Most vendors seem to have one but the full setup kits tend to be wire based even tho they seem to want you to think its wireless; what they mean is wireless monitoring not no cables to run.  I settled on Foscam cameras of a few different models.   That may have been a mistake because while I rationally expected a uniform software suite, every single camera model seems to be different.  Oy.  Not how I'd run software development but that's another story.

##Products Bought and Returned

Here's what I've bought and returned:

* D-Link cloud camera.  Why?  Too expensive on a per unit basis.  My research shows you should be able to buy new units for roughly 90 to 100 per.  The exception is pan / tilt outdoor cameras which are at the 150 range.
* IRIS Outdoor Camera  Why?  Did not work.  Period.  
* Schlage Deadbolt with Keypad.  Why?  Did not work.  Ever.

##Products Actually Bought

Here's what I ended up buying:

* Foscam 18905 W waterproof outdoor camera; tricky to mount when you're up high on a ladder
* Foscam 19821W really an indoor camera that I installed under cover so I had pan / tilt / zoom capability; haven't yet gotten the alarm to work correctly
* Foscam 18919W waterproof and pan/tilt

The thing to understand about this market is that there are three differentiators

* Indoor or Weatherproof
* Pan / Tilt

The more of these you have, the more you'll pay so a pan / tilt weatherproof is almost double the price of either an indoor pan / tilt or an outdoor fixed mount.

##Sidebar: Panasonic BL-C131

A friend I respect quite a bit strongly recommended these panasonic models but they happen to be discontinued so its an e-bay hunt.  Other than that I would have strongly considered it based on the source.

##Process

Here's the step by step unboxing to installation process:

1.  At your router level, figure out a range of contiguous ip addresses and port numbers.  For example I used 10.x.x.20y and ports 990y where y matches on both the ip address and port number to make understanding this easy.
2.  Set up a google spreadsheet RIGHT NOW to track ip addresses, passwords, mac address, port number, etc.  If you're going to have more than one then you really, really need this.
3.  Unbox the camera.  Carry it to your router and attach power and network.
4.  Use the Foscam IP scanner tool to find the default ip address of that new camera.
5. Goto that camera in a browser and set the username and password.
6. Log into the camera with new username and password.
7. Turn off DHCP and set the ip address, gateway and dns settings manually.
8. Reboot the camera (should be automatic)..
9. Log back into the camera.
10. Configure time zone.
11. Configure mail settings.
12. Configure alarm settings.  I still have issues here and can't tell why alarm works sometimes and not others.
13. Configure ddns settings.  I still have issues here and can't bloody well understand it.
14. Configure wireless settings.
15. Turn camera off.
16. Unplug network.
17. Turn camera back on and make sure it still works via network; loop on 14 to 17 until done.
18. Physically install it.  Configure power.
19. Realize that what you're doing is complex and you'll be looping on steps 1 to 15 repeatedly.  Drink heavily.

Note: Do NOT try and use mac address reservations to assign the ip address via DHCP.  This does not seem to work at least with an Apple Airport Extreme.  Go static ip addresses from day 1.
But What You Really Want is Phone / iPad Monitoring, Right ?

Here's where this actually gets weird.  What you'd think you want is a networked approach to all of this where your cameras are tied into your alarm system, right?  I had originally bought the Lowe's IRIS system thinking that its cameras would do that.  Unfortunately a) they did not work and b) they are apparently too sensitive i.e. way too many false positives.  What I have found is that having cameras means that my wife or I can check the cameras from wherever we are and get a great amount of peace of mind.  What we found was that there are very solid iPhone / iPad apps which act as a front end to your cameras.  The one I'd recommend strongly is LiveCams Pro from Eggman Technologies (I think that's the developer).  

##Summary

All of this is really quite a pain.  But feeling safe in your own home is a very, very big deal so overall it was a win for us.