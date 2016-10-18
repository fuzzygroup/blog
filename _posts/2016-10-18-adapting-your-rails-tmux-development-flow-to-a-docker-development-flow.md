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

![tmux_rails_dev_flow.png](/blog/assets/tmux_rails_dev_flow.png)

I can call this interface up with ` (my meta key) and then go up and down between the different virtual terminal windows.  If you're really sophisticated with Tmux / Tmuxinator you can actually compose up a real IDE but that's a level of terminal nerdery that I don't go to (at least for now).

Given that all Rails apps are essentially the same architecture, this approach serves me well -- it makes all the resources I need for Rails development no more than a few arrow keys away.

# Adapting this for Docker

If you think about how Docker works then adapting this isn't readily apparent.  And then you talk with a [Docker expert](http://www.nickjanetakis.com/) and he teaches you how to [attach to a running container](https://docs.docker.com/engine/reference/commandline/attach/) and you start to get a glimmer of how to do this.  But then, when you stop for lunch, it might all fly out of your head.  That's ok -- it happened to me -- but then I woke out of a dead sleep at 2 am two nights ago with all of this crystal clear.  And that's when I wrote most of this.

The realization that I had at 2 am was as follows:

* Use the Tmux window to run the docker-compose up --build 
* Use another Tmux window to attach to it

# Example 1 for Aws Monitor - My Local aws_monitor_local.yml

My [AWS Monitor code base](https://github.com/fuzzygroup/aws_monitor) is the one I chose to adapt for this.  Here's the local Tmuxinator file I use to run this (note since this is is such a minimal rails app, it only has two terminal windows):

    # http://projectidealism.com/posts/2013/9/20/my-tmux-configuration-with-tmuxinator
    # ~/.tmuxinator/tula.yml
    # you can make as many tabs as you wish...

    # NOTE -- this file belongs wherever tmuxinator looks for its configuration files

    project_name: aws_monitor_local_aws
    project_root: ~/Dropbox/fuzzygroup/rails/aws_monitor
    socket_path: /tmp/tmux-aws-monitor
    pre_tab: rvm use ruby-2.3.1@aws_monitor
    windows:
      - cmdline:
      - console1: bundle exec rails c
    

# Example 2 for Aws Monitor - My Local aws_monitor_docker.yml

Here's the equivalent for Docker:

    # http://projectidealism.com/posts/2013/9/20/my-tmux-configuration-with-tmuxinator
    # ~/.tmuxinator/tula.yml
    # you can make as many tabs as you wish...

    # NOTE -- this file belongs wherever tmuxinator looks for its configuration files

    project_name: aws_monitor_local_aws
    project_root: ~/Dropbox/fuzzygroup/rails/aws_monitor
    socket_path: /tmp/tmux-aws-monitor
    #pre_tab: rvm use ruby-2.3.1@aws_monitor
    windows:
      - run_docker: cd ~/Dropbox/fuzzygroup/rails/aws_monitor && docker-compose up --build
      - attach1: docker exec -it -v /Users:/Users awsmonitor_website_1 bash
    
# Dockerfile

My Dockerfile file for the aws_monitor app isn't terribly interesting but it does have one interesting thing -- it ends with a CMD statement which runs a rake task:

    CMD rake aws_monitor:ansible_hosts --trace 

Since all we're looking for aws_monitor to do is run continuously checking the ability to ssh into boxes, this is fine. 

# docker-compose.yml

Here's the docker-compose.yml file 

    version: '2'

    services:
      postgres:
        image: 'postgres:9.5'
        environment:
          POSTGRES_USER: 'orats_base'
          POSTGRES_PASSWORD: 'yourpassword'
        ports:
          - '5432:5432'
        volumes:
          - 'postgres:/var/lib/postgresql/data'

      redis:
        image: 'redis:3.2-alpine'
        command: redis-server --requirepass yourpassword
        ports:
          - '6379:6379'
        volumes:
          - 'redis:/var/lib/redis/data'

      website:
        depends_on:
          - 'postgres'
          - 'redis'
        build: .
        ports:
          - '3000:3000'
        volumes:
          - '/Users:/Users'
          - '.:/orats_base'
          #- '/Users/sjohnson/.ssh/:/ssh_stuff'
          #- '/Users/sjohnson/Dropbox/music_alerts/:/music_alerts'
        env_file:
          - '.env'

      sidekiq:
        depends_on:
          - 'postgres'
          - 'redis'
        build: .
        command: sidekiq -C config/sidekiq.yml.erb
        volumes:
          - '.:/orats_base'
        env_file:
          - '.env'

      cable:
        depends_on:
          - 'redis'
        build: .
        command: puma -p 28080 cable/config.ru
        ports:
          - '28080:28080'
        volumes:
          - '.:/orats_base'
        env_file:
          - '.env'

    volumes:
      redis:
      postgres:
      
The one interesting thing here is this line:

    volumes:
      - '/Users:/Users'
    
What this does is map my mac's host filesytem into the Docker filesystem.  The reason I'm doing this is that my aws_monitor code needs access to my PEM certificate for the SSH login (among other files).  By mapping this in as a logical volume I don't have to have have my PEM file as a part of my git repo.  I also don't have to worry about Figaro or another approach to environment configuration.

# Conclusion

Docker is still new to me and I'm still fine tuning this but I do think it has real potential.