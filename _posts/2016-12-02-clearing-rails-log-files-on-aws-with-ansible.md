---
layout: post
title: Clearing Rails Log Files on AWS with Ansible
category: aws
tags: ["aws", "ansible", "logs"]
---
If you are reading this and you've read more than a few things I've written then you know that I'm, well, a *wordy son of a bitch*.  I mean come on -- did you see the post on [AWS Partition Resizing](https://fuzzygroup.github.io/blog/aws/2016/11/26/fear-and-loathing-in-awsville-or-adventures-in-partition-resizing.html)?  I took like 7800 words to say "can't do it" -- apologies.  

Anyway the digression into wordiness is because like me, Rails log files are wordy son's of bitches -- the number of times in my career that I've had to log into a box and do the log dance:

    bundle exec rake log:clear
    
has to be measured in the hundreds if not thousands.  This morning I finally got mad enough to automate it with Ansible.  Here's how:

    playbook: playbook_logs_clear_rails_logs.yml
    
    #
    # MONDAY ansible-playbook -i ec2.py playbook_logs_clear_rails_logs.yml
    # ansible-playbook -i inventories/production2 playbook_logs_clear_rails_logs.yml
    #
    ---
  
    - hosts: worker
      become: yes
      remote_user: ubuntu
      gather_facts: true
      vars: 
        - app_path: /var/www/apps/banks/current
      roles:
        - { role: logs_clear_rails_logs, tags: logs}
    
    role: 
    folder: logs_clear_rails_logs
    file: tasks/main.yml
    
    ---
    - name: logs_clear_rails_logs
      shell: "cd {{ app_path }} && bundle exec rake log:clear"
    
Here are the results:

    ansible-playbook -i inventories/production2 playbook_logs_clear_rails_logs.yml

    PLAY [worker] ******************************************************************

    TASK [setup] *******************************************************************
    ok: [fiworkerbig]
    ok: [fiworker5]
    ok: [fiworker3]
    ok: [fiworker6]
    ok: [fiworker4]
    ok: [fiworker9]
    ok: [fiworker8]
    ok: [fiworker11]
    ok: [fiworker10]
    ok: [fiworker7]

    TASK [logs_clear_rails_logs : logs_clear_rails_logs] ***************************
    changed: [fiworker3]
    changed: [fiworker6]
    changed: [fiworker5]
    changed: [fiworker4]
    changed: [fiworkerbig]
    changed: [fiworker7]
    changed: [fiworker8]
    changed: [fiworker9]
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
    
Right now this is working with a static inventory file.  If anyone expresses interest, on Monday, I'll publish a revised version which uses the python boto module to clear log files based on all boxes on EC2 dynamically matching a criteria like a name tag.