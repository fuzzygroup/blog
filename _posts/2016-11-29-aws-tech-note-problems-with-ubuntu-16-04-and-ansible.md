---
layout: post
title: AWS Tech Note - Problems with Ubuntu 16.04 and Ansible
category: aws
tags: ["aws", "ansible", "ubuntu", "python"]
---
When i started going heavy down the path of AWS, Ubuntu 14.04 was the default Ubuntu in AWS and it appeared at the top of the Operating System list when you built a new EC2 server.  I've run Ubuntu for **years** ever since I asked [Matt](https://ma.tt/) what distro WordPress used and he replied Ubuntu.  *blink*  At the time I looked at Ubuntu as a personal distro but, hey, if it is good enough for WordPress then it is good enough for my crappy, little farm of boxes.  And so I've been in Ubuntu ever since.

Today was the first bad Ubuntu experience that I've really ever had.  What happened was I went to bring up a new EC2 instance and I noticed that the default Ubuntu was now 16.04.  Hm... That's different but I'll try it.  So I trot out my ansible playbook and here's what happened:

    ansible-playbook -i inventories/proxy playbook_appdata_proxy.yml

    PLAY [all] *********************************************************************

    TASK [setup] *******************************************************************
    fatal: [adproxy2]: FAILED! => {"changed": false, "failed": true, "module_stderr": "", "module_stdout": "/bin/sh: 1: /usr/bin/python: not found\r\n", "msg": "MODULE FAILURE", "parsed": false}
    fatal: [adproxy1]: FAILED! => {"changed": false, "failed": true, "module_stderr": "", "module_stdout": "/bin/sh: 1: /usr/bin/python: not found\r\n", "msg": "MODULE FAILURE", "parsed": false}

    NO MORE HOSTS LEFT *************************************************************
    [WARNING]: Could not create retry file 'playbook_appdata_proxy.retry'.         [Errno 2] No such file or directory: ''


    PLAY RECAP *********************************************************************
    adproxy1                   : ok=0    changed=0    unreachable=0    failed=1
    adproxy2                   : ok=0    changed=0    unreachable=0    failed=1

What??? There error is here: **"/bin/sh: 1: /usr/bin/python: not found\r\n"**.  Apparently Python is NOT a default install on Ubuntu 16.04 LTS.  That means that you can't use Ansible to bootstrap a box into functionality until you've first installed Python.

One of the single best attributes of Ansible is that you don't have to install anything to use it -- until now.  Unlike tools like Chef or Puppet which require an agent to be installed, Ansible has always just required nothing but python.  And since python used to be a default install you could trivially just "ansible-ize" a box into functionality.  This is a huge deal.  Happily Ubuntu 14.04 is still available -- you just have to dig down to the very bottom of the Operating Systems list to find it.

And yes I'm absolutely certain that there are very real reasons why I want 16.04 instead of 14.04 but at least for now the operational benefits of being able to bring a box up with Ansible far, far outweigh them.