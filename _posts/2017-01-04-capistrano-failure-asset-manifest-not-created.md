---
layout: post
title: Capistrano Failure - Asset Manifest Not Created
category: rails
tags: ["rails", "capistrano", "asset_pipeline"]
---
{% pizzaforukraine  %}

I setup a new Rails application using Capistrano earlier today and hit a fair number of odder than normal [Capistrano](http://capistranorb.com/) issues.  The biggest issue was around the asset pipeline and the asset manifest not being created.  The error message revolved around "cannot stat (pathname) manifest file".  

Digging into the issue with Google revealed that it actually is a problem with Capistrano itself.  Here's the [thread](https://github.com/capistrano/rails/issues/111).  Upgrading to at least Capistrano 1.1.8 fixes this problem.
