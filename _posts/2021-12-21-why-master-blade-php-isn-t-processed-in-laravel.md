---
layout: post
title: Why master.blade.php Isn't Processed in Laravel
date: 2021-12-21 20:17 -0500
category: laravel
tags: ["laravel", "php"]
---
I had the situation earlier where commands like:

    @extends('layouts.master')
    @section('title', 'Order Submitter LegendBorne Products')
    @section('content')
    
in my template weren't being processed and this led me to do the normal bit of Google fu, alas, to no avail.  And then I looked at the name of my template:

    order_submitter_index.php
    
Yes -- that's right.  I was missing the .blade. suffix so a quick rename to:

    order_submitter_index.blade.php
    
And all worked perfectly.