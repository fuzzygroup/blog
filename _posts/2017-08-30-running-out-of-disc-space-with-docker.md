---
layout: post
title: Running out of Disc Space with Docker
category: Docker
tags: ["docker", "aufs", "disc_space", "bloat"]
description: Docker has a tendency for its disc space usage to grow dramatically over time.  Here I discuss the issue and how to address it.
---
I've now been exploring [Docker](https://www.docker.com/) for almost a year now and using it daily for five months or so.  And, as I get ever closer to shipping a product that runs using containers for everything, I have been continually hitting issues regarding running out of disc space.  

# Understanding The Problem

The platform I have been using is:

* Docker Community Edition, Docker version 17.06.0-ce, build 02c1d87
* AWS EC2 instances including ELB
* No use of Kubernetes or the AWS ECS
* Ubuntu Linux
* Docker Hub for image hosting
* Rails / Ruby as an application language

What I have experienced is constant growth in disc space usage ultimately ending up in 0 bytes of free disc space and subsequent failure conditions in most of my containers.

# Docker on Linux Basics

On Ubuntu and most Linux platforms that I understand, the core Docker installation of your data is stored in /var/lib/docker and then a collection of subdirectories.  Here's an example:

    ls -l /var/lib/docker
    total 44
    drwx------ 21 root root  4096 Aug 30 01:17 containers
    drwx------  3 root root  4096 Aug 30 01:10 image
    drwxr-x---  3 root root  4096 Aug 30 01:10 network
    drwx------ 85 root root 12288 Aug 30 01:17 overlay2
    drwx------  4 root root  4096 Aug 30 01:10 plugins
    drwx------  2 root root  4096 Aug 30 01:10 swarm
    drwx------  2 root root  4096 Aug 30 01:16 tmp
    drwx------  2 root root  4096 Aug 30 01:10 trust
    drwx------ 12 root root  4096 Aug 30 03:01 volumes
    
There are two interesting directories here: containers and overlay2.  You should note that on a default docker installation the overlay2 directory would be named aufs.  The directories overlay2 and aufs are different filesystems that Docker can use to store your containers, volumes, etc.  The default Docker filesystem is called aufs and it is the oldest Docker filesystem.  The overlay2 filesystem is newer and seems to have some dramatic advantages.

I am currently involved in what is termed *green field* software development -- this is a development term related to creating a brand new product i.e. everything is a green field waiting to be plowed.  One of the characteristics of green field development is a **lot** of deploys.  As I initially looked into this problem, its characteristics seemed to map directly to the number of deploys -- more deploys meant more disc space used.  When you see this type of situation, it tends to argue that the underlying issue is somehow tied to garbage collection.  My research and analysis of this led me to think that the issue was somehow tied to issues in the Docker aufs filesystem and I switched my installation from aufs to overlay2 and thought it was resolved.

