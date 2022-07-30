---
layout: post
title: Jumpstart and GoRails Has Outstanding Tech Support - Go Chris Oliver Go - Recommended
category: rails
tags: ["rails", "jumpstart"]
---
{% pizzaforukraine  %}

Technical support gets a bad rap in the industry but there are time when technical support proves **just how good a product or service can be** -- and this is one of those times.  

I'm very much a Rails guy and I've been debating trying [Jumpstart Pro](https://jumpstartrails.com/) for some time.  I finally have a crappy little SAAS idea and this is likely the perfect time for me to try it -- because I have written **zero** code so far.  Now JumpStart is a paid product that amounts to a pre-build starting Rails app with all the necessary cruft for a SAAS app already built.  So it really only works when you are in a pure greenfield state.  So this is perfect for JumpStart Pro.  

But since it is a paid product, I wanted to try before I buy which made me try the [free version on Git](https://github.com/excid3/jumpstart).  And that, well, that was a disaster.  I ended up with all kinds of issues, mostly related to railties and Rails 6.  If you've been around a while, you've seen this and, well, you know it sucks.  So after an hour of mucking about, I finally threw my hands up and said "I'll just email Chris".  Now I am a paid subscriber to Chris' Rails Cast service, [GoRails](https://gorails.com/), which, I will admit, does give me an advantage in talking to him.  I'm not an active user of the service but I do pay for it monthly.

So I sent him an email around 3 in the morning on a Friday night and I had an answer back by 10:50 am on a Saturday:

    Hey Scott,

    The free template has no shared code whatsoever with the Pro template. The Pro 
    template is actually a pre-built Rails 6 app you clone because as you can see 
    here the Rails generators are an absolute mess to maintain.

    We built a bunch of classes with Tailwind to make it much more familiar to any 
    Bootstrap users. It's pretty freeing once you get used to it.

    It looks like it installed Devise 1.5.4 on your first error log. Devise is currently 
    4.6.2 lol. That I'm sure is part of the issue. They updated the git to support 
    Rails 6 a couple months ago, but haven't cut a release for it yet.

    All stems from a stupid nuance in gem versioning. Devise is set to < 6.0 
    and technically 6.0.0.rc2 is less than 6.0 final, so the current gem version 
    worked, but not with the final release.

    Just updated the template to use Devise from git for now. Works like a charm.
    
    Chris
    
Not only did he understand the issue but he perfectly explained it and fixed it.  And in just a few hours on a Saturday.  This is extraordinary support and, to me, it illustrates just how good JumpStart Pro likely is (and how good Go Rails is).  People don't take this much care with products that aren't good.  

So if you are in the startup business and you look at support as a cost center, you are flat out wrong at least some of the time.  In this case support was an absolute win and will get another copy of JumpStart Pro bought (I haven't done it yet because I'm headed out the door shortly; only reason).

Chris Oliver, Go Rails and Jumpstart Pro -- recommended.