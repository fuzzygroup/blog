---
layout: post
title: A Poor Man's Load Balancer
category: aws
tags: ["aws", "proxy", "load_balancer", "ruby"]
---
So I've spent the last few days dealing with proxy servers and trying to get a group of AWS instances, all running squid, to hide behind a load balancer.  And, alas, this seems to not be possible with AWS.  There are two basic issues:

* The proxy protocol header cannot be enabled via the AWS Console; why I do not know.  You have to script it and even though I did it, it does not seem to work.  [AWS Docs](http://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-proxy-protocol.html)
* The proxy request doesn't seem to get to squid -- at least based on the squid log files.  

The situation is that a number of my IP addresses seem to have been dropped on a perma-ban list.  You can get around this a number of ways but one of the easier ones is to use a proxy server in between your content fetch and the content source.  Most of my content fetching software relies on the [Ruby Mechanize library](https://github.com/sparklemotion/mechanize) so all I have to do is:

    agent = Mechanize.new
    agent.set_proxy(proxy_url, proxy_port)
    page = agent.get(url)

And that will cause the fetch to go thru the proxy server first and then to the content source.  This nicely gets around the block at the expense of some performance due to the proxying.  

The reason for wanting a load balancer in the mix is to:

* Eliminate the need for a giant box as the proxy server; more, cheaper nodes is a better model, more amenable to the cloud.
* Provide more discrete ip addresses involved the proxying so we don't appear to have a single ip address doing everything

If the AWS load balancer doesn't work then there are options.  One option is to get up HA Proxy once again.  I've done this time and time again and it usually works at the expense of configuration woes and a moderate level of cursing. Not sailor cursing mind you and certainly not "The Tree House Fell On Me Again" level of cursing.  But after you've put together a load balancer with the AWS Console web forms, you don't ever want to use HA Proxy again.  

And this brings us to the title of this article - a **poor man's load balancer**.  Here's how we go about this:

* Have a list of proxy server urls in a config file 
* A routine which loads the urls into an array and returns a random element i.e. calling .sample.
* Pass that random proxy server into the create mechanize routine 

And that's what I'm now using.  This is by no means the degree of elegance that I was looking for but sometimes you don't always get what you want -- but you still have to get the job done.  
