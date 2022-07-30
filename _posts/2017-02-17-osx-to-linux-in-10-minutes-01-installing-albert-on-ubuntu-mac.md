---
layout: post
title: OSX to Linux in 10 Minutes 01 - Installing Albert on Ubuntu Mac
category: osx_to_linux
tags: ["osx_to_linux", "osx", "postmac", "linux", "ubuntu"]
description: Albert is an Open Source version of the OSX utility Alfred.  It is a simple launcher and file finder that makes using your desktop Linux system faster, easier and more pleasant.  
image: https://raw.githubusercontent.com/ManuelSchneid3r/albert/master/v0.8.11.gif
---
{% pizzaforukraine  %}

One of the most pleasant aspects of OSX is the tool [Alfred](https://www.alfredapp.com/).  Alfred is a simple launcher that you can toggle with CTRL+SPACE and the best way I can describe it is that it makes the god awful OSX search engine (Spotlight) actually usable.  Honestly I've used Alfred so long now that I don't even know if it is its own search engine or a Spotlight front end or what.  What I do know is that I absolutely love it.

I started the day with the realization that I need to work more on my desktop Linux box.  Honestly I have a 32 gig Intel NUC running a Dell Ultra Widescreen monitor and I don't use it since I'm in an OSX rut.  So I turned it on and: 

* The network connectivity was dead
* The only easy way I could get that working again was to reboot it

Sigh.  All is not necessarily well in Ubuntu Land when the first thing you have to do is restart it but then again my brand new MacBook Pro that cost me about 3 grand, well, it shuts down constantly.  So win some, lose some I guess.

Anyway I rebooted and the very first action I did was press CTRL+SPACE and then swore up and down when Alfred wasn't there for me.  So let's fix that, shall we?

# Installation

A little bit of [Google fu](http://www.webupd8.org/2015/01/albert-fast-lightweight-quick-launcher.html) told me that the desktop Linux equivalent is called Albert.  Here's how to install it:

```bash
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get install albert
```

After that, if you're running [Ubuntu-Mate](https://ubuntu-mate.org/), then you'll find it in Applications / Accessories.  Once you run it, it recognizes that it is on first launch and you need to set a command keystroke to summon it and it will ask you if you want to.  Select this option and then you can map it to anything.  I used CTRL+SPACE.

You probably want this to start automatically when your Linux box starts up so here's some Terminal Fu to do that.  

```bash
cp /usr/share/applications/albert.desktop ~/.config/autostart/ && chmod +x ~/.config/autostart/albert.desktop
```

Thank you to [rhoconlinux](https://github.com/albertlauncher/albert/issues/11) for contributing this!

Once you have this installed then you can press CTRL+SPACE on your Linux desktop and search for things in much the same way that you can on OSX.  **Recommended**.

# Further Reading:

* [Home Page](https://github.com/albertlauncher/albert)
* [Docs](https://albertlauncher.github.io/docs/)
* [Quick Read](http://www.webupd8.org/2015/01/albert-fast-lightweight-quick-launcher.html)
* [Patreon](https://www.patreon.com/albertlauncher)
* [PayPal](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=W74BQPKPGNSNC)


**Note**: No screenshots yet; still figuring that out on Linux.
