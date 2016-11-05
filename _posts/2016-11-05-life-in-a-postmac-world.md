---
layout: post
title: Life in a Postmac World
category: postmac
tags: ["postmac", "osx", "mac"]
---
Given the astonishingly pathetic nature of the latest Macbook Pro release -- from the perspective of someone who, first and foremost, is a software developer --- I've begun thinking of this as a **Postmac Universe** and that has forced me into a deep dive on some basic things I don't normally think about.

My first conclusion is that the past decade or so has actually been a golden age for developers.  We were able to have a single machine, a Macbook Pro, which served as our one device.  It handled software development and personal / workplace data.  We could have one box which let us:

* write code
* store our pictures
* listen to our music
* write proposals 
* make videos
* play some degree of games

As I think back on my career that's actually unprecedented.  

As I look back on my Mac hardware in the post Snow Leopard world, I've had:

* Macbook Pro, 15", Mid 2010
* Macbook Pro, 15", Retina, Mid 2012
* Macbook Air, 13", Mid 2014

So I've averaged a new machine every two years or so.  And all of them are still in use.  My 2010 is a plex server for the house.  My 2012 is my back up dev box and my Macbook Air, dinky as it is, is now my primary development box.  I'd been hoping that the recent Macbook Pro (MBP) release would let me move forward by giving me more ram, more storage and more cpu.  And, alas, Apple has dashed my hopes upon the rocks.  The changes to the new keyboard also bother the hell out of me but, perhaps, I can get past that.  

So I've spent pretty much all my free time since the MBP release in research mode and I've come to some conclusions:

