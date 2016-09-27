---
layout: post
title: AWS Tutorial - Provisioning a Rails System with Ansible
category: aws
tags: ["aws", "rails", "ansible", "provisioning"]
---
Provisioning is the process of taking a machine resource or machine resources and getting them ready for use.  It generally includes software installation, resource configuration, shell level operations such as setting environment variables and so on.  When working in the cloud and the assumption is that machines are ephemeral and can be created / destroyed at will, provisioning is something that you want to happen automatically as needed.  This means that you want provisioning to be scripted so you can run it again as you need new resources

# Image Files versus Provisioning

# Building Resources Automatically versus Not

In this tutorial we're going to work with a pretty standard configuration:

* web1
* web2
* worker1

Web1 and Web2 are both front end apache boxes.  Worker1 is a generic compute resource intended for asynchronous, out of band tasks.  All machines will be t2.micro free instances since, well, they are free.  

Given that EC2 resources generally have a cost associated with them, we're NOT going to create the EC2 boxes automatically.  That will be covered in a later tutorial.  For now we're going to create the resources with the AWS CLI tool and then assign their instance ids in our Ansible group vars file so we can provision them automatically.  I know that you do not know what a group vars file is yet -- that's ok.  We'll cover that below in the Crash Course.  We're going to use this approach for most of the raw AWS resources - use the AWS CLI for creation and then provision it with Ansible.  We'll make an exception for the AWS security group where we use the UI to provision it.  Security is important enough that we want to be 100% sure that what we're getting is what we intend; I don't want a minor code glitch negatively impacting security.

# Assumptions

One of our key assumptions that we're going to make is that we essentially have one type of machine resource, let's call it a **node**.  For us a node will be a general purpose compute resource and all software that we could possibly want to use will be installed on a node.  We may choose not to run the software but at least it will be present.  This will give us the most flexibility in terms of down stream machine re-use.  If, for example, we want to convert a front end web server machine into a back end database machine, well, everything will be there.

Here is the software that we want to provision:

