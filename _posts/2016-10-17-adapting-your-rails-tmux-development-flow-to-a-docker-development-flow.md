---
layout: post
title: Adapting your Rails Tmux Development Flow to a Docker Development Flow
category: docker
tags: ["rails", "docker", "tmux"]
---
I first experimented with Docker back in summer of 2014 when I was bringing up a new data center and experimenting with development tools.  My buddy [Dv](http://dasari.me) remembers this all too well. This was back in the days where compose was still called fig and nothing actually worked all that well.  And since it didn't work all that well, I quickly noped away.  But, even then, Docker had the feel of something important, something seminal.  Fast forward two years and Docker is all the rage and a bright luminary in the tech world.

As a long time engineer, and yes you can translate that to "old guy", I'm naturally conservative.  And, as such, I haven't moved to Docker as part of my primary development flow.  To this point I've been using Docker as a way to treat applications as APIs and I've had a lot of success with that.  However, after a recent [unmitigated disaster](https://fuzzygroup.github.io/blog/ruby/2016/10/15/brew-xz-and-nokogiri-and-tmux-an-unmitigated-disaster.html), involving the wonderful but troubled Nokogiri, I'm far more willing to explore Docker.

In this blog post I'm going to use my open source [AWS Monitor](https://github.com/fuzzygroup/aws_monitor) codebase as the example.  This is a Rails application that is basically a Rake task which monitors a series of Ansible hosts to make sure that you can ssh into them.  It was written as part of my [AWS / SSH hell period](https://fuzzygroup.github.io/blog/tag.html#ssh) where I had a large application on AWS where the SSH servers would stay alive no longer than about 30 minutes. 

# My Personal Development Flow

I have a personal development flow that could essentially be described as "Lots and lots of terminal windows".  I use a terminal window to represent each of the "stages" of Rails development:

* running server
* generic command line
* command line for deploy
* rails console
* test results
* database sql window

I used to manage all this with tabs in a terminal window but as I added more and more rails projects to my workflow that tended not to scale up.  Now my approach is to use the combination of [Tmux](https://tmux.github.io) and [Tmuxinator](https://github.com/tmuxinator/tmuxinator), two open source projects.  Tmux acts as a virtual window manager allowing one terminal to front any number of character applications and Tmuxinator acts as an easy to use configuration manager for Tmux.  Here's a picture of my typical approach to development:

tmux_rails_dev_flow.png

# 
