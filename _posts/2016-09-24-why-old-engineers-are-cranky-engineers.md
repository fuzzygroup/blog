---
layout: post
title: Why Old Engineers Are Cranky Engineers
category: ["software_engineering"]
tags: ["ci", "software_engineering"]
---
I recently had an interaction with a younger software engineer and I'm pretty sure that his impression of me after that boiled down to *cranky old bastard* and that would be the nice version.  The less nice version could easily have incorporated the words difficult, jerk and a few other bits of invective.

The topic at hand was getting a commercial, for pay CI server up and running on a single Rails code base of moderate size (about 40 K lines; about 110 tables).  This is a well known, leading product and I was very, very difficult about my expectations:

*I expected it to just plain work out of the box*

He was stuck getting the configuration to work and I made it clear to him that I didn't want him spending much more time on it.  He saw no problem with investing the time in it -- and that was the conflict.  My logic goes as follows:

* We do not have a hard environment - Rails 4.2.x app, basic table structure
* RSpec works pretty much right out of the box when I set up a new developer work station
* They charge us money for this -- doesn't that mean that configuration is their damn job?

Finally I had to say to him something akin to this:

* You cost us roughly $3,000 per week so 1 day of your effort is $3,000 / 5
* You have until the end of the day at that point we're done with this vendor

# Crankiness Explained

The crankiness on my part comes from a combination of this particular vendor, partly from the unique snowflake attitude common to CI vendors, and partly from being older.  Here's the details:

* *This Vendor*. The last time this vendor decided to change its architecture, it did so at the expense of its customers. They moved from static instances where your CI server was always the same box so configuration could be done at the box level to dynamically creating instances forcing configuration into your config file.  They kept their pricing the same but this move effectively made them more profitable since their AWS costs would now go down.  At one of my consulting gigs, I saw one of our engineers blow 2 man days on getting this back to a working state.
* *Snowflake*. For some reason CI software never seems to work out of the box.  I've seen this for years in the Rails world dating back to CI Joe.  All the vendors have this attitude that they are some unique snowflake and lots of setup work is needed.  That might have been true once upon a time when TDD was new but it is 2016 now and TDD is not new.  CI is not a new concept.
* *I'm older*.  One of the things that happens as you become an older engineer is you realize just how many things that you -- and your staff -- miss out on thru obsessive attention to technology issues.  It isn't that I'm incapable of configuring this piece of crap but that if I'm doing that I'm not doing the 10 other things that absolutely, positively have to get done today.  Ultimate the CI software needs to support my job and I don't need to support it.

# Happy Conclusion

My asshole style demand -- get it done by the end of the day -- actually worked.  I absolutely hate to manage that way but forced time bounding can be a great technique at times.  We now have a CI server that is setup and that is excellent.  He really did do a good job.  We're not 100% there yet because it is only checking pull requests and not master but hopefully that is a matter of only minor additional configuration.

# Recommendation to Vendors And an Example of Doing it Right

Rightly or wrongly I don't think I'm all that different from what a lot of people when it comes to evaluating software.  Getting a great out of the box experience is essential if you want someone to pay you.  If this was an open source CI server that I had to run myself I'd expect configuration but RSpec and Rails 4.x is a known thing.  This should have just worked.

As an example of getting setup right, I'd like to point people to [CodeTree](http://www.codetree.com/).  You can point CodeTree at your git account and boom!  It makes github issues better.  Can you configure it?  I think so but the point is that I haven't needed to.  *Recommended.*

Disclaimer: CodeTree is run by a former boss of mine and I do view him as a friend.