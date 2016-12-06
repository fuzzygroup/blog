---
layout: post
title: No Rdoc Once and For All
category: ruby
tags: ["ruby", "rails", "gem", "rdoc"]
---
After watching me swear like a sailor earlier today, [Dv](http://www.dasari.me/) provided this snippet:

    cat ~/.gemrc
    install: --no-rdoc --no-ri
    update: --no-rdoc --no-ri

Never again will I have to wait for rdoc to generate (which at times takes longer than the damn gem itself).  Huzzah!
