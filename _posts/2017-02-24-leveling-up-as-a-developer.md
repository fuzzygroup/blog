---
layout: post
title: Leveling Up as a Developer
category: software_engineering
tags: ["software_engineering"]
description: If you're looking to level up your skills as a developer, here is how I've been doing it my whole career.
---
I have spent the past week handing off about 450,00 lines of ruby / ansible code (as measured by rake stats) that are an interface to about 6 terabytes of MySQL data handled by n AWS instances where n varies between 15 and several hundred to a **single** developer -- who happened to be more junior I was.  He's not a bad guy by any means but, at times, it felt like I had hit him with an intellectual anvil.  We had only one week for the transition.  

Given how hard transitions and taking on a whole new code base can be, I thought I'd write out some recommendations for *Leveling Up as a Developer*.
 
# Its All About Immersion
 
About 9 months ago, I realized that the future of computing lay, imho, in AWS.  After having resisted cloud hosting for years, I finally buckled down and immersed myself in it. During the first six months of that 9 month period, well, I pretty much read constantly about little else but AWS.  There aren't lots of great AWS books from what I can tell so I read blog post after blog post after blog post.  And then when I learned something I'd try it and then [write it down](http://fuzzyblog.io/blog/category.html#aws).
 
# You Need to Write It Down
 
The way I got good at learning things came back in 2002 when I learned to blog.  By writing things down in such a way that I could understand them, I taught them to myself.  Personally my writing preference has always been blogging since it gives something back to the public commons and, if I do write it well, I always, always, always learn something new from the writing process itself.  See Notes 1, 2 and 3 at the bottom of [this post](http://fuzzyblog.io/blog/rails/2017/02/24/understanding-low-level-index-issues-in-mysql.html) as an example.  Writing it down helped me come up with those three important points.
 
# You Need a Side Project
 
I think every single developer out there needs a side project.  It doesn't have to be grandiose in nature or even make money but your day job doesn't always allow you to learn the things that you need.  A side project is **yours**.  Want to play with backbone?  Then write a backbone front end to it.  Need to experiment with Elixir after you spent your own cash on the conference and the training and your boss denied it as too risky?  Just use it on your side project.
 
# You Need to Write Code Every Single Day

I'm a big believer in incrementalism and the fact that you get better bit by bit.  On my current side project I have a commitment to myself that I put in at least one hard core hour per day every single day and I've been sustaining that since December 27th when I got serious about it.  If you want to level up then coding isn't just a 9 to 5 thing; its an every day thing.
 
# Read, Read, Read

You need to read until you're sick of it and then you need to read some more.  This tends to go beyond immersion.  Immersion is when you're picking up something entirely new.  Reading is part of taking software development seriously as your craft.
 
# Realize This Basic Fact
 
I've now been working in software development since '87 and it took me years and years to learn this basic fact: 
 
> Any software engineer increases their skills in direct proportion to the **number** of **different** codebases that they work on.
 
The problem here is that when you're an employee the number of different codebases you're generally exposed to is, well, **one**.  The single best thing I ever did for my engineering skills was to move to being a freelancer.  I can cite which experience, since 2010, the start of my focus on freelancing, taught me what:
 
 * AppData - Large scale data *everything*
 * HowAboutWe - ActiveRecord optimization
 * StreamSend - Alternative ActiveRecord sharding architecures for decreasing hosting costs
 * LiveText - How to take a code base without any tests and grandfather them in without breaking things
 * FI Navigator - Devops
 * Interana - SAML
 * SigStr - MongoDB i.e. the world is not entirely MySQL
 * AddApp - Primary market research and ideation
 * Inside Network - How to write a billing system end to end that scales to millions of dollars and operates with zero downtime over a multiyear period
 * MDDX - Complex mathemetical workflows in Ruby
 * LinkedIn - Low level optimizations for an intensive Ruby workload
 * Trazzler - Geopositioning
 
Had I been stuck in 1 or even maybe 3 different jobs since 2010, I'm absolutely certain that I would never have picked up all these things.
 
# Learning is Multi-Medium These Days

I'm an admitted book nerd:

![book_nerd](/blog/assets/book_nerd.jpg)

You should know that these book shelves *now* go floor to ceiling and this is mostly computer science / high tech industry case studies with a bunch of cook books.  But even I have to admit that there are now very high bandwidth learning tools including:

* YouTube.  Ignore the cat videos and search for conference proceedings.
* Podcasts.  I highly, highly recommend [Software Engineering Daily](https://softwareengineeringdaily.com/).  It is a fantastic learning tool for staying up to date on things.
* Udemy Courses.  I've learned a ton from Udemy but I got the best computer science basics from [this course on Interviewing](https://www.udemy.com/break-away-coding-interviews-1/learn/v4/t/lecture/3948990?start=0).  Also see my buddy Nick's stuff on [Docker](https://www.udemy.com/the-docker-for-devops-course-from-development-to-production/).  Outstanding.
 
# Apply It For Yourself

Seemingly any technology you want to get good at these days there's a way to apply it for your personal use. Let's say for example that you want to learn Ansible.  Here are two personal applications that would teach you quite a bit:

* I now configure my MacBook using [Ansible](https://github.com/fuzzygroup/ansible-macbook-pro) - the link is to my repo for this.
* I know other people who configure their [Plex servers using Ansible](https://github.com/Phunky/ansible-plexmediaserver).