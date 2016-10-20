---
layout: post
title: AWS Tutorial 20 - Adding Machine and Process Monitoring To Your AWS Instances with Inspeqtor
category: aws
tags: ["aws", "inspeqtor", "ubuntu"]
---
**Disclaimer**: Inspeqtor is an excellent piece of open source software, any errors are mine and mine alone.  This was fully tested by deploying onto a clean EC2 instance and verifying that it functioned correctly end to end.

One of the aspects of cloud computing versus traditional hosting is that with cloud computing you tend to work with computing resources that, in general, are:

* less **powerful** 
* less **reliable**
* have less **storage**

Finally there tend to be **more** of these resources.  One way to term this might be that traditional data centers are *molecular* where as cloud computing is more *atomic*.  

In my own experience, I ran a data center for 5 years without having to worry about process monitoring and tools like Monit or Inspeqtor but the very first time I put my AWS data center under heavy load, I found things [crashing right, left and center](https://fuzzygroup.github.io/blog/tag.html#ssh).  All of my problems were magically solved simply by the addition of [Monit](https://mmonit.com/monit/) to watch dog the sidekiq process and restart it when it gets too large.  And while this solved my sidekiq problem, two nights ago, I ran out of disc space on a key resource -- my MariaDB instance.  

One approach would be to continue to use Monit and add rules to it for disc space monitoring but I've been intrigued by the *simple* configuration that [Mike Perham's](http://www.mikeperham.com) [Inspeqtor](https://github.com/mperham/inspeqtor) offers.  Sidekiq has served me well as of late and Mike's support, even [the free community support](https://fuzzygroup.github.io/blog/ruby/2016/10/10/a-conversation-with-mike-perham.html), he offers is fantastic.  So rather than double down on Monit, I'm going to branch out and use Inspeqtor.  

# Goals

We want to use Inspeqtor as follows:

* be configured on all boxes by ansible so we never have to do anything manually
* function on Ubuntu 14.04 with upstart
* deliver alerts by email (sendmail) that contain the problem and the instance id
* monitor sidekiq
* monitor apache
* monitor disc space
* monitor ram
* monitor load

# Inspeqtor vs Monit

Monit and Inspeqtor are two very different animals.  Whereas Monit is a general purpose monitoring tool, Inspeqtor is specialized focusing on process that are run thru [init.d / upstart](https://github.com/mperham/inspeqtor/wiki/Initd) as well as generalized machine configuration.  So while you can technically do more with Monit, you'll have a much easier time doing what you generally need with Inspeqtor.

# Configuring Sendmail

Inspeqtor can work with a number of different email delivery approaches from gmail to a local sendmail instance.  The configuration for Inspeqtor for different email delivery engines looks like this:

    #
    # This is the default alert statement.  This tells Inspeqtor where to
    # send alert emails.
    #
    # Here we'll configure the default to send email alerts via gmail to "dev@example.com"
    #
    # send alerts via gmail
    #   with username mike, password fuzzbucket, to_email dev@example.com

    #
    # Here's a generic email example, not requiring Google Mail.
    # Your SMTP server must accept Authentication/TLS.
    #
    # send alerts via email with
    #   username bob,
    #   password "foo bar baz",
    #   smtp_server smtp.example.com,
    #   tls_port 587,
    #   to_email analytics@example.com,
    #   from_email inspeqtor@example.com

    #
    # Here is another generic email example, not requiring authentication.
    # Your local SMTP server must be listening on port 25.
    #
    send alerts via email with
      smtp_server localhost,
      to_email fuzzygroup@gmail.com,
      from_email inspeqtor@{{ ansible_hostname }}

I've got the other approaches commented out just showing the local smtp_server (in my case sendmail).  

Here's an ansible role to configure sendmail:

    mkdir -p ansible_root/roles/sendmail/tasks
    touch ansible_root/roles/sendmail/tasks/main.yml
    
Edit the file main.yml and add these lines:

    - name: install sendmail 
      apt: name=sendmail state=present
    
In your playbook, call this role as follows:

    - { role: sendmail, tags: sendmail}

Here's how to verify if your local sendmail instance is actually running:

    echo "ficrawler1 My test email being sent from sendmail" | /usr/sbin/sendmail fuzzygroup@gmail.com

Check your inbox for the message.  You may find that you need to check a spam or junk folder since this isn't a modern mail server using SPIF / DKIM standards.  If the message didn't arrive then you need to troubleshoot and figure out why.

# Configuring Inspeqtor with Ansible

Inspeqtor relies on several files that determine how it works:

* /etc/inspeqtor/inspeqtor.conf -- how the overall inspeqtor instance runs and how to notifies
* /etc/inspeqtor/host.inq -- what to monitor about the host itself
* /etc/inspeqtor/services.d/WHATEVER_YOU_WANT_TO_MONITOR.inq

Examples of each of these are given below.

## Here is /etc/inspeqtor/inspeqtor.conf

    #
    # Welcome to the global Inspeqtor config file!
    #

    #
    # The cycle time is how often Inspeqtor will capture metrics and
    # verify rules, in seconds.
    #
    set cycle_time 15

    #
    # The deploy length is the maximum length of your application deploys, in
    # seconds. If you start a deploy and then never signal its finish, Inspeqtor will
    # time out the deploy after this many seconds and start checking rules again.
    #
    # This is a failsafe.  Normally you will signal Inspeqtor when your
    # deploys finish.
    #
    set deploy_length 300

    #
    # Set logging level, legal values are:
    #   warn
    #   info (default)
    #   debug (-l debug)
    #   verbose (-l verbose)
    # At info, inspeqtor will not log anything when everything is ok.
    #
    set log_level info

    # Inspeqtor Pro can send collected metrics to Statsd
    # set statsd_location localhost:8125

    #
    # This is the default alert statement.  This tells Inspeqtor where to
    # send alert emails.
    #
    # Here we'll configure the default to send email alerts via gmail to "dev@example.com"
    #
    # send alerts via gmail
    #   with username mike, password fuzzbucket, to_email dev@example.com

    #
    # Here's a generic email example, not requiring Google Mail.
    # Your SMTP server must accept Authentication/TLS.
    #
    # send alerts via email with
    #   username bob,
    #   password "foo bar baz",
    #   smtp_server smtp.example.com,
    #   tls_port 587,
    #   to_email analytics@example.com,
    #   from_email inspeqtor@example.com

    #
    # Here is another generic email example, not requiring authentication.
    # Your local SMTP server must be listening on port 25.
    #
    send alerts via email with
      smtp_server localhost,
      to_email fuzzygroup@gmail.com,
      from_email inspeqtor@ip-172-31-38-2
    
## Here is /etc/inspeqtor/host.inq

    check host
      if load:1 > 1 for 2 cycles then alert
      if load:5 > 1 then alert
      if cpu:user > 95% for 2 cycles then alert
      if swap > 20% for 2 cycles then alert
      if disk:/ > 90% then alert

## Here is /etc/inspeqtor/services.d/service.inq.template
    
This is a generic starting point template to monitor any service in /etc/init.d

    cat  /etc/inspeqtor/services.d/service.inq.template
    # NOTE this file should be renamed to <name>.inq where name is explained below.
    #
    # Inspeqtor is designed to monitor a host and the services running
    # on that host. Services must be controlled by your OS's init system:
    # upstart, systemd, launchd or runit.
    #
    # Inspeqtor knows how to monitor services for each major init system,
    # as long as you give the exact name of that service.
    #
    # In systemd:
    #   /usr/lib/systemd/system/<name>.service
    # In upstart:
    #   /etc/init/<name>.conf
    # In runit:
    #   /etc/service/<name>/run
    # In launchd:
    #   ~/Library/LaunchAgents/<name>.plist
    #
    # Supporting traditional init.d is a little trickier, see the
    # https://github.com/mperham/inspeqtor/wiki/Initd wiki page
    # for more details. tl;dr You need to populate a PID file at
    # /var/run/<name>.pid or /var/run/<name>/<name>.pid
    #

    #
    # Here we define the service to monitor. The name of the service
    # ('mysql') must match the name that your init system uses.
    # You'll want to rename this file to mysql.inq to match.
    #
    check service mysql

      #
      # if you want to monitor daemon-specific metrics, you'll need
      # to tell Inspeqtor how to connect to the daemon.
      # See https://github.com/mperham/inspeqtor/wiki/Daemon-Specific-Metrics
      #
      #with username root, socket /var/run/mysqld/mysqld.sock

      #
      # Add any normal process metrics you want to verify.
      #
      if memory:rss > 2g then alert

      #
      # Since a cycle defaults to 15 seconds, this rule triggers if
      # there's excessive CPU usage for more than 30 seconds.
      #
      if cpu:user > 90% for 2 cycles then alert

      #
      # Alert if we see too many queries or slow queries. These are
      # examples of Daemon-Specific Metrics.
      #
      #if mysql:Queries > 100/sec for 2 cycles then alert
      #if mysql:Slow_queries > 1/sec for 2 cycles then alert    
      
For more on writing your own inq files, see the [wiki](https://github.com/mperham/inspeqtor/wiki/INQ-Configuration).

## Here is my sample sidekiq.inq file

    check service sidekiq
      if memory:rss > 6g then alert, restart
      if cpu:user > 95% for 2 cycles then alert

## Configuring Inspeqtor with Ansible

Rather than write out a playbook, roles and template files manually, I hosted it on [github](https://github.com/fuzzygroup/ansible_inspeqtor).  Clone it from there and adapt it for your needs.  But, in case you're curious, here is the overall structure:

    tree
    .
    ├── ansible.cfg
    ├── group_vars
    │   └── all
    ├── inventories
    │   └── ficrawler11
    ├── playbook_inspeqtor.yml
    ├── playbooks
    ├── readme.md
    └── roles
        ├── inspeqtor
        │   ├── files
        │   │   ├── apache.inq
        │   │   ├── host.inq
        │   │   ├── inspeqtor.conf
        │   │   └── sidekiq.inq
        │   └── tasks
        │       └── main.yml
        ├── sendmail
        │   └── tasks
        │       └── main.yml
        └── setup
            └── tasks
                └── main.yml

The setup task exists to register an ansible variable that gives the instance-id so it can be used in alerting.  This is handled by calling the [instance id api](https://fuzzygroup.github.io/blog/aws/2016/09/07/aws-tutorial-getting-your-instance-id.html) which I covered previously.  While there is an instance_ids method in the [Ansible EC2 module](http://docs.ansible.com/ansible/ec2_module.html), this approach means you don't have your security keys as its a private API you only call from inside the instance itself.

# Managing Inspeqtor on a Daily Basis

With almost any Unix tool you need to know how to do at least two things:

* start / stop
* view logs

Start / Stop on Ubuntu is handled with:

    sudo service inspeqtor restart
    
Logs can be viewed with:

    sudo tail -f /var/log/upstart/inspeqtor.log  
    
# More Info  
  
More info on Inspeqtor can be found on the [wiki](https://github.com/mperham/inspeqtor/wiki).
