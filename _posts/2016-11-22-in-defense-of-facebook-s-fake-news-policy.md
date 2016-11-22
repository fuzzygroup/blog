---
layout: post
title: In Defense of Facebook's Fake News Policy
category: facebook
tags: ["facebook", "trump", "zuckerberg", "spam"]
---
I see from Dave Winer / [Scripting](http://scripting.com/2016/11/20/whyZuckMustBeCareful.html) that my old colleague, Scott Rafer, has come out swinging and is claiming

> "I've been trying to rationalize Mark Zuckerberg's [behavior](http://mediagazer.com/161119/p1#a161119p1), and all I can come up with is that he is secretly pro Trump. He can't admit or too much of his workforce would quit starting with [Sheryl Sandberg](https://en.wikipedia.org/wiki/Sheryl_Sandberg). But the behavior around defending Peter Thiel and denying the influence of fake news and Facebook's place in it only leads me one place." Source [https://www.facebook.com/rafer/posts/10154464766356329?pnref=story]

Now I don't know Mark Zuckerberg but I do know Dave Winer and once upon a time I hired Scott Rafer and then I worked for him.  I have tremendous respect for Dave and for Scott but I think that there are two separate and distinct issues here:

* Trump
* Fake News

# Trump

Generally I don't comment on political matters; the last time I actually cared about a candidate was Perot.  We live in a democracy and everyone is allowed, nay, **encouraged** to have their own opinion.  The election happened and Trump was elected -- we all need to accept that and begin moving on.  Not one of us actually know what is going to happen and this is all now speculation.  Just a few general, global and national political observations: 

* The US's two party system is broken and needs to change and it has been needed for years.  Trump and Bernie Sanders were both manifestations of this.
* Italy survived [Berlusconi](https://en.wikipedia.org/wiki/Silvio_Berlusconi); we will survive Trump.
* Politics in the rest of the world is far, far more entertaining than in the U.S.  Personally I'm interested to just watch the upcoming show.
* When did we forget the rules of polite civility?  Shouldn't we be allowed to have our own opinions.
* If Zuckerberg supports Trump then will Sheryl Sandberg really quit a job which has made her a [billionaire](https://www.google.com/search?q=sheryl+sandberg+net+worth&oq=sheryl+sandberg+net&aqs=chrome.0.0j69i57j0l4.5155j0j7&sourceid=chrome&ie=UTF-8)?  I don't think so; come on.  Self interest always trumps everything else (like what I dd there?)
* Peter Thiel can support anyone he damn well pleases.  So can you or I.  Personally I think he's morally courageous for taking the position he did -- whether or not I agree with it.  
* The US has had bad presidents before and we survived it. And we will survive Trump.  We are a 250 year old country that has had ups and downs.  This is not the end of the republic or the world.
* I don't know whether or not the electoral college is good or bad.  Personally I think that the founding fathers were generally smart and Hamilton was among the smartest and the electoral college was Hamilton so I'd think long and hard before calling for its change.

# The Fake News Issue

I know Scott Rafer and, honestly, I **am a fan**.  But Scott does love a conspiracy theory and, in years past, he pushed me to personally blog things like this and I regretted it.  Personally I'd attribute the fake news stuff to either Hanlon's Law or technical issues.  Let's tackle this one by one:

## Hanlon's Law

Hanlon's law states:

> Never attribute to malice that which is adequately explained by stupidity [Wikipedia](https://en.wikipedia.org/wiki/Hanlon's_razor)

Once upon a time I accused Google of malfeasance which turned out to be a mistake that I made.  I learned my lesson from that one. So one possibility is that Facebook is just stupid.  I don't actually think that's true but it is a possibility.

## Fake News is a Technical Problem Not a Political Thing

I know a few readers here aren't hugely technical so the Fake News thing needs to be explained.  Some people are alleging that the results of the recent election were twisted due to "fake news" that fed into people's facebook news feed.  Honestly it is the Internet people -- you can find websites that support just about anything -- and we all used to like that.  Now, in the wake of the favored candidate losing, we all seem to want something different.  

Here's [commentary citing the well known Snopes](https://backchannel.com/according-to-snopes-fake-news-is-not-the-problem-4ca4852b1ff0#.ka1jm96x6) on the issue.  Interestingly she puts the blame on the traditional media:

> The problem, Binkowski believes, is that the public has lost faith in the media broadly — therefore no media outlet is considered credible any longer. The reasons are familiar: as the business of news has grown tougher, many outlets have been stripped of the resources they need for journalists to do their jobs correctly. “When you’re on your fifth story of the day and there’s no editor because the editor’s been fired and there’s no fact checker so you have to Google it yourself and you don’t have access to any academic journals or anything like that, you will screw stories up,” she says.

And don't think that this is new -- the [Dateline NBC truck issue](https://en.wikipedia.org/wiki/Dateline_NBC) happened in 1992 long before the Internet mattered.  The media has been losing our trust for years and years.

I think that it is important to recognize that Fake News is a technical problem, specifically a spam detection problem -- and since it impinges on free speech issues -- it is a particularly thorny technical problem.  I feel technically qualified to talk about this because I have specific competencies in spam detection having done this now at least three times in my career:

* email spam in 2002 which culminated in a shipping product, Inbox Buddy
* blog spam in 2004 / 2005 at Feedster
* twitter spam Fall 2016, personal project, unreleased

Fighting spam is a classic attackers / defenders problem and there are always more attackers than defenders.  If you build something of value online then people will find a way to twist it to their own means.  That's just a fact.  And your Facebook news feed is valuable because that's where the people are.

## The Princeton Student's Fake News "Code"

A few students from Princeton have received acclaim recently for their [Fake News Solution](http://www.businessinsider.com/students-solve-facebooks-fake-news-problem-in-36-hours-2016-11) which was written in 36 hours and my comment is **big deal**.  I could likely take a stab at it myself in 36 hours and "solve" it.  But that's not the same thing as:

* solving it in an ongoing fashion
* solving it in a performant manner
* solving it for every user not just yourself
* integrating it with what is likely a very complex code base
* dealing with the N level of edge cases
* keeping it up to date

I lost well over a year of my life to battling blog spam and the scale of the Fake News problem is far beyond what I dealt with.  So, yes, they wrote code in 36 hours -- so could anyone else -- and fixing the Facebook News Feed is far, far harder.

## Does Facebook Profit from "Fake News"

Of course they do.  Facebook profits from traffic and if people's news feed contains "fake news" they are likely to consume more of it.  But that isn't a crime and I'm going to raise the issue of the National Inquirer which seems to publish whatever they want.  If tabloid journalists can do that then why can't Facebook put into the news feed "fake news"?  Is this even wrong?  Facebook is **not** the New York Times and it isn't supposed to be.  

## Even Facebook Fixes "Fake News"

One of the problems here is that spam detection is often like obscenity and I refer to the 1964 Supreme Court Justice Potter Stewart:

> I shall not today attempt further to define the kinds of material I understand to be embraced within that shorthand description ["hard-core pornography"], and perhaps I could never succeed in intelligibly doing so. But I know it when I see it, and the motion picture involved in this case is not that.[4] [Wikipedia](https://en.wikipedia.org/wiki/I_know_it_when_I_see_it) 

I think that it is important to recognize that even if Facebook "fixes" this, they, the Facebook Company, is in a no win situtation.  Just as we are still battling email spam in 2016, we will be facing Facebook Fake News 20 years from now.  There are also important issues of free speech here.  The blogging world has fought mightily to be taken seriously as a journalistic source.  Heck [Dave Winer](http://www.scripting.com) himself has championed this on how many different occasions -- it was among the very reasons he went to [Berkman](https://cyber.harvard.edu/) in the first place.  

There is a very easy way for Facebook to solve Fake News -- simply reduce the inputs in your news feed to only **official** news organizations.  That would solve it for sure but:

* Is that really what people want?  
* Don't we trust people enough to let them see everything and make their own decisions?  
* Ultimately people have to be personally responsible for what they read and what they believe.
* Just as people have read the National Enquirer for years and years and drawn their news from it, isn't this the same damn thing?

# Conclusion

The Fake News issue is, in my opinion, a technical issue.  I actually know one of the Data Scientists on the news feed team (he worked for me in a previous life) and I actually asked him about the whole "Facebook is suppressing right wing stuff" that came out a few months ago.  He assured me that when that happened Facebook treated it professionally -- all hands on deck, code reviews and such -- and I believe him.  I really, really, really don't think that Facebook or Zuckerberg have any personal stake in this -- it is just a technical issue.  And I know for a fact that any spam problem is damn hard to solve -- if it can be solved at all.  Generally spam problems are a matter of an ongoing battle that you never actually win.  I regard my period fighting blog spam as a personal vietnam and I suspect that Facebook feels the same way.