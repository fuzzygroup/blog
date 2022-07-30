---
layout: post
title: Reversing CSS Minification
category: css
tags: ["css", "hyde"]
description: Use a CSS reverse minifier to make understanding someone else's CSS actually possible.
image: http://fuzzyblog/io/blog/assets/css_reverse_minifier.png
---
{% pizzaforukraine  %}

For the first time in a very, very long time, I find myself actually writing a somewhat "modern" web app.  By which I mean that it has to use CSS and use it both well and effectively.  I am essentially a back end developer wandering around a series of increasingly complex front end tasks.  As with all web development one of the keys is looking at the source i.e. *Use the source Luke*.  The problem with looking at the CSS source is that generally CSS content is minified which means that all line breaks, extra spacing and such are removed rendering it hard, hard, hard to understand.  

The trick here is to reverse the minification.  Here are a few tools:

* [Web Based Reverse Minifier](http://mrcoles.com/blog/css-unminify/)
* [Visual Studio Code Plugin](
https://marketplace.visualstudio.com/items?itemName=HookyQR.beautify)

The easiest one to use is the web based tool for Mr. Coles.  Just paste your CSS into a text box on the web page and click a form button.  Here's a screenshot:

![css_reverse_minifier.png](/blog/assets/css_reverse_minifier.png)

A virtual hat tip to [Nick](http://nickjanetakis.com/blog/) who found these for me.  Thanks man!

One general note about reverse engineering CSS is that its actually pretty **hard**.  I was looking for examples of good looking page footers and the one I found was, well, mind bending in its complexity.  I then simply googled for [bootstrap footer](https://www.google.com/search?tbs=li:1&q=bootstrap+footer) and found [bootsnipp.com](http://www.bootsnipp.com/) where I found this [footer](http://bootsnipp.com/snippets/1KEEq) which was perfectly designed for use as a template.  

I still think reversing CSS minification is useful but finding things designed to be used as templates is perhaps more useful.
