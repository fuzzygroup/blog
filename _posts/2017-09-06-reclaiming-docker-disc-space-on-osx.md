---
layout: post
title: Reclaiming Docker Disc Space on OSX
category: docker
tags: ["docker", "osx", "mac"]
description: Docker on OSX can consume lots and lots of disc space.  Here's how to identify it and reclaim it safely.
---
A few nights ago, after a truly horrible night's sleep complete with my first ever incidence of acid reflux, I woke to find my Mac nattering at me about being **out of disc space**.  And by out of disc space I mean that I was down to about 3 gigs out of a terabyte sized SSD.  Yikes!

Taking a look at the normal culprits yielded no surprise increases and I can distinctly recall having in excess of 30 gigs just a day or two ago.  Given all the [server side problems with respect to Docker and disc space](http://fuzzyblog.io/blog/docker/2017/08/30/running-out-of-disc-space-with-docker.html) that I have written about previously, I had a strong hunch that somehow Docker was involved.

# Logs

My first thought was that perhaps Docker logs are huge.  On OSX, Docker logs are stored here:

> ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/log

But a quick:

    09:41 $ du -shc ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/log
     20K	/Users/sjohnson/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/log
     20K	total
     
Nope -- clearly 20K isn't anything for disc space usage.

# Containers

My next thought was that perhaps Docker has some massive backing store for containers.  I did a bunch of searches and ran across this [Docker thread](https://forums.docker.com/t/consistently-out-of-disk-space-in-docker-beta/9438/67
) and then [another thread](https://forums.docker.com/t/consistently-out-of-disk-space-in-docker-beta/9438/36), both of which pointed me to the Docker.qcow2 file.  

Here's what a du -shc showed me on this file:

    du -shc     ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
     57G	/Users/sjohnson/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
     57G	total

# Futile Attempts to Reclaim Space

I tried the normal things like:

> docker system prune
 
And when that failed, I tried a bash based approach: 

    #!/bin/bash
    for item in $(docker ps -aq); do
    docker stop $item
    docker rm $item
    done

    for item in $(docker images --filter dangling=true -q); do
    docker rmi $item
    done

But even after both of these, I still had:
    
    du -shc     ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
     57G	total
    
# My Solution

Here was the approach that I used:

1. Quit Docker for Mac entirely.
2. rm /Users/sjohnson/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2  
3. As best as I can tell this is actually safe because containers can always be rebuilt.
4. Restart Docker
5. Verify space usage:   

  du -shc     ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
  1.3G total

I then built a container and then reverified disc space usage.

    du -shc     ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
    1.3G	total

I then built some more containers and then checked disc space usage:

    du -shc     ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
    3.0G	total

I then started my overall "build all containers" shell script and tracked progress as it went:

    du -shc     ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
    3.0G	total

    09:58 $ du -shc     ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
    3.1G	total

    du -shc     ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
    3.4G    total

    du -shc     ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
    5.4G    total

By the time all containers were built:
 
    du -shc     ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
    7.2G    /Users/sjohnson/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2

And now, several days later and even more deploys, it has increased again:

    du -shc     ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
    8.2G	/Users/sjohnson/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
    8.2G	total

# Read More
* [Great Docker Thread about Disc Space Usage](https://forums.docker.com/t/consistently-out-of-disk-space-in-docker-beta/9438/67)
* [Docker Thread about Disc Space](https://forums.docker.com/t/where-does-docker-keep-images-containers-so-i-can-better-track-my-disk-usage/8370)

