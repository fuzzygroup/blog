---
layout: post
title: Code Rot is Very, Very Real
category: rails
tags: ["ruby", "rails", "software_engineering"]
---
Today has been an unmitigated disaster.  In the process of reviving a MacBook Pro that was old I had to delete and re-install rvm, gemsets, etc and, **damn**, has it ever sucked.  And I don't mean "oh it sucked" -- I mean this has sucked monkey balls.  I've been at it 12 hours and my conclusion is that I'm not sure that it will ever work.  And this brings us to **code rot**.  Rot is what happens to a physical artifact when you don't take care of it.  Now if you haven't been at this for too long you're thinking something like: 

> These are perfect digital assets how can there possibly be rot; Scott is smoking the whacky weed.

Alas, no and I wish I was.  Even if your digital assets don't decay, the supporting ecosystem that they are in actually does change.  As an example part of the Gemfile had a nokogiri 1.4.4 hard coded version number in it.  Now I might refer to Nokogiri as NokoVietnameGiri since I'm generally about as successful in installing Nokogiri as the U.S. was in winning Vietnam.  But today was far, far worse.  Finally I discovered that Nokogiri 1.4.x is now considered too old and things have changed too much and their recommendation is simple -- **upgrade**.

Note: No disrespect meant to anyone or their family involved in Vietnam.  Vietnam was a political war and soldiers were not allowed to win it.

And that's what I mean by code rot -- all executable code these days depends on a precarious web of dependencies.  If you're not actively maintaining it then you are very, very much hosed should a sufficient amount of time pass and you need to re-install things.

In this case I have to go into a code base that has laid fallow for well over a year now.  And while it has run like a champ until recently, certain things have changed and I now need to actively make changes to the code, modify vendored gems, etc.  And that means I really, really need a workable code base.  And without the ability to run bundle install, well, I've got nothing.

Since I grew up in a family that made their living from, among other things, real estate, I'm going to make an analogy.  If you owned physical real estate, you wouldn't dream of not touching it for more than a year -- you'd expect to do small maintenance, plumbing,  paint, weatherstrip, whatever.  And if it was a revenue producing property, as this was a revenue producing bit of software, you would really never dream of letting it lie fallow for a year.  

So code rot is real but I don't think that it really is any different from physical artifacts.  The universe does, after all, trend from order to disorder, towards ever increasing entropy.  

The bottom line here is that the next time someone tells you that its ok to let code just sit around and decay, perhaps you might advocate more strongly for doing at least some maintenance on it.  I strongly wish that I had done a better job of that.  *regrets*