---
layout: post
title: Creating a Hackintosh from an Intel NUC
category: mac
tags: ["mac", "osx", "hackintosh"]
---
A few weeks ago I converted my Desktop Linux box from Ubuntu to an OSX (Sierra) based Hackintosh using the brilliant documentation and technology found on the [TonyMacX86 site](https://www.tonymacx86.com/).  However I did it in a spur of inspiration and never bothered to document the process -- yes, I am an idiot.  And then, today, in an inspiring display of additional idiocy, I accepted an Apple System Update -- and broke everything.  And, naturally, since it was a brand new box, I hadn't gotten around to setting up Time Machine or Carbon Copy so, well, this is pretty much toast.  So while this is a complete disaster, I use [Ansible to configure all my application software](http://fuzzyblog.io/blog/mac/2017/07/31/configuring-your-mac-with-ansible-take-2.html) and DropBox to sync my development environment so if I can just get the machine to boot again, well, I should be good to go.  The rest of this blog post writes out all the steps I found to make an OSX based Hackintosh from an Intel NUC.  

**Disclaimer**: This is lower level with hardware than I generally care to go so I'm unlikely to be willing or even able to answer questions.  You too can have the joyful experience of groveling thru driver documentation and figuring it out on your own -- I did.

# Step 1: Understand that a Hackintosh Isn't a Mac

The first step in all this is that you need to understand that a Hackintosh isn't a Mac -- it is a Hackintosh and that has limitations.  Here are some of the ones that I found: 

* I never got audio to work
* The first system update I put on it blew up the disc rendering it unbootable
* I never got Messages to work

But, for what I wanted, a development box, here's what I got:

* 32 gigs of RAM
* Tiny form factor
* Whisper quiet
* More reliable than my Macbook Retina Pro 13" (2015)
* Cheaper and used hardware I already had

So this really can work but don't kid yourself into thinking that what you have is a Mac, it really isn't.  You need to keep it regularly backed up and take system updates with a high degree of care.  

# Step 2: Making a Bootable USB Stick

The first step you want to follow is to make a bootable USB Stick (think of this as equivalent to a Unix LiveCD and you'll be ok).  The directions to follow are [here](https://www.tonymacx86.com/threads/unibeast-install-macos-sierra-on-any-supported-intel-based-pc.200564/#create_unibeast) and I've put any specific notes below.

1.  You may not have an option in Disk Utility to create a GUID Partition Map scheme but if they aren't there then it seems to default to them.  If you have problems using Disk Utility then here's a [good reference](http://www.macworld.com/article/2990837/storage/how-to-format-a-startup-drive-in-el-capitan.html).
2.  OSX Sierra can be downloaded from the Apple Store and it needs to be put in your /Applications folder for this to work.
3.  Creating the USB Stick with Unibeast generally runs perfectly.  It isn't fast but it does the job.  Keep in mind that it can take long enough that you think it has crashed -- but it always seems to finish.  I used UEFI boot mode for an Intel NUC and did not select any of the optional graphics configuration settings.


# Useful Hackintosh Links

* [The Best Sierra INnstructions I Found](https://www.tonymacx86.com/threads/unibeast-install-macos-sierra-on-any-supported-intel-based-pc.200564/)
* [My NUC](https://www.amazon.com/gp/product/B018Q0GN60/ref=oh_aui_detailpage_o00_s00?ie=UTF8&psc=1)
* [Sierra On Any Intel PC](https://www.tonymacx86.com/threads/unibeast-install-macos-sierra-on-any-supported-intel-based-pc.200564/#download)
* [El Capitan NUC Guide](https://www.tonymacx86.com/threads/guide-el-capitan-on-the-intel-skylake-nuc.183839/)
* [El Capitan Post Install Tools](https://www.tonymacx86.com/resources/el-capitan-post-install-tools.294/)
* [Reddit Thread on Managing Your Hackintosh without Multibeast](https://www.reddit.com/r/hackintosh/comments/3c2wgy/guide_how_you_should_be_managing_your_hackintosh/)
* [Don't Use Multibeast](https://www.reddit.com/r/hackintosh/comments/5jl4u7/psa_dont_use_multibeast_and_dont_edit_your_clover/)
* [Sierra Problems](https://www.tonymacx86.com/threads/sierra-installation-works-but-wont-boot-once-multibeast-installed.204644/)
* https://www.tonymacx86.com/threads/guide-el-capitan-on-the-gigabyte-ga-z170n-gaming-5-mini-itx.199805/
* [NUC Search](https://www.tonymacx86.com/search/25328190/?q=intel+nuc&o=date)
* [Unibeast Yosemite Problems](https://www.tonymacx86.com/threads/unibeast-5-0-1-cant-select-yosemite-installation-type.144159/)
* https://www.tonymacx86.com/resources/multibeast-el-capitan-8-2-3.319/
