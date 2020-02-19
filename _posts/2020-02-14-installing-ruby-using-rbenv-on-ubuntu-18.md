---
layout: post
title: Installing Ruby using rbenv on Ubuntu 18
category: ruby
tags: ["ruby"]
---
{:.center}
![IMG_1813.jpeg](/blog/assets/IMG_1813.jpeg)

[Rbenv](https://github.com/rbenv/rbenv) provides a powerful tool for installing ruby on whether on your local box or on your server environment.  While I have traditionally used [RVM](https://rvm.io/) for local ruby development, I have found RVM problematic for use in a server context.  As long as you are using bash -lc along with things like [CRON jobs or System D](https://fuzzyblog.io/blog/ruby/2020/02/13/making-ruby-scripts-work-under-system-d-using-rbenv.html), rbenv seems to be a great server side tool.

My inspiration for this came from the [Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-16-04) docs.  As always, Digital Ocean does a great job on documentation.

Here are the steps to get rbenv installed:

    sudo apt-get install rbenv
    rbenv
    sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    rbenv install -l | grep 2.7.0
    rbenv install 2.7.0
    rbenv global 2.7.0

Here are the lines from my history file showing my flailing as I attempted to get rbenv installed.

    307  rbenv
    308  rbenv install 2.7.0
    309  rbenv install --list | grep 2.7
    310  cd ~/.rbenv/plugins/ruby-build
    311  which ruby-build
    312  /usr/bin/ruby-build --version
    313  cd ~/.rbenv/plugins/ruby-build
    314  sudo apt-get upgrade ruby-build
    315  /usr/bin/ruby-build --version
    316  rbenv install --list | grep 2.7
    317  sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
    318  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    319  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    320  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    321  source ~/.bashrc
    322  type rbenv
    323  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    324  rbenv install -l
    325  rbenv install -l | grep 2.7.0
    326  rbenv install 2.7.0
    327  rbenv global 2.7.0
    328  pwd
