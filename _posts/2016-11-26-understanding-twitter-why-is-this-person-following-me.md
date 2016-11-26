---
layout: post
title: Understanding Twitter - Why Is This Person Following Me?
category: twitter
tags: ["twitter", "blogging", "siri"]
---
I am what is generally referred to as an old school blogger.  My first blog post was back in 2002 and the first time I used hypertext links to keep daily notes was probably back in 1988.  Needless to say I've been using this as a medium for a very, very long time.  And I'm a wordy bastard at times so [Twitter, for me](http://twitter.com/fuzzygroup), is a particular challenge:

* I know there's something very, very real there
* People I [really, really respect](https://twitter.com/niall?lang=en) work there including the [guy who taught me Rails](https://twitter.com/wolframarnold) 
* It is a hell of an ecosystem
* It is closer to the open world of blogging than the closed garden of Facebook

When I came back to blogging in 2016 after a hiatius, I had an intuitive feeling that Twitter was now part of it and I've been trying to make sense of it ever since.  What I've personally found is that Twitter is a way to distribute your content.  It provides much the same function that RSS used to once upon a time.  

# The Question of Who to Follow

The thing that I've had real issues with is figuring out who to follow and whether or not reciprocal follow as a strategy actually makes sense.  When I first started really using Twitter I used what is called a reciprocal follow strategy -- if someone followed me then I followed them.  And I did it fairly blindly where I didn't first look at the "person" blindly.  This resulted in my following people like these:

* [https://twitter.com/NadiaShapiro](https://twitter.com/NadiaShapiro)
* [https://twitter.com/SimoRanieriCHEF](https://twitter.com/SimoRanieriCHEF)
* [https://twitter.com/FossaTeam](https://twitter.com/FossaTeam)
* [https://twitter.com/LaSavonnerie](https://twitter.com/LaSavonnerie)

Each of these people directly corresponds to specific tweet I made roughly at the time they followed me - with one exception.  Why in the world would LaSavonnerie ever follow me?  I have nothing to do with french milled soap.  That one was bizarre.  In the case of FossaTeam, for example, I posted something about email and then someone in the email space close to immediately followed me.  

The twitterverse is filled with APIs and is highly automated.  The implications of this became fully evident when this person followed me the other day:

![untangling_twitter_why_would_this_person_ever_follow_me.png](/blog/assets/untangling_twitter_why_would_this_person_ever_follow_me.png)

On first glance this is really, really cool -- the **voice of Siri** follows me!  And then you look at the numbers - **1.4 million** *followers*.  That kind of makes sense, right?  I mean Siri is a big deal so this is kind of like the number of followers that a celebrity might have.  The next number, however, gives me great pause: **1.1 million** *following*.  Let's just assume that you can find a Twitter user, evaluate their content quickly and make the decision to follow someone in say just 10 seconds.  That means that this person has spent **12.7 years** doing nothing more than clicking follow.  Mission Control -- we have a problem here ...

What seems to be going on here is that this person has a bot that is automatically finding "interesting" people to follow.  Perhaps via content matching similar to their goals or perhaps just via existence by monitoring new tweets.  The bot, acting as this person, then follows those people in the interest of building an audience.  This audience can likely then be monitized either thru advertising, promoting a product or service, delivering other people's tweets to it or by driving people somewhere else on the web.

# Conclusions

None of this is illegal, immoral or fattening but it absolutely feels **spammy**.  It feels spammy enough that I spent my free time this past September when my family and I were at DisneyWorld working on using Twitter's APIs to analyze my following list to see if I should continue to follow them.  I actually came up with a fairly decent algorithm but Twitter's rate limits on API calls makes it hard to use reliably.  However I'm still trying to figure out a work around.

Here are the rules around who to follow that I came up with:

1.  Never blindly reciprocally follow anyone.  It pollutes your twitter feed dramatically.  I'm still getting rid of followers.
2.  Follow people NOT products, not companies, not entities.  
3.  Don't follow celebrities - who cares.
4.  Follow people who have interest similar to yours.  Yes that ends up with a bit of an echo chamber effect but it gives you a feed of information that is consonant with your information needs.
5.  Don't follow general purpose media organizations.  Just goto Google News and let information surface that way.  

**IMPORTANT**: The bottom line is that if you carefully curate the people you follow on Twitter it can be a tremendous source of constantly flowing information.  When you incorporate follow people blindly the signal to noise ratio drops dramatically and Twitter becomes much less useful.  Wolfram, see below, explained this well to me and that really made Twitter much more useful for me.

# Thank You

Thank you to [Niall Kennedy](https://twitter.com/niall) and [Wolfram Arnold](https://twitter.com/wolframarnold) for advice on Twitter.  Both of these people are Twitter engineers that I knew in a previous life and both gave me great advice.  Appreciated.