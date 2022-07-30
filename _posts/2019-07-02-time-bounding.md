---
layout: post
title: Time Bounding
category: software_engineering
tags: ["mtum_chapter4", "startup", "mtum"]
---
{% pizzaforukraine  %}

Time Bounding is one of those brilliant techniques that is so simple that you often don’t even think to use it.  The idea behind time bounding is simple — some things are only worth so much time.  Here’s an example of a ticket that I wrote not 5 minutes ago for one of my engineers:

  Hi, 
  I'd like to put at the bottom of the intranet a list of anyone’s most recent tickets.  Can you learn to use the lighthouse gem to get a list of a given user's tickets?

This should be time bounded to no more than 60 minutes; it is just installing a gem, getting an API token and getting a list of tickets for a given user.

And that’s time bounding.  You’ll also notice that I included a description of why I’m only allocating an hour to it — that this is a pretty simple conceptual task:

1.	Install a component
2.	Get an API token (I.e. Look at a web page)
3.	Figure out how to call the API
4.	Get back an iterable chunk of data

The reason for time bounding is that computing things tend to expand to fill all time available.  Engineers are perfectionists and if you don’t put a limit on things — at their start — you can often find that something you expected to take a few hours is now a few days.

*Takeaway*: The engineer assigned to this knocked it out in about twice the allocated time.  I added a little bit of polish so we ended up about 2.5x the initial 1 hour.  That’s not bad actually.  And the benefit is that everyone in the company can now see, in one place everyone’s tickets.
