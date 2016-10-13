---
layout: post
title: Ansible Tutorial 02 - Configuring a Sidekiq Upstart Job on Ubuntu 14.04
category: ansible
tags: ["ansible", "sidekiq", "ruby", "rvm"]
---
As I've now noted a number of times, I'm in the process of a large scale AWS migration and we've had stability problems.  Unlike previous times in my life where I threw my hands up, got tired with devops and just hacked something together, I'm determined that, this time, things will be different.  At the heart of our issues has been ballooning memory use in Ruby.  Whether the issue is in our code, a gem, an interaction or something else entirely is, at present, unknown.  

The solution I've opted to go with for solving this is:

1. Remove our own threading code
2. Use [Mike Perham](http://www.mikeperham.com)'s astonishingly wonderful [Sidekiq](http://sidekiq.org)
3. Sign up for paid support / [Sidekiq Pro](http://sidekiq.org/products/pro) so any assistance that we need is possible.
4. Move to an upstart job to run sidekiq
5. Use [inspeqtor](https://github.com/mperham/inspeqtor) to Monitor Sidekiq

In this blog post I'm going to focus on #4 -- using an Upstart Job to Run Sidekiq and define that job with Ansible.  The very first thing to know is that my previous ansible task, [here](https://fuzzygroup.github.io/blog/ansible/2016/10/09/ansible-quickie-fixing-a-poorly-designed-galaxy-role.html), is absolute crap as best I can tell.  Even with my fixes, like so many things on [Ansible Galaxy](https://galaxy.ansible.com), it was just plain wrong.  Where Galaxy is good, its excellent, but that's rare in my experience.

Just a disclaimer - any errors here are mine, not Mike's or Sidekiq's.  I own the responsibility here.

# Using Ansible to Install a Sidekiq Service

Here are our assumptions that we're basing our ansible code on:

* Ubuntu 14.04
* Upstart
* Single, global ruby per server
* RVM (even though it isn't strictly necessary)
* One ruby app per server

Let's begin with the structure of our role:

    cd ~/whatever_your_ansible_root_is
    mkdir -p roles/software_licenses/tasks
    mkdir -p roles/services
    mkdir roles/services/tasks
    mkdir roles/servies/templates
    
## Optional - Adding Your Sidekiq Pro Software License    
    
Sidekiq Pro is commercial software, not open source, so if you're using it instead of the open source version, you'll need to authorize it.  Here's how to do this.  Here's what goes in your roles/software_licenses/tasks/main.yml:

    --- 
    - name: set the licensing for sidekiq pro
      become: no
      shell:  "cd /var/www/apps/banks/current && bundle config gems.contribsys.com YOUR_SECURITY_KEY"    
      
## Defining Your Group Vars      
    
Here's what goes in your group_vars context.  I had these in all but you may choose a different approach:

    app_name: banks
    app_base: /var/www/apps/banks/
    app_path: /var/www/apps/banks/current/
    user_name: ubuntu
    db_root_password: FDFJKSDJFKLSFJSLKFJSKLFSJFKLSDJF
    my_ip_address: 64.184.12.117
    server_env: production
    rvm_path: /usr/local/rvm/bin/rvm    
    
## Your Template for the Upstart Job    

Here's what goes in roles/services/templates/sidekiq_perham_init.j2:

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
    
Please note that the template above comes directly from Mike Perham's Sidekiq Wiki, [here](https://github.com/mperham/sidekiq/blob/master/examples/upstart/sidekiq.conf).  I modified it slightly to incorporate ansible variables and to remove the index parameter which didn't function, at least for me, on Ubuntu 14.04.

## Pulling the Template and Service Together

Here's what goes in roles/services/tasks/main.yml:
    
    - name: prevent sidekiq init from running if it has already been done
      stat: path=/etc/init/sidekiq.conf
      register: sidekiq_init_installed
  
    - name: Copy sidekiq init template to init.d dir
      template: src=sidekiq_perham_init.j2 dest=/etc/init/sidekiq.conf owner=root group=root force=yes
      sudo: yes
      when: sidekiq_init_installed.stat.exists == False

    - name: start_sidekiq
      service: name=sidekiq state=started
      
The only real Ansible trick here is to figure out how to make this idempotent so it only installs the upstart job once.  To do that I use the stat module to check the location of the upstart sidekiq.conf file and register a variable.  Then I only install the template when that variable is false.

## Calling Everything from the Playbook

The final step here is to pull the roles into the playbook so it can run.  Here's how:

    - { role: software_licenses, tags: software_licenses }
    - { role: services, tags: services }
    
Because the service depends on the gem it is important that the software_licenses role run first so the gem is authorized.  Otherwise Sidekiq won't start and the service will be borked.

## Optional - Your Ruby App's Gemfile

If you're using Sidekiq Pro, you'll need to update your gem file with the stuff you got from Sidekiq support.

## Running the Playbook

If you just want to run part the services and software_licenses role then you can use:


    ansible-playbook -i inventories/ficrawler3 playbook_crawler.yml --tags="software_licenses, services"
    
Here's the output from running just the services role on a single one of my boxes:
    
    ansible-playbook -i inventories/ficrawler3 playbook_crawler.yml --tags="services"

    [DEPRECATION WARNING]: Instead of sudo/sudo_user, use become/become_user and make sure become_method is 'sudo' (default).
    This feature will be removed in a future release. Deprecation warnings can be
    disabled by setting deprecation_warnings=False in ansible.cfg.

    PLAY [crawler, ansibletest] ****************************************************

    TASK [setup] *******************************************************************
    ok: [ficrawler3]

    TASK [services : stop_sendmail] ************************************************
    ok: [ficrawler3]

    TASK [services : stop_apache2] *************************************************
    ok: [ficrawler3]

    TASK [services : stop_memcached] ***********************************************
    ok: [ficrawler3]

    TASK [services : prevent sidekiq init from running if it has already been done]
    ok: [ficrawler3]

    TASK [services : Copy sidekiq init template to init.d dir] *********************
    skipping: [ficrawler3]

    TASK [services : start_sidekiq] ************************************************
    changed: [ficrawler3]

    PLAY RECAP *********************************************************************
    ficrawler3                 : ok=6    changed=1    unreachable=0    failed=0


Your results may differ a bit but it should be similar to that.

# Log File

It is always terribly important with long running processes to know where their log file goes.  In this case it is located at:

    /var/log/upstart/sidekiq_0.log  

I'll return to that in a later Ansible tutorial when I configure cross server log management with Graylog.  For my work, sidekiq logs are critical so I added a bash command to the shells on all my boxes so I can tail them easily.  All it takes is to drop alias tailsidekiq='tail -f /var/log/upstart/sidekiq_0.log' into the .bashrc on all your boxes.  

And, yes, I'm am showing off here.  This points out just how awesome automatically provisioning your boxes with ansible is.  When you can make changes across a farm of boxes with a single command, you can apply the same types of refactoring / continuous improvement that you do with code to devops.  In years past if I wanted this I'd have had to do it manually.  Now its a change to a template file and running an ansible playbook.  Tomorrow I'll likely pipe all log files over the network to Graylog but until then I have my tailsidekiq command.

# Sidebar: Why Use RVM With a Single Ruby?

I know someone's going to ask this so I may as well answer it.  RVM is the easiest way, that I've found, to get Ruby installed anywhere.  Even with a single Ruby, RVM makes getting it installed better.