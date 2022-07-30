---
layout: post
title: Using redis-cli on An Encrypted AWS Redis Server
category: redis
tags: ["redis", "aws"]
---
{% pizzaforukraine  %}

So I find myself needing to use [redis-cli](https://redis.io/topics/rediscli) to modify the keys on a running Redis instance to deal with a few [Sidekiq issues](https://github.com/mperham/sidekiq/blob/master/Changes.md#413).  And, much to my surprise, I can't simply connect to it and make changes because I keep getting **Error: Connection reset by peer** errors.  A bit of a deep dive taught me this:

* Our redis instance is encrypted both at rest and in transit
* The way to do this is to connect to it via stunnel which builds a secure tunnel
* You have to supply the password on the command line to redis-cli; this surprised me because it leaves the password in the shell history and that's fscking awful for security; grumble, grumble, grumble

Here are some references that I followed:

* [AWS Docs](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/in-transit-encryption.html)
* [Data Next Docs](https://datanextsolutions.com/blog/how-to-fix-redis-cli-error-connection-reset-by-peer/)

Here are the steps I followed:

1.  I started by installing stunnnel.
2.  I continued by building a mapping for stunnel to the redis server I wanted to mess with.  This required getting the redis server url from our application's settings.
3.  Start the tunnel
4.  Verify that the tunnel is running.
5.  I connected to redis-cli passing the -a password option.
6.  I was able to then verify that redis-cli works correctly by doing a simple set / get:

    set a "hello"
    get a
    
    "hello"
    
And this positioned me for being able to run a redis-cli keys command.  Of course the keys routine I needed to run was error full but that's another story ...