---
layout: post
title: No CI and No CD - Deploying Docker Swarm with Bash and Ansible
category: devops
tags: ["ci", "cd", "docker", "swarm", "docker_swarm", "bash", "ansible"]
---
This post may well verge on the heretical.  I'm getting close on a new SAAS app that is going to be run using containers and Docker Swarm as my container engine.  Rather than go the whole CI / CD route, I actually ended up using a combination of Bash and Ansible to handle my deployment onto AWS.  This is a side project type of thing and I didn't want to spend the time / $$$ to setup CI / CD which, honestly, can be frightfully expensive (and, yes, I'm glaring at you CircleCI and your ridiculous $50 / container / month model; containers allow nice partitioning down to the microservice level but pricing plans like this want you to run screaming back to monoliths; ARGH).  But I'm digressing into a rant so ...

# Under the Hood for a Docker Swarm Deploy

Docker Swarm is a way to easily run a cluster of Docker containers as a shared, coherent entity.  Here is what has to happen under the hood for a Docker Swarm deploy (or at least how I've done it; I'm sure there are other ways):

## Stage 1: Docker Build

The first stage is just building your Docker containers.  That looks like this:

    docker-compose build web
    docker tag seirawatchsite_web fuzzygroup/seirawatchsite_web:latest
    docker push fuzzygroup/seirawatchsite_web:latest
    
As you can see I'm using the Docker Hub container registry here and the reason is that Docker Hub really gets this right.  Nick goes over some of the numbers about Docker Hub in a [recent blog post](https://diveintodocker.com/blog/the-3-biggest-wins-when-using-alpine-as-a-base-docker-image) and the number of pulls is astonishing.

## Stage 2: Copy Up

The next stage is to simply copy of your .env, .env.production and docker-compose files up to all the hosts where your swarm runs.  I suppose if you *know* that these files won't change then you don't need to do this but, personally, I feel that you want this as part of your deploy process.  You can do this anyway you move files but I just used straight up scp commands:

    scp -i ~/.ssh/fuzzygroup2.pem .env  ubuntu@foo.com:~/seirawatchsite
    scp -i ~/.ssh/fuzzygroup2.pem .env.production  ubuntu@foo.com:~/seirawatchsite
    scp -i ~/.ssh/fuzzygroup2.pem docker-compose.production.yml ubuntu@foo.com:~/seirawatchsite
    
These are just going up to a project level directory on the underlying linux box where the container will run.  Putting them in a directory allows for another container for this project to exist on the same hardware.

## Stage 3: Restart Docker

The final stage is telling Docker Swarm to use the new files.  This requires using this Docker specific command:

    cd ~/seirawatchsite/ && docker stack deploy -c docker-compose.production.yml --with-registry-auth seirawatchsite
    
The trick here is that you need to run that on all your Docker swarm hosts -- once you are logged into them.  Up to this point all of our commands have executed locally on a development system.  With this command we need to now run on the remote box where swarm is executing -- and that's where Ansible comes in but first we have to learn a cool bash trick.

# A Cool Ass Bash Trick

As I've alluded to in the past, I'm not a bash guy.  I initially grew up with DOS .bat files and I think that must have scarred me for life since while I use bash regularly, I've never, not once, really felt comfortable with.  For example, anyone who knows me personally knows that my bash prompt is never right.  One of the issues with deploy is that, in my opinion, when there is an error, it needs to HARD STOP IMMEDIATELY.  Otherwise you'll end up with your remote system in an arbitrary state which is **dangerous**.  So I turned to Google and StackOverflow with the phrase "bash script exit on error" and found a [wonderful answer](https://stackoverflow.com/questions/1378274).  You start by adding this function to the top of your bash script:

    function run() {
      cmd_output=$(eval $1)
      return_value=$?
      if [ $return_value != 0 ]; then
        echo "Command $1 failed"
        exit -1
      else
        echo "output: $cmd_output"
        echo "Command succeeded."
      fi
      return $return_value
    }
    
You can then wrap each of your lines with the run command like this:

    run "date"
    run "false"
    run "date"

And then it exits if there is an error and it tells you where it stopped.

# Putting it All Together

Now that we have a mechanism for handling errors we can bring this all together into a single deploy.sh bash script:

    #!/bin/bash

    #
    # The Docker Specific Stuff
    #

    #function run comes from: https://stackoverflow.com/questions/1378274/ ; thank you velotron

    function run() {
      cmd_output=$(eval $1)
      return_value=$?
      if [ $return_value != 0 ]; then
        echo "Command $1 failed"
        exit -1
      else
        echo "output: $cmd_output"
        echo "Command succeeded."
      fi
      return $return_value
    }

    echo "Stage 1: Docker Build"
    run "docker-compose build web"
    run "docker tag seirawatchsite_web fuzzygroup/seirawatchsite_web:latest"
    run "docker push fuzzygroup/seirawatchsite_web:latest"

    echo "Stage 2: Copy Up"

    run "scp -i ~/.ssh/fuzzygroup2.pem .env  ubuntu@foo.com:~/seirawatchsite"
    run "scp -i ~/.ssh/fuzzygroup2.pem .env.production  ubuntu@foo.com:~/seirawatchsite"
    run "scp -i ~/.ssh/fuzzygroup2.pem docker-compose.production.yml ubuntu@foo.com:~/seirawatchsite"

    echo "Stage 3: Restart Docker Using Ansible"

    run "ansible-playbook -i script/ansible/inventories/production script/ansible/deploy.yml"

The Ansible deploy.yml is about as simple as it gets for Ansible; damn close to a one liner:

    ---
    - name: Restart Docker Swarm
      become: no
      shell:  "cd ~/seirawatchsite/ && docker stack deploy -c docker-compose.production.yml --with-registry-auth seirawatchsite"
      
Yes this needed to be wrapped in an entire Ansible environment including the full directory structure, etc but that really is pretty simple.  Here's what the whole thing looked like:


    ├── ansible.cfg
    ├── deploy.yml
    ├── group_vars
    ├── inventories
    │   └── production
    └── roles
        └── restart_docker_swarm
            └── tasks
                └── main.yml

# Closing Thoughts

So the question comes up whether or not this is a good way to tackle a Docker Swarm deploy and I have mixed feelings.  Yes CI / CD is definitely better but it is also a lot "heavier".  I am very much a believer in understanding exactly the bits that you are deploying and CI / CD always makes me feel uncomfortable in that regard.  When you understand how deploy is working you also understand how to handle the inevitable deploy problem -- and there is always something.

Note: I did not deal with migrations in the course of this writing; I'll cover that in a future blog post.

# Thanks

My thanks, as always, go out to my Docker friend and mentor, [Nick Janetakis](https://diveintodocker.com/courses/dive-into-docker), a strong shout out to [Velotron on Stack Overflow](https://stackoverflow.com/users/958118/velotron) for his bash assistance.