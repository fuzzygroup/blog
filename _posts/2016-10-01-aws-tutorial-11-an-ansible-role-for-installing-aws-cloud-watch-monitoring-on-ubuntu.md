---
layout: post
title: AWS Tutorial 11 - An Ansible Role for Installing AWS Cloud Watch Monitoring On Ubuntu
category: aws
tags: ["ansible", "aws", "cloudwatch"]
---
As I've written here earlier, Ansible is a provisioning and management tool that you can use to enable better automated provisioning of your AWS machines.  While I am [absolutely in love with AWS](https://fuzzygroup.github.io/blog/aws/2016/09/06/aws-i-was-wrong-dead-wrong.html), one thing that I do think that CloudWatch got wrong is that there is no memory graphs when you use CloudWatch to monitor your machines.  Given that I write threaded applications all the time, knowing how my memory utilization looks is a vital diagnostic tool.  And while there is a way to do this, it requires a fair bit of systems administration to accomplish it since it requires code to be installed on every server to be monitored.

Since we need to make a change to every box we have and to all new boxes we will create, who are we going to call?  Ansible!!!  That's right -- in this tutorial we're going to use Ansible to write a playbook and role for:

* downloading required modules
* downloading the code
* installing the code
* inserting our AWS keys
* creating a cron job

# Creating our Structure

While Ansible is flexible in how things can be structured, I use a standard approach.  All of the code here is available on my github (link at the end) but I find that writing it all out helps my understanding at least.  Here's how to create the structure that I use for Ansible.  All of this assumes you are already in a project directory where you want to store this.

    mkdir inventories
    touch inventories/production
    mkdir -p roles/aws_cloudwatch_memory/tasks
    mkdir -p roles/aws_cloudwatch_memory/vars
    touch roles/aws_cloudwatch_memory/tasks/main.yml
    touch roles/roles/aws_cloudwatch_memory/vars/main.yml
    # note - if you want to encrypt your aws keys that don't do the next step and do it below under Ansible Vault
    touch ansible.cfg
    touch playbook.yml

# Core Ansible Concepts: Inventory, Playbook, Role, Var

Like many automation products, Ansible is built around some core concepts:

* Inventory - a list of the machine resources to create, update or destroy
* Playbook - a list of the roles to apply to each machine resource
* Role - what to do with a machine.  This can be very complex including tasks, variables, files to copy to and from, services to restart and so on.
* Var - a list of variables to use in your role.

# The Inventory

In the inventory file you want a format very similar to an old fashioned .ini file.  Here's what mine looks like:

    [web]
    fiworker2    ansible_ssh_host=ec2-52-41-237-52.us-west-2.compute.amazonaws.com        ansible_ssh_private_key_file=/Users/sjohnson/.ssh/fi_nav_sitecrawl.pem
    
The syntax I'm using is human_readable_name  ansible_ssh_host=  ansible_ssh_private_key_file=

While you can generate the inventory file automatically with code, I don't have a ton of AWS instances yet so I've just listed them manually.

# The Playbook

Here's the playbook:

    - hosts: all
      become: yes
      remote_user: ubuntu
      roles:
        - { role: aws_cloudwatch_memory, tags: aws_cloudwatch_memory}
        
The way to read this is:

* run the playbook on all hosts
* run the playbook as sudo
* run the playbook with the remote user ubuntu
* run the role aws_cloudwatch_memory        

# The Role

