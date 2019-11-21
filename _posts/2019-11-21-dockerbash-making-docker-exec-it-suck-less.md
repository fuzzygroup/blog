---
layout: post
title: dockerbash - Making docker exec -it Suck Less
category: docker
tags: ["docker", "bash"]
---
{:.center}
![IMG_9169.jpeg](/blog/assets/IMG_9169.jpeg)

Docker is a container technology that allows you to package up a series of different technologies under (generally) a *nix style operating system.  As things deployed with Docker are generally deployed under a *nix style operating system, it isn't uncommon to want to open a shell into your Docker environment for debugging purposes.

You can easily do this with:

    docker exec -it CONTAINER_HASH /bin/bash
        
The CONTAINER_HASH is a value like 311ab7fe0ea1.  This value is fetched from a docker ps command like this:

    docker ps | grep police

The term 'police' is just some bit of text that identifies the docker process that is running. 

Here's an example of this output:

    ❯ docker ps | grep police
    311ab7fe0ea1        img-captain-police-crawl:51         "/bin/sh -c 'puma -C…"   4 hours ago         Up 4 hours

What I'd really like is a command like this:

    dockerbash police

and have that do the underlying work to generate the docker exec statement.  A little bit of bash scripting gave me this script:

```bash
#!/bin/bash
if [ -z $1 ]; then
  echo "You need to specify the name of the container you want to get into like:"
  echo "dockerbash police"
else
  pid=`docker ps | grep $1 | awk '{print $1}'`
  docker exec -it $pid /bin/bash
fi
```

Save the lines above as dockerbash and make it executable.  After that you can much more easily get a shell prompt inside your docker containers.

## Bash References

* [Bash Cheat Sheet](https://www.andreafortuna.org/2018/07/02/bash-scripting-my-own-cheatsheet/)
* [How to Set a Variable in Bash](https://stackoverflow.com/questions/4651437/how-do-i-set-a-variable-to-the-output-of-a-command-in-bash)
* [How to Use Awk to Get the First Variable](https://linuxhint.com/20_awk_examples/#a16)

## Where Does dockerbash Live?

You cannot store dockerbash in the project that you are deploying via Docker because it needs to exist **on the** machine that runs your Docker containers, not within your Docker container.  My recommendation is that you have your DevOps tooling such as Ansible install this script.