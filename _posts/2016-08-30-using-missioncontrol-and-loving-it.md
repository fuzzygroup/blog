---
layout: post
title: Using Mission Control and Loving It
category: OSX
tags: [osx, mission_control, total_spaces, virtual_desktops]

---
Once upon a time, in 2000, when I was out of work I spent a lot of time using Red Hat linux on a old ThinkPad running XFCE where I was lucky enough to make virtual desktops work.  Partitioning what I was working on physically away from everything else just made sense.  I haven't had that since but I do today and I'm loving it.  Here's what I'm using:

* OSX Capitan
* Mission Control
* [Total Spaces From Binary Age](http://totalspaces.binaryage.com/elcapitan)

Out of the box, Mission Control is one of those bits of infuriatingly good Apple products that make you want to rend your clothing and weep salty tears.  The default user interface for Mission Control is simple -- you can have all the virtual desktops you want but you can't actually give them names.  Yes there are workarounds like "[create an image and assign it as a background with the name of the desktop on the image and use a different color for each](http://apple.stackexchange.com/questions/211954/how-can-i-name-desktops-spaces-in-el-capitan)".  That works ok but when you have a lot of windows then you can't see the name so you're looking at edges of the screen and trying to guess the color.  Overall the lack of a human readable name strikes me as one of the more user vicious ideas from Apple in a long time.

What Total Spaces does is require you to turn off System Integrity Protection so it can inject code into OSX itself to enable features like these:

{:.center}
![Menu for Selecting Between Desktops](http://imgur.com/mSbCNPb.png)

{:.center}
![Admin Tool](http://i.imgur.com/gIlXZ2I.png)

Using Mission Control takes some getting used to.  Here's the process:

0.  Install Total Spaces.  Its ok.  Even I did what it asked without any issues.  I also installed [CDock](http://w0lfschild.github.io/app_cDock.html) at the same time.
1.  Turn on Misson Control.
2.  Create virtual desktops that reflect your logical contexts.  For example I use iTerminal window #3 for all my writing and blogging so I made that #3 in Mission Control.
3.  If you have a pile o' windows like I tend to then you're in for an annoying task - moving all of them, generally one by one, to a the correct virtual desktop.  Do this as follows: 
  * click with the mouse in the Window's title bar
  * press the control key and hold it down
  * press an arrow key (right or left) to *slide* the window into the right virtual desktop.  Yes its screwy but it really does work.  Supposedly you can "Drag the window to the edge of the screen. After a moment, the window moves to the next space" but that, [documented technique](https://support.apple.com/kb/PH21872?locale=en_US), has never once worked for me.  But I also installed Total Spaces and removed SIP so who knows why.  It could well be me.  You can also use the Mission Control UI and drag and drop to another desktop but oddly while I don't like the mouse + control + arrow keys, it feels better to me.
  
  
## But What About Communications?

Where this always falls down is generally communications - mail or instant message or slack.  These are apps, that when they chime, you don't want to them be hidden or you, like me, will go "&*()#$*#($#) where is it!!!"  CTRL+CLICK on the app's Dock icon and then you can bind the app to either all desktops or this desktop.  Very helpful. You can even go so far as to pick a single Safari window and bind it to all desktops. Great for mail or if, like me, you use a [gist](http://gist.github.com/) as a simple way to transfer text snippets across machines.

## This is a Pain But Recommended

Yes.  No disagreement - setting this up is a pain.  As [people who know me well](http://dasari.me), I don't reboot my machines often or easily.  My normal uptime on a laptop is usually north of 70 or 80 days.  I felt that this was important enough that I rebooted today to install Total Spaces without any reservation.  High praise for me.  For the first time in a long time it doesn't feel like context switching between projects, something I do constantly, is a burden.  Overall **Recommended**.

## Resources
Here are some useful links:

* [https://support.apple.com/kb/PH21872?locale=en_US](https://support.apple.com/kb/PH21872?locale=en_US)
* [http://superuser.com/questions/986669/osx-el-capitan-spaces-bar-show-expanded-window-thumbnails-previews-by-defaul](http://superuser.com/questions/986669/osx-el-capitan-spaces-bar-show-expanded-window-thumbnails-previews-by-defaul)
* [http://apple.stackexchange.com/questions/211954/how-can-i-name-desktops-spaces-in-el-capitan](http://apple.stackexchange.com/questions/211954/how-can-i-name-desktops-spaces-in-el-capitan)
* [http://osxdaily.com/2011/10/26/use-different-desktop-background-pictures-for-spaces-in-mac-os-x-lion/](http://osxdaily.com/2011/10/26/use-different-desktop-background-pictures-for-spaces-in-mac-os-x-lion/)
* 
## Shout out 

Thanks to my buddy [Dv](http://dasari.me/) who helped with Markdown and CSS issues.  Appreciated.