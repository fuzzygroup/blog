---
layout: post
title: PostMac Linux Take 2: Ubuntu Mate
category: postmac
tags: ["postmac", "linux", "ubuntu", "mate", "elementary"]
---
Well, alas, Elementary OS was not what I had hoped it to be.  While I absolutely loved the look and feel, I found the stability lacking.  All too many times I would find my Macbook Pro running Elementary just locked hard.  And stability is a big deal for me.  I usually have uptime readings on OSX of 3 months or more.  Right now I'm at:

    uptime
     6:28  up 19 days, 22:08, 58 users, load averages: 9.12 13.01 9.51
 
So to have uptime of less than 2 days -- ever -- was just unacceptable.  Now this might have been from my hardware or my video drivers, I never did troubleshoot it.  

Beyond stability I found a few UI things questionable:

* The decision to eliminate the menu bar from applications bothered me a lot; there's a lot of subtle functionality that you can't get to now.  Example - I couldn't recover the history from Chrome after a crash because I couldn't get to that menu item.
* No screen saver or dimming of the second monitor (no dimming is understandable at this distro's stage); no screensaver?  Sheesh.
* No support for crash recovery in the default browser.
* Beyond questionable, I absolutely detest the scrollbar approach.  A scrollbar is supposed to give you a visual queue as to how far you are through content.  This "let's make it small and then show up dynamically crap" is like someone walked over to the brilliant work of [Alan Kay's SmallTalk team](https://en.wikipedia.org/wiki/Scrollbar#History_and_Progression) and peed all over it.  Sigh.  I get that on Mobile real estate is so precious that scroll bars have to change.  This is NOT mobile.

All this makes me sad because I really loved the look and feel.  Elementary OS is really onto something but I don't think its there yet for industrial computing like I need.

To eliminate the hardware from the equation I picked up an Intel NUC and I've about to install Ubuntu Mate on it.  Here's the details:

* Ubuntu Mate is a bit of a retro distro; Gnome 2 not 3.  They describe it as traditional desktop and that doesn't sound all bad.
* How to make the [USB Installer](https://computers.tutsplus.com/tutorials/how-to-create-a-bootable-ubuntu-usb-drive-for-pc-on-a-mac--cms-21187)
* Where to download [Ubuntu Mate](https://ubuntu-mate.org/download/)
* When you goto download the 64 bit version, confusingly, it is described as AMD.  Since I was dropping this on an Intel box I was surprised.  Apparently AMD is the default term for a 64 bit architecture.  I guess I blinked thru that industry change.  

I had been contemplating installing OSX on this but [Kevin Burton's description of using Ubuntu on modern hardware](http://www.tbray.org/ongoing/When/201x/2016/10/29/Post-Mac#c1477858058.300020) appealed to me -- "It's INSANELY powerful. It's like using god's computer."  A NUC isn't that powerful but I'm curious how much Ubuntu versus OSX accounts for that.
