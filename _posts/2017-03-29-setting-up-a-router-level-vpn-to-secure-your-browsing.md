---
layout: post
title: Setting Up a Router Level VPN to Secure Your Browsing
category: vpn
tags: ["vpn", "privacy", "security", "router"]
description: Given that Congress has now made it legal for your ISP to sell your Internet browsing history, its time to protect yourself with a VPN.  Here's how.
---
Well the fools in Congress really did it -- they made it [legal for any ISP to sell your browsing habits](https://arstechnica.com/tech-policy/2017/03/for-sale-your-private-browsing-history/) - [Hacker News Discussion](https://news.ycombinator.com/item?id=13981184).  If you think this isn't a privacy issue then consider these examples:

* Visiting babycenter.com?  Maybe you're pregnant.
* Visiting cars.com?  Maybe you're buying a new car.
* Visiting celiac.com?  Maybe you have medical issues around gluten.
* Visiting kink.com?  Maybe you're a sexual deviant.  

# How To Setup a Router Side VPN

This is an **abomination** of everyone's privacy and the only even partial answer is to start using a VPN immediately.  Here's how I did it.  I have an Internet connection from a local fiber ISP named [NineStar](https://www.ninestarconnect.com/residential/residential-internet/).  They provided us with an ASUS RT-N66U router.  Here's the step by step illustration of how to do this using this router.  I suspect that most current routers will now support this type of VPN setup but you need to check your router.

1.  Sign up with a VPN provider. This usually costs between $5 and $10 per month.  I used [StrongVPN](http://www.strongvpn.com/) just now but I also looked at [Mullvad](http://www.mullvad.net) and [Private Internet Access](http://www.privateinternetaccess.com/).  All of these are good; I've previously used Mullvad and they kept my browsing safe for years.  One of the reasons I went with StrongVPN was their wide support for mobile devices including [iOS, Google Play and more](/blog/assets/vpn09.png).
2.  Go into your router's control panel and find the VPN option:<br/>
![/blog/assets/vpn01.png](/blog/assets/vpn01a.png)
3.  Select the VPN client option:<br/>
![/blog/assets/vpn02.png](/blog/assets/vpn02b.png)
4.  Set the VPN client parameters:<br/>
![/blog/assets/vpn03.png](/blog/assets/vpn03c.png)
5.  The parameters you really need to set are description (which VPN service you are using), VPN Server, User Name and Password.  You should also turn on Auto-Reconnection.

# Disadvantages

Using a VPN can be a really nerdy thing and there can be disadvantages.

## Turkey Anyone?

For example I was initially assigned to a VPN server that was located in Istanbul, Turkey.  This had the amusing impact of Google thinking that I was Turkish and giving me results from google.tr:

![/blog/assets/google_turkey.png](/blog/assets/vpn04.png)

The solution for me was to log into StrongVPN and then change my VPN server's location to one in Atlanta.  Here's that process:

1.  Login to the [Customer Area](https://intranet.strongvpn.com/services/intranet).
2.  Click on Change Server:
![/blog/assets/vpn05.png](/blog/assets/vpn05.png)
3.  See what servers are available:
![/blog/assets/vpn06.png](/blog/assets/vpn06.png)
3.  Choose a country:
![/blog/assets/vpn07.png](/blog/assets/vpn07.png)
4.  Choose a server:
![/blog/assets/vpn07.png](/blog/assets/vpn07.png)
5. Click the Change Server button:
![/blog/assets/vpn08.png](/blog/assets/vpn08.png)

## Netflix, Sigh

The biggest issue for most people with a VPN will be that it kills Netflix entirely.  If you google for [Netflix VPN](https://www.google.com/search?q=Netflix+VPN&oq=Netflix+VPN&aqs=chrome..69i57j0l5.419j0j7&sourceid=chrome&ie=UTF-8), the 570,000 search results for that simple query should indicate that there's something going on here.  The issue is that VPNs make content access look like it comes from a different location thus allowing a Netflix customer in say Thailand to get the U.S. version of Netflix.  And since this violates all kinds of content licensing, Netflix aggressively prevents the use of a VPN.  StrongVPN is supposed to work with Netflix (that's one of the reasons I chose it) but, right now, at least for me, it seems to be failing.

For right now I'm going to go with the "Turn VPN on / off" when we want to use Netflix.  I'm sure there are better approaches and I'll likely figure one out but for now this will work given that most of our media content is on a local [Plex](http://www.plex.tv) server and not on Netflix.  

I know the Netflix problems absolutely suck but the privacy and security that this provides is absolutely worth it.


