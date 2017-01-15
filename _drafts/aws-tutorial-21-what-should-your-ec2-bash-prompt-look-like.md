---
layout: post
title: AWS Tutorial 21 - Naming Your EC2 Machines, Defining Your Bash Prompt and More
category: aws
tags: ["aws", "bash"]
---
It has been said that there are really only two hard problems in computer science -- [naming things and cache invalidation](http://martinfowler.com/bliki/TwoHardThings.html).  Once upon a time I would have argued against that but increasingly I tend to fall into this camp.  I would tend to argue that if you can't name something that you don't *understand* it.  And I've recently run up against this in terms of my EC2 instances:

* how should they be named
* where should that name be represented
* how should the bash prompt look

I know this sounds simple but its really not.  We're still at the stage of actively debugging our EC2 cluster of boxes and I'm regularly zipping into a box or out of a box via SSH along with frequent cursing such as "Dang it -- why isn't X working #*$#&$()#$*#($)".  I know according to a lot of people you're not supposed to bother SSH'ing into EC2 instances -- they are supposed to be single purpose, ephemeral, etc.  But even though everything is live, well, we're still debugging **everything**.  Sorry folks but that's just the state of my life right now.

So I've got some number of EC2 instances -- more than 10, less than 1000 and any one of them could fail at any point.  I might learn about failures from [Inspeqtor](https://fuzzygroup.github.io/blog/aws/2016/10/20/aws-tutorial-20-adding-machine-and-process-monitoring-to-your-aws-instance-with-inspeqtor.html) or [Monit](https://fuzzygroup.github.io/blog/aws/2016/10/16/aws-tutorial-17-wrapping-up-our-ssh-issues-by-using-monit-for-process-monitoring.html) or by some other means (log files).  Some failures I might discard and others I might need to investigate at the box level by ssh'ing in.  So what has this told us:

* We need to easily be able to get into any box at any time
* Any alerts that we get need to include the machine name
* We need to know what box we're in when we are in it (otherwise its easy to get confused)

And what do we know about working with EC2 boxes:

* The instance id is really all that Amazon cares about

Given that we know that EC2 machines are supposed to be non snowflakes, ephemeral and automatically provisioned, this, to me, argues for a naming convention something like:

    PrefixRoleNumber
    
with those tokens defined as follows:

* prefix - something distinct to the overall project; allows you to have different machines in the same aws account with the same role
* role - what the machine is doing; its function; something like worker or web
* number - just an integer

So if you this all together you get a naming structure like:

* fiworker1
* fiweb1
* fiworker199

And then if you pair this with an ssh config file where names like these are mapped to hosts, particularly if you generate your SSH config file dynamically, you can easily ssh into any box by typing something like **ssh fiworker199**.

Note: If we are going to have a single AWS account manage boxes across multiple projects then we may want to inject the prefix into the role as well.  This would allow automated manipulation of classes of boxes by just tapping into the ec2 name / value space.  If we don't do this then we might manipulate say all web servers for all projects at a time instead of just the web servers for a single project.

So now we know how we want to name boxes, the question comes up as to our bash prompt (or zshell prompt if you're fancy).  I'm not a bash expert by any means but I do know the importance of a good prompt.  What we likely want is something like this:

    username@local_ip@machine_name@instance_id:

That's long but it actually gives us everything we need.  The advantage to a token like @ being injected is that when you double click a portion of the prompt you'll get that information selected so you're just a command+c away from copying it to the clipboard for use somewhere else.

# The Ansible Side of Things

Given how much I do with Ansible, you're likely not surprised that I'm going to automate this.  Given the number of boxes, automation is the only way to go and Ansible, while quirky, is a fantastic tool.

Given how well my previous approach of illustrating the structure and then giving a git repo for the code went recently, I'm doing the same thing again:

    tree .
    
Here's the git repo.

One of the tricks that we're going to use to make this work is push variables at the host level into the inventory file.  This is a very simple trick     

Here's how to use it:

  