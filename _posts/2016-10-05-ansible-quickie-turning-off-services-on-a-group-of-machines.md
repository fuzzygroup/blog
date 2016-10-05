---
layout: post
title: Ansible Quickie - Turning Off Services On A Group of Machines
category: ansible
tags: ["ansible", "devops", "services"]
---
In my continuing investigation of [SSH failures on my cluster of AWS boxes](https://fuzzygroup.github.io/blog/aws/2016/10/01/aws-tutorial-10-diagnosing-ssh-failures-or-when-ping-works-but-ssh-fails.html), I've noticed that sendmail is running on my boxes and NOT refusing connections.  I'm not an ops guy but I can't think that this is good.  Here's what I'm seeing:

    tail -f /var/log/syslog
    
    Oct  5 08:10:01 ip-172-31-32-56 sm-mta[25939]: u958A1I6025939: from=<root@ip-172-31-32-56.us-west-2.compute.internal>, size=888, class=0, nrcpts=1, msgid=<201610050810.u958A1eD025938@ip-172-31-32-56.us-west-2.compute.internal>, proto=ESMTP, daemon=MTA-v4, relay=localhost [127.0.0.1]
    
# Stopping Services with Ansible    
    
I don't have a port open for sendmail in my security group so this confuses me but it should be easy enough to add an ansible role to my playbook to address it.  Here are the steps:

    cd ~/wherever_your_ansible_root_is
    mkdir -p roles/services/tasks
    touch roles/services/tasks/main.yml
    
In main.yml add:

    - name: stop_sendmail
      service: name=sendmail state=stopped
  
    - name: stop_apache2
      service: name=apache2 state=stopped
    
I added the routines to stop my apache2 instances because I'm not actually using them yet and any part of an attack surface that I can reduce might increase the chance of these boxes staying running longer.  Ideally they should be on a private internal network that isn't exposed to the world at all.  And that's coming but that's a level of work I can't do this very minute.

In my main playbook simply call this role:

    - { role: services, tags: services }
    
You should note that I'm calling that role as the very last role since it does no good to stop a service before its created.  According to the [ansible service module docs](http://docs.ansible.com/ansible/service_module.html), the options for state are:

  * running
  * started
  * stopped
  * restarted
  * reloaded
    
# Proof

Here's an example of a ps test on this before and after:

**Before:**

    ps auwwx | grep sendmail
    root      1447  0.0  0.0 100704  2628 ?        Ss   08:26   0:00 sendmail: MTA: accepting connections
    ubuntu    2958  0.0  0.0  10460   940 pts/0    S+   08:31   0:00 grep --color=auto sendmail
    
**After:**    

    ps auwwx | grep sendmail
    ubuntu    8485  0.0  0.0  10460   940 pts/0    S+   08:37   0:00 grep --color=auto sendmail