Last night I started getting alerts that my production server was again almost out of disc space (thank you [Monit!](https://github.com/arnaudsj/monit)).  Now the interesting thing is that between when I thought this was resolved and last night, I **have not been deploying at all**.  Over the past 5 days, I have been involved in an intense refactor of my new product's two core [god objects](https://en.wikipedia.org/wiki/God_object) - course.rb and teacher.rb.  In software development parlance, a god object is an object that knows too much or does too much and it is regarded as an [anti pattern](https://en.wikipedia.org/wiki/Anti-pattern).  When you do this type of refactoring, it tends to shut down everything since it breaks, well, **everything**.  Seeing that I was again running out of disc space -- while I wasn't deploying -- argued that my working theory was just plain **wrong**.

My next step was to ssh into the box (yes, even with a containerized architecture, there are still servers and sshing in is still a thing) and look into /var/lib/docker once again.  My general tool for this was the command du -shc *  which translates to "show me the disc space usage at a summary level and translate it to human style (i.e. k / megs / gigs)".  Here's an example of my command flow: 

    sudo su - 
    cd /var/lib/docker
    du -shc * 
    
    du -shc *
    10G	containers
    11M	image
    140K	network
    3.4G	overlay2
    20K	plugins
    4.0K	swarm
    4.0K	tmp
    4.0K	trust
    3.3M	volumes
    13.5G	total

I started to wonder what could possibly be in the containers directory with a size of **10G** so I changed into that directory and I found an anomaly, a single file, 6.2 gigs in size, like this:

    586e6e0b559281785d023097518ed9303e15db66eee04173792856ff7b2da528-json.log

When I looked at that file, it was a log file showing the log output from the underlying crawler at the coder of the product I have been building.  And with this one discovery, the problem came into focus:

1. While there may have been issues related to a constant ongoing deploy process, the core underlying issue seems to be disc usage due to log file build up.
2. Docker makes it very hard to see the underlying problem since there doesn't seem to be a "where is my damn disc space going" type of command.  Update: Try using "docker system df" to visualize docker disc space usage.  I only found this late in the writing process on this post.  The docker system df command doesn't specifically report log file space usage which I suspect would illuminate this problem.
3. Logs appear to be persistent over time and not reclaimed as you deploy.  My suspicion is that logs are only reset when you stop the Docker daemon (and sometimes not even then).
4. Traditional log management like log rotate won't work unless you restart the Docker daemon.
5. **Sidebar**: I wonder how many people that have struggled with this issue have actually had log file growth issues not actual Docker problems?  Most of the unresolved Docker / Moby issues below don't explore the logs possibility.  

It should be noted that I'm not logging to files from within my application code and I'm using the log to standard out approach from the [Orats gem](https://github.com/nickjj/orats).

# Fixing this Problem Once and For All

Here are the steps that I took to address this problem: 

## Step 1: Stop the Docker Daemon

The first step is shutting down Docker itself:

> sudo service docker stop

## Step 2: Delete /var/lib/docker 

The next step appears drastic and it is.  If you have important data in your Docker system then you're going to lose it at this stage but when I attempted to do this piecemeal, I got bizarre deployment errors related to missing containers and even redeploying did not fix it.

    sudo su
    umount /var/lib/docker/overlay2
    cd /var/lib/docker
    rm -rf * 

This blows away everything in your Docker installation.  The second command line is only necessary if you have already switched your system to overlay2 as I had.

## Step 3: Switch from aufs to overlay2 and Add Log Limits to Docker Config

**Note**: Full use of the overlay2 driver is covered [here](https://docs.docker.com/engine/userguide/storagedriver/overlayfs-driver/#configure-docker-with-the-overlay-or-overlay2-storage-driver) and should probably be read before you make this switch.  Not everyone can make use of overlay2.

The core docker config file is:

> /etc/docker/daemon.json

You should edit this file and make it look something like this:

    {
      "storage-driver": "overlay2",
      "log-driver": "json-file",
      "log-opts": {
        "max-size": "100m"
      }
    }



**Disclaimer**: I'm honestly not 100% certain that switching from aufs to overlay2 is absolutely required but it was a part of the overall solution and does seem to have benefits so I left it in here although I suspect that the logging is clearly the biggest win here.

## Step 4: Restart Docker Daemon

Start Docker up again:

> sudo service docker start

## Step 5: Add Logging Limits to Your Compose Files

On your local machine where you do your development, you need to set the logging options on a per container basis to your docker-compose file.  The lines to add are to each service are:

    logging:
      options:
        max-size: 50m

Here's an example in the context of a full container:

    services:
      redis:
        image: 'redis:3.2-alpine'
        ports:
          - '6379'
        volumes:
          - 'redis:/var/lib/redis/data'
        restart: on-failure
        logging:
          options:
            max-size: 50m

Theoretically I could have ignored this at a per container level and just relied on the log management defined in /etc/docker/daemon.json but when you have a system level config file, that often gets changed and not checked into version control, belt **and** suspenders is better.  Setting this at the application level and the system level should ensure that I don't get bit by this again.  This will also protect your local dev box from unlimited log growth which could otherwise be a problem since your local dev box isn't configured by the same /etc/docker/daemon.json file.

## Add Cron Jobs for Removing Unused Stuff Periodically

I added cron jobs to my underlying instance for cleaning up after dangling containers and volumes:

    #Ansible: docker rmi images
    1 1 * * * docker rmi -f $(docker images -a -q -f dangling=true)
    #Ansible: docker volume rm
    1 3 * * * docker volume rm -f $(docker volume ls -q -f dangling=true)

The #Ansible comment indicates that these were added by Ansible as part of my machine provisioning script (Step 8 below is now also part of that same script).

## Step 7: Get /etc/docker/daemon.json into Ansible / Version Control

However you configure a new instance, you should make sure that your modified daemon.json file from Step 3 is part of that process or you'll find that setting up a new machine has this same problem.

## Step 8: Redeploy Everything

The final step is to re-deploy everything as all containers, volumes, etc have been deleted earlier in the process.  Hopefully you will find that your disc space usage comes under control.

# Sidebar 1: docker system df

As I was finishing this post, I found the command docker system df which shows you the space docker uses.  Here's an example from my local dev box:

    FuzzygroupMacbookPro2016% docker system df
    TYPE                TOTAL               ACTIVE              SIZE                RECLAIMABLE
    Images              671                 67                  40.59GB             24.07GB (59%)
    Containers          84                  5                   742.2MB             718MB (96%)
    Local Volumes       41                  22                  634.5MB             1.553kB (0%)

# Sidebar 2: docker system prune

The command docker system prune reclaims dangling images and stopped containers.  Here's an example:

    FuzzygroupMacbookPro2016% docker system prune
    WARNING! This will remove:
            - all stopped containers
            - all networks not used by at least one container
            - all dangling images
            - all build cache
    Are you sure you want to continue? [y/N] y
    Deleted Containers:
    4fc625609ac8f86f8d8f9076a8e75d5ccb31c1e871ed6f4589b79de2721af02c
    ... (A long, long list of containers was here)
    Total reclaimed space: 28.72GB

The interesting thing here is that before I ran this I had 46 gigs of free space on my local dev box and after I ran this, I still had 46 gigs free.  I don't know why Docker states that it reclaimed space when it doesn't.

Note: I'm not the only person who can't reclaim this space.  

# What to Learn from This

I would argue that the big takeaway from this isn't actually the specific Docker commands, useful as they are, but the observation that disc space growth wasn't tied to deploys but instead to system operation.  Realizing this changed how I approached the problem.  When you build complex systems, learning how to observe them and then correlating that with what you are doing to the system is a key technique.

# Thank Yous

Most of what I know about Docker, I learned from the courses of [Nick Janetakis](https://diveintodocker.com/).  He is a friend and he pitched in greatly on the analysis and resolution of this.  Thanks man!

# References

* [Interesting Blog Post about Cleaning Up After Docker](http://blog.idetailaid.co.uk/docker-using-up-all-your-disk-space-dont-forget-to-clean-up-after-docker/ ) 
* [Docker Logs on Stack Overflow](https://www.google.com/search?tbs=li:1&q=how+much+space+are+my+docker+logs+taking)
* [Docker Disc Space Quotas and aufs](https://github.com/moby/moby/issues/3804)
* [Docker in Production a History of Failure](https://thehftguy.com/2016/11/01/docker-in-production-an-history-of-failure/)
* [Docker in Production a History of Failure](https://news.ycombinator.com/item?id=12872304) (search for overlay2)
* [Docker not Cleaning Up tmp Files](https://github.com/moby/moby/issues/22207)
* [Docker Orphaned Diffs](https://github.com/moby/moby/issues/29486)
* [Using Overlay2](https://docs.docker.com/engine/userguide/storagedriver/overlayfs-driver/)
* [A seemingly good shell script for cleaning up after Docker](https://gist.github.com/stanislavb/6634fc35b3d1655201a93d2dd2c3a366)