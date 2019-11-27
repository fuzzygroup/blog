---
layout: post
title: Using Eternal Terminal with OSX and AWS Including Ansible Support
category: aws
tags: ["aws", "eternal_terminal", "osx"]
---
{:.center}
![IMG_9163.jpeg](/blog/assets/IMG_9163.jpeg)

I know, I know -- it is 2019 and we're not supposed to be SSH'ing into boxes -- but, really, you're going to do it anyway.  And if you are going to ssh into boxes then, for heaven's sake, let's get rid of that stupidity that is your SSH terminal disconnecting whenever there is a simple blip in connectivity.

[Eternal Terminal](https://eternalterminal.dev/), ET, is a mature Open Source project that purports to solve SSH disconnects.  I say "purports" because I have only just installed it and this blog post is my proof of concept to see how well it works.  I'm essentially SSH'd into some box or another roughly 10 to 12 hours a day, 5 to 7 days a week.

**Note**: You can strike purports in the above paragraph.  I've now been using Eternal Terminal though a variety of network conditions including changing my wifi connection with long running processes and it works great. I do not understand the deviltry that drives this pretty damn amazing bit of software but I sure do like it.

## Overview

Here's what you need to do to use ET on a local OSX to remote AWS context:

1. You need to install ET (client) on your OSX box.
2. You need to install ET (server) on your Linux server.
3. You need to start ET (server) on your Linux server.
3. You need to open port 2022 on your AWS security group.
4. You need to adjust your SSH login statements.
5. You may want to use an Ansible Playbook to install ET on your server.

### Installing ET on OSX

Here's how to install ET on OSX:

    brew install MisterTea/et/et

### Installing ET on your Server

Here's how to install ET on Ubuntu:

    sudo apt-get install -y software-properties-common
    sudo add-apt-repository ppa:jgmath2000/et
    sudo apt-get update
    sudo apt-get install et

### Starting Eternal Terminal on Your Server

After installation, ET should start automatically.  You can check its status with:

    systemctl status et

You should see something like this if ET is running:

    ● et.service - Eternal Terminal
       Loaded: loaded (/lib/systemd/system/et.service; enabled; vendor preset: enabled)
       Active: active (running) since Tue 2019-11-26 21:37:24 UTC; 22min ago
      Process: 6052 ExecStart=/usr/bin/etserver --daemon --cfgfile=/etc/et.cfg (code=exited, status=0/SUCCESS)
     Main PID: 6061 (etserver)
        Tasks: 10 (limit: 4915)
       CGroup: /system.slice/et.service
               └─6061 /usr/bin/etserver --daemon --cfgfile=/etc/et.cfg

    Nov 26 21:37:23 ip-172-31-3-194 systemd[1]: Starting Eternal Terminal...
    Nov 26 21:37:23 ip-172-31-3-194 systemd[1]: et.service: Can't open PID file /var/run/etserver.pid (yet?) after
    Nov 26 21:37:24 ip-172-31-3-194 systemd[1]: Started Eternal Terminal.

### Opening Port 2022 on Your Security Group

Eternal Terminal on the server relies on port 2022 being open.  This needs to be done at your AWS security group.  Here's how to do this:

1. Log into console.aws.amazon.com in a browser.
2. Go into EC2 instances.
3. Open Security Groups from the sidebar.
4. Select the Inbound tab.
5. Click the Edit button.
6. Click the Add Rule button.
7. In the Port Range field enter **2022**.
8. In the source field, enter **0.0.0.0/0**.
9. Click the Save button.

### Changing Your SSH Login Statement

My normal ssh statement looks like this:

    ssh -i "~/Downloads/adl_fuzzygroup.pem" ubuntu@xx.yy.zz.aa

To use ET, you need to have a "ssh statement" like this:

    et ubuntu@xx.yy.zz.aa -i "~/Downloads/adl_fuzzygroup.pem"

### An Ansible Playbook to Automate Server Setup

If you have more than one server on AWS, you should be using a DevOps tool like Ansible to automate machine setup.  Here's a sample playbook:

    ---

    - name: Configure servers for use with Eternal Terminal
      hosts: all
      become: true
      remote_user: ubuntu
      tasks:
        - name: Install system packages
          apt: pkg={{ item }} state=latest install_recommends=no
          with_items:
            - software-properties-common

        - name: Add Ansible PPA
          apt_repository: repo="ppa:jgmath2000/et" update_cache=no

        - name: Update APT cache
          apt: update_cache=yes

        - name: Install system packages
          apt: pkg={{ item }} state=latest install_recommends=no
          with_items:
            - et
            
Save the above to playbook_install_et.yml and then run it with a statement like this:

    ansible-playbook -i inventories/inventory.txt playbook_install_et.yml
        

## References

* [Eternal Terminal Home Page](https://eternalterminal.dev/)
* [Github Eternal Terminal](https://github.com/MisterTea/EternalTerminal)
* [Hacker News Discussion](https://news.ycombinator.com/item?id=21640200)