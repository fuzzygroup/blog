---
layout: post
title: Fixing the Docker Permission Denied While Trying to Connect to the Docker Daemon Socket Error
category: docker
tags: ["docker", "ubuntu", "linux", "ansible"]
---
{:.center}
![IMG_3878.jpeg](/blog/assets/IMG_3941.jpeg)

I recently had the situation where even the simplest docker command:

    docker run -it bash

gave this error:

    docker: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: 
    Post http://%2Fvar%2Frun%2Fdocker.sock/v1.40/containers/create: dial unix /var/run/docker.sock: connect: permission denied.
    See 'docker run --help'.

The solution for this is actually pretty simple:

* Add your user to the docker group.  Since I was running Ubuntu linux, the default user is also ubuntu and then command is:
* sudo usermod -aG docker ubuntu
* And then you have to log out and log back in or u -s ${ubuntu}

Here's an ansible task which you can drop in a playbook to accomplish this:

    - name: Update the ubuntu user to be part of the docker group
      user:
        name: ubuntu
        shell: /bin/bash
        groups: docker
        append: yes

## Verifying this

If you need to validate what groups a user is in then use: 

    id -nG ubuntu

**Note**: Thanks to Don Neufeld for teaching me this command; somehow despite N decades of unix experience, I missed the id command.  Bizarre.

## See Also

Here's a good article from [Digital Ocean on this](https://www.digitalocean.com/community/questions/how-to-fix-docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket).