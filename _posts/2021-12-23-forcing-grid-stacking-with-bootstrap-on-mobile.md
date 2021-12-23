---
layout: post
title: Forcing Grid Stacking with Bootstrap on Mobile
date: 2021-12-23 12:33 -0500
category: bootstrap
tags: ["bootstrap"]
---
I recently had the situation where a Bootstrap application:

* Worked perfectly on a desktop with a side by side layout
* Properly wrapped on desktop when the window was resized down to a mobile like form factor
* Failed to ever wrap on mobile showing just a smaller version of the desktop

I puzzled over this quite a bit until I ran a google search for "bootstrap text too small on mobile" which led me to this directive:

    <meta name="viewport" content="width=device-width, initial-scale=1">
    
This needs to be inserted into your html head element and then, like magic, made everything format perfectly on mobile.