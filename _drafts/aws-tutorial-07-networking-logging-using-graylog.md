---
layout: post
title: AWS Tutorial 07 - Networking Logging Using Graylog
category: AWS
tags: ["aws", "logs"]
---

One of the core ideas in cloud computing is that if machine instances can dynamically come up and down then data should not be stored on them.

1.  Build an aws image using ubuntu 14.04 trusty
2.  Get the docker tools on it
3.  You're going to need this [docker compose file from Github](https://github.com/fuzzygroup/graylog).


curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

  239  ls ../
  240  ls ../..
  241  tmn
  242  tmn winstongraylog
  243  exit
  244  tmn winstongraylog
  245  pwd
  246  cd ~/
  247  pwd
  248  mdkir graylog
  249  mkdir graylog
  250  cd graylog
  251  vim docker-compose.yml
  252  vim docker-compose.yml
  253  mkdir config
  254  cd config
  255  which wget
  256  wget https://raw.githubusercontent.com/Graylog2/graylog2-images/2.1/docker/config/graylog.conf
  257  wget https://raw.githubusercontent.com/Graylog2/graylog2-images/2.1/docker/config/log4j2.xml
  258  cd ..
  259  docker-compose up -d
  260  docker
  261  docker version
  262  uname -r
  263  dockder
  264  docker
  265  docker version
  266  curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  267  sudo curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  268  service docker start
  269  sudo service docker start
  270  docker version
  271  sudo su curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  272  tma graylog
  273  sudo su -
  274  ls
  275  cd graylog
  276  ls
  277  less docker-compose.yml
  278  tmn graylog
  279  cd ~/graylog/
  280  ls
  281  history
  
  
  -------
  
  
  59  exit
  60  cd /var/log/apache2/
  61  ls
  62  ls -ltr
  63  tail -f error.log
  64  apache2ctl restart
  65  /etc/init.d/apache2 restart
  66  ls -ltr
  67  tail -f error.log
  68  which passenger
  69  tail -f error.log
  70  curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  71  exit
  72  cd /home/ubuntu/graylog/
  73  ls
  74  docker-compose up
  75  ls -l /usr/local/bin/d*
  76  exit
  77  history
  
  
  usermod -aG docker ubuntu
  
  
  open 12900
  open 9000
  
  Need a 16 gig box
  
  
  http://docs.graylog.org/en/2.1/pages/installation/docker.html#requirements