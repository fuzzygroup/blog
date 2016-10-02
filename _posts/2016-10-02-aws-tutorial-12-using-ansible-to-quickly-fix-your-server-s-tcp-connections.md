---
layout: post
title: AWS Tutorial 12 - Using Ansible to Quickly Fix Your Server's TCP Connections
category: aws
tags: ["aws", "ansible", "redis"]
---
The bulk of my coding is actually back end coding and I spent a lot of time dealing with network programming issues.  We've been running for years in a data center that I put together and every box was finely tuned.  Unfortunately due to the massive issues surrounding Chef, we were never able to maintain boxes automatically so every server became a unique snowflake -- well set up and such but I have no idea now what changes we made to tune each server over the years.

And while we still have that data center active, we're now crawling on our AWS boxes and much happier but we're still working the kinks out.  This morning I started seeing this appear:

    Cannot assign requested address.
    
It was appearing in the context of our Redis connections.  And, sure enough, we had a routine which was creating a handle to redis every, single, time it was handling a url.  That's bad.  So the easy fix was to pass the connection in from a higher level.  But even after that it was still an issue.  Some quick research brought me to:

* [https://stackoverflow.com/questions/10980850/solveredis-localhost6379-cannot-assign-requested-address](https://stackoverflow.com/questions/10980850/solveredis-localhost6379-cannot-assign-requested-address)
* [http://redis4you.com/articles.php?id=012&name=redis](http://redis4you.com/articles.php?id=012&name=redis)
 
Apparently the recommended solution is to fix a running box with:

    echo 1 > /proc/sys/net/ipv4/tcp_tw_reuse

and put the same fix into:

     /etc/rc.local 
     
# How to Ansible-ize This
     
Given that we have a bunch of AWS nodes setup, I don't really want to make this change manually so let's script it with Ansible and run it as a role.  Here's what to do for the directory where your Ansible stuff resides:

* mkdir -p roles/machine_setup_tcp_tw_reuse/tasks
* touch roles/machine_setup_tcp_tw_reuse/tasks/main.yml

In your main.yml file you want this code:

    # this sets it for the machine permanently after the machine restarts
    - name: update /etc/rc.local for tcp_tw_reuse (faster tcp recycling) on machines which are servers 
      lineinfile: dest=/etc/rc.local regexp="^echo 1 > "  line="echo 1 > /proc/sys/net/ipv4/tcp_tw_reuse"
  
    # this fixes the current machine state
    - name: execute the fix on the currently running machine instance
      shell: "echo 1 > /proc/sys/net/ipv4/tcp_tw_reuse"
      
In your main playbook.yml you want to call this:

    - hosts: all
      become: yes
      remote_user: ubuntu
      roles:
    - { role: machine_setup_tcp_tw_reuse, tags: machine_setup_tcp_tw_reuse}
    
# How to Run this

You can run this using the following syntax:

    ansible-playbook -i inventories/production_actual playbook.yml --tags "machine_setup_tcp_tw_reuse"
    
# How to Verify the Fix

To verify this, you can do what I did:

* ssh into a box
* cat /proc/sys/net/ipv4/tcp_tw_reuse

If you see a 1 there then the fix actually worked.

# Notes

The reason for the small level of granularity on this role is that I'm now using Ansible to fix issues on production running hosts.  And I wanted to be able to run **just** this role.  Ansible has tagging which I do believe would let me have this embedded within my overall machine_setup task but this felt safer since I'm still a noob at Ansible.