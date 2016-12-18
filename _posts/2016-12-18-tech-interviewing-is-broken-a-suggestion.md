---
layout: post
title: Tech Interviewing is Broken - A Suggestion
category: software_engineering
tags: ["software_engineering", "hr", "hiring", "interview"]
---
So [Medium](http://www.medium.com/) this morning tells me that person X is following me, I forget who -- that was on my phone and I'm writing on my laptop.  I try and figure out why and I notice that person X commented on an article by [Eric Elliot](https://medium.com/@_ericelliott).  I bounce over there and I find his [Tech Hiring is Broken](https://medium.com/javascript-scene/tech-hiring-has-always-been-broken-heres-how-i-survived-it-for-decades-b7ac33088de6) rant and I am inspired.  And that is how this post vomited its way out of my cortex and onto the Internet.

Sidebar: Medium has a brilliant authoring interface but the integration between phone and browser on your laptop is deeply, deeply flawed.  Know why I referred to someone as person x?  I can't find the same stuff on my laptop as on on my phone.  Honestly I was barely able to find Eric Elliot at all -- know how I did it?  [Google](https://www.google.com/search?q=medium+eric+elliot&ie=utf-8&oe=utf-8).  Know how I found the hiring post?  [Google](https://www.google.com/search?q=medium+eric+elliot+tech+hiring&ie=utf-8&oe=utf-8).  Don't get me wrong, I love what Ev has done for the industry (Blogger, Odeo, Twitter and now Medium as well as more) but there are deep usability problems here.  This might well be fine if you could use your phone to author on Medium but all authoring in Medium still has to be done on a PC which means responding to Medium's notifications is painfully hard.  Sigh.  I would strongly suggest that Medium do real usability work and give people problems like "there's a post by this person; respond to it".  Their product would get better as a result.

Eric makes a number of good points about tech interviewing, whiteboard coding exercises and so on.  Having both been a interviewer and a interviewee over the years and having **failed** the interview process at every big tech company I've ever tried at, I think I have an interesting perspective on the process so I thought I'd put together some notes on how to tech interview.  I've used variants of this over the years and I think this is exactly how I'll interview someone the next time I'm hiring.

# What Does an Engineer Actually Do?

If you think about what an engineer does then you might think that it is something like this:

* code
* code code!
* code code code!

Sadly, even though writing code is the fun part of the job, that's **not** actually what we do at all.  Here's actually what we do in order of frequency:

* think
* research problems
* debug code
* read code
* write code 

So, yes, writing code is a part of it but writing new code is actually, with a few exceptions, probably the smaller part of your job, particularly at bigger companies.  The bigger the company, generally, the smaller the amount of new code you generally have to write and the more you have to debug and read code.

Eric, in his post, argues quite well that white boards in the interview process are broken:

> People don’t think or code linearly, from top to bottom, in neat lines. They put together blocks, frequently cut and paste, etc… On a whiteboard, that requires erasing, and that looks like a mistake. Of course, that makes the interviewee nervous, and it sends false signals to interviewers [Eric Elliot](https://medium.com/javascript-scene/tech-hiring-has-always-been-broken-heres-how-i-survived-it-for-decades-b7ac33088de6#.mw5b2ha1n)

He's absolutely right on this and the simple truth of it, whether we want to admit it or not, is that an engineer's skills using Google / Stack Overflow / Github to find the answer to a problem is probably a bigger factor in overall job success than any ability to solve interviewing brain teasers.  Overall Eric makes a huge number of good points and you really should read his post.

# Adapting What an Engineer Actually Does to the Interviewing Process

The hands on technical interview portion of the overall interview process is likely between 1 and 3 hours with the initial hour determining whether you advance to the next stage or you fail out.  At least that's been my experience.  So given that I've argued that you spend more time thinking / researching / debugging code / reading code how do you evaluate those aspects?

Given that I basically regard my last bit of technical hiring as a failure of mine at the interview level I've spent a lot of time thinking about this and this is roughly my third time I've written all this down (the first 2 were abject failures; bytes fed into the bit bucket).  Here's my conclusion:

> An engineer needs to be evaluated along the lines of the work he is going to be doing.  And the best proxy for that is likely the work that **you** are **currently** doing.

Unfortunately, giving the secrecy fetish in most large companies, this doesn't work when:

* a person is being interviewed by someone on the team but the current project can't be shared
* by someone who isn't on the same team as the person being hired and the same dev tools aren't being used
 
Let me illustrate this with an example.  And I will admit that for the next person I interview, this will be the interview process I use.

## Pre-Requisite

All of these approaches below require screensharing as a pre-requisite. Specifically control needs to shift fluidly between interviewer and interviewee so that the interviewer can give the interviewee a task and watch them execute on it.  I'd recommend ScreenHero for this but sadly Slack has brutalized ScreenHere through the normal acquihire debacle.  I'm not sure what else to recommend although there are a few web based tools around that are promising.

## Test What You Know 1 - Thinking

If you're an engineer writing code on a project then there is **always** some aspect of the project that you are currently thinking about.  Something, no matter what, is always unsolved.  Bill Joy, the principal author of BSD Unix and the co-founder of Sun, has something to say here:

> Joy's law is the principle that "no matter who you are, most of the smartest people work for someone else,” [Wikipedia](https://en.wikipedia.org/wiki/Joy's_law_(management))

If you accept that that's right then here's my suggestion - get the interviewee's input on what you are currently thinking about.  Find out what they have to say on the matter.  If nothing else I suspect the process of cogently explaining it to a fresh brain might help you; I always find that to be the case.  And, if the interviewee has a great insight, isn't that a **damn solid indicator** that they might be a good hire?

## Test What You Know 2 - Research

Once again if you're an engineer writing code on a project then there is something that you googled either today or yesterday where: 

* the answer was hard to find
* the answer was hard to interpret
* tenacity was needed i.e. you needed to dig into the 3rd page of google results or find the answer not in a github wiki post but actually in a closed issue or perhaps by back tracing the original author to their reddit presence and posts they wrote

The sad, sad truth of search today is that finding answers to hard questions often takes a considerable amount of sleuthing.  And if you accept that as true then watching how an engineer takes a problem you give them and find the answer tells you how efficient they might be in the work place.  And, best of all, all you have to do for this interview task is look in your own search history and say something like "here's an error message -- how do you look this up to take the next step".

## Test What You Know 3 - Debugging

This is my personal favorite in terms of interviewing tests.  Debugging for engineers is the equivalent for wood workers of *measure twice, cut once*.  Debugging is the **essential** skill that tells you how an engineer tackles a problem and watching how someone debugs something is always interesting.  My first business partner, Brian, was an absolute super hero at this.  You could hand Brian a code base with 3.5 million lines of C in it, describe the error and say "go" and he'd find it and fix it.  You might not always like the way he fixed it but he'd get it done and get it done in short order.  I'm not, yet, at that stage but I do quite well.  Once again my suggestion here is to give the interviewee a current problem you're debugging and then watch his progress.  Yes he's going to be missing the overall context you have but you're looking for approach / technique here more than actual results.  And, once again, you yourself might learn something.  

Let me illustrate this with an example from my own pair programming history.  [Dv](http://www.dasari.me) used to work for me and we'd pair but not always as often as we should have.  One day he was watching my technique, I was using raise statements as my primary tool and he finally said "Let's try the debugger".  He dropped a few gems in my Gemfile and then added the debugger pragma at the offending spot in the code and we restarted.  And you know what?  My life has **never been the same** since.  That's not hyperbole by any means.  I write / debug ruby code 60+ hours per week or 3,120 hours per year and, based on my own premise, more of that is spend debugging than writing.  By teaching me how to use the debugger gem, my life was literally changed.  

So take a part of the code that you need to debug, perhaps even what you were working on before the interview, create a branch so the interviewee can't screw up your work and let them go! What you want to do here is watch their process.  Even if they don't know the code base the process of debugging is generally the same so they should be able to do something.  Whenever you interact with someone who isn't vested in your culture and tooling you have a tremendous opportunity to learn from them.  If you pick up one small technique from an interviewee then isn't that also a good indicator that they might be a good hire?

And if someone can't make any progress or even suggestions then that tells you something.  Perhaps you might get an interaction like this:

* **interviewee**: Perhaps we need a log file here to gather data
* **interviewer**: We have a 10 server environment; how would you go about that

Even if they don't solve the problem, and they likely won't, watching the process is likely hugely informative.  If you see that they are an inefficient debugger or, worse, an ineffective debugger then that's a strong argument against hiring them.

## Test What You Know 4 - Reading Code

I've never seen a code base, not **once**, without a particularly tricky section somewhere.  We may not admit it but every single code base has at least one module where you either tread gently or you modify only with a degree of regret and self loathing.  So here's my suggestion:

1. Hand them that code module to read and, perhaps, indicate to them what you want them to focus on
2. Give them say 5 to 15 minutes to go thru it (adjust the time to fit based on size)
3. Ask them questions; adjust your questions to match the the instructions in 1.

Once again how well they read the code and understand it gives you a huge indicator of whether or not they might be a good hire.

## Test What You Know 5 - Write Code

At this point, if a person has proven to you that: 

* they can think
* that they can research
* that they can debug
* that they can read code

isn't it a given that they can write code?  I don't think I've ever seen a candidate get thru thinking, researching, debugging and reading and then not be able to write code.  But, if you're still concerned then give them a coding problem.

# Conclusion

I think this is a very solid approach to gauging whether or not to hire someone but, honestly, I've only used portions of it in the past.  I've never done it as a step 1 to step 5 process.  However the next time I do I will definitely document it here.