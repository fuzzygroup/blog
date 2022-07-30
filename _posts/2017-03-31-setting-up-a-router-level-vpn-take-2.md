---
layout: post
title: Setting Up a Router LeveL VPN Take 2
category: vpn
tags: ["vpn", "privacy", "security", "router"]
description: Given that Congress has now made it legal for your ISP to sell your Internet browsing history, its time to protect yourself with a VPN that allows you to use Netflix.  Here's how.
---
{% pizzaforukraine  %}

Three days ago [I wrote up how to configure a Router level vpn](http://fuzzyblog.io/blog/vpn/2017/03/29/setting-up-a-router-level-vpn-to-secure-your-browsing.html) to secure your Internet browsing so your ISP can't know where you're visiting and sell your Internet history.  That tutorial is still very relevant but the commercial VPN provider I used, [StrongVPN](http://www.strongvpn.com/), prevented me from using Netflix.  My initial plan had been to turn the VPN on / off at the router level when we wanted to use Netflix but my kids apparently use Netflix very regularly when I'm at work so that's kind of a non starter.  This meant that I needed a different VPN solution -- one that I ran myself and not a commercial provider.

The reason that Netflix blocks VPN access is that they don't want customers in other countries buying the US version of Netflix to get around country specific content licensing.  And since any VPN provider is an ongoing business with a persistent set of IP ranges, Netflix can easily block any centralized VPN provider just by noting "Ok - StrongVPN is using xxx.yyy.vvv.zzz" so using any commercial provider is always going to play cat and mouse.  The one I used, StrongVPN, had a history of being Netflix compliant but that's apparently no longer the case.  

The approach that I took is one that's currently popular among networking folk that I know online:

* Take a cheap cloud computing instance like an AWS t2.micro or a Digital Ocean droplet
* Configure an open source VPN tool on top of it
* Use that for all Internet access including router level access like I linked to above

There are a number of these solutions now available and they generally operate using a provisioning engine like Ansible to spin up the cloud instance, install the VPN and create the needed infrastructure.  Here are the ones I looked at:

* Hacker News Discussion Threads on this Topic: [AutoVPN](https://news.ycombinator.com/item?id=13249523), [Algo](https://news.ycombinator.com/item?id=13998493), [Streisand](https://news.ycombinator.com/item?id=13996417)
* **Recommended** [Algo](http://github.com/trailofbits/algo) | [Blog](http://blog.trailofbits.com/2016/12/12/meet-algo-the-vpn-that-works/)
* **Recommended** [openvpn-install](http://github.com/Nyr/openvpn-install)
* [Streisand](https://github.com/jlund/streisand)
* [Pritunl](http://pritunl.com)
* [Tinc](http://www.tinc-vpn.org)

Of the options above I tried three of them: Streisand, Algo and openvpn-install.  Streisand was very promising but it failed to install completely on either Google Cloud or AWS.  Worse it left a dangling cloud instance on AWS meaning that had I not been watchful, I'd have been paying for that until I noticed.  Algo did far, far better on installation but its post install documentation left me confused enough that I had to file a [Github issue](https://github.com/trailofbits/algo/issues/320) to find out what to do next (which someone answered almost immediately -- thank you!).

Of the options above I ended up using Algo and openvpn-install.  This is likely confusing and, to a VPN expert, actually stupid but here's why:

* Algo handled provisioning the AWS instance and securing it perfectly.  It also generated VPN configurations specific to iOS devices which is useful since we're an Apple household.  
* Algo is a deliberately cut down VPN system focused solely on the IKEv2 spec.  Sadly while this works client side on OSX devices, my router only supports OpenVPN, PPTP and L2TP vpn protocols so I can't use Algo at the router level.  Please be aware that this is a feature not a limitation -- the real solution is for my router vendor, Asus, to support IKEv2.
* Once I had an AWS instance running, there is nothing stopping you from running openvpn-install directly on that AWS instance so you have an OpenVPN protocol that works on a router that only supports OpenVPN -- and that's what I did.
* And since this VPN is now running on my own box, not a commercial provider, it actually does support Netflix which makes my kids happy.
* This should end up being quite a bit cheaper than a commercial provider since a t2.micro not is pretty minimal but untiL i see a bill I won't really know.

# Process

Here's what to do.  Please bear in mind that this requires a full Ansible dev stack complete with Boto so if you're not a Linux or OSX person who's fairly technical, well, you're likely out of luck.

1.  Start by going to [Algo](http://github.com/trailofbits/algo) and downloading it per the instructions.
2.  Run the Algo setup process and answer all the questions.  You likely want to pick a data center for your VPN closest to you for best performance.  It will take a fair bit (roughly 20 minutes to run).  At the end you'll get a nicely formatted although mildly unclear set of instructions.  If you don't want to use openvpn-install also then you can stop here and just configure your local vpn.  Or you can continue to install openvpn-install.
3. Ssh into the algo box:
> ssh -i config/algos.pem ubuntu@xxx.yyy.vvv.zzz
4. Become root:
> sudo su - 
5.  Run the openvpn-install process: 
> wget https://git.io/vpn -O openvpn-install.sh && bash openvpn-install.sh
6. At the end your OpenVPN settings will be in **/root/client.ovpn**   Copy that file locally and then use it to configure a VPN connection at your router or client side.  See my [earlier tutorial](http://fuzzyblog.io/blog/vpn/2017/03/29/setting-up-a-router-level-vpn-to-secure-your-browsing.html) for details on setting up your router level connection.  Either way you should now have a VPN that supports Netflix.  

# Post Installation Steps

After you install, you should goto [whoer.net](https://whoer.net) and check your params.  My local ISP is in Indiana but here's my whoer report once my VPN was running on my router:

![/blog/assets/whoer.png](/blog/assets/whoer.png)

As you can see this reflects the location of my VPN which is located in Ohio.

# Comments

Please bear in mind that this is a sub optimal approach -- I'm running two separate VPN servers now (thought I could shut down the Algo one) but it supports my use case which boiled down to:

* Securing my family's Internet browsing
* Fast and easy installation -- I spent much more time writing these two blog posts than I did dealing with VPN configuration
* Worked router side with a router that didn't support Algo's protocols; ideally I'd have replaced my router with something that ran IKEv2 directly but I didn't feel like that pain right now
* Supported Netflix which made my kids happy
