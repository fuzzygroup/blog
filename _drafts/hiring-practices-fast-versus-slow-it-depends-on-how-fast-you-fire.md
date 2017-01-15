---
layout: post
title: Hiring Practices - Fast versus Slow; It Depends on How Fast You Fire
category: software_engineering
tags: ["hiring", "firing", "hr"]
---
I started this draft six months ago and I had to sit on it for personal reasons; some organizational changes had to happen before I could publish it.

I recently made a hiring decision that I was concerned about.  In fact I was so concerned that I said this to the candidate before he was hired:

    If you don't work out, you'll be fired within a month.
    
And I have to admit that I was wrong -- after a month he was **still** present.  But he wasn't working out.  I've always taken the position that as an incoming engineer that **it is your job to adapt to the codebase you're working on**.  To some extent it doesn't matter what your personal preferences are for things, you're the employee and unless your job title specifically empowers you to re-architect things, well, *suck it up buttercup*!  This problem is particularly acute when new hires join from structurally different organizations -- say you're a startup and the new hire is from a slow moving, regulated organization.  The culture the new hire came from generally permeates their thinking and just their approach to everything.

With this new hire we had the problem that despite having gotten both verbal instructions, documentation and slack instructions, he would still either do exactly what he was told not to do or skirt the letter of the law by taking his own approach (let's not use database.yml and instead put database configuration into application.yml).

The biggest mistake I made here was that I followed what I call Fast Hire with him.  Specifically:

* I relied on his github as a representation of technical competency instead of administering a detailed verbal examination of Rails competency
* I took the first candidate that applied
* I didn't require multiple candidates i.e. "we'll hire the best of the the first five candidates"
* I didn't set up a pair programming session with him first and watch him work thru a problem
* I didn't assess the speed at which he worked
* I didn't hire him for a project on a consulting basis BEFORE he was hired full time
* I trusted that the organization would support me in my desire to fire when it didn't work out

And bear this in mind: this was my mistake.  We've been technically overloaded with work for over a year and when the purse strings were loosened to hire, I jumped at the chance.  What I forgot, something that I know terribly well, is that bad hires cause ripple effects throughout the organization both at the technical level and at the human resources level.

So here's my thesis:

1.  Hiring is painful.  The best way to find out if someone can work out in your organization is, ironically, to hire them.
2.  If you're willing to **Fast Hire** then you have to be willing to **Fast Fire**.

If you're not willing to fast fire and you take the approach of a 30 day plan, remediation, opportunity to fix things, etc then you have to move with **slow hire**.  

# The Fast Hire Approach

Here's what I call the fast hire approach:

1.  Technical interview with the hiring manager with a focus on culture fit and their interest in the problem space.  Make the assumption that the person's resume correctly represents their skills.
2.  Review the person's online presence and assess their technical competency from their side projects, github presence, blog posts, etc.
3.  Have them interview with all senior staff with the founder and president having final yes / no say.
4.  Make offer.

# The Slow Hire Approach

Here's what I call the slow Hire approach:

1.  Initial technical interview with the hiring manager with a focus on culture fit.  Make the assumption that the person's resume is, well, biased in their favor and you have to defend the company from them.
2.  If the culture fit interview goes well then schedule another interview for specific technical skills.  Do an hour long, deep, hard dive on their platform knowledge.  If this is a Rails position then you can guarantee that questions like "Atoms Vs. Strings, Pros / Cons", "Where is the database configured", "How do you execute a sql query when there is no model" will be asked.  
3.  If the technical skills interview passes then the next step up is a pair programming session using a shared screen tool like Screen Hero.
4.  If the pair programming test passes then I would strongly argue for a paid programming project.  Ideally this should be something that costs less than $600 so it doesn't require any U.S. tax issues, not even a 1099.  Pick some small bit of code, command line tool, etc and see what happens.  Require it to be submitted via github and furnish them a copy of your internal coding standards.  See if they follow them.  
5.  If steps 1 thru 5 are ALL successful then review the person's online presence and assess their technical competency from their side projects, github presence, blog posts, etc.  If you notice a serious disconnect between what you learned in 1 to 4 and their public presence, drill into it.
6.  Have them interview with all senior staff with the founder and president having final yes / no say.
7.  Make offer.

# Fast Hire vs Slow Hire

Despite this person not working out and causing me an astonishing amount of rage, I still don't regret the Fast Hire approach.  Unfortunately I thought that because I was giving hiring authority, that also meant that I had firing authority.  To my infinite regret, that has not turned out to be the case.  You can guarantee that in the future I'll be more certain of that.  Or I'll slow hire with the best of them.

