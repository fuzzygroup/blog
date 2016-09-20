---
layout: post
title: AWS Tutorial 08 - Using SSH's Config File with Your AWS Boxes
category: aws
tags: ["aws", "ssh"]
---
Disclaimer: If you're a hard core Unix head then this can easily be skipped. However if your knowledge of SSH extends to "config file -- what?" then it likely is worth a read.

SSH is one of those core bits of the modern computing world that we all rely on and don't even think about.  And, like all such technologies, there is a lot to SSH under the hood.  The aspect I'm going to focus on here is the SSH config file and how it can make your AWS development life easier.

Let's start with how I first logged into one of my production AWS boxes:

    ssh -i ~/.ssh/my_pem_file.pem ubuntu@ec2-52-39-100-178.us-west-2.compute.amazonaws.com

That certainly works but it is **long**.  And where you have length then you may the chance for error.  And then when you need to transfer a file from server to client (or vice versa) then you need to rewrite it like so:

    scp -i ~/.ssh/my_pem_file.pem ubuntu@ec2-52-39-100-178.us-west-2.compute.amazonaws.com:/tmp/foo.txt ~/Downloads


# The SSH Config file

In your ~/.ssh directory there is a file named, simply enough, **config**.  The config file stores a series of entries related to the the host you want to log into.  Here's an example of what logging in using a config file is like:

    ssh mariadb
    
And here is an example of scp'ing a file down to your local box:

    scp mariadb:/tmp/foo.txt ~/Downloads

So that is a clear advantage but how do we get there?

You need to edit the file ~/.ssh/config.  Do that now with nano or another editor:

    nano -w ~/.ssh/config
    
You need to create an entry that looks like this:

    Host THE_NAME_YOU_IDENTIFY_THIS_ENTRY_BY
      Hostname YOUR_REALLY_LONG_EC2_HOST_NAME
      user SOME_USERNAME
      IdentityFile PATH_TO_A_PEM_FILE
      Port 22 (this is almost always 22)

Here's an actual example for one of my EC2 boxes:

    Host mariadb
      Hostname ec2-52-39-100-178.us-west-2.compute.amazonaws.com
      user ubuntu
      IdentityFile /Users/sjohnson/.ssh/fi_nav_sitecrawl.pem
      Port 22

What this is telling ssh is pretty simple:

* identify everything by mariadb
* when called log into the hostname ec2-52-39-100-178.us-west-2.compute.amazonaws.com
* when called use the username ubuntu
* when called use the /Users/sjohnson/.ssh/fi_nav_sitecrawl.pem to establish the user's identity
* when called use port 22

And, as illustrated above, this will work whether for SSH or SCP.

SSH is one of those rich deep tools where there is always something more to learn.  Here are some resources:

* [http://nerderati.com/2011/03/17/simplify-your-life-with-an-ssh-config-file/](http://nerderati.com/2011/03/17/simplify-your-life-with-an-ssh-config-file/)
* [https://www.digitalocean.com/community/tutorials/how-to-configure-custom-connection-options-for-your-ssh-client](https://www.digitalocean.com/community/tutorials/how-to-configure-custom-connection-options-for-your-ssh-client)
* [http://michaelheap.com/ssh-config-files/](http://michaelheap.com/ssh-config-files/)

