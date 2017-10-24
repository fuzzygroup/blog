---
layout: post
title: ElixirCon Review and Closing Thoughts
category: elixir
tags: ["elixir", "phoenix"]
---
As I write this, ElixirCon is winding down and I have to just say **thank you** to the organizers.  This was a **fantastic conference** and worth every single penny.  I spent my own money on this and I still feel it was worth it.

Here are some closing thoughts:

* Elixir 2016 feels a lot like Ruby in 2006 or Rails roughly version 3; it feels like it is about to explode and this is a great time to jump on the bandwagon.
* The 1.3 directory structure changes in Phoenix actually do concern me a lot.  Chris has shown wonderful design sense so far so I have to trust him but rejiggering the overall directory structure always wreaks havoc on existing code.  We'll have to see.  It does make me, however, want to defer starting on new Phoenix code until it comes out.  I have some command line Elixir tools, however, that I can start on.  Chris also made some comments about the generators and I would be very sorry to see them go as they are currently **excellent**.  Sonny also didn't teach the generators at all in the Phoenix class which makes me wonder.
* Surprisingly the Presence / Channels in Phoenix, which I really have undervalued, I can see offer some really interesting opportunities particularly in building admin tools that keep you up to date on the status of a running system.
* DRY is no longer the underlying rule of the day.  Sonny, in the Phoenix training course, showed us the use of error_tag: at the level of each form field instead of a UL / LI loop at the top of the form.  Not having someone natter to me about DRY was really shocking.
* Dialyzer looks to be a wonderful tool.  The Riak guy who gave the presentation was impressive. (Note - you can generally ignore the *no local return* message and and go to the next error)
* The single best session I attended was the Leveling Up Your Ecto session; just outstanding!
* A lot of presenters went a bit too fast or to shallow at the level.  At a conference like this you don't need to be told how to use anything; you should be told how it works.  YMMV but that's my opinion. 
* The donut to human ratio (DHR) on the Thursday coffee session was **excellent** and seemed to be at least 1:1 if not 1.5 to 1.  Sadly Friday's coffee was ruled by healthy muffins and fruit salad reflecting a *DHR of 0*.  The afternoon food on Friday was similarly healthy.  **Unacceptable!**  ;-)
* I haven't spent time with multiple arities since an AI course in 1986 (Quintus prolog on a Sun 3).  Seeing /1, /2. /3 all over the place generated college nostalgia.
* I'm not certain that I agree with Amy Tan's learning presentation that its best to start with Elixir and then do Phoenix.  Elixir is very abstract where as the web, Phoenix, is concrete.  Learning tastes vary but I don't think she is 100% right on this one.
* Elixir is now all over the place.  I've met people from close to every state as well as a whole bunch of different countries.  For the first time in a long time I met more people at a tech conference that weren't from the bay area.
* Deployment is still kind of a mess.  It does appear, however, that people are packaging up their Elixir into containers and then deploying the containers.  Maybe this signals an end to native deployment?  Given the shite show that Rails deployment has been for years I can 't say that I'm sorry.
* Kubernetes is real and actually being used much to my surprise.
* Unlike a lot of recent technology conferences where I always feel like the old guy in the room, here I felt just like one of the crowd.  There are a ton of, ahem, "more senior", guys still writing code and since I'm one of them, that feels great.  Makes sense -- reliability appeals a lot more when you know that there's more to life than grinding out code / ops issues.  What's fun in your 20s is drudgery by your 40s.
* The composition of the attendees varied but it generally seemed to be "erlang experts bemused by all this (the Get off my Beam Slide!)" or Rubyists who are just plain at the breaking point.  I'm not here because I dislike Ruby -- I'm here because I no longer believe that Ruby / Rails can actually improve to meet my needs.  Every rubyist I talked to had a similar story including the two guys I rode to the airport with.  Do I love the Elixir syntax?  Do I feel that is as elegant and beautiful as Ruby can be?  Right now, no.  Do I feel absolutely certain that it can be more **reliable** and **scalable** than Ruby?  1,000%
* I met a ton of great people.  Thank you all.
* tooople NOT tuple as I have always pronounced it.
* __ = dunder (double underscore)
* Great tshirts!  They even gave me an extra one for my wife when I asked nicely which was very, very classy.
* structs, tuples, lists and maps oh my!  I need to dig out the books and knock out some study.
