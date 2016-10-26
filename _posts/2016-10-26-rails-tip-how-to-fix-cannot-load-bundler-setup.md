---
layout: post
title: Rails Tip How to Fix Cannot/Load Bundler/setup
category: rails
tags: ["rails", "apache", "passenger", "bundler", "capistrano", "deploy"]
---
One of my least favorite things in the entire rails ecosystem is deployment.  Deployment was ass painful in 2007 when I started with Rails and it is still ass painful.  Sigh.  Even as much as I love passenger, it is a fickle beast at best and you always end up with arcane error messages that you haven't solved in six months or so so you never quite have the answer.

When you hit the error message:

    cannot load such file -- bundler/setup (LoadError)

The usual answer is to run:

    gem install bundler

in the Rails root application.  Unfortunately this can't generally be done until the source code of your application is installed making it hard to ansible-ize.  Alas.

[Obligatory Stack Overflow Reference on this](http://stackoverflow.com/questions/19061774/cannot-load-such-file-bundler-setup-loaderror).
