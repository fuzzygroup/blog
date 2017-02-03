---
layout: post
title: Apache2 and Mod Rewrite and Automatic Redirect to https
category: apache
tags: ["apache", "mod_rewrite"]
---
**Note:** If you're using AWS and an Elastic Load Balancer (ELB) this is actually tricky and will not work.  I documented that process in my [AWS Redirection](http://fuzzyblog.io/blog/aws/2017/02/03/redirecting-http-to-https-with-aws-and-elb.html) post.

**Note:** You'll need to use sudo for almost all the commands here.  Keep that in mind.

With Lets Encrypt making https actually free for the first time, there is a greater desire to use SSL than there used to be.  This blog post explains how to enable / disable the mod_rewrite aspect of Apache and also defines a simple rule for transforming all inbound requests to https from http:

To enable mod_rewrite:

> a2enmod rewrite

Here's a [Stack Overflow on enabling mod_rewrite](http://stackoverflow.com/questions/869092/how-to-enable-mod-rewrite-for-apache-2-2).

To disable mod_rewrite:

> a2dismod rewrite

The a2dismod is something I've never seen before.  Thanks to [James Lin](http://james.lin.net.nz/2010/07/28/ubuntu-apache-enabledisable-modrewrite/) who wrote about it on his blog.

A simple rule to transform http to https:

    RewriteEngine On
    RewriteCond %{HTTPS} off
    RewriteRule ^ https://%{HTTP_HOST}%{REQUEST_URI}
    
Here's the [Stack Overflow](http://stackoverflow.com/questions/16200501/http-to-https-apache-redirection) where I got this redirect from.
    
That needs to go into your vhost configuration.  After that you need to restart apache:

> service apache2 restart

**Note:** I can’t stress this enough. The Apache directive AllowOverride all means that redirects will not work. Honestly I don’t even understand what AllowOverride all even does but I did confirm, experimentally, that if you have this, redirects simply will not work. So make sure that you’ve got this turned off.

To test your side after, assuming url foo.bar.com:

> wget https://foo.bar.com/

-or-

> curl -v http://foo.bar.com

Here's a [Stack Overflow](http://stackoverflow.com/questions/3252851/how-to-display-request-headers-with-command-line-curl) on curl and request headers that was helpful.

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
