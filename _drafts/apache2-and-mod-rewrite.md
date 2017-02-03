---
layout: post
title: Apache2 and Mod Rewrite and Automatic Redirect to https
category: apache
tags: ["apache", "mod_rewrite"]
---
Note: If you're using AWS and an Elastic Load Balancer (ELB) this is actually tricky and will not work.  I'll document that shortly.

With Lets Encrypt making https actually free for the first time, there is a greater desire to use SSL than there used to be.  This blog post explains how to enable / disable the mod_rewrite aspect of Apache and also defines a simple rule for transforming all inbound requests to https from http:

To enable mod_rewrite:

> a2enmod rewrite

To disable mod_rewrite:

> a2dismod rewrite

A simple rule to transform http to https:

    RewriteEngine On
    RewriteCond %{HTTPS} off
    RewriteRule ^ https://%{HTTP_HOST}%{REQUEST_URI}
    
That needs to go into your vhost configuration.  After that you need to restart apache:

> service apache2 restart

To test your side after, assuming url foo.bar.com:

> wget https://foo.bar.com/

-or-

> curl -v http://foo.bar.com

I always **strongly recommend** testing this kind of change with wget or curl because then you actually see the http header values.  Here's an example showing the http to https auto redirect with wget:

    wget http://foo.bar.com/
    --2017-02-03 15:06:25--  http://foo.bar.com/
    Resolving foo.bar.com... 23.23.164.47, 54.225.218.129, 2406:da00:ff00::36e1:da81, ...
    Connecting to foo.bar.com|23.23.164.47|:80... connected.
    HTTP request sent, awaiting response... 301 Moved Permanently
    **Location: https://foo.bar.com/ [following]**
    --2017-02-03 15:06:25--  https://foo.bar.com/
    Connecting to foo.bar.com|23.23.164.47|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 2083 (2.0K) [text/html]
    Saving to: 'index.html.12'

References:

* [Stack Overflow with different mod_rewrite rules](http://stackoverflow.com/questions/869092/how-to-enable-mod-rewrite-for-apache-2-2)
* [Good Blog Post](http://james.lin.net.nz/2010/07/28/ubuntu-apache-enabledisable-modrewrite/)