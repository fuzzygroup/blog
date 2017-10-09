---
layout: post
title: Concept of the Week - Immutable Infrastructure
category: software_engineering
---
In nerd speak the term immutable means “something that cannot be changed”.  An immutable variable, for example, is one that can be set but then cannot be changed.  

Immutability is increasingly important because of the recognition that as things change state, its harder and harder to find errors.  So by locking things down the hope is that bugs will become easier to track down.  

I ran into the idea of immutable infrastructure on Sean Devine’s podcast where he was speaking with Chad Fowler.  Chad brought this up with the idea that when a server goes bad (and they do go bad), you do not fix it.  Not ever.  You instead throw it out and reload it from scratch.  In an era of Docker and things like Chef, I can really see the appeal of that.

Sadly our own Chef skills aren’t there yet enough for us to do this with AppData but its a goal to shoot for.  

Thanks Chad!  Thanks Sean!