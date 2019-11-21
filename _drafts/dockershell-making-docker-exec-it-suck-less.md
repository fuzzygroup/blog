---
layout: post
title: dockershell - Making docker exec -it Suck Less
category: docker
tags: ["docker", "bash"]
---
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

    dockershell police

and have that do the underlying work to generate the docker exec statement.  A little bit of bash scripting gave me this script:

```bash
#!/bin/bash
if [ -z $1 ]; then
  echo "You need to specify the name of the container you wnat to get into "
else
  pid=`docker ps | grep $1 | awk '{print $1}'`
  docker exec -it $pid /bin/bash
fi
```

Save the lines above as dockershell (or the shorter to type dockershell or dockerbash) and make it executable.  After that you can much more easily get a shell prompt inside your docker containers.