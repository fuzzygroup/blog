---
layout: post
title: AWS Tutorial 13 - Adding Idempotency to Our CloudWatch Monitoring Playbook
category: aws
tags: ["aws", "ansible", "cloudwatch"]
---
In [AWS Tutorial 11](https://fuzzygroup.github.io/blog/aws/2016/10/01/aws-tutorial-11-an-ansible-role-for-installing-aws-cloud-watch-monitoring-on-ubuntu.html) we used an Ansible playbook to set up CloudWatch memory monitoring on a series of Ubuntu EC2 instances.  This worked perfectly -- **once**.  I noticed, after I published the blog post, that if I tried to re-run the Ansible script playbook that it fail on a second run.  Initially I chalked this up to plain old randomness but then I actually **thought** about it and it all came into focus.

# Ansible is All About Idempotency and This Was Not

So in Ansible the core idea is that you only want to make changes one time.  If a box has redis installed then it doesn't need it again.  That's the idea of idempotency -- do the same thing over and over and always get the same result.  In this case we used shell actions for all of installing CloudWatch Memory Management and, well, that's not idempotent.  The second time you run it, it's trying to do it all over again.  

The trick to making this idempotent is to register an ansible variable based on something we did and then check that variable at every stage.  Here's how I revised my previous playbook:

    - name: Install CloudWatch libraries
      apt: pkg={{ item }}
           state=installed
      with_items:
        - unzip
        - libwww-perl
        - libdatetime-perl
    
    - name: prevent this from running if it has already been done
      stat: path=/root/aws-scripts-mon/
      register: aws_cloudwatch_installed

    - name: download scripts
      get_url: url=http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip dest=/tmp/CloudWatchMonitoringScripts.zip
      when: aws_cloudwatch_installed.stat.exists == False

    - name: chown the file and make it writeable
      file: path=/tmp/CloudWatchMonitoringScripts.zip mode=0755  #owner=ubuntu group=ubuntu 
      when: aws_cloudwatch_installed.stat.exists == False

    - name: unzip the scripts
      #unarchive: src=/tmp/CloudWatchMonitoringScripts.zip dest=/tmp/
      shell: "cd /tmp && unzip /tmp/CloudWatchMonitoringScripts.zip"
      when: aws_cloudwatch_installed.stat.exists == False

    - name: delete archive
      file: path=/tmp/CloudWatchMonitoringScripts.zip state=absent
      when: aws_cloudwatch_installed.stat.exists == False

    - name: set Access key in credentials file
      replace: dest=/tmp/aws-scripts-mon/awscreds.template regexp='AWSAccessKeyId=' replace='AWSAccessKeyId={{ ec2_access_key }}' backup=yes
      when: aws_cloudwatch_installed.stat.exists == False

    - name: set Secret key in credentials file
      replace: dest=/tmp/aws-scripts-mon/awscreds.template regexp='AWSSecretKey=' replace='AWSSecretKey={{ ec2_secret_key }}' backup=yes
      when: aws_cloudwatch_installed.stat.exists == False

    - name: move directory out of /tmp
      command: mv /tmp/aws-scripts-mon/ /root/ creates=/root/aws-scripts-mon/
      when: aws_cloudwatch_installed.stat.exists == False

    - name: add command to cron
      lineinfile: dest=/etc/crontab insertafter=EOF line="* * * * * root /root/aws-scripts-mon/mon-put-instance-data.pl --mem-util --mem-used --mem-avail --aws-credential-file=/root/aws-scripts-mon/awscreds.template"
      when: aws_cloudwatch_installed.stat.exists == False

The magic is in the second step:

    - name: prevent this from running if it has already been done
      stat: path=/root/aws-scripts-mon/
      register: aws_cloudwatch_installed
    
What this does is use the stat module to check if a given path, where we're put the scripts, already exists.  If this exists then we know that we've already done it.  We then check it at every subsequent change:

    - name: download scripts
      get_url: url=http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip dest=/tmp/CloudWatchMonitoringScripts.zip
      when: aws_cloudwatch_installed.stat.exists == False
    
And that's all it takes to make this something that you can run over and over every time a box is updated.  

# References

Here are some good references:

  * [http://docs.ansible.com/ansible/stat_module.html](http://docs.ansible.com/ansible/stat_module.html)
  * [https://raymii.org/s/tutorials/Ansible_-_Only_if_a_file_exists_or_does_not_exist.html](https://raymii.org/s/tutorials/Ansible_-_Only_if_a_file_exists_or_does_not_exist.html)
  * [http://www.caphrim.net/ansible/2015/05/25/be-careful-with-unarchive.html](http://www.caphrim.net/ansible/2015/05/25/be-careful-with-unarchive.html)
