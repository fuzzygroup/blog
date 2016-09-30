---
layout: post
title: Ansible Tutorial 01 - Examples of Ansible Ad Hoc Commands
category: ansible
tags: ["ansible", "ad_hoc"]
---
My writing progress has slowed as of late while I have gone 100% heads down on learning Ansible.  Ansible is a provisioning tool which lets you describe a machine or machines as well as how you want them configured.  Ansible also offers an ad hoc mode where you can operate on a group of machines and execute a command or commands.  These examples are based on an Ansible inventory file located in the directory inventories/ as follows:

    file: inventories/production_actual
    
    [web]
    # format - english machinename   ssh host   ssh private key
    web1  ansible_ssh_host=ec2-52-41-237-52.us-west-2.compute.amazonaws.com  ansible_ssh_private_key_file=/Users/sjohnson/.ssh/fi_nav_sitecrawl.pe
    
    [db]
    
    [log]
    
Note - in my actual inventory file there are machines in each group section.

Here are some examples:

Execute uptime against all machines in the inventories file with the user ubuntu:

    **ansible all -i inventories/production_actual -u ubuntu -a "uptime"**
    ec2-52-39-100-178.us-west-2.compute.amazonaws.com | success | rc=0 >>
     17:09:56 up 36 days,  4:05,  4 users,  load average: 0.99, 1.00, 0.97

    ec2-52-89-105-4.us-west-2.compute.amazonaws.com | success | rc=0 >>
     17:10:06 up 23 days,  4:17,  2 users,  load average: 0.69, 0.53, 0.54

    ec2-54-68-16-169.us-west-2.compute.amazonaws.com | success | rc=0 >>
     17:11:43 up 22 days,  9:11,  2 users,  load average: 0.93, 0.93, 0.89

    ec2-52-42-166-105.us-west-2.compute.amazonaws.com | success | rc=0 >>
     17:11:23 up 31 days,  7:26,  2 users,  load average: 0.00, 0.02, 0.05

    52.40.224.171 | success | rc=0 >>
     17:10:54 up 20 days, 23:42,  1 user,  load average: 0.08, 0.04, 0.05

Execute uptime against all machines in the db group in the inventories file with the user ubuntu:

    **ansible db -i inventories/production_actual -u ubuntu -a "uptime"**
    ec2-52-39-100-178.us-west-2.compute.amazonaws.com | success | rc=0 >>
     17:11:13 up 36 days,  4:06,  4 users,  load average: 0.90, 0.97, 0.96
    
You can also use this to do things like check the amount of free disc space on every box.

    **ansible all -i inventories/production_actual -u ubuntu -a "df -h"**
    ec2-54-68-16-169.us-west-2.compute.amazonaws.com | success | rc=0 >>
    Filesystem      Size  Used Avail Use% Mounted on
    udev            7.5G   12K  7.5G   1% /dev
    tmpfs           1.5G  376K  1.5G   1% /run
    /dev/xvda1      7.8G  3.9G  3.5G  53% /
    none            4.0K     0  4.0K   0% /sys/fs/cgroup
    none            5.0M     0  5.0M   0% /run/lock
    none            7.5G     0  7.5G   0% /run/shm
    none            100M     0  100M   0% /run/user

    ec2-52-42-166-105.us-west-2.compute.amazonaws.com | success | rc=0 >>
    Filesystem      Size  Used Avail Use% Mounted on
    udev            492M   12K  492M   1% /dev
    tmpfs           100M  368K   99M   1% /run
    /dev/xvda1      7.8G  3.7G  3.7G  51% /
    none            4.0K     0  4.0K   0% /sys/fs/cgroup
    none            5.0M     0  5.0M   0% /run/lock
    none            497M     0  497M   0% /run/shm
    none            100M     0  100M   0% /run/user

    ec2-52-89-105-4.us-west-2.compute.amazonaws.com | success | rc=0 >>
    Filesystem      Size  Used Avail Use% Mounted on
    udev            7.5G   12K  7.5G   1% /dev
    tmpfs           1.5G  376K  1.5G   1% /run
    /dev/xvda1       16G  3.9G   11G  27% /
    none            4.0K     0  4.0K   0% /sys/fs/cgroup
    none            5.0M     0  5.0M   0% /run/lock
    none            7.5G     0  7.5G   0% /run/shm
    none            100M     0  100M   0% /run/user

    ec2-52-39-100-178.us-west-2.compute.amazonaws.com | success | rc=0 >>
    Filesystem      Size  Used Avail Use% Mounted on
    udev             32G   12K   32G   1% /dev
    tmpfs           6.3G  400K  6.3G   1% /run
    /dev/xvda1      2.0T  1.4T  557G  71% /
    none            4.0K     0  4.0K   0% /sys/fs/cgroup
    none            5.0M     0  5.0M   0% /run/lock
    none             32G     0   32G   0% /run/shm
    none            100M     0  100M   0% /run/user

    52.40.224.171 | success | rc=0 >>
    Filesystem      Size  Used Avail Use% Mounted on
    udev            3.9G   12K  3.9G   1% /dev
    tmpfs           799M  484K  798M   1% /run
    /dev/xvda1      7.8G  5.6G  1.9G  76% /
    none            4.0K     0  4.0K   0% /sys/fs/cgroup
    none            5.0M     0  5.0M   0% /run/lock
    none            3.9G     0  3.9G   0% /run/shm
    none            100M     0  100M   0% /run/user

Ensure that a package is installed; don't update it if it isn't
    
    **ansible all -i inventories/production_actual -u ubuntu -m apt -a "name=tree state=present"**
    ec2-52-39-100-178.us-west-2.compute.amazonaws.com | success >> {
        "changed": false
    }

    ec2-52-89-105-4.us-west-2.compute.amazonaws.com | success >> {
        "changed": false
    }

    ec2-54-68-16-169.us-west-2.compute.amazonaws.com | success >> {
        "changed": false
    }

    ec2-52-42-166-105.us-west-2.compute.amazonaws.com | success >> {
        "changed": false
    }

    52.40.224.171 | success >> {
        "changed": false
    }
    
    **ansible all -i inventories/production_actual -u ubuntu --become -m apt -a "name=htop state=present"**


References:

  * [http://edunham.net/2015/06/08/playing_with_ansible.html](http://edunham.net/2015/06/08/playing_with_ansible.html)   This is a very good read.
  * [http://docs.ansible.com/ansible/intro_adhoc.html](http://docs.ansible.com/ansible/intro_adhoc.html)
    
As always thanks to [Dv](http://dasari.me) who pushed me off the proverbial Ansible cliff and has supported me all the way down the learning curve.  