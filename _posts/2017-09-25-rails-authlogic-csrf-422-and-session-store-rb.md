---
layout: post
title: Rails, AuthLogic, CSRF, 422 and session_store.rb
category: rails
tags: ["rails", "authlogic", "csrf"]
---
When you're a professional developer, you come to recognize a category of problems that I refer to as "Pair Programming Required".  These are those mysterious failures where you know damn well that something should work but *nothing* and I repeat ***nothing*** works.  In this situation, you really want to bring another set of eyes to bear on the problem.

I'm in the process of bringing a new Rails powered application online and I discovered around 3:53 am this morning that login, which works perfectly in development, completely fails in production with the wonderfully helpful error message:

> Rails 5 ActionController::InvalidAuthenticityToken error

When I dug into it, I saw that was a CSRF error and, oddly, I was getting a 422 error message returned to me.  

The mystery of all this was that this wasn't new login code -- it was code that I've been using in another application for months and it has been flawless.

Here are just a few of the things that I tried to address this:

* Switch from Rails 5.1.x back to 5.0.x
* Investigate the prepend: true approach to protect_from_forgery ([StackOverflow](http://www.stackoverflow.com/questions/38331496))
* Rewrite most of application_controller.rb
* Massively hack around in the guts of AuthLogic
* Google
* Stack Overflow
* Run production locally
* change, deploy, test, change again, Lather, Rinse Repeat N times where N is > 10 and less than 50

Once I exhausted all these possibilities, I reached out to a [friend](http://www.nickjanetakis.com/) and he and I paired on it.  And that's where the power of pair programming really illustrated itself.  We fairly quickly discovered that the issue was that session_store.rb didn't match the production domain.  I find it unbelievable that the error message wasn't actually useful but since I've been guilty of that sin more than a few times, well, karma I guess.  

Documented here for the next time that I hit this (in the spirit of being a good Internet citizen, I did add it to the Stack Overflow as well).
