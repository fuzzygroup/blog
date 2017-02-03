---
layout: post
title: Redirecting HTTP to HTTPS with AWS and ELB
category: aws
tags: ["aws", "apache", "elb", "http", "https"]
---
<p style="text-align:center">A Tale of Four Redirects</p>

Every technologist worth his or her salt has an internal list of "most hated technologies".  These are the things that no matter what they do always, always give them trouble.  Whether its because the technology in question is actually hard, a mental block or just plain 'ol bad luck, we all have them.  For me it is always, always [mod_rewrite](http://httpd.apache.org/docs/current/mod/mod_rewrite.html).  [Apache's](http://httpd.apache.org/) mod_rewrite is just plain magic -- when it works (and it can always be made to work), it does in place url transformations that let you change your entire technology stack but let Google keep on serving those old urls.  It really is outstanding.  But Great Ghu does it ever give me trouble at times.

The situation in question was that I had a client with Rails being served by Apache / [Passenger](https://www.phusionpassenger.com/) (my very **favorite** Rails deployment tool) and the client wanted, correctly, to convert all http based url requests to https.  Here's the transition of the redirects one by one

# Important - Remove AllowOverride all from Your Apache Conf File

I can't stress this enough.  The Apache directive **AllowOverride all** means that redirects will not work.  Honestly I don't even understand what AllowOverride all even does but I did confirm, experimentally, that if you have this, redirects simply will not work.  So make sure that you've got this turned off.

# Redirect 1

Here was my first attempt:

    RewriteEngine On
    RewriteCond %{HTTPS} off
    RewriteRule ^ https://%{HTTP_HOST}%{REQUEST_URI}
    
This would actually work but our Apache isn't actually serving https at all.  When you use an AWS ELB (Elastic Load Balancer) in conjunction with the ACM (AWS Certificate Manager) then your web server talks http on port 80 and the ELB acts as an intermediary translating it to and from https.  If you're lucky with this redirect then your site may, possibly work.  If you're unlucky then you'll get stuck in an infinite loop of http to https to http and so on.  

# Redirect 2

My second attempt actually came straight from the [AWS docs](https://aws.amazon.com/premiumsupport/knowledge-center/redirect-http-https-elb/) and it is **flat out wrong**.

    RewriteEngine On
    RewriteCond %{HTTP:X-Forwarded-Proto} =http
    RewriteRule . https://%{HTTP:Host}%{REQUEST_URI} [L,R=permanent]
    
The problem here is that the 301 redirect which this is generating causes the ELB health check to go poorly and your site is declared offline at which point no traffic gets to it.  This can be very annoying to troubleshoot but you should watch for back end not available messages.

# Redirect 3

On an [AWS forum thread](https://forums.aws.amazon.com/thread.jspa?messageID=745509) I found this redirect which an AWS engineer contributed and claimed would work.  Again it is **flat out wrong**.

    RewriteEngine on
    RewriteCond %{HTTP:X-Forwarded-Proto} !https
    RewriteRule .* https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]
    
This causes the same health check problem as #2.

# Redirect 4 - The Working One

If you read support forum threads *closely* and **well** then you often, always near the end, find the right answer.  Here's the redirect that worked for me:

    # the final correct redirect
    RewriteEngine on
    RewriteCond %{HTTP:X-Forwarded-Proto} ^http$
    RewriteRule .* https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]
    
This is from the same thread above (#3).  You'll notice that #2, #3 and #4 all rely on the HTTP:X-Forwarded-Proto http header feature - this prevents problems with the ELB.  The description that the author gave is interesting:

> The Apache block (#2) above caused our ELB health check to fail from the HTTP 301 response. To allow this and other local requests over HTTP while redirecting external requests through the ELB to HTTPS, adjust the rewrite condition to match on http instead of a negative match on https:  

This solution was contributed by [holeinonenv](https://forums.aws.amazon.com/profile.jspa?userID=342382) and, sir, I owe you a beer.  Thank you for your help. It is the only thing he's ever posted on the AWS forums and man am I glad he posted it.