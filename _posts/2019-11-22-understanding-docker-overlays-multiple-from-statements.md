---
layout: post
title: Understanding Docker Multi Stage Builds - Installing Python and Ruby in the Same Dockerfile
category: docker
tags: ["docker", "python", "ruby"]
---
{% pizzaforukraine  %}

Now that I've come up to speed on Python, I have an application in production that uses both Python and Ruby.  What it does isn't really important but getting it live posed an interesting deployment challenge due to the need to have both Python and Ruby concurrently.

My initial attempt to make this was work was a native install using Python 3.7 and a fairly large set of Python dependencies on an Ubuntu 18.04 AWS instance.  Unfortunately I kept hitting issues where, well, things just went to hell.  This had me turn to Docker and my thinking was that I should be able to easily build a Dockerfile that supported both Python and Rails.  *chuckle*.  Nothing in Docker is actually easy but I got there.

**Note**: The reason I needed Python is I was building a [Twitter](https://github.com/twintproject/twint) related application and I needed to use the truly excellent Twint library / executable.

## Python Dockerfile Attempt 1

I don't have a full record of this but I tried to pull in a traditional Python install using apt-get.  This worked fairly horribly for reasons that escape me.  

## Welcome to Overlays and Multiple From Statements

My first attempt to make this work failed to work and it failed to really adopt the zen of Docker.  One of the very cool features is that you can build up a Docker container with bits from different containers by using **multiple** from statements.  This lets you have something like this:

    FROM continuumio/miniconda3:latest AS python
    RUN apt-get update && apt-get install build-essential python3-dev -y
    
    FROM ubuntu:latest
    FROM ruby:2.6.4-stretch
    

The term for this is a [Docker Multi Stage Build](https://dev.to/brpaz/using-docker-multi-stage-builds-during-development-35bc).  The trick here is that the output from each FROM statement is logically isolated from each other.  The reason for this is actually pretty simple -- standard directory structures.  Given that most *nix environments use similar top level structures like /opt, you simply can't combine things blindly -- it needs to be an intentional choice using, **drumroll**, **copy**!

Here's what this multi stage build stuff looked like:

    FROM continuumio/miniconda3:latest AS python
    RUN apt-get update && apt-get install build-essential python3-dev -y
    RUN conda update -n base -c defaults conda
    RUN pip install twint
    
    # The Ruby Stuff Starts Here
    FROM ubuntu:latest
    FROM ruby:2.6.4-stretch
    
    # This Is The Magic Here 
    COPY --from=python /opt/conda/bin/twint /usr/bin
    RUN mkdir -p /opt/conda/bin/
    COPY --from=python /opt/conda /opt/conda/
    COPY --from=python /opt/conda/bin/python /opt/conda/bin/python
    

The last block of lines above show the process of copying from python (the FROM line at the top is named with the "AS python") and there are two copy statements that were really necessary:

* The twint executable needed to be copied to something in the path.  I chose /usr/bin.
* Since the twint "executable" is written in python, the entire python supporting libraries needed to come with it.  Since this was located in /opt/conda originally and nothing in Ruby used that path, I could simply copy all of it from the python container over to the ruby container.

**Note**: I tried a few different ways to do the copy and I never narrowed it down to which copy statement was exactly needed.  Apologies.  I suspect it should be nothing but "COPY --from=python /opt/conda /opt/conda/" but Docker's documentation on COPY was less than helpful.

## Figuring Out Where twint Existed

The section above is interesting but it relies on one specific bit of knowledge -- where the heck that the Twint executable comes from.  And while I might know this for my local environment, I had no idea where it would be installed in a conda environment.  Fortunately the answer was actually pretty easy:

* Create a cut down version of this Dockerfile 
* Build it 
* Shell into it and then use ls and which to find things

Here's how I did this:

    mkdir ~/twint
    touch ~/twint/Dockerfile

**Note**: Docker likes to build directories mostly so it was just easier to give it a directory of its own with a single Dockerfile in it.

The next step was to edit the Dockerfile and add the following lines:

    #FROM ruby:2.6.5-ubuntu
    FROM continuumio/miniconda3:latest
    
    RUN apt-get update && apt-get install build-essential python3-dev -y
    RUN conda update -n base -c defaults conda
    
    RUN pip install twint
    # This trick keeps the container running so you can shell into it
    RUN while true; do sleep 1000; done

Once I had this written, I could do a:

    docker build twint
    docker ps | grep twint
    docker exec CONTAINER_HASH -it /bin/bash

And then I was able to use a combination of ls and which to find the twint binary and gather the information needed for the copy statements above.

**Note**: This technique of generating a small Dockerfile and using it for diagnostic purposes is pretty powerful.  Recommended.

## A Working Python and Rails Dockerfile with Twint Support via Conda

Here is how it all came together:

    # All The Python Stuff
    FROM continuumio/miniconda3:latest AS python
    RUN apt-get update && apt-get install build-essential python3-dev -y
    RUN conda update -n base -c defaults conda
    RUN pip install twint
    
    # The Ruby Stuff Starts Here
    FROM ubuntu:latest
    FROM ruby:2.6.4-stretch
    
    RUN apt-get update
    RUN apt-get install -y tzdata
    RUN apt-get install -y git
    RUN apt-get install -y ruby
    RUN apt-get install -y build-essential patch ruby-dev zlib1g-dev liblzma-dev
    RUN apt-get install -y nodejs
    
    # This Is The Magic Here 
    COPY --from=python /opt/conda/bin/twint /usr/bin
    RUN mkdir -p /opt/conda/bin/
    COPY --from=python /opt/conda /opt/conda/
    COPY --from=python /opt/conda/bin/python /opt/conda/bin/python
    
    RUN mkdir /app
    WORKDIR /app
    
    # Install yarn
    RUN apt-get update && apt-get install -y apt-transport-https
    RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
    RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
    RUN apt-get update && apt-get install -y yarn
    
    COPY Gemfile Gemfile.lock ./
    RUN bundle install --binstubs
    
    ENV secret_key_base SOMEKEY
    
    ENV RAILS_ENV production
    ENV DB_NAME SOMETHING
    ENV DB_USERNAME SOMEUSER
    ENV DB_PASSWORD A_PASSWORD
    ENV DB_HOST a_host
    
    COPY . .
    
    RUN bundle exec rake RAILS_ENV=production DATABASE_URL=mysql2://user:pass@127.0.0.1/dbname SECRET_TOKEN=dummytoken assets:precompile
    
    CMD puma -C config/puma.rb

## Ubuntu Not Alpine

Yes, yes, yes, I know that I really should have used Alpine.  I started from Ubuntu because I know it well and the additional overhead of Ubuntu wasn't an issue for this product (a small internal application).
