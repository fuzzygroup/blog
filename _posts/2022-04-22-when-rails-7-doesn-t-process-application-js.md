---
layout: post
title: When Rails 7 Doesn't Process application.js
date: 2022-04-22 18:28 -0400
category: rails
tags: ["rails"]
---
This is more than a mildly embarrassing post to have to write but it is an interesting example of how habits can bite you hard -- so, so hard.

I recently wanted to start on an application and actually be current on everything: Rails, Bootstrap, etc.  I have long admitted to having issues with respect to "modern" web development (specifically JavaScript / the asset pipeline) and I'm mildly starting to deal with those issues.  I began with a [BootrAils tutorial](https://www.bootrails.com/blog/rails-7-bootstrap-5-tutorial/) and started to work through it.

I got all the way to the end and I noticed that I simply could NOT get the popovers to work.  I don't claim to have a great understanding of the asset pipeline but I do know that it is a preprocessor that should get invoked on every page request.  I traced the problem back to application.js seemingly not getting processed (a view source didn't show it).  So, just to be sure, I added this to application
