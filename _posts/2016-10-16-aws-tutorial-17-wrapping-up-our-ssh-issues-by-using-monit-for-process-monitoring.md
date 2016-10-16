---
layout: post
title: AWS Tutorial 17 - Wrapping Up Our SSH Issues By Using Monit For Process Monitoring
category: aws
tags: ["aws", "ssh", "monit", "ansible"]
---
So the solution to our SSH issues is actually fairly simple:

* Ruby code is using too much memory / cpu; memory leak?  bad code?  who knows.
* A watchdog process needs to look out for processes using too many resources and shut them down so that the underlying init / service system can restart them

[Mike Perham](https://fuzzygroup.github.io/blog/ruby/2016/10/10/a-conversation-with-mike-perham.html) helpfully pointed out the right approach to solving this - use a systems monitoring tool like [Inspeqtor](https://github.com/mperham/inspeqtor) or [Monit](https://mmonit.com/monit/).  I don't normally do devops to the level that I am now so getting this perspective was key.  Given that its a 50 / 50 choice, I flipped a coin and chose Monit.

In the rest of this post, I'll go over how I used Ansible to configure Monit.

# The Role

The first thing we need is a role for monit so we're going to build out our role structure as follows:
    
    mkdir -p your_ansible_root_path/roles/monit/tasks
    mkdir -p your_ansible_root_path/roles/monit/templates
    touch your_ansible_root_path/roles/monit/tasks/main.yml
    
Then we're going to need a few things in our role (main.yml):    

    ---
    - name: install monit
      apt: pkg=monit state=present
  
    - name: start monit
      service: name=monit state=started

    - name: install monit sidekiq config file
      template: src=roles/monit/templates/sidekiq.j2 dest=/etc/monit/conf.d/sidekiq

Our template for monitoring sidekiq is going to rely on a handful of variables that for simplicity's sake, I've defined in the file all in groupvars:

    app_base: /var/www/apps/banks/
    app_path: /var/www/apps/banks/current/
    server_env: production
    
Since I have sidekiq running on two different machines with different configurations, I used variables in the inventory file to define the number of threads and the max ram:

    [crawler]
    ficrawlerbig ansible_ssh_host=BLAH1.compute.amazonaws.com  ansible_ssh_private_key_file=/Users/sjohnson/.ssh/fi_nav_sitecrawl.pem  max_sidekiq_memory="50 GB" max_sidekiq_threads=50
    ficrawler3 ansible_ssh_host=BLAH2.compute.amazonaws.com ansible_ssh_private_key_file=/Users/sjohnson/.ssh/fi_nav_sitecrawl.pem max_sidekiq_memory="13 GB" max_sidekiq_threads=25


Here's what that template looks like:

    check process sidekiq
      with pidfile {{ app_base }}shared/tmp/pids/sidekiq.pid
      start program = "cd {{ app_path }} && bundle exec ./bin/sidekiq -C ./config/sidekiq.yml -e {{ server_env }}"
  
      stop program = "/bin/bash -l -c 'cd {{ app_path }} && bundle exec sidekiqctl stop {{ app_base }}shared/tmp/pids/sidekiq.pid 10'"
      if totalmem is greater than {{ max_sidekiq_memory }} for 3 cycles then restart
  
      if 3 restarts within 5 cycles then timeout

And here's the playbook routine which calls the monit role:

    - { role: monit, tags: monit}
    
Once you put that all together, you'll have monit watching the sidekiq process on a regular basis.  One thing I didn't cover above is that we need to modify the config/sidekiq.yml file in the Rails root directory to use the right number of threads.  This is left as an exercise for the reader.  

# Conclusion to this Series of Posts on SSH Trauma and Thank You Time 2

When I started this series of posts, 16 days ago, I really didn't think all that much about SSH.  To an Internet developer, ssh is like *oxygen*, you only notice it when it is **gone**.  By having such a fundamental part of the infrastructure go away unexpectedly, it brought me new depths of understanding.  And, all of this occurred, while daily data processing and data crunching was going on.  Even with all the failures, our boxes stopped working.  Yes they would die periodically but I would just restart them while I explored my next hypothesis.  In the real world, business needs don't stop even though things aren't working correctly -- you still have to get the job done.  And I did.

Two people were absolutely essential to sorting this all out:

* [Nick Janetakis](http://nickjanetakis.com).  I initially met Nick thru his outstandingly excellent [Udemy](http://www.udemy.com) [course on Docker](http://nickjanetakis.com/courses/) and I've since gotten to know him a bit and hired him twice for [ad hoc consulting](https://fuzzygroup.github.io/blog/aws/2016/10/06/aws-tutorial-14-diagnosing-ssh-failures-take-2.html).  Nick is a smart guy, knows Docker like the back of his hand and can think.  Thinking always sounds easy but it never is.  Recommended.
* [Mike Perham](http://www.mikeperham.com).  I've known of Mike Perham's work intellectually for years and years and always described him as *the best guy in known space for Ruby threading*.  I only met him recently when we adopted sidekiq as a partial solution for this problem.  In Mike's weekly Happy Hour where he provides *free* support to the Ruby community for Sidekiq, [he correctly analyzed the problem and suggested a solution](https://fuzzygroup.github.io/blog/ruby/2016/10/10/a-conversation-with-mike-perham.html).  And you can bet that I've made sure that we purchased the [commercial version of Sidekiq](http://sidekiq.org/products/pro) in order to ensure that we have access to Mike should any future Sidekiq issues come up.  And don't forget that the commercial version of Sidekiq includes more features as well as support.  Recommended as well.

Thank you Nick; thank you Mike.  