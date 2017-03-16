---
layout: post
title: When Your Font Awesome Etsy Icon Doesn't Display
category: css
tags: ["css", "fontawesome"]
description: If you are having problems with Font Awesome icons displaying then try replacing your Font Awesome Rails gem with the Font Awesome CDN.
---
I'm a fan of [Font Awesome](http://fontawesome.io/) and I think enough of it that it was actually the **first** bit of software I purchased for use on my side project.  

I recently had the situation where most of my Font Awesome icons would show up but a few wouldn't.  I knew it wasn't a layout problem because the code was all machine generated and the Amazon icon was showing up just a few lines earlier.  An example of an icon which wouldn't show up is the Etsy icon.

As with almost all my crazy CSS / Bootstrap issues, I reached out to my buddy [Dv](http://dasari.me/) and a quick pairing session set it right.  The first solution we found was to add the following snippet to custom.scss in /app/assets/stylesheets:

    .fa-etsy:before {
      content: "\0045"
      font-family: georgia, serif
    }

And that fixed the Etsy icon -- but it was really a work around and the credit goes to [Hayley.cc](https://hayley.cc/2016/10/05/Font-Awesome-No-Etsy-icon-No-problem/) (brilliant but still a work around).  But only fixing the Etsy icon clearly wasn't enough.

Dv did some digging and came up with the thesis that the [font-awesome-rails gem](https://github.com/bokmann/font-awesome-rails) wasn't up to date and suggested I replace it with the CDN.  So by adding this:

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    
The problem was entirely fixed.  Given the problems with CloudBleed, a month ago, I'm mildly paranoid with a CDN but this did simply and brilliantly fix the problem.

Thank you Dv!