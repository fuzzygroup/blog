---
layout: post
title: What Keeps You From Using Using Elixir
category: elixir
tags: ["elixir", "phoenix"]
---
So I'm at roughly 35,000 feet coming back from ElixirCon, and I saw a tweet that sparked my interest: [What Keeps You from Using Elixir?](https://twitter.com/georgeguimaraes/status/771722738994180096).  Wow.  That's a fantastic question.  I'd like to break that down to several issues:

* The Elixir Language
* The Phoenix Framework
* Deployment
* Ecosystem
* "It Has to be Standard Platform"

This is exactly the right question to ask and I believe that the author works for Platformatec so this is effectively market research for them and I'm delighted to answer at least for myself.

Personally I'm a hard core rubyist.  I've been using Ruby since 2006 and Rails since 2007.  I'm responsible for a pure ruby codebase doing hardcore data processing at a very large scale (6,000,000 data points per day) for one application / 1/4 terabyte of crawled data per month for another application. Our aggregate code base is approaching 500,000 lines of code in total and the design pattern is, well, the all too familiar **Ruby Monolith**.  I came to ElixirCon because the tooling I've devoted over a decade to simply can't cut it anymore.  Its is the fragility that all of us know all too well:

* brittle gem stack (but better than Node)
* test coverage that runs slowing, inconsistently if at all
* performance issues that range from annoying to dreadful

Now don't get me wrong -- I actually do love ruby but I no longer feel like I can build stable, reliable distributed systems with it.  And, honestly, the less reliable my systems are the less time I can get with my wife and kids.  After over a decade of ruby, the failures just aren't fun anymore.  I go into work and it feels, too often, like I'm an architect building something on a foundation of wet sound.

Personally I've been experimenting with Elixir now since [March 5, 2016](http://localhost:4000/blog/elixir/2016/03/05/getting-started-installation.html) and I still don't have anything save toys so, now with the context in place, let's talk about the issues.

I'd draw a firm distinction between the Elixir language and the phoenix framework.

# Elixir

Getting going with a new language in production is **hard**.  And its particularly hard when the language breaks with existing paradigms and then leverages other technology (Erlang).  You end up having to master a language and then master the other technology.  And even if you don't have to master Erlang to use Elixir you do have to be able to get it running and feel comfortable with it in a production context.

However, for most of us, I think the issue comes down to finding that perfect penetration point.  The killer app which the language is really good for.  Its taken me six months to figure that out for my organization and I finally have it.

Maybe Platformatec needs to work on a twitter campaign like #MyElixirKillerApp and get people talking about what they want to use Elixir for.  We all just saw #MyElixirStatus do quite well over the past few days.

# Phoenix

Phoenix is interesting as heck to me although Chris McCord's presentation yesterday on changes to the layout does make me a bit apprehensive.  Knowing that major changes are coming to the layout makes me mildly concerned about starting work on it today -- although I did start on an application before I boarded this plane.  Honestly the single biggest thing that concerns me about Phoenix is having to write the authentication layer myself.  I'm hard pressed to think of anything I've built in the last 5 if not 10 years that didn't have login as part of it.  So the concept that I have to roll my own authentication for Phoenix when I know that Devise comes from the parents of Elixir really bothers me.  

And don't get me wrong, I know that I can build a simple password form and use Comeonin for hashing.  And it doesn't even have to be Devise but I'm very reluctant to implement security in what is to me a brand new language and brand new framework.  I'm too damn likely to screw something up and leave a hole.  I don't have to have all the features of Devise but I really feel like this out to be a provided facility and not something that we all implement poorly.

**Sidebar:** I don't even like Devise; I struggle with it regularly but I trust their understanding of security better than my own.  The guy who [taught me rails](https://fuzzygroup.github.io/blog/software%20engineering/2016/09/02/what-wolfram-arnold-taught-me.html) drilled this into me when I started and its as good advice now as it was then.  People who exploit security holes are scary good.

# Deployment

I should admit that I couldn't make the deployment presentation at ElixirConf so perhaps the answer as at the conference and I missed it.  The state of deployment for an Elixir / Phoenix "thing" bothers me.  I know that I can develop in it but I don't fully understand how I regularly get this into my daily code / fix / release workflow.  I do know that the state of Ruby deployment in the early days was poor and that makes me think that things aren't all that different.  And perhaps the answer is that classical deployment is irrelevant and all this needs to be done at the container level. If so then that's another issue since not all of us are fully conversant with containers yet.

# Ecosystem

For all the bashing of Ruby / Rails at the conference, it should be noted that Rails has a rich ecosystem at this point.  In talking with a potential client just after the conference they brought up "Technology X" and, yep, there was a gem for it.

# "It Has to be A Standard Platform"

As a consultant you do have to listen to your clients and in while talking with the potential client I mentioned in the preceding section, they did make it clear to me that if I built anything for them that it "had to be a standard platform".  What that exactly means wasn't defined but, somehow, I don't think elixir / phoenix was it.


# Conclusion / What is the Killer App for Elixir?

I really, really want to use Elixir / Phoenix.  Ever since the first day, picking up my rails apps has felt, well wrong.  Its been very, very hard to motivate myself to write code and that's unusual for me.  I suspect my recent [prolific writing output](http://fuzzyblog.github.io) is a part of that.

As I look down upon the world from afar (remember I'm still on a plane), I wonder if the killer app settles down to three things: 

* who will use a crazy new technology?
* what are the one or two defining attributes of elixir?
* how do the who and the what intersect?

One possible strategy would be: 

* people without an installed code base - **startups** - the same type of people who leveraged Rails to success over the past ten years
* **performance** / **reliability**.  I've listened to a lot of Chris' and Jose's presentations by now and they always say how it isn't all about performance.  And I get it -- its a rich, elegant language that can do so, so much -- but you can't be everything to everybody.  

So if you went with startups and performance / reliability then what's the intersection?  **API backend for apps**.  

I think about all the companies that have tried to reliably scale Ruby as a back end api strategy and kept having to either add more servers or more cache layers and it just makes you want to weep then die.  A microsecond response time solves a ton of issues.  And I agree that Elixir can do just about anything but it needs its equivalent of CRUD apps to get past the adoption hurdle.  And just as we now do lots and lots of different things now with Ruby, it all started from one thing.  Similarly Elixir needs that one thing.

Thoughts?