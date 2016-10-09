---
layout: post
title: AWS Tutorial 15 - SSH Failures Take 3 - Time to Write Some Monitoring Code
category: aws
tags: ["aws", "ssh", "ruby", "monitoring"]
---

OOD Picture

http://www.bbc.co.uk/doctorwho/medialibrary/images/800/s4_03_wal_16.jpg?size=800&promo=/doctorwho/medialibrary/images/main-promo/s4_03_wal_16.jpg&purpose=Computer%20wallpaper&summary=The%20circle%20must%20be%20broken.&info=&tag_file_id=s4_03_wal_16



Well crap.  I just ran my ansible df -h test which checks to make sure my boxes are up and running and I got complete failure:

    fiweb1 | UNREACHABLE! => {
        "changed": false,
        "msg": "Failed to connect to the host via ssh.",
        "unreachable": true
    }
    fiansible2 | UNREACHABLE! => {
        "changed": false,
        "msg": "Failed to connect to the host via ssh.",
        "unreachable": true
    }
    ficrawlerbig | UNREACHABLE! => {
        "changed": false,
        "msg": "Failed to connect to the host via ssh.",
        "unreachable": true
    }
    ficrawler3 | UNREACHABLE! => {
        "changed": false,
        "msg": "Failed to connect to the host via ssh.",
        "unreachable": true
    }
    ficrawler4 | UNREACHABLE! => {
        "changed": false,
        "msg": "Failed to connect to the host via ssh.",
        "unreachable": true
    }
    ficrawler5 | UNREACHABLE! => {
        "changed": false,
        "msg": "Failed to connect to the host via ssh.",
        "unreachable": true
    }
    ficrawler6 | UNREACHABLE! => {
        "changed": false,
        "msg": "Failed to connect to the host via ssh.",
        "unreachable": true
    }
    ficrawler7 | UNREACHABLE! => {
        "changed": false,
        "msg": "Failed to connect to the host via ssh.",
        "unreachable": true
    }
    ficrawler8 | UNREACHABLE! => {
        "changed": false,
        "msg": "Failed to connect to the host via ssh.",
        "unreachable": true
    }
    ficrawler9 | UNREACHABLE! => {
        "changed": false,
        "msg": "Failed to connect to the host via ssh.",
        "unreachable": true
    }
    ficrawler10 | UNREACHABLE! => {
        "changed": false,
        "msg": "Failed to connect to the host via ssh.",
        "unreachable": true
    }

Curiouser and curiouser said Alice.  The interesting thing here is that two of these boxes ARE NOT running our crawler code.  They're actually doing nothing at all.  So what does this tell us:

1.  Perhaps the issue has nothing to do with our code at all.
2.  Perhaps it is an underlying Linux problem on AWS w/ Ubuntu.
3.  It seems to be related to resource consumption but that's a guess not a true statement.
4.  There is no damn way to monitor this (&$#($*#()$*#)) problem since it no one monitors SSH failures.  Sigh.

# Writing Your Own Monitoring Tool

And so I now get to time travel back to 2007, the first time I wrote a monitoring tool in Ruby.  I was working for the late, not-lamented eduFire and there wasn't money to sign up for a monitoring tool.  Ah life in startup land.  My children can and do tell the tale of Dad's computer waking up in the middle of the night screaming "eduFire IS DOWN!!!".  And then there was the incarnation that, a few years later, would plain Billy Idol's White Wedding at top volume.  So this is old territory for me.  But maybe we can do a bit better.  So what do we need to do?

1.  Run forever
2.  Run reliably - this is Ruby after all
3.  Read from the ansible hosts file and get a list of resources to monitor
4.  Loop over the hosts 
5.  Establish an ssh connection 
6.  If successful then do nothing
7.  If unsuccessful increment a failure counter
8.  If failure ctr > a threshold then fire off an alert by playing White Wedding and also send an alert to my phone
9.  Optionally incorporate AWS API calls to restart the instance if this is possible and it has failed more times than a restart threshold

## Run Forever

This can be nothing more than a while(true) loop construct.  It isn't elegant but it will work.

## Run Reliably

We can wrap this within daemon tools supervise to make sure it stays running.

## Read from Ansible Hosts file

This can be done with any of a number of gems which read from an INI file.  No matter what we use, the Ansible INI syntax is funky so we're likely to need some parsing.

## Loop Over The Hosts

The INI gem will return an enumerable collection so this is just a .each call.  Piece of cake.  .each is my single favorite thing in all of Ruby.

## Establish an SSH connection

There has to be a gem for this.  **Google Furiously**  Yep.  Even better Jamis Buck wrote it.  Fantastic.  That means I can trust it.

## Items 6 thru 9

This is the core of a monitoring tool and where crap gets tricky:

* You have to make sure you actually have outbound connectivity so you need something to test against that NEVER goes down.  Hm... 8.8.8.8 is perfect -- it is Google's DNS server and it can be ping'd so I don't have to test via SSH.  There must be a ping gem.  **More Furious Googling**.  Yep.  
* You have to alert.  Yep.  That means I'm going to use Twilio again.  Twilio is fantastic.
* In the event of a failure you have to get my attention and no alert needs to be sent if I'm already at the computer.  I'll yank out the old white wedding play routine I used for my second monitoring tool (which indirectly was this same damn code base) and I'll just reuse it.
* You need a machine which is 24x7 connected to the Internet and never goes away.  Well my Macbook Air travels everywhere I go these days but my Macbook Pro is constantly on.  So I'll use that.

# The Code

Listed below is a rake task which encapsulates the bulk of it.  The detailed stuff is handled by aws_monitor.rb which is a short class of static methods just to simplify the rake task and make them testable.  The only bad thing I can ever say about Jim Weirich is that Rake tasks aren't really testable.  Other than that I wish he was still with us.  Right now this code is a bit of a rough draft as the failure hasn't happened again yet and things like error handling always need to get addressed but it looks something like this:

    namespace :monitor_aws do
      # bundle exec rake monitor_aws:ansible_hosts --trace
      task :ansible_hosts => :environment do
        #
        # Things to change easily for adapting to different environments
        #
    
        # CHANGE THIS to your ansible inventory file
        ansible_hosts_file = File.join(Rails.root, 'script/ansible/inventories/production2')
        # CHANGE THIS to how frequently to monitor
        sleep_time = 60 * 5  # every five minutes we will execute
        # CHANGE THIS to your ssh login
        username = "ubuntu"
        # CHANGE THIS to the number of consecutive failures you want to alert on
        min_failures = 2     
    
        run_ctr = 0
        while(true) do
          run_ctr = run_ctr + 1
          puts "Monitoring run: #{run_ctr}"
          ansible_hosts = AwsMonitor.load_ansible_hosts(ansible_hosts_file)
          failure_ctr = 0
          ansible_hosts.entries.each do |entry|
            ansible_host = AwsMonitor.ini_entry_to_struct(entry)
            session = Net::SSH.start( ansible_host.host_name, username, :keys => ansible_host.keyfile )
            if session.error.nil?
              puts "Success!  The box #{ansible_host.human_name} is still alive!!!".green
            else
              puts "#{session.error}"
              AwsMonitor.play_white_wedding(ansible_host, '')
              debugger          
            end
            session.close
          end
          puts "\n\n\n"
          sleep(sleep_time)
        end
      end
    end

And that's about all there is to it.  The complicated version, which is also written, but not yet published has some other tricks like using ping to make sure my local connectivity didn't fail.  I don't want to publish that yet since I don't understand if my failure condition is going to be a  Net::SSH::AuthenticationFailed or a session.error message or what.  