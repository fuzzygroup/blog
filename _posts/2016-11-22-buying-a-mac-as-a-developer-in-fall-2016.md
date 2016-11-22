---
layout: post
title: Buying a Mac as a Developer in Fall 2016
category: mac
tags: ["mac", "osx", "rage"]
---
So my buddy Nick [almost rage purchased a Mac](https://nickjanetakis.com/blog/i-almost-rage-bought-a-macbook-pro) the other day and I thought that given that I sit at an 8 foot long custom built computing desk with six different MacBook computers on it, and a nerd closet of doom with 3 on the shelf and 2 more upstairs for the family's use, perhaps I should write down for him the different issues with respect to buying a developer machine in Fall 2016.  As I write this:

* I am in my PostMac phase where I'm actively trying to use an Ubuntu-Mate install on an Intel NUC as a primary development tool
* I just bought a brand new MacBook Pro (last generation)

So I'm clearly deeply divided but perhaps writing all this down will help either myself or at least someone else sort it out.

As I write this Apple has the following offerings each of which is a possibility for a developer: 

* MacBook 2016
* MacBook Air 2015
* MacBook Pro w/o TouchBar
* MacBook Pro w/ Touchbar
* MacBook Pro 2015
* iMac

Each of these is discussed below.  Just as an overview, my buddy Nick isn't part of the "Apple Faithful" at present.  He doesn't bleed six colors as we used to say (I date back to the Apple II days and my first Mac was a Plus) which means there are all aspects of the ecosystem which he doesn't yet get.  Nick is a Windows user, a Docker Captain, a Udemy instructor and an all around good guy.  His almost rage buy was inspired by frustration with Microsoft and its not dissimilar to my rage moving to Ubuntu-Mate.  

# Developer or Tourist?

The first thing to understand if you're going to enter the Apple ecosystem is are you doing it as a developer or as a tourist.  If you just want a Mac for light consumption, for syncing an iPhone or for just answering the question - "is this for me" then you could easily buy either of these:

* MacBook 2016
* MacBook Air 2015

The new MacBook 2016 is the one I just bought my wife as she decided to goto graduate school this past October for her master's degree.  It is:

* tiny
* elegant
* beautiful

Personally I despite the new Apple low travel keyboard but in time I could likely move from despise to gentle loathing.  Given that I still use ThinkPad keyboards with trackpoints for my "desktop" Mac usage, that's actually a fair compliment.  The new MacBook 2016 is limited to 8 gigs of RAM which I don't feel is acceptable for a developer but if your needs aren't serious then that is likely ok.  

I'm tying this out on a MacBook Air 13" Early 2014 model which has been an absolute workhorse beast of a computer for me.  Even though it only has 8 gigs of RAM, I've done more with this MacBook I think than any other and it has been a rock star for me.  If Apple had just offered an upgrade of this exact machine with 16 gigs of RAM, I'd have bought it in a heart beat -- I love it just that much.  When my 15" MacBook Pro decided that it was useless, and only redeemable by [installing Elementary OS](https://fuzzygroup.github.io/blog/postmac/2016/11/05/life-in-a-postmac-world.html), this was the box that saved my professional life.  It runs I can't tell you how many different code bases and the only drawback is really the amount of RAM.  It also has the advantage of a fantastic keyboard and an ok battery.  The CPU kind of sucks and the fan makes a bunch of noise but I do love this damn little box.

# Sidebar: Understanding What Mac You Have / Upgrade Tools

One of the first weird things about Apple hardware to understand is that Apple has relatively few model names and they just keep reusing them with internal, non visual suffixes like Mid 2013 / Early 2015, etc.  What you have to do is this:

    Apple Menu
    About this Mac
    Support
    Specifications
    
Here's the visual flow:

![which_mac_01_apple_menu.png](/blog/assets/which_mac_01_apple_menu.png)
![which_mac_02_about_this_mac.png](/blog/assets/which_mac_02_about_this_mac.png)
![which_mac_03_specifications.png](/blog/assets/which_mac_03_specifications.png)
![which_mac_04_specifications_browser.png](/blog/assets/which_mac_04_specifications_browser.png)
    
This will take you to a [web page like this](http://support-sp.apple.com/sp/index?page=cpuspec&cc=G5RP&lang=en_US) which explains exactly what your Mac is.  The name at the top like *MacBook Air (13-inch, Early 2014)* is what you can give to [Crucial](http://www.crucial.com/) if you're looking to upgrade something.  Yes Crucial is still vital if you're using a Mac.  Another great resource is [iFixit.com](http://www.ifixit.com) if you're looking to understand exactly how to install the upgrade from Crucial you just bought.  And yes there are special tools involved -- just do whatever iFixit tells you to do and its usuallk ok.

NOTE: RAM on MacBooks is soldered in.  If you don't get it at purchase time you aren't upgrading.  Crucial's upgrades on RAM or Macs are either for older models or for Desktop Macs (the iMac line).

# So You Want to Develop on a Mac

If you're serious about dipping into the Apple waters then here are your options in Fall 2016:

* MacBook Pro w/o TouchBar
* MacBook Pro w/ Touchbar
* MacBook Pro 2015
* iMac

Each of these has distinct pros and cons.  They all have pros but I think the cons are more illuminating so let's elaborate on them:

* **MacBook Pro w/o TouchBar**
  * Pros
    * available today
    * cheaper
    * Light
    * At the time of this writing no ability to run Linux; maybe it will get sorted out; maybe not    
  * Cons
    * Not really a Macbook Pro imho
    * Really a big Macbook Air
    * Only 2 USB c ports
    * Dongle, Dongle, Dongle
    * No HDMI port
    * Keyboard

* **MacBook Pro w/ Touchbar**
  * Pros
    * 4 USB C ports
    * The Touchbar
    * Light
    * At the time of this writing no ability to run Linux; maybe it will get sorted out; maybe not
  * Cons
    * 4 USB C ports - only 2 of which are the high speed thunderbolt flavor
    * Expensive
    * The Touchbar
    * No function keys
    * No esc key
    * Only 16 gigs of RAM; DAMN YOU APPLE!
    * Dongle, Dongle, Dongle
    * No HDMI port
    * Keyboard

    
* **MacBook Pro 2015**
  * Pros
    * Great Keyboard
    * A full array of ports - USB, Thunderbolt, HDMI
    * 16 gigs of RAM is supported
  * Cons
    * Older Hardware

  
* **iMac**
  * Pros
    * More than 16 gigs of RAM
    * It really is pretty
  * Cons
    * Its a desktop
    * Painful to upgrade; I'm looking into upgrading a Mid 2011 iMac my family uses and the process scares the hell out of me

As I look at this list I have to wonder if my decision to try working on an Intel NUC using Ubuntu-Mate was entirely rational.  An iMac would have gotten me the more than 16 gigs of RAM which I personally felt was necessary and that would have addressed my **immediate** needs.  Now, that said, I'm a professional developer and, recently, it feels that Apple's path and mine are diverging, specifically:

* the increasingly locked down nature of OSX is at direct odds with what a developer needs
* I don't feel that Apple is remotely "fair" with respect to storage capacities on boxes / iPhones given modern picture density; there's a huge space / capacity mismatch between high megapixel phones and lots of videos with respect to selling computers with paltry SSD capacity
* poor Unix support.  I can't find the links right now but we're seeing poor support / broken libraries for core Unix stuff that shouldn't be broken.
* [visudo issues on Mac OS Sierra](https://fuzzygroup.github.io/blog/osx/2016/11/22/visudo-on-osx-sierra.html).

I'm not the only one who feels this way:

* [My Post Mac Writings](https://fuzzygroup.github.io/blog/tag.html#postmac) 
* [End of the Line for Macbook Pro](https://news.ycombinator.com/item?id=12825849)
* [Ask HN: What Do I Do Know That Apple Macs Suck](https://news.ycombinator.com/item?id=12822913)
* [Thinking of Going Purely Open Source in 2017](https://news.ycombinator.com/item?id=12818724)
* [What Will You Use Next for Development](https://news.ycombinator.com/item?id=12810732)

Now there's some level of whining here -- and I'm clearly among them -- because I did just hand Apple almost $3,000 of my hard earned personal money for a new MacBook but there is one thing that I haven't mentioned about Apple Hardware and it is one of the two close out topics.

# Apple Hardware Is Fantastic

When you separate out RAM, price and performance, one thing stands out about Apple hardware -- when it matches what you need -- the pure hardware is fantastic.  Specifically:

* Macs just plain feel good; they have a level of fit and finish that I don't don't think I've ever seen else where (Intel's NUC is a happy exception)
* Macs tend to last a long time.  Examples:
  * My family 2011 iMac which the kids use daily is still running strong
  * Every Macbook or Macbook pro I've bought back to Snow Leopard still works
  * Generally a Linux version installs well on older MacBooks which is a great way to revive an older machine
  * Screws don't come out; the chassis's don't bend or flex; this sounds minor but in the 90s I lost 3 separate Toshiba / Dell laptops due to screws coming loose and rattling around until they caused a short
* Macs have a high resale value

# So Should Nick Buy a Mac?

So I started this with the tale of my buddy Nick almost buying a MacBook Pro.  That wasn't a metaphor for what should I do -- Nick is a real person who is telling his own tale [here](https://nickjanetakis.com/blog/i-almost-rage-bought-a-macbook-pro).  My recent choice was clear -- **buy the top end of the previous generation**.  This got me the RAM upgrade I wanted, the keyboard I adore and it freed me from Dongle, Dongle, Dongle Hell.  Apple's choice of USB-C everywhere is bold but it isn't for me.  I do too many public facing events to NOT have an HDMI port on my primary travel machine.  And the incremental hardware advance isn't sufficient in my opinion to justify the cost in Fall 2016.  If Apple had been able to give me more than 16 gigs of RAM then I could have dealt with likely everything else but more than 16 gigs was my key issue.

I don't know if Nick should buy a Mac.  For a professional developer buying into a platform is a major decision.  The amount of learning that you have to do if you're serious is immense and the cost of the machine, unfortunately, is a rounding error when compared to the value of your time.  I remember how hard it was to transition from Windows to OSX back in 2006 in my post Feedster days and it was expensive in terms of time.  Personally I find it hard to think of Apple as a professional developer ecosystem in Fall 2016.  It feels like Apple is trying to become a mobile computing company and developers are just a wart on that.  I remember discussing this with colleagues as early as 2012 / 2013 and it does seem to be coming to pass.  Honestly it feels to me that committing to a Linux platform makes more sense for Nick but that's just me.  His opinion likely varies as it should.  Personally I'm pissed as hell that the platform I've given more than a decade too seems to be petering out and that makes me more than a bit irrational on the matter.