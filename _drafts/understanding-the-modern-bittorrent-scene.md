---
layout: post
title: Understanding the Modern Bittorrent Scene
---
The modern bittorent / media piracy scene is absolutely astounding.  If you're nerdy enough, well, you don't ever have to pay for media again and you can get a vastly better selection of media far more easily than you would expect.  In particular you don't ever have to see a commercial again and that's particularly wonderful.  Finally you can have full control over what your kids watch which, as a parent, is something I find invaluable.

Note: This document is being shared with you because you're a friend.  Please don't re-share.

# The Hardware

Here's my recommended hardware configuration:

* Modern computer; if you want a dedicated computer for this then I'm a fan of the Intel NUC - small, fast and silent with more than enough power to download and serve media
* Two hard drives (large media drives tend to fail; use rsync to synchronize all data from a master drive to a slave drive and then throw out the master when it fails, promote the slave to master and buy a new slave)
* Large screen TV
* Roku box for interfacing to your shared content and watching it on screen; you can go for the new 4K roku but I personally favor the older [Roku 3](https://www.amazon.com/Roku-Streaming-Player-Certified-Refurbished/dp/B016LBZVN2/ref=sr_1_1?s=tv&ie=UTF8&qid=1486204785&sr=1-1-spons&keywords=roku+3&psc=1&smid=A334XHS1C5Y12J) You should note that there are lots and lots of Roku like devices.  What you really want is one that is Plex compatible.

I favor a dedicated computer for this because a VPN can get in the way of normal computer activity.  If, for example, your VPN is locked down to say Sweden then that's where Google perceives you to be which can cause search issues, gmail problems and more.  The computer also handles the transcoding (or at least that's what the log messages say).  .  You can also run Plex on top of a NAS device but I have no particular experience with that.

If you find that you only have a limited number of HDMI ports then a [$11 HDMI splitter](https://www.amazon.com/Fosmon-HD1831-3-Port-Switch-Pigtail/dp/B008GVOVK0/ref=pd_lpo_23_bs_t_2?_encoding=UTF8&psc=1&refRID=03FFEM9AM3VZYZC0016B) from Amazon makes it all better.

# The Software

I'm a huge, huge fan of [Plex.tv](http://www.plex.tv).  Plex is, well, iTunes for All Media with the difference that you don't consume content in Plex on your PC -- you use a TV with a box like Roku or a mobile app on your phone.  What Plex does is take in a file system hierarchy that you specify and serve it out to your devices.  If you are very sophisticated then you can even watch your Plex content when away from home thru a subscription that Plex.tv offers.

Plex is just a media server.  You still need to acquire media somehow.  This can be done with any of a number of tools including:

* Bittorrent Client Software
* [NZBGet](http://nzbget.net/)
* [SickRage](https://sickrage.github.io/) 
* [CouchPotato](https://couchpota.to/)
* [CouchPotatoServer](https://github.com/CouchPotato/CouchPotatoServer)

Additionally there area  raft of tools and utilities that make the overall process easier:

* https://github.com/seedbox/deploy
* https://github.com/seedbox/sync
* [FileBot](http://www.filebot.net/)

The open source community has been impressive in its support for media consumption.  The links above have barely touched the surface.

# Avoiding Detection - VPN or Seedbox

There are two basic approaches to avoiding detection: 

* VPN
* Seedbox

A VPN is just that - a virtual private network - that routes your traffic away from your host so that where you go on the Internet can't be monitored. If you are running a local bittorent client then a VPN is absolutely essential.  Be careful though - if your VPN fails then your bittorent traffic can be exposed to your ISP and you'll likely get a cease and desist letter.  If you use a dedicated computer for media then you really, really want a VPN that:

* starts on boot
* shuts down your Internet connection if the VPN fails
* requires NO manual action on startup (MullVad, on OSX, requires you to always enter a sudo password and this stops it from launching automatically)

A seedbox is a dedicated Internet host who generally provides a VPN, web based torrenting software (ruTorrent normally) and an instance where your content can be torrented.  In this case the torrenting happens NOT on your computer but on an instance in the cloud, often in a non-US jurisdiction.  Then, after the files have been pulled into your cloud instance, you can FTP them down to your computer (or watch them from the cloud but I've never done that).  [Seedboxes.cc](http://https://torrentfreak.com/) has worked great for me but choose one according to your needs.

Seedboxes are astonishingly fast.  The days of bittorrent taking hours are long gone -- a modern 700 meg movie download might take as little as 5 minutes.

For information on choosing seedboxes, see the [Reddit SeedBox thread](https://www.reddit.com/r/seedboxes/.

# Media Sources

There are a number of ways that media can be acquired: 

* Bittorrent in which case ThePirateBay is still a huge factor
* Usenet; Here's a [general usenet tutorial](https://www.codecguide.com/usenet_tutorial.htm)  Usenet vendors include:

  * [SuperNews](http://www.supernews.com/)
  * [GigaNews](http://www.giganews.com/) (includes VPN)

A general tutorial on downloading with Usenet is [here](https://paulstamatiou.com/how-to-download-with-newsgroups/).

# References

* [News on Torrenting](https://torrentfreak.com/)

