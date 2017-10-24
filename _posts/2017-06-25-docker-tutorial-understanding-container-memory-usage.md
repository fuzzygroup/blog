---
layout: post
title: Docker Tutorial Understanding Container Memory Usage
category: docker
tags: ["docker"]
description: While we might like to pretend that containers isolate us from low level details like memory usage, you still need to understand it.  Here I explain docker stats and give a shell script for an easy to use tool for viewing container memory stats.
---
I know that it might seem like in 2017, in our new container centric world, that understanding memory usage on a per container basis isn't all that necessary but my recent experiences with my side project are, sorely, disagreeing with that.

I'm developing a SAAS product where I've firmly and irrevocably broken the traditional Rails monolithic development model.  So rather than have one giant Rails app, I have multiple Rails apps -- the promotional website, the crawler, the admin tool and so on.  .  My current deployment model is Docker containers and each Rails app is represented by a container stack.  For cost reasons I want to use resources efficiently allowing multiple container stacks to exist on the same host.  This requires understanding our low level memory usage so here goes...

Note: All of this is being done on AWS under Ubuntu 16.04 using docker-compose 1.8

# Box Level Memory

Use free -m to find out the current memory status of your box:

> free -m

                  total        used        free      shared  buff/cache   available
    Mem:           1998        1163          90          22         743         554
    Swap:             0           0           0

# Docker Container Memory

Use docker stats to get the low level container memory usage:

> docker stats

    CONTAINER           CPU %               MEM USAGE / LIMIT       MEM %               NET I/O             BLOCK I/O           PIDS
    a5251659f7c9        0.23%               15.29 MiB / 1.952 GiB   0.76%               35.5 MB / 20.3 MB   1.35 MB / 40.5 MB   3
    59ce2ad1dc64        0.01%               257.8 MiB / 1.952 GiB   12.90%              25.6 MB / 33.9 MB   143 kB / 0 B        6
    b4aaa4c36791        64.55%              237 MiB / 1.952 GiB     11.86%              639 MB / 115 MB     3.39 MB / 4.1 kB    14
    a7c039f80931        0.00%               199.8 MiB / 1.952 GiB   10.00%              152 kB / 1.22 MB    1.2 MB / 0 B        23
    ee27a6e37fef        0.00%               131.4 MiB / 1.952 GiB   6.57%               1.22 MB / 2.33 MB   26.9 MB / 0 B       6
    07d5252abf5f        0.00%               196.6 MiB / 1.952 GiB   9.84%               127 kB / 689 kB     1.63 MB / 0 B       23
    4aa705c8cf4b        0.07%               6.234 MiB / 1.952 GiB   0.31%               9.11 kB / 1.94 kB   0 B / 0 B           3
    78f495fcf733        0.06%               6.922 MiB / 1.952 GiB   0.35%               145 MB / 91.1 MB    766 kB / 2.97 MB    3
    
If you wanted to reduce the amount of output to the bare essentials then try:

> docker stats --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}"

    CONTAINER           CPU %               MEM USAGE / LIMIT
    a5251659f7c9        0.10%               15.29 MiB / 1.952 GiB
    59ce2ad1dc64        0.01%               239.1 MiB / 1.952 GiB
    b4aaa4c36791        21.33%              478.5 MiB / 1.952 GiB
    a7c039f80931        0.01%               251.1 MiB / 1.952 GiB
    ee27a6e37fef        0.00%               109 MiB / 1.952 GiB
    07d5252abf5f        0.00%               250.9 MiB / 1.952 GiB
    4aa705c8cf4b        0.05%               6.234 MiB / 1.952 GiB
    78f495fcf733        0.05%               6.664 MiB / 1.952 GiB

Now the clear and obvious problem here is that a5251659f7c9 or 59ce2ad1dc64 mean **absolutely nothing** to us.
# But What is a5251659f7c9 or Understanding Docker Process IDs?

The a5251659f7c9 is a Docker process id and you need to grep the docker process list to find out.  Docker process ids change with every single container  deploy so you always have to look them up with the *docker ps* command.

    docker ps | grep a5251659f7c9
    a5251659f7c9        redis:3.2-alpine  "docker-entrypoint..."   27 minutes ago      Up 27 minutes       0.0.0.0:32771->6379/tcp   seiracrawler_redis_1
    
So the way to interpret all this is the docker container with process id a5251659f7c9 corresponds to the named container seiracrawler_redis_1 and is using 15.29 mb RAM and 0.23% CPU.

# Putting it All Together - dockerstats

If you're thinking that this two step process, well, **sucks**, yep.  I took a pass at cleaning this up into a single shell script but I found my bash skills, sadly weren't up to it.  Happily I did additional research and managed to put this together from some things I found on the web:

    #!/bin/bash
    docker stats --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}" $(docker ps|grep -v "NAMES"|awk '{ print $NF }'|tr "\n" " ")

If you put this into a shell script named dockerstats and then make it executable with:

> chmod +x dockerstats

then you'll have a single shell script that produces this:

    CONTAINER                                            CPU %               MEM USAGE / LIMIT
    seiracrawler_redis_1                                 0.12%               15.29 MiB / 1.952 GiB
    seiracrawler_rake_1                                  0.01%               239.1 MiB / 1.952 GiB
    seiracrawler_sidekiq_1                               11.99%              480.5 MiB / 1.952 GiB
    seirawatchsite_web.2.3x1bx3ji93hueuidv4dgfeab3       0.00%               251.1 MiB / 1.952 GiB
    seirawatchsite_sidekiq.1.8nxcvjx353725lsv70h72mzup   0.10%               109 MiB / 1.952 GiB
    seirawatchsite_web.1.rxbzptnfuopfauqwjf4ib4bjr       0.01%               250.9 MiB / 1.952 GiB
    seiraadmin_redis.1.ws2hc37dihkbh0cejk6z75140         0.06%               6.234 MiB / 1.952 GiB
    seirawatchsite_redis.1.siatex4zd6xezsevxfk4no98n     0.09%               6.664 MiB / 1.952 GiB

You'll seem some redundancy here because one my Docker installations on this particular box is using Docker Swarm (not recommended btw) and there are  replicas of some of the containers due to my swarm configuration.

Personally I think this functionality is important enough that I've added it to my deploy process on all my boxes running Docker and I'll recommend the same to all my clients.

If you just want the dockerstats shell script, here is a [gist with it](https://gist.github.com/fuzzygroup/e000a972a999b406a38557324e11d1c0).

# See Also

Extracting just a section of the Docker stats output came from the official Docker docs for [Docker Stats](https://docs.docker.com/engine/reference/commandline/stats/#formatting).  Feeding the output from Docker Stats to a docker ps grep statement came from a [github issue on moby](https://github.com/moby/moby/issues/10772).

