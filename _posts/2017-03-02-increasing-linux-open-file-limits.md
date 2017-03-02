---
layout: post
title: Increasing Linux Open File Limits
category: linux
tags: ["linux", "sys_admin", "sidekiq"]
description: When you hit open file limits in Linux you can get past them by editing your config files.  This post shows you the config files to edit and how to diagnose your file limits.
---
So [Winston](http://winstonkotzan.com/) found this log message in our logs today:

    2017-03-02T18:18:31.561Z 32313 TID-osjfdq3bg ERROR: !!! ERROR HANDLER THREW AN ERROR !!!
    2017-03-02T18:18:34.696Z 32313 TID-osjfdq3bg ERROR: Too many open files @ rb_sysopen - /proc/meminfo

We were running a large data processing job using sidekiq for running our queue and this was causing the queue to stop being processed.  As the resident *nix nerd, this one was on me.  A quick google on increasing open file limits gave me a tutorial from [Easy Engine](https://easyengine.io/tutorials/linux/increase-open-files-limit/) and the information was good but I think it could be documented better so here is the process I used.

# Step 1: Diagnosis 

Figure out what your limits actually are.  Given that these can be set on a per user basis you want to first diagnose them.  I'm using the user ubuntu so here's the command line you need:

> sudo su - ubuntu -c 'ulimit -aHS' -s '/bin/bash'

Here's the result:

    sudo su - ubuntu -c 'ulimit -aHS' -s '/bin/bash'
    core file size          (blocks, -c) 0
    data seg size           (kbytes, -d) unlimited
    scheduling priority             (-e) 0
    file size               (blocks, -f) unlimited
    pending signals                 (-i) 122314
    max locked memory       (kbytes, -l) 64
    max memory size         (kbytes, -m) unlimited
    open files                      (-n) 1024
    pipe size            (512 bytes, -p) 8
    POSIX message queues     (bytes, -q) 819200
    real-time priority              (-r) 0
    stack size              (kbytes, -s) 8192
    cpu time               (seconds, -t) unlimited
    max user processes              (-u) 122314
    virtual memory          (kbytes, -v) unlimited
    file locks                      (-x) unlimited
    
Clearly a limit of 1024 sounds low.  

# Step 2: Fixing

The configuration file that you need to edit is: /etc/security/limits.conf.  Edit this with:

>  sudo vi /etc/security/limits.conf

Add to the end of this file the following content:

    *         hard    nofile      999999
    *         soft    nofile      999999
    root      hard    nofile      999999
    root      soft    nofile      999999
    
Save the file and exit.

# Step 3: Log Out

For these changes to take effect you need to log out.  Do that now with **exit**.

# Step 4: Login and Re-Diagnose

Log back into the server and run the diagnosis step again:

> sudo su - ubuntu -c 'ulimit -aHS' -s '/bin/bash'

This time you should see something like:

    core file size          (blocks, -c) 0
    data seg size           (kbytes, -d) unlimited
    scheduling priority             (-e) 0
    file size               (blocks, -f) unlimited
    pending signals                 (-i) 122314
    max locked memory       (kbytes, -l) 64
    max memory size         (kbytes, -m) unlimited
    open files                      (-n) 999999
    pipe size            (512 bytes, -p) 8
    POSIX message queues     (bytes, -q) 819200
    real-time priority              (-r) 0
    stack size              (kbytes, -s) 8192
    cpu time               (seconds, -t) unlimited
    max user processes              (-u) 122314
    virtual memory          (kbytes, -v) unlimited
    file locks                      (-x) unlimited
    
    
# Step 5: Ansible

Ideally this should be implemented using Ansible level so that any new boxes have these settings.  Unfortunately that is left as an exercise for the reader.
 




