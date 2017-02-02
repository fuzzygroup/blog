---
layout: post
title: How to Succeed at a Site Project
category: site_project
tags: ["side_project", "startup"]
---
I have started, by my own metrics, well over 20 side projects since I entered the Rails world.  That's at least 2 a year, sometimes more.  I've just launched Hyde in its first, albeit free, MVP stage.  I've been working on this, every single day, since December 27, 2016 when I decided to get serious.  Here's how I did it.

# Realize that Your Paying Job is Only 40 Hours / Week

This was the critical epiphany for me.  I wrote my side project so far while I had a full time gig.  But as my wife helpfully pointed out to me - "You want to do this and you're spending more time than you are actually paid for on someone else's thing -- work your 40 hours and spend all your other time on the side project".  She was right and I have.

Work culture, at least in America, has gotten so bizarre where people now define themselves entirely by their job and they think nothing of working around the clock.  There's no need for that.  As a full time employee you are paid for 40 hours / week (generally).  If you're working more than 40 hours per week then you're effectively lowering your hourly rate and giving your employer **free money**.  Given that most employers don't see fit to giving you free money, well, think about it.

# Establish a Schedule; Give Side Project Your Best Time

I think most software engineers have natural rhythms.  For me my best time is the quiet hours at the beginning of the day.  From the moment I wake up until my actual (paid) work day starts, I work on side project.  So I normally rise around 3 am which gets me anywhere from 1 to 4 hours on side project every single day.  Your schedule will likely vary -- hopefully you're not up pre dawn like I am -- but figure out a repeatable schedule where you can give your best time to your side project.

# Write Code Every Single Day

I've written code every single day since I started on this.  On days where I'm blocked I write something.  There's a lot of infrastructure if I'm going to write this side project in a scalable way without killing myself down the road so I think I've actually spent more time there than I have on the features.  That's ok -- personally the real technical challenge here is in the infrastructure.

And, if you don't like coding enough to write code for a side project every single day, well, a side project isn't for you.  I'm sorry if that's harsh but I think that's the reality.

# Take a Laptop Everywhere

If you're doing a side project then its really important to take advantage of what I have always referred to as interstitial time -- the time between times.  For example I wrote UrlCommon.is_valid? which validates whether or not the user entered a valid url while watching my son play basketball at an Indianapolis Pacers Junior training thing.  Doubt me?  Here's the YouTube video!

Any modern laptop should be small enough and light enough to go with you always.  I have a go bag with everything I need to code successfully whether in the car while waiting for the kid to come home from the bus, taking my wife to the store, etc.  Every minute counts.

# Minimize Costs Ruthlessly

Like a lot of us, when we work for a funded startup, I use all kind of services.  For a side project, **Nope**!  Every dollar counts so the only "service" I use is my $7 / month paid github account.  Not airbrake / hoptoad / dockerhub / etc.

# Take a Paper Notebook Everywhere

The best tool I've had in developing this has been this:

![spidey_notebook.png](/blog/assets/spidey_notebook.png)

Paper and pen is a superior thinking tool than just about anything else.  This notebook has gone everywhere with me and the pages are filled with scrawls about features, marketing, naming, architecture diagrams, plans how to minimize cloud hosting costs, etc.  It is small enough that it fits into the pockets on most of the cargo shorts I wear everywhere (yes, even in March as I write this, I'm still in shorts).  

If you don't write it down, at some point, you're going to forget it.  Don't make that mistake.

# Recognize Your Own Failings

Like most people I have serious failings.  From a technical perspective I tend to not treat data validity as a significant enough issue.  From a business perspective I pay more attention to the product than the revenues and the costs.  Neither of these is acceptable and I strongly believe that a side project should make you better at what you do so use your side project as a way of addressing your own failings.  Here's an example of one of the first bits of Hyde that I implemented -- I call it Revenues & Costs: 

![hyde_revenues_and_costs.png](/blog/assets/hyde_revenues_and_costs.png)

Yep - I wrote an accounting dashboard.  Why?  Well I'm going to pay a lot more attention to revenues and costs if I like / understand the tool which tracks them.

# Recognize that Writing Content is Part of It

There have been days where I did nothing but write the contact page and the about page.  And about 20 other pages that aren't yet visible (sorry; the cat isn't fully out of the bag yet).  Any side project isn't just the code -- its **everything**.

# Give Something Back

At this stage Hyde is a non revenue producing side project with only a free MVP released.  But, even so, I've already released something as [open source](http://github.com/fuzzygroup/sync-dot-rake).  I could talk about karma, how we're all reliant on open source and should morally give somethign back or some other drivel.  Here's a simple fact - giving stuff back gets you attention.  Getting attention to a side project is hard and giving something back is easy.  Think of giving something back as **marketing**.

# Recognize When You're in the Weeds

I cook quite a bit and one term I've adopted from the professional cooking world is "being in the weeds".  This refers to when you're swamped with orders and can't see the forest for the trees.  This is all too common in technology.  A few weeks ago I had the brilliant idea -- write my own Rails generators to create some specific types of classes that I use a lot.  Well, an hour later, I was **nowhere**.  I've even done this before but Rails 5 has changed things and I was just plain stuck.  I made the realization that either my only goal for today was going to be "make some progress on a generator" or I should **stop cold** and go back to features.

# Treat it Professionally

I have a side project which has only barely launched.  A month and five days into it there were 122 issues in Github and 3 milestones.  Just because its a side project doesn't mean that you don't track bugs, do project planning, etc.  

# Don't Stress About Domain Name, Product Name, Marketing

Here's the sad truth about side projects:

* Most don't amount to anything
* Most never get finished
* Few even get launched
* Of the few that get launched, even fewer actually ever produce a dime in revenue

So why, oh dear lord, why are you even worrying about domain name, product name, marketing, etc.  **JUST WRITE CODE !**  If you write code then maybe you'll be lucky enough to get to this stage.  Domain names can be changed, product names can be changed, marketing can be figured out.  If you want to product yourself from the impact of a name change then store the product name in an internal constant and always reference it from the contant.  Hell I have a whole file of marketing related constants since I **hate** rewriting stuff.  


