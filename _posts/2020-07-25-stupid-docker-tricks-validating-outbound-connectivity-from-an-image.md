---
layout: post
title: Stupid Docker Tricks - Validating Outbound Connectivity from an Image
category: docker
tags: ["docker"]
---
I recently had the odd situation where it seemed like I had outbound Internet connectivity issues under Ruby powered by Docker but not with Python powered by Docker.

Here's how I disproved this:

    docker run -it ruby:2.7.1 ping google.com
    64 bytes from ord30s26-in-f238.1e100.net (216.58.192.238): icmp_seq=1 ttl=37 time=15.2 ms
    64 bytes from ord30s26-in-f238.1e100.net (216.58.192.238): icmp_seq=2 ttl=37 time=15.5 ms

and 

    docker run -it python:3.7.2 ping google.com
    64 bytes from ord30s26-in-f238.1e100.net (216.58.192.238): icmp_seq=1 ttl=37 time=21.9 ms
    64 bytes from ord30s26-in-f238.1e100.net (216.58.192.238): icmp_seq=2 ttl=37 time=31.3 ms

The docker run command starts up an image.  The -it option opens an interactive terminal underneath it and giving it a command like 'ping google.com' runs that in the terminal.

One of the things that this Docker trick makes exceptionally easy is testing different versions of languages.  Here's an example for Ruby:

    docker run -it ruby:2.7.1 /bin/bash
    root@4460a9daddff:/# ruby --version
    ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
    root@4460a9daddff:/# irb
    irb(main):001:0> puts "Hello World"
    Hello World
    => nil
    irb(main):002:0>

And for Python:

    docker run -it python:3.7.2 /bin/bash
    root@3fe135f566bb:/# python --version
    Python 3.7.2
    root@3fe135f566bb:/# python
    Python 3.7.2 (default, Mar 27 2019, 08:41:08) 
    [GCC 6.3.0 20170516] on linux
    Type "help", "copyright", "credits" or "license" for more information.
    >>> print("Hello World")
    Hello World
    >>> 


Credit for this goes to my friend and Docker Guru / Docker Captain, [Nick Janetakis](https://nickjanetakis.com/).  Nick teaches Docker online and I highly recommend his stuff.
