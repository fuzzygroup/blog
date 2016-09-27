---
layout: post
title: Software Engineering - How Do You Fill The Time Between Times?
category: software_engineering
tag: ["software_engineering", "ruby"]
---
In any software development job there are ALWAYS things to do.  Let's say that you have finished all your tickets, all your code is committed and your boss just gave you a great review.  Its 1 in the afternoon on a monday and the product manager isn't available.  What are you supposed to do?  Well obviously there's always reddit and hacker news but that's not what you're supposed to do -- that's how you fill in a quick break.  There's still a full half day of work left so what do you do?  Well, you **test**.  There's no software on the planet that can't benefit from test coverage.  Even if you're using the infinitely appealing [QuickCheck](https://en.wikipedia.org/wiki/QuickCheck), there is still a role for well written test coverage.  So you find some corner of the software that isn't well tested or that you don't understand well and you poke it with a stick and write some tests.  And when they run, you write some more tests.

Test coverage in 2016 is probably today's equivalent of cleaning in the 1950s U.S. navy.  Just as **nothing can ever be too clean**, ***nothing can ever be too well tested***.  If you don't know what to test then install RCov into your project and run a full rake spec.  This will show you what needs to be tested.  