---
layout: post
title: Software Engineering Learnings - What Wolfram Arnold Taught Me
category: software_engineering
tags: ["startup", "learnings", "entrepreneurship", "feedster", "software_engineering", "wolfram_arnold"]

---
The year was 2007 and the month was August.  I had just joined eduFire and we made the decision at a corporate level that despite my technical expertise being in anything but Rails, we were going to move all of our development efforts to Rails.  Thankfully I did have Ruby experience but Rails was new to me so we brought in a consultant, [Wolfram Arnold](https://twitter.com/wolframarnold), to bring me up to speed.  

You can easily be familiar with something intellectually and still have it throw you.  Sure I knew what **pair programming** was -- I'd read the Ward Cunningham stuff but I'd never done it.  And I'd certainly never done it intensively as we proceeded to do for the next month.  I suspect to my dying day,  I will never forget my very first day with Wolf.  I'd been working on my own for a few weeks at this point and I'd cobbled together an authentication system for our educational application.  Within the first fifteen minutes he looked at it and then with, teutonic precision, he said to me "*And now we'll throw all this away.*"  I was absolutely flummoxed but when you hire a consultant, if you're not going to trust them, then why did you hire them?  So over the next 30 days or so, Wolfram taught me rails, pairing and test driven development (tdd).  Oh and that code throw away thing?  He was right.  Damn it.  ;-)

Tossing out your new boss' work on your very first day, even if you are a consultant, that takes guts.  And it was the right call but it was still gutsy.  

So here's what Wolfram Arnold taught me: **Pair Programming Works** or what is also known as [Linus' Law](https://en.wikipedia.org/wiki/Linus%27s_Law): **With enough eyes, all bugs are shallow**.  

Pair programming is one of those absolutely uncomfortable experiences that's absolutely good for you.  I've now been pairing for years and years so I'm used to it but when you're just starting out, you feel like an idiot having someone watch you stumble through things.  Pair programming, imho, remains the single best way to get a new hire up to speed on a code base.  And because the cost of fixing a bug is **directly proportional** to amount of time that lapses from when a bug was created, I can make a pretty solid argument that two man teams are much more effective than solo developers. If a bug never gets into the code base in the first place then fixing it has effectively zero cost.  When we developed eduFire, we took the practices that Wolfram drilled into me and we ran development almost exclusively as a paired thing for the next two years.  I don't think I've ever had such a well tested, stable code base. We used to average about 90% to 95% test coverage on any given day.

Pairing wasn't the only thing I learned from Wolfram, Rails itself was an eye opener and tdd changed everything for me.  I've always felt that tdd was what let me describe myself as "Software Engineer" instead of "Coder" but pair programming fundamentally changed my perspective on software engineering.  


