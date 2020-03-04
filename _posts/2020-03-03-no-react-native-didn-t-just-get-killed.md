---
layout: post
title: No React Native Didn't Just Get Killed
category: react
tags: ["react"]
---
Once upon a time I blogged about the controversial things but now, well, I mostly don't care.  Still every so often you come along someone getting things so, so, so wrong that you feel compelled to respond.  I'm speaking to this tweet by DHH, someone I deeply, deeply respect:

> Did Facebook just kill off React Native? Either way, it's funny that I actually agree. [More](https://twitter.com/dhh/status/1234644555258978304)

Nope.  We didn't just see React Native get killed.  Just because Facebook may not be using it for Messenger, it doesn't mean that React Native has been killed.  What it likely means is that React Native simply **isn't the right technology** for Messenger at this time. 

Here is what React Native lets you do:

1. Use a single code base across multiple platforms.
2. Have less employees on the same project because it is a single code base.
3. Work in JavaScript instead of native languages (Objective C / Swift or Java / Kotlin).
4. Have an app that works more universally instead of more "platform like" (i.e. the user interface abstractions that a cross platform tool like React Native use have a cost in terms of look and feel) .

I mean does anyone actually think that Facebook can't afford multiple teams to work on Messenger?  I certainly don't.  And I also don't think that Facebook needs to have developers working in JavaScript instead of native languages.  My suspicion is that Facebook simply made an **economic decision** around resourcing of teams and / or a decision that native languages would result in a better user experience.  But this is an economic decision that is tied to the large economic resources that Facebook has.  We saw a similar decision a year or two ago when AirBnB left React Native and, again, that did not kill React Native.

Cross platform development technologies like React Native and Flutter still have a place in the world as most companies / organizations simply don't have the massive economic resources of a Facebook (or AirBnB).