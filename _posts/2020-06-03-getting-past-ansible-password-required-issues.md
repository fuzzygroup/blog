---
layout: post
title: Getting Past Ansible Password Required Issues
category: ansible
tags: ["ansible"]
---
{:.center}
![IMG_2655.jpeg](/blog/assets/IMG_2655.jpeg)

I recently had the situation where I needed to run an Ansible task on a user which I sudo su'd into i.e.:

    sudo su jenkins
    
I then ran my Ansible task and I repeatedly got this error:

    TASK [zzet.rbenv : update apt cache] ****************************************************************************************************************
    fatal: [localhost]: FAILED! => {"changed": false, "module_stderr": "sudo: a password is required\n", 
    "module_stdout": "", "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error", "rc": 1}
    
The underlying issue was that most of the tasks in the playbook used:

    become: true
    
which says to Ansible "run this as a sudo operation" and, given that I was already sudo'd into this account, that proved to be a failure.  I puzzled over this for a bit and then realized that all I needed to do was grant the jenkins account passwordless sudo access via the command:

    sudo visudo
    
by adding this line to the end of the sudoers file that visudo edits:

    jenkins    ALL=(ALL) NOPASSWD:ALL
    
**Note**: I made sure to remove the jenkins account from visudo after this was done to prevent any issues related to sudo exploits and this user.