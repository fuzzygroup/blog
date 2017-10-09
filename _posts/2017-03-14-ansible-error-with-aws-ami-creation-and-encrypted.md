---
layout: post
title: Ansible Error with AWS, AMI Creation and Encrypted
description: Hitting bizarre AWS / Ansible errors that reference encrypted?  Try upgrading boto.
category: aws
tags: ["aws"]
---
Here is a bizarre Ansible / AWS error I just found:

    An exception occurred during task execution. To see the full traceback, use -vvv. The error was: TypeError: __init__() got an unexpected keyword argument 'encrypted'
    fatal: [localhost]: FAILED! => {"changed": false, "failed": true, "module_stderr": "Traceback (most recent call last):\n  File \"/tmp/ansible_prCPvG/ansible_module_ec2_ami.py\", line 560, in <module>\n    main()\n  File \"/tmp/ansible_prCPvG/ansible_module_ec2_ami.py\", line 552, in main\n    create_image(module, ec2)\n  File \"/tmp/ansible_prCPvG/ansible_module_ec2_ami.py\", line 381, in create_image\n    bd = BlockDeviceType(**device)\nTypeError: __init__() got an unexpected keyword argument 'encrypted'\n", "module_stdout": "", "msg": "MODULE FAILURE"}
    
A quick google revealed [this solution](https://github.com/ansible/ansible-modules-core/issues/1773):

> pip install boto --upgrade

which I had to execute as:

> sudo pip install boto --upgrade