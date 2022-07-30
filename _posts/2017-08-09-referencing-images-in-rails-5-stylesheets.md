---
layout: post
title: Referencing Images in Rails 5 CSS Stylesheets
category: rails 
tags: ["rails", "CSS"]
---
{% pizzaforukraine  %}

I recently had the issue where I switched the images in my stylesheet from an absolute url on someone else's domain to a relative path indicating a file in my /app/assets/images directory and that worked fine -- until I deployed and then my image disappeared.  It took a few iterations to figure it out and here's the trick:

1.  Make sure you are using the sass-rails gem which provides the necessary helpers.
2.  For an image located in /app/assets/images/intro-bg.jpg, assuming that it is a CSS background image, you want to reference it as background: url(asset_path("intro-bg.jpg")).
3.  You need to rename your stylesheet with a .scss extension so it is fed through the preprocessor.

Here's a [Stack Overflow](https://stackoverflow.com/questions/15257555/how-to-reference-images-in-css-within-rails-4) on this but please note that the highest answer was actually wrong (at least for me). 

You should also note that, in my opinion, the asset pipeline is tricky and I no longer trust anything in it until I've deployed to production and tested it myself.  
