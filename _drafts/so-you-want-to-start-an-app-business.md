---
layout: post
title: So You Want to Start an App Business
category: startup
tags: ["startup", "apps"]
---
**Note**: I'm actually not going to blog this (or at least not until you tell me you can).  I think being specific about this opportunity is likely to be more useful for you.  Bits and pieces of this tho may end up blogged.  

I saw something online the other day about a person wanting to start some type of location centric online social network based around an app front end, **without raising any funding** initially, and my immediate thoughts were:

* Interesting
* Has possibility
* Oy vey

The person who had written this had a very interesting concept but wasn't a startup person / wasn't a technologist so I thought I'd write up my thoughts about starting an app business.

The idea at hand was sort of an "Dating without Sex" idea.  Call the app "I'd Like a Friend To" (ILAFT).  The basic idea is

* An app which allows a user to register using an avatar as opposed to a picture; this isn't a dating app so gender shouldn't matter
* A user can express what they want in a few different ways:

1. "I want to do X and I need someone" 
2. "I'm available, surprise me!"
3. They might browse for what's going on 

This is a pretty simple concept and while pulling it off at scale is technologically challenging, the interesting thing to me is pulling it off **without funding**.  I'm writing this as a thought experiment to see if I could work out a way to build this business without a ton of funding -or- perhaps any funding.

**Disclaimer**: I write this as someone who hasn't ever built an app or app business but I am an extremely solid, working engineer and I did spend a decade writing AppData -- a now defunct SAAS business that indexed the different app stores and sold analytics on them.  So I've got a pretty solid handle on trends and the overall app ecosystem / core technologies.

## App Business Rule 1 - It Isn't About the Technology, It Is About the Marketing

You should understand something important here when I say that your app business isn't about the technology -- it really, really isn't.  The issue with building any app business is marketing.  The question here, and it is specific to any type of social network, is how do you jump start the social network.  And, while some social networks are tied to digital things like content, this is explicitly tied to real world events -- which makes starting it hard.  

The best idea that I've had in this regard is to grow this regionally, metro area by metro area.  The reason for this approach is it parallels how both Uber and Lyft have built their driver networks.  It seems to me that one approach would be to model this on local speed dating events where you seek out local people that like to do things and get them to use the app as in a role something like a "Local Guide".  This, combined with some type of local marketing should prove (or disprove) the concept.

## App Business Rule 2 - There Are 4,000,000 Plus Apps in the App Store

One of the things that most people that either start app businesses or want to start app businesses simply don't understand is that there are 4,000,000 plus apps in the App Store:

> In 2019, the App Store offered 903,489 gaming apps. In contrast, as of that period of time the store had 3.06 million non-gaming apps available. As of June 2017, 180 billion apps had been downloaded from Apple App Store. [Statista](https://www.statista.com/statistics/268251/number-of-apps-in-the-itunes-app-store-since-2008/)

And the numbers are similar for the Google Play app store:

> The number of available apps in the Google Play Store was most recently placed at 2.8 million apps, after surpassing 1 million apps in July 2013. [Statista](https://www.statista.com/statistics/266210/number-of-available-applications-in-the-google-play-store/)

Just think about that for a second -- if there are almost 3 million apps for Android / Google Play phones and 4 million apps in the App Store then:

* How is your app business going to stand out and be discovered?
* How many apps like it are in the category?

## The Technology Basics of Any App Business

And now we come to the technology that drives any app business.  There are two types of app development technology: 

* Front End App Technology
* Back End App Technology

Each of these is described below.

### Front End App Technology

Your app itself is what is called "front end" technology.  Whether it is for iOS or Android / Google Play, the app executes locally on the phone / tablet itself.  Apps can be developed in a few different ways:

1. Apple - Swift / XCode
2. Android / Google Play - Java / Kotlin
3. Apple and Android / Google Play - React Native
4. Apple and Android / Google Play - Cordova
5. Apple and Android / Google Play - Ruby Motion 

If you look at numbers 1 and 2 above, you'll notice that each of these technologies are used to write a platform specific app.  To have a successful app business, you generally need to have an app that works on both Apple and Google platforms.  And if you use these technologies, you are effectively developing your app twice.  Given the lack of funding, neither of these development tools are appropriate.

#### React Native

React Native is a technology from Facebook that allows you to develop the bulk of an app in JavaScript and HTML / CSS -- with mostly the same code between Apple and Google platforms.  Yes, that's correct, it sounds impossible but it actually does work.  And while there are some limitations in the resulting app, none of these limitations are likely a problem for at least the initial prototype (and possibly never).

#### Cordova

Cordova is a similar technology to React Native although older and less sophisticated.  Like React, your app is mostly developed in JavaScript and HTML / CSS and it shares code to between the Apple and Google Play platforms.  Overall Cordova would be a choice mostly because of ease of development and it definitely has more limitations than React Native but it is likely faster and simpler in which to develop.  

**Note**: Going down the React Native path would give you an app that is strong enough to be built on long term.  Going down the Cordova path will be faster and cheaper but much more likely to be a "throw away" technology if the app succeeds.

See also:

* [Cordova Docs](https://cordova.apache.org/docs/en/3.0.0/guide/overview/index.html)
* [Cordova Tutorial](https://www.tutorialandexample.com/apache-cordova-tutorial/)

#### Ruby Motion

A much less known technology is Ruby Motion which allows cross platform apps, both Apple and Google platforms, to be written using the same code base.  Ruby Motion isn't widely known but there are apps in the App Store using it, mostly games.  The risks in using a lesser known development technology include:

* Problems hiring (but this is only an issue if the app succeeds; and, statistically, it won't)
* Problems finding information on how to use it
* What happens if it goes away?

### Back End App Technology

The term back end technology applies to the servers behind the scene that the app talks to.  The way an app like this works is that all the information that comes in is ultimately send to a back end server, mostly a database, that acts to store the information and drive the match making process.  

Back end app technology can really be written in any language but normally a standard language like Ruby, Python or PHP are good choices.  For this type of app you need to build an API (application programming interface) that accepts and retrieves information from a database that supports some level of what are referred to as GIS queries.  A GIS query is one that can use latitude and longitude, as supplied by the phone, to do location based queries.  This would allow you to answer queries like "Events going on near me".

## From the Founder of DropBox

An interesting way to look at this is from the perspective of the founder, Drew Houston of DropBox who, in a presentation at YCombinator, argued that to succeed, you need:

* A huge market
* Founder to Market Fit

### How Big is this Market?

So one question is how big is the market for a non dating event service.  We do know that people are lonely and separated today more than ever.  We can see this a thousand different trends, including: 

* the loss of traditional front porches
* people that don't know their neighbors
* the trend to pull one's car right into a garage and not see people locally

Now, that said, whether or not people will intentionally use this type of app is unclear.  There are lots of trends that we see everyday that people don't want to address.

### Founder to Market Fit

I am not the founder of this idea.  I am really just an interested bystander who saw this idea and sought to offer my advice.  So the question is whether or not this founder is the right founder for this idea.  

The essence of this concept is that founders bring certain traits to the table that work for some opportunities more than others and the trick to succeeding is making sure that your market fits your traits.
