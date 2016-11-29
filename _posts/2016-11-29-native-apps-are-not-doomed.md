---
layout: post
title: Native Apps Are Not Doomed
category: mobile
tags: ["apps", "iphone", "google_play", "android", "xvt", "qt", "software_development", "mobile"]
---
So there was a meme that went around a week ago that I meant to jump on but, well, [database crash and my life was subsumed into disaster recovery](https://fuzzygroup.github.io/blog/aws/2016/11/26/fear-and-loathing-in-awsville-or-adventures-in-partition-resizing.html) so there you go.  Here are the relevant links:

* [Native Apps Are Doomed - 1](https://medium.com/javascript-scene/native-apps-are-doomed-ac397148a2c0#.knd91wksx)
* [Native Apps Are Doomed - 2](https://medium.com/javascript-scene/why-native-apps-really-are-doomed-native-apps-are-doomed-pt-2-e035b43170e9#.iipzbyled)
* [Hacker News Thread](https://news.ycombinator.com/item?id=13002598)

I don't know the author of these pieces but I really, really don't think he's at all correct.  His basic thesis seems to be that native app development is going to be replaced by some kind of "progressive web apps" -- essentially an embedded browser and the reasons are many:

* users install too few apps 
* app development is hard
* app development is expensive

All of these are good points but they are all also wrong and I'm going to explore this along two dimensions: The History of Cross Platform Development Tools and The Very Young.  The first is relevant along the technical axis and the second is relevant along the install axis.

# The History of Cross Platform Development Tools

The year was 1996 and I was being heavily courted by a company called Dataware.  They wanted to acquire my company, NTERGAID, and the CEO / Founder, Kurt Mueller, and I were out for a very, very nice meal at one of the, at the time, leading Boston restaurants.  Kurt was at his very charismatic best as he so often was and he pitched Dataware **hard**.  One of the things he held out to me was the possibility of cross platform development, something we were weak on.  I can't remember the exact words but it was something like this:

> And we're committed to this new cross platform framework called XVT.  It will let you get your browser software onto platforms like the Mac easily and it is fantastic.

Ultimately Dataware did buy NTERGAID but that's not really relevant.  After we joined up, well, XVT was never actually used for any of the products we were involved in -- or for much of anything.  Simply put it just didn’t work well; apps it made didn’t feel right.

The position that the author is taking is that cross platform development is hard and non economical so you have to use progressive web apps.  NO YOU DON'T.  Progressive web apps are just another take on cross platform development tools and history has shown us that cross platform development tools don't work well.  

It is interesting to me that 20 years later, XVT is still around and still a niche tool: 

* [XVT Today](http://www.xvt.com/)
* [XVT 20 Years Ago](https://web.archive.org/web/19970605034017/http://www.xvt.com/docs/products.html) - Thanks Archive!

And lest you think that this is all about XVT, its not.  XVT is just an example.  I could just as easily have picked [QT](https://www.qt.io/) which has been around a similar amount of time.  

The bottom line about cross platform development tools is that the bulk of users only use one platform at a time.  Cross platform tools are great for the developer but they are generally irrelevant to users.  What users want are great feeling, great looking, performant apps.  And, at least in my experience and the experience of the industry, apps like that **NEVER** come from cross platform tools.  

**Note 1**: It might be different for back end / server software which doesn't have a UI but for beautiful apps that users actually want to use, those come solely from native development.

**Note 2**: Cross platform development tools go back way further in time than 1996.  I remember seeing ads for them back in Dr. Dobb's Journal starting in the mid 80s.

# The Very Young

One of the interesting points that this author, Eric Elliot, makes is that people don't install apps: 

>  I mean that most web traffic comes from mobile devices, and that users install between 0–3 new apps per month, on average. That means that people aren’t spending a lot of time looking for new apps to try out in the app store, but they are spending lots of time on the web, where they might discover and use your app.

I think he's absolutely **wrong** here.  I have two kids and they both use either iOS or Google Play (really Amazon's Fire Tablet) constantly.  And their information access patterns are radically different from those of my wife and myself.  They **do not** surf the web.  And as an Internet professional, while that breaks my heart, as a parent I find it *profoundly* interesting.  They look at information in terms of can it be delivered in an app form or not.  They use the web certainly but they use it in terms of Googling for something, getting an answer and getting out.  I've never seen either of them lost in the web as so often happens to me or my wife.  

And the number of new apps they use -- it changes constantly.  For my youngest I have his iTunes account set to authorize app purchases through me.  So I see literally every app he gets and I know the rate of change.  Adults may only be installing 0 to 3 apps per month but kids are not.  And the kids of today are the adults of tomorrow.  

**Note**: Lest you think that I'm a closed minded, controlling parent, go search the iTunes app store for Feeld or 3somer or Trippple and then ask yourself if you'd want your 10 year old child being able to install that.

You should note that "very young" is perhaps misleading.  What I mean by it is "the people growing up with iOS and Google Play".

# Conclusion / TLDR

I absolutely understand the desire for progressive web apps to work.  If they did it would:

* increase consumer choice
* decrease platform vendor power
* decrease developer costs dramatically

As a developer I want this too but, unfortunately, the software industry has now tried for well over 3 decades to build development tools for good cross platform experiences and they still **don't work**.  I see no reason that this will change in the near term; history is on my side.  This, coupled with the fact that younger people have no problem installing apps regularly, means that native apps have a long life in front of them.