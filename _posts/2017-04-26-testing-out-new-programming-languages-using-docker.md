---
layout: post
title: Testing Out New Programming Languages Using Docker
category: docker
tags: ["docker", "programming", "elixir"]
description: If you're looking to experiment with different programming languages then Docker can make this really, really easy -- far simpler than a native install.
---
I am, as you likely know, an unabashed Ruby fan -- love the language; loathe the performance but still a huge, huge damn fan.  Ruby is the first language I ever fell in love with and like many first loves, they never really fade.  Still, even so, there times when you just hunger for something new.  Here's how to get a new programming language up and running with Docker for a handful of different environments.  I deliberately chose languages that can boot into a console or REPL (replace-evaluate-print-loop) since that's the easiest way to get going in terms of experimenting with a language.

# Installing Docker

The easiest way to install Docker is to follow the official directions [here](https://docs.docker.com/engine/installation/).  You want Docker Community Edition in likely one of these platforms:

* [Mac](https://docs.docker.com/docker-for-mac/install/)
* [Windows](https://docs.docker.com/docker-for-windows/install/)
* [Ubuntu](https://docs.docker.com/engine/installation/linux/ubuntu/)

Please note that Docker install urls change frequently so you may need to look around a bit.  They work today, end of April 2017, how long that lasts is unclear.

# Docker Basics

There are a few basic Docker things that you need to know, particularly, if you run Docker on OSX.  Docker is a container technology, similar to a virtual machine (albeit faster, smaller and very differently implemented) that allows you to run programs.  The best way I understand Docker is to think of it as a portable runtime that is bound to a software stack and allows you to achieve build once, run anywhere status.  The software stack can be your own code, 3rd party code such as a database or some combination.

## The ps and kill Commands

Just like your operating system has a ps command, so too does Docker:

![docker_ps.png](/blog/assets/docker_ps.png)

Unlike your operating system where a simple number denotes a process id, Docker uses a git like hash for each process.

Just like your operating system has a kill command, so too does docker which you run with: 

> docker kill hash

The general syntax shown above of **docker** *command* is what you'll see below.  Normally there will be other options as well which you can see illustrated below.


## The Magic Eval Statement

If you get this message:

docker ps
Cannot connect to the Docker daemon at tcp://192.168.59.103:2376. Is the docker daemon running?

after running a docker ps or any docker command then its an issue of not being able to find the Docker daemon and then you need this bit of magic:

> eval $(docker-machine env ${C_DOCKER_MACHINE})

My bash skills are laughably bad so I'm not going to even try and explain that.  Just think of it as a magic spell given to you by an experienced wizard -- you don't have to understand how it works as long as it does.

## The images Command

Run the command docker images to find all the Docker images on your system.  You'll be surprised at how big some of these can be and they often will hang out on your system, just eating your disc space.  Just as an example, a prototype I played with using the tleyden5iwx/open-ocr-preprocessor OpenOcr image over a year ago is still on my system using 1.3 gigs of disc sapce.

## Disc Space Usage / Where Does All This Go?

The location of all your images varies by [operating system](http://stackoverflow.com/questions/19234831/where-are-docker-images-stored-on-the-host-machine).  On OSX it is stored under the virtual machine:

> ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2

Please keep in mind that you can use up a considerable amount of disc space just by experimenting with images.  Here's my system:

    du -hc ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
     21G	/Users/sjohnson/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
     21G	total

# Testing Different Languages

## Ruby

In case you're not a rubyist, I thought I'd start with this one.  [Ruby on Docker](https://hub.docker.com/r/library/ruby/tags/)

docker run --rm --name ruby -it ruby:2.4-alpine

## Elixir 

Elixir is a next generation functional language designed by some of the former Rails core members.  [Elixir on Docker](https://hub.docker.com/_/elixir/)

docker run --rm --name elixir -it elixir:1.4-slim

Here's what this process looks like while it runs:

![docker_elixir.png](/blog/assets/docker_elixir.png)

## PHP 7.1

PHP is, well, php.  Do I really need to say any more?  [PHP On Docker](https://hub.docker.com/r/library/php/tags/)

docker run --rm --name php -it php:7.1-alpine

## Python 2.7

Python is a dynamic scripting language similar to Ruby.  Python 2.7 is the mainstream version of Python.  [Python on Docker](https://hub.docker.com/_/python/)

docker run --rm --name python27 -it python:2.7-slim

## Python 3

Python 3 is a newer version of Python that hasn't been as widely adopted as the Python 2 family.

docker run --rm --name python33 -it python:3.3-slim

## R

I really, really like R for statistical analysis and data crunching.  [R on Docker](https://hub.docker.com/_/r-base/)

docker run --rm --name r-base -it r-base:3.4.0

R can be a bit different from other languages due to its mathematical orientation.  Here's a sample R one liner you can use to test it:

> print(sample(1:10))

[More R Examples](http://www.rexamples.com/)

## Perl

Perl in many ways is the grandfather to all modern web development.  Unlike the languages above, Perl isn't a REPL based language so you'll have to pass a script in when you run it.  [Perl on Docker](https://hub.docker.com/_/perl/)

 docker run -it --rm --name my-running-script -v "$PWD":/usr/src/myapp -w /usr/src/myapp perl:5.20 perl your-daemon-or-script.pl

## Julia

Julia is a high performance language used for finance and math that runs on top of the Java VM.  [Julia on Docker](https://hub.docker.com/_/julia/)

docker run -it --rm -v "$PWD":/usr/myapp -w /usr/myapp julia julia script.jl arg1 arg2

# Learning More About Docker

Most of what I know about Docker, I learned from The [Dive into Docker](https://diveintodocker.com/) course by Nick Janetakis.  Recommended.