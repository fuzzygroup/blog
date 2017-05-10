---
layout: post
title: Deploying a Rails app to AWS with Docker Swarm
category: rails
tags: ["rails", "docker", "aws", "swarm"]
---
Historically I've deployed Rails apps via Vlad or Capistrano and, honestly, deployment is always one of the **worst** parts of Rails.  I decided recently that I was just plain tired of classical deployment and I wanted to move to deploying via the new Docker Swarm.  I'm in an interesting position where I need to launching N things over the next few months and thought of struggling with Capistrano every time I want to make something publicly available is, honestly, more than I can bear.  I'm looking at Docker and Docker Swarm from the perspective of there **has** to be a better way.

# Application Description

In order to teach myself this new style of deployment, I didn't want to use a toy application.  I wanted a real app that served a real purpose so I came up with the idea of a web app which evaluates a gem from GitHub and answers the question of "Should I (use this) Gem?".  I call it [ShouldIGem](http://www.shouldigem.com/) and it is live on the web in a minimal state.

This would give me a:

* rails app
* that uses network i/o
* exercises a code base I've been building to illustrate possible issues
* uses multiple AWS resources in a scalable way - micro instances and RDS
* that uses Puma as a an application server
* separates the different functional parts of a Rails app into different "containers" i.e. web, sidekiq, migrations, redis

Even though most applications of Docker seem to use a CI server, I wanted to do this at least quasi manually so I had a better understanding of what's actually happening under the hood.  By the end I mildly regretted not using a CI server but I suspect the effort to setup a CI server would have been similar and I would have learned far less.

Surprisingly I didn't actually have to do all that much development to pull this off.  Over the past several months, ever since I left my full time gig, I've been developing an HTML micro expression parsing engine and this is simply an application of it.