* The apple tax is very, very real - 64 gigs of RAM on a pc platform is about $200.  Apple's charge for the same amount of ram but a generation behind, for the 3 year old computer that you actually shouldn't buy, is about $1,200
* PC Hardware is a confusing ecosystem that makes your eyes want to bleed just from the naming conventions alone (I'll come back to that later)
* PC Hardware is cheap, fast and can be easily upgraded
* There are lots and lots of inexpensive, fast computers, with way more cpu and ram than Apple will sell you.  If you've been locked in the Mac world as I have, its time to wake up and smell the cheapness
* Apple still makes the best laptops around; the only thing that I've found that looks close in terms of build quality is [Razer](http://www.razerzone.com).

# What Are My Computing Needs?

My personal needs fall into two categories:

* software development
* everything else

The lack of ram is what's killing me right now.  Roughly once per day my creative flow is shot to hell when I have to shut down apps because something isn't responding.  And I have a well honed process now.  First to go is Skype.  Then its WhatsApp.  Then its Slack. Then its Hangouts.  Then the programming editor.  Then its whatever piece of crap browser is chewing too much ram today.  Just a few minutes ago, it was chrome that when I killed it, gave back my machine to me (and 3.7 gigs of ram).  

I think the logical thing to do is separate out my software development work from everything else.  I run an ordinate number of terminal windows as each Rails app I work on generally requires a tmux session (fronted by tmuxinator) to run what I refer to as the Rails Trinity (server, logs, console, sql client, deploy, login window on production box, etc).  And yes I know that's more than 3 but it has the same Father / Son / Holy Ghost feel to it.  If I had different hardware for development then my ram needs **per device** wouldn't be so large.

## Computing for Software Development

In terms of my computing needs for software development, I'm looking at the Intel NUC series of devices.  All I need is:

* small
* fast
* at least 32 gigs of ram
* whisper quiet
* ssd storage; at least 1 tb

I've settled on the Intel NUC Kit NUC6i5SYH which is a generation behind the very cool Skull Canyon  but has the advantage of there being a [better chance of getting OSX running on it](https://www.tonymacx86.com/threads/guide-el-capitan-on-the-intel-skylake-nuc.183839/).  Now, that said, I'm likely to start with [Elementary OS](https://elementary.io/) because I'm just so damn tired of performance issues.  If I can do development under Linux that would be great and future proof me.  If not I can go the hackintosh route.

The reason for Elementary OS is that I find the current UI direction in Linux desktops actually bewildering.  I recently installed Ubuntu on my Chromebook and using it was an absolute WTF moment.  Given that I'm going to be going back and forth between OSX and Linux for years to come, having a Unix that works like OSX feels compelling.

This isn't as fast as Kevin Burton's [8 core Ubuntu box](http://www.tbray.org/ongoing/When/201x/2016/10/29/Post-Mac#c1477858058.300020) which he describes as: 

    It's INSANELY powerful. It's like using god's computer.
    
But I'm not [Kevin](https://www.spinn3r.com/) and this is likely good enough for me.  

If I'm ever going to branch out from Ruby to Elixir, which I want to do desperately, I can't be fighting performance every single day.  It is just plain too distracting.  

Oh and a NUC is only $375 or so plus ram and SSD.  That's dirt cheap by Mac standards.  Honestly seeing that kind of price makes me feel a bit stupid for how much money I've spent in the Apple ecosystem over the years.

Oh and did I mention that a NUC can, out of the box, drive two full displays?  Damn.

Finally if using it for development doesn't work out then it can always become a full time plex server allowing me to retire a still functional latop into one of the kids computers.

## Computing for Everything Else

In terms of computing for everything else, I've look at all the candidates:

* Razer
* Thinkpad
* Asus Zenbook

Here's a [Hacker News thread that is inadvertently on high quality machines](https://news.ycombinator.com/item?id=12843775) and this is a good [sub thread](https://news.ycombinator.com/item?id=12845081).  

All of those machines have one or more issues.  Most of it is around hardware quality.  Apple's hardware really is lovely and its robust.  My 2010 Macbook is now 6 years old and it runs 24x7x365 with nary a hiccup.  Find a PC laptop that's 6 years old and still running that hard.  

The only machine that made me drool was the Razer and it just feels too big.  I went over to the Macbook Air for mobility - the combination of size and weight was hugely desirable.  What I found with that decision was that the 13" form factor is, for me, the sweet spot.

What I'm actually considering for a Macbook Air replacement is ... wait for it ... a Macbook Pro.  Despite my vitriol there is one option I hadn't considered -- the **old Macbook Pro**.  Apple is still selling them and they are even on clearance if you don't need a custom configuration.  That would get me onto a 2015 model which a 3 gig processor, 1 tb storage and 16 gigs of ram.  Yes its not what I wanted but considering that the cost of a tricked out past generation Macbook Pro plus a NUC is less than a tricked out new Macbook Pro, well, its a no brainer.  And it would get me HDMI out, real usb, thunderbolt, SD card slot, etc.  Apple's new port strategy is bold but I don't think its viable yet.  And it would get me the keyboard that I actually enjoy.

The other side of getting a new mac is that I'm still interested in building iOS apps and XCode is painful on a Macbook Air.  And XCode will never run on anything that isn't apple hardware (nor should it).   And I'll never carry two laptops ever again; that's a suck ass experience in an airport.

# Conclusion - A Synchronized Computing Environment For Me

Given that I'll be dealing with two primary computing devices and want the ability to pick up and goto a coffee shop from time to time with either code or non code that's a concern.  What I've done across all my Mac boxes is used Dropbox with a paid account and the core bit of my data that has to move with me is always synchronized.  As long as I'm not modifying the same git repo across multiple boxes at the same time, I'm absolutely fine.  [Dv](http://dasari.me/) showed me this trick and I'm eternally grateful as it is honestly life changing.

Beyond data, the application I spend more time in than anything else is an editor and I suspect this is where I need to change my habits.  I've been using TextMate now since 2006 and I think the time has come to bite the bullet and move to either Atom or Sublime.  Neither excite or inspire me but partly that's an old dog new tricks type of thing.

In conclusion the concept of Apple not selling good enough gear for a professional developer is profoundly disturbing to me.  But, as its said, all good things must come to an end.  And it does feel like we've been in a golden age that we're transitioning away from.  When I changed from Windows to the Mac for development it was a huge boost to my skill set and I suspect being on a full Linux full time will be a similar boost.

# References and Other Interesting Things

Various things I discovered about Elementary OS and related hardware / software stuff using my iPad in a pre bed time research session:

* Intel Nuc Stuff

  * [An intel nuc review](http://www.digitaltrends.com/desktop-computer-reviews/intel-nuc-core-i7-review/)
  * [An Intel Skull Canyon Review](http://www.digitaltrends.com/desktop-computer-reviews/intel-nuc6i7kyk-skull-canyon-review/)
  * [Ram pricing for the NUC](http://www.crucial.com/usa/en/compatible-upgrade-for/Intel/nuc6i5syh)

* Elementary OS
  
  * [Good Hacker News Thread About Elementary OS and its Many Pros and Cons](https://news.ycombinator.com/item?id=12830761)
  * [Very Good "A Week with Elementary" Article](https://adam.merrifield.ca/2016/09/17/a-week-with-elementary-os-loki-0-4-0/)
  * [All Hacker News Coverage of Elementary](https://hn.algolia.com/?query=elementary%20os&sort=byDate&prefix&page=0&dateRange=all&type=story)
  * [Installing Elementary on a Macbook Pro](http://forlearning.com/dual-booting-elementary-os-and-osx)
  * [To figure out what hardware is in your Mac use dmidecode](http://cavaliercoder.com/blog/dmidecode-for-apple-osx.html)  
  * [Use dmidecode with EveryMac](http://www.everymac.com/)
  * [Reddit Forum](https://reddit.com/r/elementaryos)
  * [Web Development on Elementary OS Loki](https://adam.merrifield.ca/2016/09/20/web-development-on-elementary-os-0-4-0-loki/)

* Unix Versions of Common Mac Tools

  * [Terminal Alternatives to iTerm](https://www.reddit.com/r/Ubuntu/comments/3u2l5r/which_is_best_iterm_alternative_for_ubuntu_guake/)
  * [Replacing the Elementary Terminal](https://adam.merrifield.ca/2015/11/23/4-steps-to-replace-the-terminal-in-elementary-os-freya/)
  * [Linux Alternative to Alfred - Albert!](https://github.com/ManuelSchneid3r/albert/wiki)
  * [Atom.io works as an editor](http://www.atom.io)
  * [Cronopete is one TimeMachine replacement](http://www.rastersoft.com/programas/cronopete.html) - warning no changes to github for 6 months; mildly concerning
  * [Back in Time is another Backup Tool](https://github.com/bit-team/backintime)
  
  
* Misc

  * [How to get a Linux running on an older PowerBook](https://antergos.com/wiki/install/installing-antergos-on-a-macbook-82-mid-2011/)
  * [Yes Virginia Dedicated Linux Hardware Firms Offer Laptops](https://system76.com/laptops/lemur)
  * [And they Offer Overpriced, Fully Configured NUCs](https://system76.com/cart/configure/meer2)
  * [Another Linux Laptop Company Albeit One with Controversy](https://puri.sm)
  * [A Fedora Based Distro Supposedly Easier to Install on a Macbook with Elements of the same Goals as Elementary OS](https://kororaproject.org)
  
# Sidebar - Elementary OS Really Does Work on Mac Hardware, Even Old Mac Hardware

Yesterday I got my copy of Linux Format magazine and I laughingly scoffed at the DVD to my son -- "who needs that".  And then earlier today I noticed that the included distro was actually Elementary.  Well, during the course of a very busy work day, I still managed to get an old MacBook up and running Elementary using that same, initially scoffed at DVD.  Here's a pic to prove it:

(elementary_on_old_mac)[/blog/assets/elementary_on_old_mac.jpg]

This is hardware that I haven't touched in maybe 3 years.  It was even too slow for the kids to play Minecraft on so I pulled it out of the closet and its now sitting alongside my other kit.  Hopefully I'll pull some of the tools above onto it and see how things work.

The one thing that I've noticed is that mouse sensitivity is way too high and its hard to click on things. Other than that it really is a beautiful distro.


