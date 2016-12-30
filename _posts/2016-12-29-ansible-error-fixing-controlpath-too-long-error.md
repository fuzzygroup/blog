---
layout: post
title: Ansible Error Fixing ControlPath Too Long Error
category: ansible
tags: ["ansible", "osx"]
---
If you get the ansible error *ControlPath Too Long Error* then all you need to do is create an ansible.cfg file in the directory where you run your playbook.  Please note that this is generally an OSX only error related to the length of the .  Then you need to add this line to it:

    [ssh_connection]
    control_path = %(directory)s/%%h-%%r
    
There are other options that can go here as well.