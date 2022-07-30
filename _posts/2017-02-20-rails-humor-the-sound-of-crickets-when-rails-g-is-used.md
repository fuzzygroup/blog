---
layout: post
title: Rails Humor The Sound of Crickets when rails g Is Used
category: rails
tags: ["rails", "humor"]
description: When you eliminate ActiveRecord from a Rails project, generating a model is pure hilarity
---
{% pizzaforukraine  %}

So I'm starting work on a new project that promises to be interesting.  This is pure green field development -- one of my very, very favorite things.  I did a skeleton application generation like this:

```ruby
rails new exploder --skip-active-record --skip-action-cable --skip-spring --api
```

Then I did the normal repository initialization dance: 

    git init
    git add .
    git commit -m "First commit"
    git remote add origin git@github.com:fuzzygroup/exploder.git
    git push -u origin/master
    
No surprises so far.  Time for the first model:

    rails g model TextCommon
    
And I got ... nothing. Hm... Here's app/models:

    ls -l app/models/
    total 0
    drwxr-xr-x@ 3 sjohnson  staff   102B Feb 20 08:32 concerns/
    
*blink*  Oh right -- skip-active-record.  This is going to be purely an API and one that processes a lot of text.  But, in an amazing lack of foresight, apparently there's no such thing as a model generator when you don't have ActiveRecord installed.  Sheesh.  

I'll say this much though -- it did make me laugh out loud when I really, really needed it.  Off to write a poro (plain old ruby objects) model generator so test files get properly set up and such...