* RVM 
* Ruby 
* MariaDB (just think of it as MySQL if you're not familiar with it)
* Redis
* Memcached
* VI 
* Nano 
* Erlang
* Elixir

Elixir and Erlang aren't part of this but they're valuable development languages and provisioning with Ansible is so easy we'll just put them there in case we want them later.

# What is Ansible?

Ansible is a python based configuration management tool with a strikingly simple approach.  It supports everything from ad hoc usage (example - show me the date and time on all boxes) to complex, idempotent machine configuration using a "playbook", the Ansible term for a series of instructions to follow.  It is an open source project and there's even a fantastic book on it from Leanpub: [Ansible for DevOps](https://leanpub.com/ansible-for-devops).  

# What About Chef?

Given my decade long love affair with Ruby, you might be wondering why I'm using a Python based provisioning tool.  Well the Ruby world equivalent to Ansible is Chef and, well, using Chef was such an awful experience that it turned me off tools like it for about 2.5 years.  Once upon a time Dv and I provisioned a data center with Chef and 2.5 years later it is still a disaster.  Ansible is such an improvement over Chef that it is like a spring breeze as compared to a 1970s gust of New Jersey turnpike air as you drive past the chemical processing plants on the way thru the state.  Words cannot express to you just how much I hate Chef.

# A Fancy Word: Idempotent

One of Ansible's claims to fame is that it supports idempotent machine configuration.  This is a fancy computer science term that just means "always produce the same result regardless of the state".  Think, for example, of installing a big piece of software like MariaDB.  Your machine should either have it installed or not.  It shouldn't ever install it twice.  That's an example of an idempotent software install.  Ansible is smart enough that you can test for presence of something before you install it so its never installed multiple times, breaks its own dependencies, etc.

# A Basic Ansible Crash Course

Like a lot of configuration management software, Ansible relies on a handful of core concepts that it leverages in a pretty universal fashion.  Here's what you need to know:

* Yaml.  All configuration files are yaml and since we're Ruby folk, well, this should be old hat.
* Playbook.  The playbook is the master structure of what you want to build.  A playbook pulls in information from group vars, hosts or inventories and roles.
* Group Vars.  The group vars file stores variables that you want to use in your playbook or other places.  
* Hosts or Inventories.  A hosts file is an inventory of the machine resources you want to configure.
* Roles.  Dv -- what the heck is this?

# Testing Ansible Scripts

One of the most interesting things about Ansible in my opinion is that you can test machine configuration using Vagrant.  Since you can specify your hosts using an external inventory file, by substituting a separate inventory file that points to a series of local vagrant resources, you can speed up testing of your Ansible playbook in a very dramatic fashion.  Dv talks about this in his [Ansible post](http://dasari.me/2016/08/26/ansible-for-aws-provisioning-configuration-management.html).

From an ansible perspective vagrant is your staging environment. This is very different from normal Ruby thinking so I wanted to make sure it was explicitly identified.

# Supporting Ansible in Your Rails Source Code Control Repo

When you think about configuration management, a number of questions come immediately to the fore:

* Where does this go in the context of the Rails application?  
* Is this under version control?  
* Is this just files on a hard disc?  
* Where should it live?

The answers to this are pretty simple:

* Yes it is under version control.  Everything should **always be under version control**.  It is 2016.  I mean come on -- even this blog post is under version control.
* Dev Ops is important and, now a days, so intimately a part of your application that it goes in your source code right along side your code.  I've tried the "put machine configuration routines in a separate git repo" and you just forget about it.  Don't go that route.

If you put this into the Rails application then the first thing you're going to think of is a top level folder named /ansible.  Unfortunately that puts it at the same level of folder importance as /app and that's the wrong decision.  That way every single time you go to click on app you might click on Ansible.  I know it sounds small but a dev team clicks on app thousands of times every _insert_time_period_proportional_to_team_size_ here.  Putting ansible in:

* bin
* config
* db
* public
* spec
* test
* tmp
* vendor

does not feel right.  One obvious contender would be lib where a lot of things tend to live but at a conceptual level that should be about extending the running Rails system not configuration management.  In Rails 5 the decision was made to get rid of the top level script folder in favor of unifying things into bin.  And while that was actually an excellent decision, it feels to me that re-creating the script directory and then putting an ansible directory below it is an excellent convention so that's the path we'll take.  Here are some commands to setup the basic structure you need:

    cd ~/wherever_your_rails_app_is_located
    mkdir -p script/ansible
    mkdir -p script/ansible/group_vars
    mkdir -p script/ansible/inventories
    mkdir -p script/ansible/roles
    
# Reversing the Order of Things: EC2 Last

Historically I've built AWS projects by starting with servers i.e. the EC2 instances that I want.  However, the more that I work with AWS, the more I'm convinced that this is the actually entirely the wrong approach.  There are three reasons for this:

1.  When building AWS projects you need to think of the overall project first -- where as machine resources will come and go, the overall project will still exist.
2.  You want a single VPC or "virtual private cloud".  Think of this as a subnet which lets all your machines talk to each other.  By creating the VPC first it can be assigned to each resource as it is provisioned rather than after the fact.
3.  Each EC2 resource you create inherently comes with its own security group that defines networking / firewall structure.  Unless you're a real network wizard -- and if you are, why are you reading this; you should be writing this -- then I tend to argue for a single security group for simplicity's sake.

# AWS Resources - The VPC and Security Group

Here is the [official AWS documentation on creating a VPC](http://docs.aws.amazon.com/cli/latest/reference/ec2/create-vpc.html) with the command line.  Open a command line and enter:

    aws ec2 create-vpc --cidr-block 10.0.0.0/16 --instance-tenancy shared
    
Here is the [official AWS documentation on creating a security group](http://docs.aws.amazon.com/cli/latest/reference/ec2/create-security-group.html) with the command line.  Open a command line and enter:

# AWS Resources - The EC2 Instances 

    