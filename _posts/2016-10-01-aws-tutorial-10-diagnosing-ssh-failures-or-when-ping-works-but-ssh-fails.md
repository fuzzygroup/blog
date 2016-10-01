---
layout: post
title: AWS Tutorial 10 - Diagnosing SSH Failures or When Ping Works But SSH Fails
category: aws
tags: ["aws", "ssh"]
---
I just had the issue where a Capistrano deploy onto our AWS cluster of boxes failed.  This let me into the following process of debugging:

* Can I ping each box?  Yes!
* Can I ssh into each box?  No!  The box we name ficrawler2 was unable to be ssh'd into and gave this error:

  ssh ficrawler2
  ssh_exchange_identification: read: Operation timed out

My next action was to look at the instance in the web console and discover that it was actually reachable from the perspective of:

  * System reachability check passed
  * Instance reachability check passed
  
{:.center}
![aws_tutorial_10_01.png](/blog/assets/aws/aws_tutorial_10_01.png)
{:.left}
  
This makes me think that SSH itself went down but external network metrics like ping remained up.  Next step up is to reboot the box.  And I did that and the problem persisted.  This led me to thinking that there's a lower level problem here, possibly network layer?

Now from my ssh config tutorial you might know that my ssh config file defined ficrawler2.  Here are the particulars:

  Host ficrawler2
    Hostname ec2-54-68-16-169.us-west-2.compute.amazonaws.com
    User ubuntu
    IdentityFile /Users/sjohnson/.ssh/fi_nav_sitecrawl.pem
    Port 22
    
So this lets us construct a debuggable ssh connect line:
  
    ssh -i "/Users/sjohnson/.ssh/fi_nav_sitecrawl.pem" ubuntu@54.68.16.169 -vv
    
The result of the ssh -i line above will be a very long string of ssh commands showing what happened.

Unfortunately by the time I did the research to figure this out and setup this blog post, ssh returned and I'm left scratching my head more than a bit.  

# Lessons Learned

Here's what we now know:

  * A box can be ping'able but not ssh'able
  * Next time I may want to not reboot so quickly
  * A reboot doesn't necessarily clear it up so the underlying box might actually have been fine
  * I need to write the ssh test line faster next time
  * It is very unclear how AWS cloud watch can be used to test for a box that is unable to be ssh'd into; that may not be viable (monitoring it could actually be construed as an attack)