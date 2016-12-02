---
layout: post
title: Killing Sidekiq on AWS with Ansible
category: aws
tags: ["aws", "ansible", "sidekiq", "rails"]
---
We do a lot of batch data processing here and much of that involves shoving crap into [Sidekiq](http://sidekiq.org/) to be run in a threaded fashion.  I'm not done with my own threading stuff yet by any means but, for now, Sidekiq is a superstar so we're going to use it and bow west towards the [Mike Perham](http://www.mikeperham.com/) alter of threaded awesomeness that is Sidekiq.

One issue we had recently was that we thought we had killed sidekiq dead but, since it was running as a background service instead of a foreground task, it popped back up and kept happily eating data.  This would have been fine except for the fact that we had a db dump and restore in process and this caused data to be in an inconsistent state.  And that led to a second round of table dump / restore tangoing.  

The first thing to understand here is that this is **my** mistake.  I'm the moron who set it as a background service after all and, in the utter panic that accompanies disaster recovery, well, I forgot.  I did my normal kill -9 dance and went on my merry way ignoring the fact that Ubuntu would happily cackle gleefully as it re-launched it.  *Sigh*.

So there's at least two playbooks here:

* playbook_status_sidekiq.yml
* playbook_stop_sidekiq_with_prejudice.yml

The "_with_prejudice" refers to stopping Sidekiq with a -9 argument to kill.  This tells Linux "really, truly, right DAMN NOW kill this process".  Sometimes Sidekiq fails to stop; often because of the ruby code its executing and while that's fine there are lots of times that you just need it to go away.  This is one of them.

Two additional related playbooks I could write are:

* playbook_stop_sidekiq.yml
* playbook_service_stop_sidekiq.yml

And here we go!  The first thing we need is the ability to know what's going on in our cluster of boxes.  This means the ability to know if sidekiq is running:

    playbook:
    
    role:
    
    output:
    
    ansible-playbook -i inventories/production2 playbook_status_sidekiq.yml

    PLAY [worker] ******************************************************************

    TASK [setup] *******************************************************************
    ok: [fiworker5]
    ok: [fiworker6]
    ok: [fiworker3]
    ok: [fiworkerbig]
    ok: [fiworker4]
    ok: [fiworker8]
    ok: [fiworker7]
    ok: [fiworker9]
    ok: [fiworker10]
    ok: [fiworker11]

    TASK [status_sidekiq : display sidekiq's status] *******************************
    changed: [fiworker5]
    changed: [fiworker3]
    changed: [fiworkerbig]
    changed: [fiworker4]
    changed: [fiworker6]
    changed: [fiworker7]
    changed: [fiworker8]
    changed: [fiworker10]
    changed: [fiworker9]
    changed: [fiworker11]

    TASK [status_sidekiq : view the output] ****************************************
    ok: [fiworker5] => {
        "out.stdout_lines": [
            "root     11103  0.0  0.0   4440   636 pts/5    S+   12:43   0:00 /bin/sh -c ps auwwx | grep sidekiq",
            "root     11105  0.0  0.0  10460   912 pts/5    S+   12:43   0:00 grep sidekiq",
            "ubuntu   17371  0.0  0.0  27920  5328 ?        Ss   Oct27  13:57 tmux new -s sidekiq",
            "ubuntu   25815  0.6  6.5 1933952 1022068 pts/1 Sl+  Dec01   7:13 sidekiq 4.2.3 banks [0 of 25 busy] stopping                                                                         "
        ]
    }
    ok: [fiworker6] => {
        "out.stdout_lines": [
            "ubuntu   17308  5.7  6.1 1948728 957972 pts/1  Sl+  Dec01  63:18 sidekiq 4.2.3 banks [25 of 25 busy]                                                                                 ",
            "root     18126  0.0  0.0   4440   636 pts/5    S+   12:43   0:00 /bin/sh -c ps auwwx | grep sidekiq",
            "root     18128  0.0  0.0  10460   912 pts/5    S+   12:43   0:00 grep sidekiq",
            "ubuntu   23040  0.0  0.0  31808  9200 ?        Ss   Oct27  15:12 tmux new -s sidekiq"
        ]
    }
    
As you can see in the first bit out output, fiworker5, I missed when I manually shut stuff down yesterday.  Oops.  And this brings us to our next playbook:

    playbook:
    #
    # MONDAY ansible-playbook -i ec2.py playbook_stop_sidekiq_with_prejudice.yml
    # ansible-playbook -i inventories/production2 playbook_stop_sidekiq_with_prejudice.yml
    #
    ---
  
    - hosts: worker
      become: yes
      remote_user: ubuntu
      gather_facts: true
      roles:
        - { role: kill_sidekiq_with_prejudice, tags: sidekiq}
    
    role:
    ---
    - name: kill_sidekiq_with_prejudice
      shell: ps -ef | grep sidekiq | grep -v grep | awk '{print $2}' | xargs kill -9
    
    output:
    (fiworker5 shut down on its own before this ran; sigh)
    
    ansible-playbook -i inventories/production2 playbook_stop_sidekiq_with_prejudice.yml

    PLAY [worker] ******************************************************************

    TASK [setup] *******************************************************************
    ok: [fiworker3]
    ok: [fiworkerbig]
    ok: [fiworker5]
    ok: [fiworker4]
    ok: [fiworker6]
    ok: [fiworker7]
    ok: [fiworker9]
    ok: [fiworker10]
    ok: [fiworker8]
    ok: [fiworker11]

    TASK [kill_sidekiq_with_prejudice : kill_sidekiq_with_prejudice] ***************
    changed: [fiworker5]
    changed: [fiworker6]
    changed: [fiworker3]
    changed: [fiworker4]
    changed: [fiworkerbig]
    changed: [fiworker7]
    changed: [fiworker9]
    changed: [fiworker8]
    changed: [fiworker10]
    changed: [fiworker11]

    PLAY RECAP *********************************************************************
    fiworker10                 : ok=2    changed=1    unreachable=0    failed=0
    fiworker11                 : ok=2    changed=1    unreachable=0    failed=0
    fiworker3                  : ok=2    changed=1    unreachable=0    failed=0
    fiworker4                  : ok=2    changed=1    unreachable=0    failed=0
    fiworker5                  : ok=2    changed=1    unreachable=0    failed=0
    fiworker6                  : ok=2    changed=1    unreachable=0    failed=0
    fiworker7                  : ok=2    changed=1    unreachable=0    failed=0
    fiworker8                  : ok=2    changed=1    unreachable=0    failed=0
    fiworker9                  : ok=2    changed=1    unreachable=0    failed=0
    fiworkerbig                : ok=2    changed=1    unreachable=0    failed=0

Given my [previous praise of pkill](https://fuzzygroup.github.io/blog/unix/2016/11/23/pkill-rocks.html), readers may be wondering why I used the old xargs trick.  Simply put I couldn't make pkill work.  There are google posts on the topic but I didn't have time to dig into it -- I **knew** that xargs had to work so I went with it.  Honestly I dont understand why Ansible doesn't have a process module -- it just seems so absolutely needed.

As with my previous example if there is interest, on Monday, I'll publish examples showing the dynamic inventory version of this.
