---
layout: post
title: So That One Time You Played with Docker
 for hte 

So that one time, at band camp -- wait; wrong movie, this is a technical blog post about Docker ...

I recently helped a friend doing some federal work in the medical field get a better understanding of Docker and how Docker can mess about with open source licensing.  We got up a "open source" stack of tooling using a bunch of heavy weight tools:

* Mongo
* Memcached
* A big Python app
* Rabbit MQ

And then, as you so often do, we finished up and I got distracted by the next bit of crazy nerd-fu that runs about in my life (server down; wifi crisis; son needing help with his PC; who can remember) and then I went back to my desk, closed my terminal prompt and never thought much more about this.

Lately I've been noticing some slowness on my machine and I just happened to run **docker ps** and what do I see but:

    docker ps
    CONTAINER ID        IMAGE                         COMMAND                  CREATED             STATUS              PORTS                                                 NAMES
    b93fbedc58d2        data_streamer_to_sqs_ruby     "ruby ./main.rb"         29 seconds ago      Up 27 seconds                                                             nice_torvalds
    605da7fe5159        dsarchive/dsa_girder:latest   "/bin/sh -c 'sudo -E…"   2 weeks ago         Up 3 hours          0.0.0.0:8080->8080/tcp                                dsa_girder
    0b0eb7730fb0        dsarchive/dsa_worker:latest   "/bin/sh -c 'sudo -E…"   2 weeks ago         Up 3 hours                                                                dsa_worker
    df6fd902c11b        memcached:latest              "docker-entrypoint.s…"   2 weeks ago         Up 3 hours          11211/tcp                                             dsa_memcached
    dc7f57778b4e        mongo:latest                  "docker-entrypoint.s…"   2 weeks ago         Up 3 hours          27017/tcp                                             dsa_mongodb
    863768f4f33f        rabbitmq:management           "docker-entrypoint.s…"   2 weeks ago         Up 3 hours          4369/tcp, 5671-5672/tcp, 15671-15672/tcp, 25672/tcp   dsa_rabbitmq
    
Yep.  That's the whole set of processes that I was using for my federal friend.  Sigh.  They've been happily sucking up CPU for more than 2 weeks.  **grumble**

The solution:

    docker stop 863768f4f33f dc7f57778b4e df6fd902c11b 0b0eb7730fb0 605da7fe5159