---
layout: post
title: Software Engineering - Training a New Engineer the Outside In Way
category: "software_engineering"
tags: ["software_engineering", "economics"]
---
This post is about training a new hire to do things the way you want them done.  Your way may not be the right way or even the current way but it is your way and that's ok.  You know your code base better than the new hire and you know your environment.  Now that's not to say that you should ignore their inputs by any means -- they're coming in with fresh eyes and that's incredibly valuable.  Every engineer generally:

1. is conservative by nature
2. falls into technical ruts
3. the more senior you are then the older you are and the more likely you are to fall victim to 1 and 2

So please don't dismiss what new hires bring to the table.

Before we go further with how to train a new hire, we need to take a brief lesson in the economics of hiring a software engineer.  Let's start with some assumptions:

* base salary: $100,000 U.S. per year
* startup benefits: vacation, medical, etc.  For a startup this usually means 50% of the salary is spent additionally as benefits which means that this one engineer costs you 1.5 * 100,000 or $150,000 / year.
* two weeks vacation per year; even if your policy is only 1 week when you factor in christmas, labor day, memorial day, etc, you'll be lucky to get 50 weeks of "work" from them.
* this new hire -- who can't do anything yet with your code base costs you -- 150,000 / 50 or $3,000 per week.

So let me put this differently to you: 

**Every week this new hire isn't productive, you just threw out *2.3* brand new macbooks (at the time of this writing a Macbook is $1299)**

I don't know an engineer in the world who would take 2.3 brand new laptops and throw them in the trash.  So then the question becomes: 

**How can you make a new hire productive from day 1?**
**How can you waste as few macbooks as possible?**

# The Outside In Way

Years and years ago I watched the onboarding (this was before I think I had even heard the term onboarding) process for a new engineer, let's call him Dan, since that was his name, at a Cambridge, MA software company.  We were building a large (3.5 million lines of C code was our core code base) Windows NT application.  Dan was hired at a salary considerably higher than $100 K per year and I remember watching the process of getting the code base to build which kind of looked like this:

* Get the code checked out
* Something he needed to change was exclusively locked by a remote guy in a different time zone so wait until tomorrow; the only person would could break the lock was Ed and
* Go find Ed; Ed's in a meeting; wait some more
* Make some incremental progress; now we need Brian and he's in transit to the Cambridge office from Ohio; wait again
* Infrastructure issues; now we need Boris
* Stuff isn't documented well; only Jim would know and Jim's, well Jim -- you get time with him when he's ready
* Lather; Rinse; Repeat

If my memory is correct it took about 4 weeks before Dan could actually compile the code base.  And he did do a lot of learning in the process but there was a lot of crap in that time period -- a lot of long lunches and beer o'clock arrived early for Dan more than a few days.

This was when I started to figure out what I call "Outside In".  The core idea behind outside in is this:

* a new hire brings no knowledge on your code base 
* but they bring generally valuable industry level knowledge
* apply their general knowledge to tasks related to your codebase but not IN your code base
* ease them into the code base only after they've had some actual successes; I remember Dan, by the time he could finally build the code base, was just plain demoralized; you want to avoid that.

Its very hard to learn a new code base and the time to do so is highly individual.  Trying to get a new hire to successfully make changes to your code base is almost impossible to get a metric on.  And since you, as a manager, don't know their skills yet if they take a week to do something, is that fast or slow?  I'd argue that it is very, very hard to know.  But if you give them a task that you need done which doesn't require any specific codebase learnings then you have something that you can get a metric on.  

This is the way I've now been training new hires for years.  There is always some task that every project needs which does not require any knowledge of your code base.  They are the things that you back burner consistently because while they are important, they aren't that important and you can make do.

# Examples of Outside In

Here some some examples of outside in tasks that I used recently:

* Get up an ec2 instance running graylog so we can have a shared log server -- this teaches a new hire every box in your system and how logging works which is always useful
* Make a rails based micro service which can accept an error call and send it onto honey badger- shows that a new hire can work independently enough to build something which stands on its own
* Get [EC2 memory monitoring](http://blog.krishnachaitanya.ch/2016/03/monitor-ec2-memory-usage-using-aws.html) in place using the god awful perl code they supply

Yes some of this might be called "devops" or sys admin but in today's world the gap between a software developer and dev ops has shrunk so considerably that I don't think it matters any more.

# Getting them Into the Actual Code

I usually put new hires through one to two weeks of outside in style tasks before I have them touch the actual code base.  And when they first do touch the code base it is always, always, always the same -- **test coverage**.  I'm sorry.  I know its ugly, crufty work but it is essential so its either fix the current set of failures or make stuff better by writing new tests.  The time period at this stage ranges from 1 to 3 weeks depending on the current state of the test suite.  After that it is pair programming on maintenance issues and then it goes like this:

* UI stuff (views)
* Controllers
* Models

The reason for that order is that it tackles things in complexity from least abstract to most abstract.  UI stuff has widgets on screen that you can see.  Controllers are such a well understood pattern that they aren't that different.  And models, well, that's generally harder.

The whole point here comes right back to where we started -- **economics**.  Every single week that new hire isn't productive you just wasted some fraction of 2.3 macbooks.  I've spent virtually my whole career in startups and always on the poorly funded side of startups so to me that's a lot of money.  Using this approach to onboarding new engineers, I've rarely if ever wasted a macbook.