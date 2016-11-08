---
layout: post
title: When Bundler Insists On Putting Gems into vendor/cache
category: rails
tags: ["rails", "ruby", "bundler", "gem"]
---
If you've ever find that Bundler insists on putting gems in vendor/cache and you can't make it stop, check the .bundle/config file and you will find a directive that was written there as a result of a bundle install --path vendor/bundle command you did *previously*.  Once you execute this command, bundler will write gems to this directory forever more unless you delete the directive.  This can be maddening as .bundle/config isn't a file that many of us look at.

Notes:

* [Bundler Reference](http://bundler.io/v1.2/bundle_install.html)
* Thanks to [Dv](http://www.dasari.me) who pitched in on this on a busy Sunday morning

