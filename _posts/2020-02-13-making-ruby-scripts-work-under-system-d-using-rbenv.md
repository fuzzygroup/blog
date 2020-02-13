---
layout: post
title: Making Ruby Scripts work Under System D Using rbenv
category: ruby
tags: ["ruby", "systemd"]
---
{:.center}
![IMG_1840.jpg](/blog/assets/IMG_1840.jpg)

This has bit me I think every single time I make a SystemD launch script using ruby and rbenv (RVM is worse; imho). Perhaps writing it down for once makes the lesson stick.  

Let's start with our SystemD unit file that doesn't work:

    [Unit]
    Description=Twitter To Kafka
    
    [Service]
    SyslogIdentifier=twitter_to_kafka
    User=ubuntu
    PIDFile=/home/ubuntu/twitter_to_kafka/twitter_to_kafka.pid
    WorkingDirectory=/home/ubuntu/twitter_to_kafka
    
    ExecStart=/home/ubuntu/twitter_to_kafka/twitter_to_kafka.sh
    ExecReload=/home/twitter_to_kafka/twitter_to_kafka/twitter_to_kafka.sh
    ExecStop=/bin/kill -s QUIT $MAINPID
    Restart=always
    
    [Install]
    WantedBy=multi-user.target
    

This generates errors like these:

    ❯ sudo systemctl status twitter_to_kafka.service
    ● twitter_to_kafka.service - Twitter To Kafka
       Loaded: loaded (/lib/systemd/system/twitter_to_kafka.service; enabled; vendor preset: enabled)
       Active: failed (Result: exit-code) since Thu 2020-02-13 12:57:48 UTC; 1min 54s ago
      Process: 7615 ExecStart=/home/ubuntu/twitter_to_kafka/twitter_to_kafka.sh (code=exited, status=203/EXEC)
     Main PID: 7615 (code=exited, status=203/EXEC)

    Feb 13 12:57:48 ip-172-31-24-213 systemd[1]: twitter_to_kafka.service: Main process exited, code=exited, status=203/EXEC
    Feb 13 12:57:48 ip-172-31-24-213 systemd[1]: twitter_to_kafka.service: Failed with result 'exit-code'.
    Feb 13 12:57:48 ip-172-31-24-213 systemd[1]: twitter_to_kafka.service: Service hold-off time over, scheduling restart.
    Feb 13 12:57:48 ip-172-31-24-213 systemd[1]: twitter_to_kafka.service: Scheduled restart job, restart counter is at 5.
    Feb 13 12:57:48 ip-172-31-24-213 systemd[1]: Stopped Twitter To Kafka.
    Feb 13 12:57:48 ip-172-31-24-213 systemd[1]: twitter_to_kafka.service: Start request repeated too quickly.
    Feb 13 12:57:48 ip-172-31-24-213 systemd[1]: twitter_to_kafka.service: Failed with result 'exit-code'.
    Feb 13 12:57:48 ip-172-31-24-213 systemd[1]: Failed to start Twitter To Kafka.

The problem is that rbenv is a shell extension so the shell has to be loaded to run this correctly.  Just adding /bin/bash -lc to ExecStart and ExecReload fixes this.  Here's the actual working unit file:

    [Unit]
    Description=Twitter To Kafka

    [Service]
    SyslogIdentifier=twitter_to_kafka
    User=ubuntu
    PIDFile=/home/ubuntu/twitter_to_kafka/twitter_to_kafka.pid
    WorkingDirectory=/home/ubuntu/twitter_to_kafka

    ExecStart=/bin/bash -lc /home/ubuntu/twitter_to_kafka/twitter_to_kafka.sh
    ExecReload=/bin/bash -lc /home/twitter_to_kafka/twitter_to_kafka/twitter_to_kafka.sh
    ExecStop=/bin/kill -s QUIT $MAINPID
    Restart=always

    [Install]
    WantedBy=multi-user.target
    
Sample github file where I found [this](https://gist.github.com/unonasoft/48fd1df0f6a8a7a8e554632c9066178b).