---
layout: post
title: Monitoring Free Disc Space On AWS Instances with Monit, Ansible and SparkPost
category: aws
tags: ["aws", "ansible", "monit", "SparkPost"]
---
There are lots and lots of things that can go wrong with an AWS instance but I have always found that the single most common problem is nothing more than running out of disc space -- log files fill up, too many things get deployed, etc.  And with low end AWS instances being only 8 gigs of free disc space, well, this is bound to happen.

The expensive solution is simple -- buy more disc space -- but I'm **cheap** and that means that the real solution is **monitoring** and **alerting**.  Here's what this means: 

* You need a way to configure monitoring, **automatically**, on **not** just one server but **all** servers you have.  We'll use [Ansible](http://www.ansible.com/) for this.
* You need a monitoring daemon, a piece of software which looks for error conditions and sends email when they occur.  We'll use [monit](https://github.com/arnaudsj/monit) for this.
* You need an email server to send the messages through.  We'll use [SparkPost](http://www.sparkpost.com/) for this.

# Step 1: Installation of Monit with Ansible

Ansible, which I've [written a lot about](http://fuzzyblog.io/blog/category.html#ansible), is a configuration tool for servers, your laptop, etc -- essentially any device that you want to configure can be managed by Ansible.

Here is a basic Ansible role which installs monit along with a configuration file:

    ---
    - name: install monit
      apt: pkg=monit state=present
  
    - name: copy config file
      template: src=roles/install_monit/files/monit.rc dest=/etc/monit/monitrc
  
    - name: start monit
      service: name=monit state=started
    
The lines above would go in a file roles/install_monit/tasks/main.yml.  You could then call that from a playbook with nothing more than:

    - { role: install_monit, tags: monit}
    
As long as all your AWS instances are listed in an inventory file then this will install monit on all boxes, copy up the configuration file and then restart the service.

# Step 2: Monit Configuration

We do need a simple Monit configuration file to tell it about our email server, credentials and the monitoring rules.  Monit is very powerful and can monitor for all kinds of issues but I'm only going to configure free disc space checking.  Where you see things in UPPERCASE then you need to configure them for your settings.

This configuration file will be installed into /etc/monit/monitrc by your Ansible playbook.

    set daemon 120 with start delay 60

      set mailserver smtp.sparkpostmail.com  port 587 username "SMTP_Injection" password "PASSWORD" using tlsv1 with timeout 30 seconds

      set alert YOURADDRESS@YOURSERVER.COM
  
    mail-format {
        From: noreply@YOURSERVER.COM
        Subject: MONIT ERROR !!! [$HOST] $EVENT $SERVICE
        Message: $DESCRIPTION
                 $DATE
    }

    check filesystem "root" with path /dev/xvda1
      if space usage > 90% for 8 cycles then alert
      
And that's it.  Here is the english language explanation of the Monit configuration:

* Set the daemon to monitor every 2 minutes (120 seconds) with a delay of 60 seconds for checking on startup
* Set the mail server to be sparkpost on 587 with the SMTP_Injection username and a password
* Set the alerting email address
* Set the format for the alerting email including subject and description
* check the filesystem device and then alert if the space usage is more than 90% for 8 cycles

# Step 3: Email Configuration

[SparkPost](http://www.sparkpost.com) is a provider of email sending services and they have an incredibly generous free plan with up to 10,000 emails per month for free.  And while I could have used SES or another email service, I've had wonderful success using SparkPost to power my Rails ActionMailer routines so I just reused the same email credentials for Monit and it worked like a charm.  Here's what you need to do:

1.  To get a SparkPost account, sign up [here](https://app.sparkpost.com/account/credentials).
2.  Go to your [dashboard](https://app.sparkpost.com/account/credentials) to get an API key
3.  You do need to goto [Sending Domains](https://app.sparkpost.com/account/sending-domains) and configure the domains that you are sending from and then you need to add the DKIM settings to your DNS provider to prove that you own the domain in question.

# Conclusion

If you put these three pieces together then you will have an Ansible playbook that you can deploy onto all your servers that monitors for free disc space and alerts you via email.  Down the road you could easily enhance the monit script with other things that need monitoring such as http services, CPU load and more.

# Useful References

* [Akabos Gist](https://gist.github.com/akabos/3897117)
* [Art Chang](http://blog.artchang.com/post/37424851210/monitor-memcached-with-monit-and-alert-with-g
)
* [Ansible](http://www.ansible.com/)
* [Monit](https://github.com/arnaudsj/monit)