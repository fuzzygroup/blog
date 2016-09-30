---
layout: post
title: Using Ansible to Drive Down Hosting Costs
category: ansible
tags: ["ansible", "hosting"]
---
Ever since the Fall of 2014 I have been trapped in an **dysfunctional relationship** that I have been unable to leave.  No I'm not talking about a spouse, a boyfriend or a girlfriend.  I'm talking about my hosting company where all my Rails applications live.  And, while I'm talking about Rails, it doesn't have to be Rails.  It could be PHP, Python, Go, Elixir or anything.  

Here is what I refer to the ***economic paradox of hosting***:

1.  On the day you arrange to use hardware from a hosting company you should be paying the MOST ever for your hardware.
2.  Your bills almost always go UP not DOWN.

The issue at hand here is that your hosting company knows that the longer you have a box with them, the more valuable that box becomes to you.  And the paradox is that the value of hardware falls over time.  That 24 gig of RAM box that you contracted for in 2014?  Well it should likely be a 36 gig of RAM box in 2015.  And it would be if you bought it again.  But you didn't buy it again -- you stayed with the machine you had -- and your hosting company knows this.  So even tho the machine you're renting today is worth less than it was when you started with it, your price per month hasn't gone done.

# Servers Should Never Be Unique Snowflakes

One of the single best concepts that I've learned from cloud computing and all the time I've spent doing AWS is that servers should never be unique snowflakes. Servers should be identical resources that you just have.  They should be something that you **generate** and build dynamically as needed.  Need a web server -- just generate one.  Need a worker box?  Just generate another one.  And, you know what, even if you have your own infrastructure, its **still true**.

# Ansible Versus Chef

I've spent the past week deeply immersed in devops using Ansible.  Ansible is a declarative approach to machine configuration and it is far, far beyond procedural approaches to machine configuration like puppet or chef -- the tools I had used previously.  In 2014 I and one other engineer used Chef to provision a data center for 3 applications and over a 45 day period we never actually finished.  We took Chef as far as we were able to and then we had to finish the process manually and every time we needed to make a change to a box, after things were "setup", we had to do it manually.  Here's a comment from the other engineer:

    with chef, I had no idea after all that time, where I should put what file
    
And here was my comment:

    Chef was a f***ing disaster.  Make that my bad decision of 2014.
    
In about 4 days of on and off work I have not only duplicated every single bit of the chef provisioning work that I had done previously but:

  * Its testable using vagrant
  * Its repeatable
  * All the tools I rely on are there
  * I can add new boxes just by modifying a single inventory file 
  * Even things I used to have to do manually I can now automate
  * I've improved security my adopting elements of the [12 factor approach](https://12factor.net)
  * It works

# How Does this Bring Down Our Costs?

Well if machines aren't unique snowflakes, if they are things you can regenerate then you have the ability to better negotiate your rates.  When you're prepared to go elsewhere, you'll have the confidence to actually explore your alternatives.  I've never even considered moving from the hosting company I went to in 2014 purely because of the amount of effort it would entail.  Now that I can programmatically build the infrastructure I need?  You can bet that I'll either be asking for lower rates or moving on.