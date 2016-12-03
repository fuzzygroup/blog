---
layout: post
title: More Ansible on AWS for Sidekiq
category: aws
tags: ["aws", "ansible", "sidekiq"]
---
So, much like the Godfather, just when I think I'm out, Ansible pulls me back in...  Yesterday I tackled using Ansible to manage Sidekiq.  Today I'm going to bring you:

* Installing Sidekiq as a service
* Viewing the status of the service

Let's start with installing Sidekiq as a service.  Happily [Mike Perham](http://www.sidekiq.org) has built Sidekiq to run as a service (and thanks to Mike for the service configuration; noted and appreciated).  Here's what you need:

    playbook: playbook_service_install_and_start_sidekiq.yml
    
    role: service_install_and_start_sidekiq.yml
    
    ---
    - name: prevent sidekiq init from running if it has already been done
      stat: path=/etc/init/sidekiq.conf
      register: sidekiq_init_installed

    - name: Copy sidekiq init template to init.d dir
      template: src=sidekiq_perham_init.j2 dest=/etc/init/{{ app.process_name }}_worker.conf owner=root group=root force=yes
      template: src=sidekiq_perham_init.j2 dest=/etc/init/sidekiq.conf owner=root group=root force=yes
      sudo: yes
      when: sidekiq_init_installed.stat.exists == False

    - name: start_sidekiq
      service: name=sidekiq state=started enabled=yes
    
    template: sidekiq_perham_init.js
    
    # /etc/init/sidekiq.conf - Sidekiq config
    # source: https://github.com/mperham/sidekiq/blob/master/examples/upstart/sidekiq.conf

    # This example config should work with Ubuntu 12.04+.  It
    # allows you to manage multiple Sidekiq instances with
    # Upstart, Ubuntu's native service management tool.
    #
    # See workers.conf for how to manage all Sidekiq instances at once.
    #
    # Save this config as /etc/init/sidekiq.conf then manage sidekiq with:
    #   sudo start sidekiq index=0
    #   sudo stop sidekiq index=0
    #   sudo status sidekiq index=0
    #
    # Hack Upstart's reload command to 'quiet' Sidekiq:
    #
    #   sudo reload sidekiq index=0
    #
    # or use the service command:
    #   sudo service sidekiq {start,stop,restart,status}
    #

    description "Sidekiq Background Worker"

    # This script is not meant to start on bootup, workers.conf
    # will start all sidekiq instances explicitly when it starts.
    #start on runlevel [2345]
    #stop on runlevel [06]

    # change to match your deployment user
    setuid {{ user_name }}
    setgid {{ user_name }}
    env HOME={{ app_path }}

    respawn
    respawn limit 3 30

    # TERM is sent by sidekiqctl when stopping sidekiq. Without declaring these as
    # normal exit codes, it just respawns.
    normal exit 0 TERM

    # Older versions of Upstart might not support the reload command and need
    # this commented out.
    reload signal USR1

    # Upstart waits 5 seconds by default to kill the a process. Increase timeout to
    # give sidekiq process enough time to exit.
    kill timeout 15

    #instance $index
    instance 0

    script
    # this script runs in /bin/sh by default
    # respawn as bash so we can source in rbenv
    exec /bin/bash <<'EOT'
      # Pick your poison :) Or none if you're using a system wide installed Ruby.
      # rbenv
      # source /home/apps/.bash_profile
      # OR
      # source /home/apps/.profile
      # OR system:
      # source /etc/profile.d/rbenv.sh
      #
      # rvm
      # source /home/apps/.rvm/scripts/rvm
      source {{ rvm_path }}

      # Logs out to /var/log/upstart/sidekiq.log by default

      cd {{ app_path }}
      #exec bundle exec sidekiq -i ${index} -e production
      exec bundle exec sidekiq -i 0 -e production
    EOT
    end script
    
    output: 
    
    ansible-playbook -i inventories/production2 playbook_service_install_and_start_sidekiq.yml
     [WARNING]: While constructing a mapping from
    /Users/sjohnson/Dropbox/appdatallc/ansible/roles/service_install_and_start_sidekiq/tasks/main.yml, line 6, column 3, found a duplicate dict
    key (template). Using last defined value only.

    [DEPRECATION WARNING]: Instead of sudo/sudo_user, use become/become_user and make sure become_method is 'sudo' (default).
    This feature will
    be removed in a future release. Deprecation warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.

    PLAY [worker] ******************************************************************

    TASK [setup] *******************************************************************
    ok: [fiworker3]

    TASK [service_install_and_start_sidekiq : prevent sidekiq init from running if it has already been done] ***
    ok: [fiworker3]

    TASK [service_install_and_start_sidekiq : Copy sidekiq init template to init.d dir] ***
    skipping: [fiworker3]

    TASK [service_install_and_start_sidekiq : start_sidekiq] ***********************
    changed: [fiworker3]

    PLAY RECAP *********************************************************************
    fiworker3                  : ok=3    changed=0    unreachable=0    failed=0
    

Once you install this as service you **do not** want to log into N machines and check if its manually running so now you need this:

    playbook: playbook_service_status_sidekiq.yml
    
    role: service_status_sidekiq.yml
    
    --- 
  
    - name: display sidekiq's status
      shell: "service sidekiq status"
      register: out

    - name: view the output
      debug: var=out.stdout_lines
    
    output:

    ansible-playbook -i inventories/production2 playbook_service_status_sidekiq.yml

    PLAY [worker] ******************************************************************

    TASK [setup] *******************************************************************
    ok: [fiworker3]

    TASK [service_status_sidekiq : display sidekiq's status] ***********************
    changed: [fiworker3]
     [WARNING]: Consider using service module rather than running service

    TASK [service_status_sidekiq : view the output] ********************************
    ok: [fiworker3] => {
        "out.stdout_lines": [
            "sidekiq (0) start/running, process 7759"
        ]
    }

As long as you see a process id here then you know its running.  Would it be better to have this report out something like "Out of N boxes, sidekiq is running on N-1"?  Sure.  And I suspect that I will get there at some point but I have critical pressing needs **today** -- all these examples are being written as part of actual devops that I'm doing now.  These blog posts are the time stamped documentation that I can refer back to.