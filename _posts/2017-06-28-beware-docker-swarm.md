---
layout: post
title: Beware Docker Swarm
category: docker
tags: ["docker", "swarm", "devops"]
---
I have previously mentioned that I was using Docker Swarm and fairly happy with it.  I even went so far as to document the [deploy process](http://fuzzyblog.io/blog/devops/2017/06/20/no-ci-and-no-cd-deploying-docker-swarm-with-bash-and-ansible.html).  I now have to retract everything positive I said about Docker Swarm.  I have now reverted to just using Docker and Docker Compose and bare containers with an AWS ELB on top of it.  Here's why:

1.  I attempted to have multiple apps with Docker Swarm on the same instance.  Nothing seemed to work and I had continuous troubles including containers running out of memory and the instance itself becoming hugely unresponsive.  This led me to the conclusion that Docker Swarm wasn't really ready for production.
2.  On the instance where I had previously used Docker Swarm I disabled the swarm functionality and attempted to use the instance just for raw containers.  This utterly failed with no http services (puma) being able to serve content but no clear errors either (i.e. the request wasn't even getting to the http server).  Digging into it deeper showed that Docker Swarm had left all kinds of digital garbage in iptables.  So I flushed that with a sudo iptables --flush and did a fresh deploy of the containers.  This still failed.
3.  Finally I built a new instance from scratch and assigned that instance the same ip address as the instance referenced in #2 and did another deploy.  The result?  The container worked perfectly on the very first try.

My final conclusions are:

* Swarm isn't ready for production use now
* If you have to use Swarm then put only one "stack" on a physical instance
* Don't try and use raw containers on a swarm box that aren't using swarm
* If you want to stop using swarm then, well, destroy the instance
