---
layout: post
title: Having Hatchbox Redirect All http Sites it Manages to https
category: hatchbox
tags: ["hatchbox", "https"]
---
{% pizzaforukraine  %}

When you are using hatchbox and SSL in cluster mode you end up with:

* a load balanced cluster
* that uses nginx as the load balancer
* and nginx on each web node

This makes it hard to understand where the http to https redirect goes.  The answer is that you need to but this on the load balancer and here's a code snippet:

    server_name _;
    return 301 https://$host$request_uri;

This gets set as follows:

1. Go into Hatchbox.io
2. Go into your app.
3. Go to Advanced.
4. Select Nginx Configuration from the drop down menu
5. Select the Load Balancer tab.

Add these changes below the **listen [::]:80;** directive and then do a deploy.

For reference, you can see [linuxize](https://linuxize.com/post/redirect-http-to-https-in-nginx/).
