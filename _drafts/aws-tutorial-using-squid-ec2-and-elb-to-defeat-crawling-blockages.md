---
layout: post
title: AWS Tutorial - Using Squid, EC2 and ELB to Defeat Crawling Blockages
---
I write crawlers.  I have crawlers for years.  And I **hate** beyond **hate** when companies throw up roadblocks to defeat crawlers.  As a general rule of thumb the big Internet companies tend to be the worst at this -- they, who shall be unnamed, love information to be "free" but they hate like hell to themselves be indexed.  

Well, in the age of the cloud, crawling blockages can be really, really easy to defeat.  In this tutorial I'm going to show you how.

# Proxying

The core technology to defeat blockages is simple -- you use a proxy server.  Let's say that you have a server on this ip address:

    24.36.48.19

If someone wants to block your crawler all they need to do is place a block on that ip address by any number of means - code, router level, firewall level, etc and your code can't actually access the data.  A proxy server sits in between your code and the data you want to access.  Here's a ruby example using Mechanize:

    agent = Mechanize.new
    url = "http://www.google.com/"
    proxy_server_url = "proxy.foo.com"
    proxy_server_port = 3199    
    agent.set_proxy(proxy_server_url, proxy_server_port)
    page = agent.get(url)
    
That will cause the request to be through the proxy server and NOT from your actual server.  Given that a proxy server can be blocked as easily as your actual server this may not seem all that significant -- but think of this in terms of a cloud computing environment like AWS: 

* In aws you can create instances trivially with tools like ansible
* In aws you can automatically / automagically install a full featured proxy server like squid with one command
* In aws you can front end a cluster of proxy server instances behind an elastic load balancer allowing your software to simply access the load balancer and then the proxy servers can be dynamically replaced either when they are blocked or perhaps proactively every single day
    
# Squid

Squid is the proxy server we're going to be using.  Squid is an old school Internet tool -- I remember experimenting with it back in maybe 2002 although that seems impossible but it actually isn't since it is cited in papers going back to [1995](https://en.wikipedia.org/wiki/Squid_(software)).  We're going to need to use the 3.5 or later version of Squid since we need support for what is called ProxyPass which is what lets a proxy transaction travel through a load balancer.

If you're uncertain about the installed version of Squid then run this:

    /usr/sbin/squid -v

Thanks to [Mamchenkov](http://mamchenkov.net/wordpress/2004/03/23/how-to-check-squid-proxy-server-version-on-a-linux-system/). 

Troubleshooting an ELB in Front of an EC2 Running Squid

1.  Create the proxy programmatically using proxy protocoal
2.  Squid has to be 3.5 or later
3.  Make sure that the ec2 has the proxy port open in its security group

ec2 has a sec group
lb has a security group 

make sure the ports are sync'd

# Architecture

We're going to need the following architecture bits:

* an elastic load balancer
* 1 or more EC2 instances that run squid

# Ansibling This All Together

# Be Careful - Bandwidth Bills Are Real