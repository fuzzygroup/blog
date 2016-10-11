---
layout: post
title: AWS Tutorial 15 - SSH Take 3 - Using Ansible To Diagnose my SSH Troubles 
category: aws
tags: ["aws", "ansible", "ssh", "ruby"]
---
Everyone wants to think that that complex computing problems are solved with a single flash of blinding insight.  And sometimes you do have that one epiphany that brings everything home.  But, more often than not, computing problems are solved by dogged persistence, by being more stubborn than the problem itself and by careful, diligent incremental progress where you observe the problem in question, altering one variable at a time until you understand what's happening.  

In this step of our ongoing SSH disaster, we're going to use Ansible to gather metrics on our running system and give ourselves a command line tool we can execute regularly.  By building this into a single command line tool, we can run it quickly and easily.  When we can do things quickly and easily we will do them more frequently and more frequency means more data.  And, I tend to believe that more data gives us the opportunity for more insights.  

# A Hypothesis

We've been working on the hypothesis that what's going on is a problem of memory leaks causing an out of memory (OOM) condition on our Linux EC2 instance.  And even though Linux is supposed to kill a run away process that uses too much memory that doesn't seem to be happening.  And, no, I don't understand why.  

There are two basic compute resources that cause any Linux or Unix systems to have problems when they run low:

* memory
* disc

Linux has two tools that we can always run when we're logged into a linux system to monitor these resources:

    df -h
    
    df -h
    Filesystem      Size  Used Avail Use% Mounted on
    udev            7.5G   12K  7.5G   1% /dev
    tmpfs           1.5G  376K  1.5G   1% /run
    /dev/xvda1      7.8G  5.5G  1.9G  75% /
    none            4.0K     0  4.0K   0% /sys/fs/cgroup
    none            5.0M     0  5.0M   0% /run/lock
    none            7.5G     0  7.5G   0% /run/shm
    none            100M     0  100M   0% /run/user
    
    free -m
    
    free -m
                 total       used       free     shared    buffers     cached
    Mem:         15298       8184       7114          0        201       1250
    -/+ buffers/cache:       6732       8566
    Swap:            0          0          0
    
# A Script

What we're going to do is write a tiny script, in Ruby, that we can use to monitor these resources.  And while there are literally hundreds of different monitoring tools that could do this for us, we're going to do it ourselves so we introduce the smallest possible changes to our environments.  I call this type of approach reducing things to **first principles**.  Yes a real monitoring tool would be far more powerful but setting it up would take a bunch of time, introduce multiple changes and then we'd have to learn how to use it.  We're going to write our Ruby script in about 10 minutes and we're done.  

Here's all you need:

    script/free_memory.rb
    
    #!/usr/local/rvm/rubies/ruby-2.3.1/bin/ruby
    output = %x(free)
    parts = output.split(" ")
    total_memory = parts[7].to_i
    used_memory = parts[8].to_i
    free_memory = parts[9].to_i
    output = %x(df -h)
    parts = output.split(" ")
    free_disc = parts[22]
    used_disc = parts[23]
    puts  "Total Memory: #{total_memory} (#{total_memory/1024 / 1024} gb) / Used Memory: #{used_memory} (#{used_memory/1024 / 1024} gb) / Free Memory: #{free_memory} (#{free_memory/1024 / 1024} gb) / Free Disc: #{free_disc} / % Used Disc: #{used_disc}"

This is what I call hobbesian coding after the British philosopher Thomas Hobbes who coined the expression **Life is nasty, brutish and short**.  This is ugly but its quick.  All we need to do is run the command and capture the output.  This is done with output = %x(free) and output = %x(df -h).  We then split it into an array on the space character and then map it to variables.  Finally we have a single puts statement that we displays the result and does some math.

**Note**: This could have been written in anything.  Bash / awk would have been great for it but I'm a Ruby guy so I use the tool that I know.

# The Ansible Connection

If you remember, I said *Linux has two tools that we can always run when we're logged into a linux system*, well being logged into a system is what Ansible **does**.  Ansible is brilliant because it runs via ssh.   SSH means you have a login so  all we need to monitor our box is an ansible ad hoc command to run this and here that is:

    ansible all -i inventories/production2 -u ubuntu -a "/var/www/apps/banks/current/script/free_memory.rb"

That tells Ansible to run on all boxes in the inventories/production2 collection using the username ubuntu and then run whatever code exists at /var/www/apps/banks/current/script/free_memory.rb.  

