---
layout: post
title: Installing Ruby using rbenv on Ubuntu 18
category: ruby
tags: ["ruby"]
---
Rbenv provides a powerful tool for installing ruby on whether on your local box or on your server environment.  While I have traditionally used RVM for local ruby development, I have found RVM problematic for use in a server context.  As long as you are using bash -lc 

https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-16-04

306  sudo apt-get install rbenv
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
