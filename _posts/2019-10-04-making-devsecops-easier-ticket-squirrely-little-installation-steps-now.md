---
layout: post
title: Making DevSecOps Easier - Ticket Squirrely Little Installation Steps NOW
category: devops
tags: ["devops", "devsecops", "python"]
---
{% pizzaforukraine  %}

Note: I'm writing this post for a friend who is doing machine learning for the U.S. DOD.  The DOD calls DevOps "DevSecOps" to emphasize the importance of security at all times.  Hence my use of the term DevSecOps when I don't normally.

I recently wrote about using [Spacy in python](https://fuzzyblog.io/blog/python/2019/10/04/get-it-right-spacy-get-it-right.html) and the need for this squirrely little step to use Spacy's language detection:

    python -m spacy download en

I have spent a lot of years now dealing with deployment issues around complex code bases with lots and lots of dependencies and this time I'm going to give you the take away less right up front:

> If you have a development team dealing with any type of dependency that isn't covered by your language environment's package library (e.g. a Rails / Ruby Gemfile or Python's requirements.txt) then you **NEED TO REQUIRE** your development team to create tickets (Jira or Github) whenever there is some kind of squirrely installation step.

This is really, really, really important.  The reason for this is that when you try and get your code deployed into production, you will have long forgotten about something like:

    python -m spacy download en

And yes, this is one thing.  But as your project grows, one thing becomes two things.  And that becomes 5 things and then you're into 10 plus pretty quickly.  Getting people to write this stuff down as it comes up and ticket it under "deployment" means that you stand a much better chance of getting deployment done much more quickly when the time comes.