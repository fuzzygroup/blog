---
layout: post
title: Rails Tip How to Fix Could not find a JavaScript runtime
category: rails
tags: ["rails", "javascript", "therubyracer", "bundler", "capistrano", "deploy"]
---
One of my least favorite things in the entire rails ecosystem is deployment.  Deployment was ass painful in 2007 when I started with Rails and it is still ass painful.  Sigh.  Capistrano is worlds better than it used to be but its still tricky.  And you always end up with arcane error messages that you haven't solved in six months or so so you never quite have the answer.

When you hit the error message:

    Could not find a JavaScript runtime

The right thing to do is to first bitch out loud about the mind boggling stupidity that you can't run db:migrate w/o a JS runtime.  After you've done that 3 or 20 times then the solution is to just install nodejs on every one of your production boxes:

    sudo apt-get install nodejs

This sucks hard but it does work.  Another solution is to use a native ruby tool like therubyracer but I have projects where therubyracer cannot be installed -- it just gives "gem not found" errors no matter what I do so cie la vie.
