---
layout: post
title: So My Mac Keeps Crashing
category: osx
tags: ["osx"]
---
{:.center}
![IMG_6366.jpeg](/blog/assets/IMG_6366.jpeg)

I'm in the unenviable position of my MacBook Pro (2015 vintage) crashing regularly -- once yesterday, twice the day before, once the day before.  I used to have an uptime measured in the tens of days -- there have been periods when I had an uptime measured, on this computer and this OS version, of 100 plus days.  And now I have this bit of pathetic:

    ❯ uptime
     7:04  up 16:23, 79 users, load averages: 5.52 26.30 57.61
     
Yep.  That's 16 hours.  *grumble*

So something changed -- but what?  The problem here is that whatever changed, there was a clear temporal disconnect between the change and the start of the crashing.  And **wham**:

* I took a phone call and walked away from my computer
* I returned and my machine was again crashed

Here are the characteristics of the crash:

* the foreground app was TextMate 2 (almost always the foreground app on my computer)
* caps lock doesn't turn on 
* machine apple logo doesn't turn off when the lid is closed
* mouse doesn't move
* no crash log event file is generated that tells me what happened and (uselessly) "report it to apple" when I restart.

Here's what I've tried so far:

* stopping using Chrome (because Chrome is a damn beast using more resources than anything else on my machine)
* turning off Dropbox
* turning off bluetooth (because I recently turned it on)
* stopping my TimeMachine backup
* dumping my normal trinity of chat apps: FB Messenger, Signal and Telegram

So my theory is that something is happening when my machine isn't actually processing input (whether mouse or keyboard) such as an update process.  And since this seemingly started happening without any formal update process, it is likely an app which self updates.  So, my next task is to close:

* DropBox
* Box Sync
* CleanMyMac
* KeyBase
* Tuple
* Duet
* Alfred
* Slack
* Sublime
* Messages
* Notes
* Postico

And, when I walked away to go to the grocery store, my machine crashed again.  This time I'm also closing:

* SyncThing

If this doesn't work then my apparent options are:

* change my computer usage so if I'm not at the keyboard working, the lid is closed
* upgrade the os (undesirable because I'm deliberately staying at Mojave)
* new computer (also undesirable because that means I get forced off Mojave and Apple has yet to ship a 13" Macbook Pro which takes 32 gigs of RAM)
* temporarily swap over to another machine in the house until Apple ships new hardware
* take my machine to Apple and see if hardware diagnostics reveal anything; undesirable because its not currently backed up and can't stay running long enough to back anything up 
* create a new user account on the machine and see if working in that new user account changes anything

I also did do a TextMate update today so maybe that fixes something. Sigh.  

One useful tool that I remembered for looking at log files of what's going on on my mac is [Console](https://blog.macsales.com/45586-how-to-use-the-mac-console-app-to-diagnose-a-crash/).

## Update After Several Hours

Well my machine has now been usable for several hours.  I'll just need to keep using it and see what happens.  *additional grumbles*

