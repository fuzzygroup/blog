---
layout: post
title: An Engineer's Guide To Having Your Credit Card Stolen
category: misc
tags: ["misc", "credit_card", "cloudflare", "cloudbleed"]
description: While having your credit card sucks monkey chunks, its actually not that bad to update all the sites a developer relies on.  Here's an example.
---
{% pizzaforukraine  %}

So the one credit card that my wife and I rely on was recently stolen.  Personally I put the blame on [CloudFlare / CloudBleed](https://www.google.com/search?q=cloudbleed&ie=utf-8&oe=utf-8) since it occurred just after I purchased the HumbleBundle for Arduino (Feb 22nd) and that's:

* the only different credit card transaction done in the past few weeks
* HumbleBundle was affected by CloudBleed

But, that said, I don't know to 100% certainty and this wasn't Humble's fault so I'll still keep purchasing from them.  But I do feel pretty good in thinking that this was due to CloudFlare and I certain, after having reviewed more technical details, that CloudBleed is a lot worse than the [CloudFlare](http://www.cloudflare.com/) company is admitting.  If you haven't yet started the login change process you might want to think about it.  Even I am gearing up to change all my damn passwords.  Sigh.

Now that we just received new credit cards, I thought outlining the process of what to do when you're a developer might be interesting for someone out there.  

1.  If you're not using a digital wallet to manage your secure crap (passwords / credit card data / pins) then I'd highly recommend it.  I've tried a bunch but the one I like best is [EnPass](https://www.enpass.io/) which runs on iOS, OSX, Windows and Unix, uses DropBox for sync from a small company in India.  **Recommended**.
1.  [Github](http://www.github.com/settings/billing).  Github is keys to the kingdom so it is always my first stop.  Drop down the menu next to your profile picture and choose settings and then billing.  Then do the credit card credentials three step jig.
2.  [GoRails](http://gorails.com/users/edit).  [GoRails](http://gorails.com/) is a screencast service about Rails.  I have a legacy account grandfathered in at $9 / month and I don't want to lose it so it was my #2 stop.
3.  [Elixir Sips](http://www.elixirsips.com). ElixirSips is a screen cast service for Elixir and Josh Adams does a great job on it as it was my #3 stop.
4.  [Amazon](http://www.amazon.com/).  How can you not change the big A?  I suspect we all know how to do this by now.
4.  [AWS](https://console.aws.amazon.com/billing/home/#paymentmethods).  Your AWS card can be different from your Amazon card and mine had contact details that were 3 years out of date so make sure to check them.  This is also a great opportunity to shut down any AMIs, instances or snapshots you're not actually using.  You should also check your Cost Explorer while you're at it. I'm finding Route 53 Hosted Zones to be oddly pricey but more on that later...
5.  VPN.  We don't all use VPNs but if you are trying to crawl geographically different information like the Google Play store world wide, a VPN is an awesome testing tool.  Everyone's usage here is different so YMMV.
6.  Apple.  This can easily be done under iOS via Settings / Wallet & Apple Pay.
7.  [DropBox](https://www.dropbox.com/account/profile).  I hate DropBox's performance.  I despise how it runs my CPU at 99% constantly and turns my bloody MacBook Pro fan on but other than my code editor it is probably the one app I just can't live without at this stage.  DropBox keeps all my files up to date across three MacBooks, a Linux desktop, an iPad and an iPhone.  
8.  [BackBlaze](http://www.backblaze.com/).  I actually am no longer a current BackBlaze subscriber but I know lots and lots of us are so if you use BackBlaze or another cloud backup tool I'd update that.
9.  [Meh](http://www.meh.com/account).  If you're reading this and you haven't ever used Meh then you really, really should.  Its an outstanding Nerd resource.
10. [Freshbooks](http://www.freshbooks.com/#/profile).  Since I'm going back to full time freelancing shortly, decent accounting software is called for an Freshbooks is pretty great.  
99. Search your email for the word receipt and look at anything in the last 60 days and you'll likely be ok.

Now, print this out for your wife / significant other so they know where your card has been updated.