Here's the role:

    ---
  
    - name: Install CloudWatch libraries
      apt: pkg={{ item }}
           state=installed
      with_items:
        - unzip
        - libwww-perl
        - libdatetime-perl

    - name: download scripts
      get_url: url=http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip dest=/tmp/CloudWatchMonitoringScripts.zip

    - name: chown the file and make it writeable
      file: path=/tmp/CloudWatchMonitoringScripts.zip mode=0755  #owner=ubuntu group=ubuntu 

    - name: unzip the scripts
      # note - unarchive should work but it fails; maybe an ansible issue?  shell: to the rescue!
      #unarchive: src=/tmp/CloudWatchMonitoringScripts.zip dest=/tmp/
      shell: "cd /tmp && unzip /tmp/CloudWatchMonitoringScripts.zip"

    - name: delete archive
      file: path=/tmp/CloudWatchMonitoringScripts.zip state=absent

    - name: set Access key in credentials file
      replace: dest=/tmp/aws-scripts-mon/awscreds.template regexp='AWSAccessKeyId=' replace='AWSAccessKeyId={{ ec2_access_key }}' backup=yes

    - name: set Secret key in credentials file
      replace: dest=/tmp/aws-scripts-mon/awscreds.template regexp='AWSSecretKey=' replace='AWSSecretKey={{ ec2_secret_key }}' backup=yes

    - name: move directory out of /tmp
      command: mv /tmp/aws-scripts-mon/ /root/ creates=/root/aws-scripts-mon/

    - name: add command to cron
      lineinfile: dest=/etc/crontab insertafter=EOF line="* * * * * root /root/aws-scripts-mon/mon-put-instance-data.pl --mem-util --mem-used --mem-avail --aws-credential-file=/root/aws-scripts-mon/awscreds.template"

  
# Using Ansible Vault for the vars file

Within the roles directory there is a vars directory and a file main.yml within it.  This file will contain our variables that define our AWS access key and AWS secret.  Given that this file will likely be checked into version control, there's value in encrypting those variables.  The tool Ansible Vault is used for that.  Here's how:

  1.  Use the command:  ansible-vault create roles/aws_cloudwatch_memory/vars/main.yml
  2.  This will ask your for a password.  Enter one and confirm it and then you'll be launched into an editor where you can put in your keys.
  3.  Exit the editor and it will save your now encrypted data.  You can then edit it later with: ansible-vault edit roles/aws_cloudwatch_memory/vars/main.yml
  
More on the Ansible Vault is available on the [docs.ansible.com site](http://docs.ansible.com/ansible/playbooks_vault.html).

The vars file needs to look something like this:

    ec2_access_key: "foo"
    ec2_secret_key: "bar"
    
Obviously these would be replaced with real values.  By storing this file in rolename/vars/main.yml location and format, Ansible knows to load this file automatically when the role is executed.

# The ansible.cfg file 

You may, or may not, need a ansible.cfg file.  This is an ASCII file that defines how to handle ssh connectivity.  Here's mine:

    [ssh_connection]
    ssh_user = vagrant
    scp_if_ssh = True
    control_path = %(directory)s/%%h-%%r
    ansible_ssh_private_key_file = /Users/sjohnson/.ssh/fi_nav_sitecrawl.pem

I'm not, at the time of this writing, a true Ansible expert so I suspect there's redundancy in my cfg file but when I run without it, I'm unable to connect to AWS and I think it's due to the control_path setting being required due to the length of the EC2 host names.
  
# Running This

Here's all you need to do to run this:

    ansible-playbook -i inventories/production playbook.yml
    
If you encrypted your keys then you'll be prompted for the password.  If you want to store the password in a local file on your machine then you can always do it this way:

    ansible-playbook -i inventories/production playbook.yml --vault-password-file ~/.vault_pass.txt

# Code on Git

All of this is published on my [github](https://github.com/fuzzygroup/ansible_cloud_watch_memory_monitoring).

# References

Here are some great references

* [https://gist.github.com/weirdbricks/3e0d0e3428f3d683ccfa](https://gist.github.com/weirdbricks/3e0d0e3428f3d683ccfa)  This is the gist I started from; it was for Redhat / CentOS and used Yum
* [http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/mon-scripts.html](http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/mon-scripts.html)  This is the canonical documentation
* [http://blog.krishnachaitanya.ch/2016/03/monitor-ec2-memory-usage-using-aws.html](http://blog.krishnachaitanya.ch/2016/03/monitor-ec2-memory-usage-using-aws.html) Good tutorial