I call this application *Should I Gem* and it is online at [http://www.shouldigem.com/](http://www.shouldigem.com/).

# Thank You

A good friend is Nick Janetakis who is a Docker Captain and has taught over 10,000 people how to use Docker.  His latest course is [Dive Into Docker](https://diveintodocker.com/courses/dive-into-docker).  He pitched in on this and while I'm the humble scribe here, he's been the steadfast advocate for Docker, pushing me towards it for almost a year now.  Thanks Nick -- I couldn't have done it without you.  Additional thank yous related to this project can be found on the [About Page](http://www.shouldigem.com/pages/about).

# Things to Understand

When you go into Docker Swarm, you're not in the same old one server, one process Rails world you are likely used to.  You're moving into a brave new world of zero downtime deploys and to support that, ideally, you need 2 of everything -- 2 web instances, 2 sidekiq instances and so on.  This brings with it an increase in resource usage (mostly ram) so keep that in mind.

**Note**: Since this is all being paid for on my own dime, I initially put this up on a single machine; no matter, changing it to multiple machines with Docker Swarm is actually trivial.

# Getting Your Application Deployed Under Docker Swarm

## Step 1: Create an AWS RDS Instance for the Database

The very first thing I did to get started was to decide that I wanted my persistent storage absolutely separate from Docker.  Yes I do know that Docker's volume support makes this less absolutely necessary than it once was but I'm pretty old school when it comes to the data side of the equation so I used AWS RDS.

To do this, I used the standard AWS RDS web front end and then copied the configuration parameters to database.yml.  Yes I could have used environment variables or secrets or something else but database.yml is just fine for a private app where there is only one developer.

**Note**: Now that I've thought this over a bit, I understand more why in the Docker world, there is such a focus on environment variables versus static values checked into version control.  Historically I've always worked in terms of full time staff but in the brave new world of contract developers and freelancers, it does make sense to pull configuration away from people (particularly true with credentials like AWS api keys which can be so easily exploited if they escape into the wild).

## Step 2: Build an AWS Instance for the Server

When you start talking about containers and cloud stuff, you often lose sight of the fact that there still are **physical servers** involved and you're going to need one to run your containers on.  Thinking of containers as *a runtime layer for a software stack* is what finally make me understand them well enough to commit to using containers in production.

All I did here is build a t2.micro instance, nothing special at all.

## Step 3: Make an AWS Security Group and Set Up AWS Billing Alerts

Add your AWS instance to the same security group that was automatically created for your RDS instance.  Personally I'd recommend opening up the ICMP port for ping but that's just me.

If you don't normally setup AWS Billing Alerts on your cloud stuff then I highly recommend it. AWS entirely lacks the concept of a hosting budget for experimental stuff like this but AWS will alert you when your spending goes over limits so that's at least something.  

## Step 4: Install Docker Locally on Your Development box

If you don't have Docker installed locally then you need to do this now.  These days this is so simple that I don't think you need any more help than [http://www.docker.com/](http://www.docker.com/).

## Step 5: Sign up for DockerHub

A key decision in any Docker strategy is where are your Docker Images stored.  This is called a *container registry* and think of it as a git repo but for a **compiled** artifact instead of source code.  AWS has their own registry called the AWS ECR (elastic container registry) but I decided to use Docker Hub instead.  The reason was that I figured that:

* Docker Swarm would naturally work better with something from Docker.  
* There are also issues with the AWS ECR and authentication needing to re-authenticate every 12 hours or so that I just plain didn't want to tackle.

### Steps:

1.  Goto https://hub.docker.com/
2.  Create an account.
3.  Sign up for a paid account if you need more than one container (and you likely will).  It is only $7 per account for a micro account so it isn't much money.
4.  Create repositories for each of your containers.  Please note that since you haven't set them up yet you may need to wait until later in the process on this.

### Review

While I found DockerHub to be a bit pricey for what you get, it worked **perfectly**.  I don't think that I hit a single snag related to the container registry and that's just plain awesome.  Recommended!

## Step 6: Install Docker on Your AWS Instance

Although Amazon offers an Amazon branded version of Linux complete with Docker, Ubuntu has been very, very good to me over the years so when I created my instance, I used Ubuntu which means I needed to manually install docker per the Linux Install instructions: 

[1](https://docs.docker.com/engine/installation/linux/ubuntu/#install-from-a-package) and [2](https://docs.docker.com/engine/installation/linux/linux-postinstall/#kernel-compatibility).  

Here's what you need to do once you are SSH'd into your Linux box:

    sudo apt-get install     apt-transport-https     ca-certificates     curl     software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
    sudo apt-get install docker-ce
    sudo docker run hello-world
    sudo groupadd docker
    sudo usermod -aG docker $USER
    docker run hello-world
    exit
    sudo systemctl enable docker
    docker login

Enter your login credentials for Docker Hub when you type docker login and they will be saved, securely, to  this file:

    ~/.docker/config.json

After you get Docker installed on your AWS instance, there are two final steps:

1. Create a directory where your application will live.  I called mine should_i_gem but yours will obviously be different so I have ~/should_i_gem as my path.
2.  You need to initialize swarm mode as it is turned off by default.  Do this with:

> docker swarm init

At the end of your docker swarm init command, you will get a message like this:

    Swarm initialized: current node (zv7y6c7236mtjl4jv31kw1elb) is now a manager.

    To add a worker to this swarm, run the following command:

        docker swarm join \
        --token SWMTKN-1-4vpwpu2qiwkj7c5br92g8x8kchynw7evto5xm7n0fj46fj7e51-1yzi6jj84m19e9wylz7wvg55q \
        172.31.9.129:2377

    To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

This message is actually pretty important so make a note of it.  Personally all my Rails apps have a top level directory called docs where I can drop anything I need to ever come back to.  That's a best practive that I'd recommend.

## Step 7: Get Your Application Ready for Docker i.e. "Dockerizing It"

The next step is to get your Rails application ready for Docker.  There are different ways to do this.  If you're starting with a brand new app then I'd recommend that you use the [ORATS](https://github.com/nickjj/orats) gem as a generator since that builds all the Docker stuff for you but I'll take you through the steps manually.

### The Files You Need

You need:

* Dockerfile
* .dockerignore
* docker-compose.yml
* docker-compose.production.yml
* .env
* .env.production

All of these files live in the root directory of your Rails app.  You'll also likely need to change puma.rb in config.  Each of these files is described below.

#### Dockerfile

The Dockerfile tells Docker itself how to get it to build and how to run it.  Here's what mine looked like:

    FROM ruby:2.3.1-alpine

    RUN apk update && apk add build-base nodejs mariadb-dev tzdata

    RUN mkdir /app
    WORKDIR /app

    COPY Gemfile Gemfile.lock ./
    RUN bundle install --binstubs

    COPY . .

    # The ENV variables simply need to be set for Rails to correctly pre-compile
    # your assets. They do not need to be populated by real values.
    RUN bundle exec rake RAILS_ENV=production DATABASE_URL=mysql2://user:pass@127.0.0.1/dbname SECRET_TOKEN=dummytoken assets:precompile

    CMD puma -C config/puma.rb
    
The FROM directive tells Docker what "software engine" to use.  In this case I'm using a Ruby 2.3.1 language implementation on top of the Alpine linux distro which is a tiny Linux just for containers.

The first RUN command tells it to update and then build the best, nodejs and mariadb-dev and tzdata.  These are equivalent to doing a apt-get install on any Ubuntu system.

The second RUN command makes a directory /app and then it is set as WORKDIR.  Please note that all these commands generally execute from where your Dockerfile is located.

The first COPY command copies in Gemfile and Gemfile.lock and then runs bundler so that your gems are build in the runtime container.

The second COPY command copies your code into the container.

THE RUN bundle exec command sets up environment variables and handles asset compilation.

And then CMD puma starts the web process.

#### .dockerignore

The .dockerignore file tells Docker what files to ignore.  For example .git shouldn't ever be pushed to DockerHub and neither should tmp.  Generally speaking you want your Docker images to be as slim as possible since the larger they are, they longer they take to download.

Here's my .dockerignore:

    .git/
    .dockerignore
    .byebug_history
    tmp/*
    log/*

We do want the tmp and log directories to exist in the runtime for our application so we exclude them as tmp/* so the files within them are excluded but not the directory.

#### docker-compose.yml

The docker-compose.yml tells Docker how to run all the different containers in your application.  If you think about a normal web application, even on a single server, there are actually different pieces like:

* web server
* database server
* sidekiq
* redis 

Here's my docker-compose.yml:

    version: '3.1'

    services:
      redis:
        image: 'redis:3.2-alpine'
        ports:
          - '6379'
        volumes:
          - 'redis:/var/lib/redis/data'

      web:
        depends_on:
          - 'redis'
        build: .
        env_file:
          - '.env'
        ports:
          - '3500:3500'
        volumes:
          - '.:/app'
      
      sidekiq: 
        depends_on: 
          - 'web'
        build: .
        env_file:
          - '.env'

        volumes:
          - '.:/app'
        command: "bundle exec sidekiq -C config/sidekiq.yml.erb"
  
    volumes:
      redis: {}
      assets: {}
    
There are a few different directives here:

* version - this tells Docker what version you want to run and since we want to use Swarm, it needs to be 3 or later.  I want the latest and that's 3.1.
* services - this is the top level grouping of each of the containers you're going to create.
* volumes - this exposes data from service to service.

The key thing here is the services so let's start by looking at our Redis service:

    redis:
      image: 'redis:3.2-alpine'
      ports:
        - '6379'
      volumes:
        - 'redis:/var/lib/redis/data'
        
What this is telling us is:

* name the service redis
* base this on an image i.e. something from a repository (often DockerHub but not always); you find available images at [DockerHub](http://www.dockerhub.com) and there are thousands upon thousands of images
* expose the port 6379 to other services
* store your data at the specified volume location

Our web service now starts to show how this all fits together:

    web:
      depends_on:
        - 'redis'
      build: .
      env_file:
        - '.env'
      ports:
        - '3500:3500'
      volumes:
        - '.:/app'
        
What this is telling us is:

* web depends on Redis actually running
* build the code from the current directory i.e. .
* use the environment file .env
* run on the port 3500 both internally to the service and external in the local environment
* expose a volume at app

Now the sidekiq service brings it all home:

    sidekiq: 
      depends_on: 
        - 'web'
      build: .
      env_file:
        - '.env'

      volumes:
        - '.:/app'
      command: "bundle exec sidekiq -C config/sidekiq.yml.erb"

What this is telling us is:

* sidekiq depends on web 
* it is again going to build from the current directory
* it will use the same env file and volumes
* it will use a special command to run sidekiq when the container starts up

If you look at this sidekiq container it actually answers a common question that people have about Docker which is CRON based processing.  Let's say you had a rake task that you wanted to run every day under Docker.  Just create a container which has an entry command of either cron or a scheduling gem like ClockWork and make it part of your stack.  Please bear in mind that if you're launching multiple copies of your container then you'd need to allow for locking or whatever mechanism you needed to prevent concurrency issues.

#### docker-compose.production.yml

Here is the **production** version of my docker-compose file that is the one that will be located on the server to define our services and our swarm:

    version: '3.1'

    services:
      redis:
        image: 'redis:3.2-alpine'
        ports:
          - '6379'
        volumes:
          - 'redis:/var/lib/redis/data'
        deploy:
          replicas: 1
          restart_policy:
            condition: on-failure

      web:
        depends_on:
          - 'redis'
        image: fuzzygroup/shouldigem_web
        env_file:
          - '.env'
          - '.env.production'
        ports:
          - '80:80'
        deploy:
          replicas: 2
          update_config:
            parallelism: 1
            delay: 10s
          restart_policy:
            condition: on-failure


  
      sidekiq: 
        depends_on: 
          - 'web'
        image: fuzzygroup/shouldigem_web
        env_file:
          - '.env'
          - '.env.production'      
        command: "bundle exec sidekiq -C config/sidekiq.yml.erb"
        deploy:
          replicas: 1
          restart_policy:
            condition: on-failure
    volumes:
      redis: {}
  
#### .env

A .env file is a set of environment variables that Docker will cause to come into being in the environment that you are setting up.  Here's my .env file:

    COMPOSE_PROJECT_NAME="should-i-gem"
    BIND_ON=0.0.0.0:3500
    RAILS_MAX_THREADS=1
    WEB_CONCURRENCY=1
    ACTIVE_JOB_URL=redis://redis:6379/0
    REDIS_CACHE_URL=redis://redis:6379/0
    ACTIVE_JOB_QUEUE_PREFIX=jobs
    LOG_LEVEL=debug
    RAILS_ENV=development

#### .env.production

Here's my .env.production:

    RAILS_MAX_THREADS=5
    WEB_CONCURRENCY=5
    RAILS_ENV=production
    RAILS_SERVE_STATIC_FILES=true
    BIND_ON=0.0.0.0:80

## Step 8: Build Your App Under Docker

Your Rails app is run inside a container or series of containers as defined by your compose file.  The key step to getting your containers to run is that they need to be "built".  This is done with the docker-compose tool:

> docker-compose build web

## Step 9: Create Your Images, Tag Them and Push them to Docker Hub

Once you have built your docker images, they need to be pushed to the DockerHub where they can be pulled onto your server when you are ready to run them.  This is done with a command like this:

> docker tag shouldigem_web fuzzygroup/shouldigem_web:latest

## Step 10: Copy the docker-compose.production.yml to the Server

In order to run your containers in production there are three files that need to go up to the server:

* .env
* .env.production
* .docker-compose.production.yml

Technically these files only need to be copied up **once** but because configurations change, I'd recommend that you think of these as *deployment artifacts* that need to be copied up every time.  And because these things are external to your actual image they can't be a part of them.

## Step 11: Actually Deploying

Deployment of a Rails app under Docker, the way I've done it, is actually a two step process:

1.  Copy the three files in Step 10 to the server or servers (if you have N servers then they need to go up to all N servers).
2.  Restart the Docker Swarm engine.

### A Tiny Bash Deployer to Get Your Files Up

Steps 8, 9 and 10 can all be rolled together into a simple bash script as follows:

    #!/bin/bash

    #
    # The Docker Specific Stuff
    #
    docker-compose build web
    docker tag shouldigem_web fuzzygroup/shouldigem_web:latest
    docker push fuzzygroup/shouldigem_web:latest

    #
    # Setting up the remote box
    #
    scp -i ~/.ssh/fuzzygroup2.pem .env  ubuntu@shouldigem.com:~/shouldigem
    scp -i ~/.ssh/fuzzygroup2.pem .env.production  ubuntu@shouldigem.com:~/shouldigem
    scp -i ~/.ssh/fuzzygroup2.pem docker-compose.production.yml ubuntu@shouldigem.com:~/shouldigem

### Restarting Docker Swarm

Here's the command to restart Docker Swarm:

> docker stack deploy -c docker-compose.production.yml --with-registry-auth shouldigem

This has to be done after:

* Your images have been built and pushed to Docker Hub
* The .env and compose files are copied to all remote servers

### Two Discrete Steps Sucks Monkey Chunks

Yes I'm clearly aware that two separate steps for deployment (and that this entirely ignores migrations) actually sucks monkey chunks.  I'll roll all this into an Ansible deployer in the not too distant future.  And I'll address migrations at that time.

# Gotchas

In getting this deployed, I only hit one real gotcha -- I wanted to use Nginx to serve the 10 or so static assets (images, JS and CSS) that make up this application.  Due to the layers of isolation and the fact that Docker Swarm prevents use of the VOLUMES_FROM directive, I was simply unable to make this work.  There are various workarounds but none of them let me achieve my zero downtime goal so I ended up just using Puma to serve them for now.  At some point I'm sure that I or someone else will figure this out.

# Conclusions and Observations

If you're going to go down the container route then I strongly recommend that if at all possible, you do it with someone who has already done it.  Docker Swarm and Docker itself are highly impressive technologies but the levels of abstraction and isolation that you have to internalize are very hard to wrap your head around.

You should be aware that there's a whole additional post that I need to write -- *Working with a Rails App Under Docker* which discusses how you work with a Rails app under Docker and will cover things like logs, migrations, getting into console and so on.  Look for that in the next few days.

# Recommended Reading

Here are some good things to read

* [Dive Into Docker](http://www.diveintodocker.com)
* [J Hannah](https://jbhannah.net/articles/rails-development-with-docker/)
* [Devops 2.1 Toolkit](https://leanpub.com/the-devops-2-1-toolkit)
* [Containers versus Virtual machines](https://diveintodocker.com/blog/comparing-virtual-machines-vs-docker-containers)