And here's an example of the result:

    ansible all -i inventories/production2 -u ubuntu -a "/var/www/apps/banks/current/script/free_memory.rb"
    ficrawlerbig | SUCCESS | rc=0 >>
    Total Memory: 15666140 (14 gb) / Used Memory: 351564 (0 gb) / Free Memory: 15314576 (14 gb) / Free Disc: 1.2G / % Used Disc: 84%

    ficrawler4 | SUCCESS | rc=0 >>
    Total Memory: 15666140 (14 gb) / Used Memory: 327688 (0 gb) / Free Memory: 15338452 (14 gb) / Free Disc: 1.5G / % Used Disc: 81%

    fiweb1 | SUCCESS | rc=0 >>
    Total Memory: 65966140 (62 gb) / Used Memory: 3847964 (3 gb) / Free Memory: 62118176 (59 gb) / Free Disc: 305M / % Used Disc: 96%

    ficrawler3 | SUCCESS | rc=0 >>
    Total Memory: 15666140 (14 gb) / Used Memory: 8385776 (7 gb) / Free Memory: 7280364 (6 gb) / Free Disc: 1.9G / % Used Disc: 75%

    ficrawler5 | SUCCESS | rc=0 >>
    Total Memory: 15666140 (14 gb) / Used Memory: 9511684 (9 gb) / Free Memory: 6154456 (5 gb) / Free Disc: 1.2G / % Used Disc: 85%

    ficrawler6 | SUCCESS | rc=0 >>
    Total Memory: 15666140 (14 gb) / Used Memory: 946336 (0 gb) / Free Memory: 14719804 (14 gb) / Free Disc: 1.4G / % Used Disc: 83%

    ficrawler10 | SUCCESS | rc=0 >>
    Total Memory: 15666140 (14 gb) / Used Memory: 351416 (0 gb) / Free Memory: 15314724 (14 gb) / Free Disc: 1.2G / % Used Disc: 84%

    ficrawler7 | SUCCESS | rc=0 >>
    Total Memory: 15666140 (14 gb) / Used Memory: 12421004 (11 gb) / Free Memory: 3245136 (3 gb) / Free Disc: 2.0G / % Used Disc: 74%

    ficrawler8 | SUCCESS | rc=0 >>
    Total Memory: 15666140 (14 gb) / Used Memory: 4821588 (4 gb) / Free Memory: 10844552 (10 gb) / Free Disc: 1.4G / % Used Disc: 82%

    ficrawler9 | UNREACHABLE! => {
        "changed": false,
        "msg": "Failed to connect to the host via ssh.",
        "unreachable": true
    }
    
I've now been running this repeatedly for several days.  And I've learned that I can now pretty well predict when failures are going to occur.  I can also use this to diagnose problems on the boxes.  What we know is that if we're running a heavy weight process like Sidekiq that is literally chewing through memory, the used memory column should actually show something.  If you look above you can see that ficrawler4 has (0 gb) in use.  That means that something has gone wrong.  So if we log into the box and change to the tmux session where this is executing, here's what we find:

    after get_mechanize_links_on_a_pageKilled                                                                                                                                                           │·····························
    __AWS_PRODUCTION__ ubuntu@ip-172-31-32-54:/var/www/apps/banks/current$
    
Now that's interesting, isn't it?  This is actually what's supposed to happen.  When you see Killed on a Linux machine it means that the OOM actually worked for a change.  Praise Be!  And if we log into the box ficrawler10 we will actually find the same thing.  But when we log into ficrawler6, here's what we find:

    ssh ficrawler6
    ssh_exchange_identification: read: Connection reset by peer

Sigh.  Now that's the whole problem we're suffering from.  Now here's what that means -- this crash of ssh -- just happened!  I've been writing this post in real time and running this ad hoc ansible command so about 5 minutes ago ansible could ssh in and run the command.  Now it can't.  So what that means is that there is a time period where we have 0 gb free and the system is still responsive.  That's **really** interesting.  What that means is that we could manually ssh into the box, if we caught it soon enough, and restart the sidekiq process and NOT have to restart the whole box.  

Hm... I need to think about that and I'm pretty sure that it is **important**.

Here's what happens on ficrawler6 when we run our ansible routine again:

    ficrawler6 | UNREACHABLE! => {
        "changed": false,
        "msg": "Failed to connect to the host via ssh.",
        "unreachable": true
    }

We've learned some valuable things from gathering metrics and being able to run them easily.  Lots of people would have taken the approach of using an off the shelf tool for this and while tools are great, they're big.  And they can be intrusive.  Breaking things down to first principles helps you understand.  And sure our ruby script for this is absolute crap.  Move it to a different distro and formatting will likely be off and it will break.  Who cares?  We spent 10 minutes writing it.

# Credit

A Shout Out to [Nick Janetakis](http://nickjanetakis.com/) who was a consultant on [Take 2](https://fuzzygroup.github.io/blog/aws/2016/10/06/aws-tutorial-14-diagnosing-ssh-failures-take-2.html) of this series of posts.  The first thing Nick said was disc space and I probably wouldn't have thought to include disc space monitoring in my Ruby script if he hadn't done that.  Thanks man!