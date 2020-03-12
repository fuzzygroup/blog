---
layout: post
title: The Bullcrappery That is Offering Only Magic Link Authentication
category: login
tags: ["authentication", "login"]
---
So I just signed up a new service, [SimpleAnalytics](https://simpleanalytics.com/) because, well, if I never look again at Google Analytics then I'll be happy as hell.  I can't say enough bad things about Google Analytics -- and I've been using it since it was [Urchin](https://en.wikipedia.org/wiki/Urchin_(software)).

Simple Analytics appears to be an impressive tool and I want to launching something, well, **TODAY** so when they offered a simple signup and easy to use workflow, I bit.  I even gave them a credit card.  And then I went to add my co-founder on this project to it and, well, *crap*.  They **only** offer Magic Link authentication.  Sigh.  **censored**

Magic Link Authentication is that beautiful concept that Slack pioneered where they just:

* Email you a link to authenticate with.  
* You click the link and WHAM!  
* You're in.  
* No account stuff.
* No password.  

And it feels like **magic**.  I was blown away by this the first time I used it in Slack and I, well, I actually did a small bow towards Silicon Valley and the **awesomeness** that is Stuart Butterfield (he is the guy behind Slack, the guy behind Flickr and the guy behind Game Never Ending).  Stuart is awesome (imho but so is Caterina also of course).

But Magic Link Authentication isn't supposed to be your only approach to authentication.  Tomorrow I leave my home office for a long weekend.  The Magic Link Authentication email that I just forwarded to my partner on this project has a duration of only 3 hours.  My partner doesn't have access to my email (and nor should they; it is my damn email).  So let's say that they somehow need to re-authenticate (browser crash; cookie expire; whatever), their only option is to send me a text message that begs:

> Please kind partner of mine - will you request a Magic Link again and then wait for the email to arrive to you and then please forward it on to me?

That's absolute crap imho.  Usernames and passwords are not that damn hard.  As a company SimpleAnalytics is on a [$360,000 run rate](https://blog.simpleanalytics.com/how-we-hit-our-30k-annual-recurring-revenue-milestone) -- figure out a way to add a second person onto the damn account.  

## Disclaimer

For all my bitching: 

* I like the Simple Analytics product.  
* I wouldn't have paid for it otherwise.
* I despise Google Analytics which needs to die, painfully, by fire
* I want them to succeed.
* I am likely to keep paying them.

but I know a lot about authentication (yes Virginia I even built [SAML](https://en.wikipedia.org/wiki/Security_Assertion_Markup_Language) tools once upon a time and [Kerberos](https://en.wikipedia.org/wiki/Kerberos_(protocol)) before that) and authentication isn't as simple as Magic Links.  Even I want it to be as simple as Magic Links but it just plain isn't.