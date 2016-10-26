---
layout: post
title: Rails Tip How to Fix Incomplete response received from application
category: rails
tags: ["rails", "apache", "passenger", "bundler", "capistrano", "deploy"]
---
Again, one of my least favorite things in the entire rails ecosystem is deployment.  Deployment was ass painful in 2007 when I started with Rails and it is still ass painful.  Sigh.  Even as much as I love passenger, it is a fickle beast at best and you always end up with arcane error messages that you haven't solved in six months or so so you never quite have the answer.

When you hit the error message:

    Incomplete response received from application

The usual answer is that you're missing the secret from:

    config/secrets.yml

You want to solve this with:

    bundle exec rake secret

and then copy the result and define a secret for the correct environment or load it from the environment variable.

[Obligatory Stack Overflow Reference on this](http://stackoverflow.com/questions/29241053/incomplete-response-received-from-application-from-nginx-passenger).
