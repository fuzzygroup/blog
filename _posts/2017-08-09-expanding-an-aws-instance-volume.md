---
layout: post
title: Expanding an AWS Instance Volume
category: aws
tags: ["aws", "docker", "aufs"]
---
One of the true promises of cloud computing is freeing you from resource limits.  In an ideal world you'd be able to easily example: 

* ram
* storage
* networking
* cpu

And while this is somewhat true, the reality is always a bit trickier.  I've had a new project underway for a while and I've been plagued by constant disc space issues.  And while this is a multi container project, my core /var/lib/docker/containers directory is only 1.1 gigs according to a du -sh /var/lib/docker/containers and /var/lib/docker/volumes is only 288K but my /var/lib/docker/aufs directory is 14 + gigs.  Despite diving deeply into the [spotify-gc project](https://github.com/spotify/docker-gc) and the [open issue on Moby](https://github.com/moby/issues/22207), none of these actually solved the issue.

So it was time to just suck it up and add more disc space -- even though I am an admitted cheap bastard and this bothers the hell out of me.  I've done this in the past and while it wasn't [as bad as the last time](http://fuzzyblog.io/blog/aws/2016/11/26/fear-and-loathing-in-awsville-or-adventures-in-partition-resizing.html), it still wasn't obvious.

# How to Expand Your AWS Volume on a Running Instance

I've broken this into two stages.  Here is stage 1 - using the web UI.  **Keep in mind that you are going to need to do a reboot at the end and that means some level of downtime so plan this out accordingly.**

1.  Start at your dashboard on [console.aws.amazon.com](http://console.aws.amazon.com) or however you log in and go into the EC2 section.
2.  Select volumes on the left hand sidebar.
3.  Select the instance.
4.  From the actions drop down select Modify Volume.
5.  Change the disc space to whatever you want and click ok.

This starts the process of AWS reallocating your disc.  If you're on Linux you now need to proceed to stage two:

1.  Log into your box.
2.  Run a df -h and see if the new space shows up.  It almost certainly won't but you can always try.
3.  Run a lsblk to list your blog devices and you need to note the one that your system is using.  The default is /dev/xvda1
4.  Run a sudo resize2fs /dev/xvda1
5.  Reboot the box with /sbin/reboot
6.  Wait the appropriate amount of time and ssh in again.  Re-run df -h and you should see the new space.

# Commentary

As a computer scientist I entirely understand why you have to reboot.  But as a consumer of cloud services it feels to me like we should be past this at this stage of the using cloud services.  All of my AWS experience is generally using Ubuntu and if Amazon was to tell me that this wasn't necessary on the AWS Linux, well, that alone would be enough to make me switch distros.

# Links

Here are two useful links that dig into this:

* [EC2 Console Notes](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html?icmpid=docs_ec2_console)
* [Linux Recognizing the Resized Space](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html#recognize-expanded-volume-linux)

