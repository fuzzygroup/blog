---
layout: post
title: Using a Cron Job to Run Rake Tasks Inside Your Docker Container
category: docker
tags: ["docker", "rails", "rake"]
---
{:.center}
![IMG_9341.jpeg](/blog/assets/IMG_9341.jpeg)

Despite cron being an age old *nix technology, it alway seems like  scheduling tasks is an annoying thing.  

**Note**: [Cron](https://crontab.guru/) is the standard *nix technology for running tasks on a recurring basis like "every monday at 5 am execute this program".

We are now doing things like running tasks within containers and that raises the question of where does cron exist:

* within the container?
* at the OS level?
* what about multiple instances of the container across different machines?

I'm not going to try and address the bigger picture questions here like multiple instances but I can show you how to use cron at the OS level to drive a rake task within a container.

## How Do You Run Something Within in a Container

The first thing to understand is that you can easily execute a shell with in a container, from the outside, with this syntax:

    docker exec -it CONTAINER_HASH /bin/bash

The CONTAINER_HASH is the docker equivalent of a *nix pid (process identifier). 

## How to Run a Rake Task

And if you can run a shell like /bin/bash within a container from the outside then, *drum roll please*, you can easily run anything from outside including a Rake task.  And if you have that then you can easily schedule it.  Here's an example:

    docker exec -it 8d76da4ab481  bundle exec rake data_source:update_or_initial_load --trace

The 8d76da4ab481, shown above, is an example of the CONTAINER_HASH.

## But Docker Container Hashes Change...

If you think about this a bit there is one real problem -- that damn CONTAINER_HASH isn't consistent.  It changes every time the container is restarted.  The trick to making a cron job that runs your rake task is to use a shell script which pulls the container hash dynamically.  And to figure that you we are going to start with my [dockerbash blog post](https://fuzzyblog.io/blog/docker/2019/11/21/dockerbash-making-docker-exec-it-suck-less.html).

Here's the shell script from the dockerbash post:

    #!/bin/bash
    if [ -z $1 ]; then
      echo "You need to specify the name of the container you want to get into like:"
      echo "dockerbash police"
    else
      pid=`docker ps | grep $1 | awk '{print $1}'`
      docker exec -it $pid /bin/bash
    fi

Let's create another shell script calling it, say, docker_datasource_update:

    #!/bin/bash
    pid=`docker ps | grep police | awk '{print $1}'`
    docker exec -it $pid bundle exec rake data_source:update_or_initial_load --trace

**Note**: This is for an application which has the word 'police' in its name hence the above grep for the word police.  

Let's say that this is now stored in /usr/local/bin/docker_datasource_update.  You then need to write a cron job to call it:


    # m h  dom mon dow   command
    0 7 * * * /usr/local/bin/docker_datasource_update

**Note**: Add the crontab above with **crontab -e**.
