---
layout: post
title: Ansible Quickie Fixing a Poorly Designed Galaxy Role
category: ansible
tags: ["ansible", "galaxy", "sidekiq"]
---
Earlier today I used an Ansible Galaxy role to set [Sidekiq as a background process started with an Ubuntu Upstart service](https://github.com/crushlovely/ansible-sidekiq-upstart/).  Unfortunately when I went to run the service, I found that it would not start at all.  While I like the concept of Ansible Galaxy, I have described it as: 

    Galaxy is DockerHub without the stars for ratings
    
I was on the phone with [Nick Janetakis](http://nickjanetakis.com/) yesterday, shooting the breeze as it were and he agreed but offered a slightly different perspective:

    Galaxy is DockerHub without the approved packages
    
Either one is true.  There are lots of great options on Galaxy but it is a bit of a crap shoot.  Let's diagnose the problem and see how it can be fixed.  Here's what the install looked like:

    ansible-galaxy install crushlovely.sidekiq-upstart,v1.0.0
    - downloading role 'sidekiq-upstart', owned by crushlovely
    - downloading role from https://github.com/crushlovely/sidekiq-upstart/archive/master.tar.gz
    - extracting crushlovely.sidekiq-upstart to /usr/local/etc/ansible/roles/crushlovely.sidekiq-upstart
    - crushlovely.sidekiq-upstart was installed successfully

Here's how to use this in your playbook:

    - { role: crushlovely.sidekiq-upstart, app_path: "/var/www/apps/banks", server_env: "production", tags: sidekiq}
    
That can go anywhere in your playbook after Sidekiq is installed.  

There are two problems with this role.

1.  The first is a syntactic bug identified [here](https://github.com/crushlovely/ansible-sidekiq-upstart/issues/7).
2.  The second is that while there are several variables for this, there isn't a variable for the username the rails process runs as.  This causes the upstart job to die before it starts because there is a hard coded deploy username.
  
Here are the workarounds:

1.  In the meta directory below were the role was installed, modify the file main.yml and comment out the version.
2.  In your group_vars directory, modify the file all to include a user_name variable set to whoever you want the rails process to run as.
2.  In the install directory for the role, find the sidekiq_init.j2 template (in the templates directory) and modify **setuid deploy** to be **setuid {{user_name }}**.  After that do the same thing for the setgid bit.


That was sufficient to get this running for me.  Perhaps next time we'll fork this role into our github and fix the bug properly with Ansible variables.
