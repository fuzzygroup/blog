---
layout: post
title: Startup Learnings - I Do All My Coding Before Anyone Gets to Work or What Ed Fisher Taught Me
category: startup
tags: ["startup", "software_engineering", "learnings", "ed_fisher"]
---
Once upon a time, ages and ages ago, I worked for a company called Dataware Technologies.  Dataware had bought my first company, NTERGAID, relocated me to Cambridge, MA and I went from being president of a teeny, tiny, 9 person software company in Milford, CT to a member of a 435 person global, publicly traded company.  Dataware wanted only myself and my co-founder so I lost my whole team in the process.  Needless to say this was not an easy or pleasant transition.  And I made about every mistake that a fish out of water could make.  At least one of those mistakes, the one that would ultimately doom me at Dataware, I made on my **very first day**.  

But Dataware was a profound and wonderful experience for me.  The folks I met there were the first real professional colleagues I ever had (note - when you're responsible for people's salary, they're not colleagues, they are staff).  Invariably whenever I whip out one of my "back in the day" stories, it is about Dataware or Dataware folk. 

Now when I was working for Dataware, I was a product manager more than an engineer.  And for the first six months, I was a product manager without a product to build (that's another story; we got acquired, showed up and on the first day we were told "we canceled what we wanted you to build for us"; different story, this one is about Ed).  As a product manager without a product, I pitched in on what we internally called Project Pegasus.  Project Pegasus was an attempt to repackage a software product that we had acquired called BRS-Search into a more modern, more usable Windows NT product.  Our CEO had promised Wall Street that we'd ship new, modern product by year end and all hands were on deck for that effort.  I became an adjunct product manager helping out Pete Jenney, the Pegasus Product Manager, and my co-founder from NTERGAID got dropped onto the main Project Pegasus code base.

By way of background, Dataware was a company that sold software and services for CD-ROM production and when I joined they were about 40 odd million in gross revenue with offices all around the world and headquarters in Cambridge, MA.  Now any technology company that makes it make *always*, **always** has a core of brilliant technical staff.  These are those fabled "10x" or "100x" engineers who are just that more productive than anyone else you've ever met. If you've ever heard of Google's Jeff Dean, that's the kind of engineer I'm talking about.  And while most technology companies are lucky to have 1 of those, Dataware had several.  One of our best was Ed Fisher.

I've always been an early riser and I'd find myself at the office at 6 am and there Ed would be.  So I'd wander into his office and he would often remark that he did "all my real work was done before anyone got to the office; after that I do email".  Now you hear a statement like that and you often dismiss it out of hand.  You think it can't possibly be true.  But I'd watch Ed after people poured into the Dataware offices, here is what he'd do:

* email
* meetings
* drink diet coke
* more meetings in which he'd invariably prevent stupid decisions
* an occasional code review
* help other engineers

Ed was the lead engineer on the overall Project Pegasus which was an integrated electronic publishing system which took content in from arbitrary sources, stored it in an internal repository, indexed it for full text search and then could output whether to CD-ROM, LAN or the web.  The overall project was about 3.5 million lines of C and most of it was OLD C.  Periodically you'd find cryptic source code comments about the Vietnam war, 60s music, etc and i and j variables were not always integers / counters.  So, as you could imagine, Ed had his hands full.  To make matters worse this was code from an acquisition so rather than being the code base that Dataware itself had built, this was all built on the BRS code base.  And in addition to being the lead, Ed had has own piece of it which he owned which was effectively the DOM and nokogiri like mechanism for walking it.  Yep.  Years before you heard of the DOM and JavaScript, people were building things like that internally.

So, back to the core of this blog post, getting your job done **before** anyone comes into work.  For six months I would watch Ed in the early mornings and then I'd rarely see him touch code from 9 am until 4 or 5 pm.  And everyday the project continued to move forward and the code metrics on Ed's own stuff would get grow and the tickets would get closed like clockwork.  Finally I talked to Ed.  I was a bit concerned that he was burning the candle at both ends too much.  His answer was no; I'd arrive at 6 and his Saturn would show up in the Dataware parking lot just a few minutes before mine. This put him squarely in the 10 to 12 hours per day club.  And that's a lot but its not at all uncommon for high tech folk.  Ed's explanation to me was simple -- you can be ridiculously fast and productive if:

* you are left **alone**
* you have a **purpose**
* you **understand** the problem
* you aren't **distracted**
* you are solving **one** thing at a time
* you **focus**

All of these things were only true when there was no one in the office.  Sure Pete and I were around but we knew not to bother him except to take him for breakfast when he was at a stopping point / needed some time off.  Now if you're a software engineer and you think about your day, how much of it is actually writing code?  A lot of your time, as it always does, goes to the things **around coding** instead of actually **writing code**.  Code reviews, prioritization, email, slack, etc.  

More than anything else what Ed taught me was the power of **focus**.  When you clear your metaphorical desk and actually concentrate you can get a tremendous amount done -- far more than you would expect.  It took me years before I really understood this.  For a long time I was a devoted multitasker thinking that I could juggle far more than I actually could.  Now I focus with razor precision on what's actually important and I get far more done.

What led to my telling you this story is I woke this morning at 2:55 am and I was in my home office by 3:15.  I took yesterday's code, which was a single class which indexed all metadata we care about from the iOS App Store and the Google Play App Store and I realized that it was a maintenance suck fest and I completely refactored it, cutting its size down by 1/3 and making it easier to maintain and vastly simpler.  Then I wrote two rake tasks which will update all the metadata and generate success / fail metrics.  Oh and I fixed 3 bugs reported by other people on the team.  And that was about two hours of work.  And you know what -- **Ed was right** -- I did a "full days" worth of work before anyone else arrived.  Now was it 8 hours of work?  Clearly not but was it the economic value of 8 hours of work?  I think so.  This is a key bit of our system and a particularly problematic bit of code that might be significantly more trouble free than it has been in the past half decade.

Thanks Ed.  I wish you well my friend.