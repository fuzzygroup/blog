---
layout: post
title: Ansible Tutorial 03 - Setting AWS Network and Security Options with Ansible
---


For now we're going to create the resources with the AWS CLI tool and then assign their instance ids in our Ansible group vars file so we can provision them automatically.  I know that you do not know what a group vars file is yet -- that's ok.  We'll cover that below in the Crash Course.  We're going to use this approach for most of the raw AWS resources - use the AWS CLI for creation and then provision it with Ansible.  We'll make an exception for the AWS security group where we use the UI to provision it.  Security is important enough that we want to be 100% sure that what we're getting is what we intend; I don't want a minor code glitch negatively impacting security.


## AWS Resources - The VPC 

Here is the [official AWS documentation on creating a VPC](http://docs.aws.amazon.com/cli/latest/reference/ec2/create-vpc.html) with the command line.  

Open a command line and enter:

    aws ec2 create-vpc --cidr-block 10.0.0.0/16 --instance-tenancy shared
    
## AWS Resources - The Security Group
    
Here is the [official AWS documentation on creating a security group](http://docs.aws.amazon.com/cli/latest/reference/ec2/create-security-group.html) with the command line.  

Open a command line and enter:

## AWS Resources - The EC2 Instances 

Here is the [official AWS documentation on creating EC2 instances](http://docs.aws.amazon.com/cli/latest/userguide/cli-ec2-launch.html) with the command line.

Open a command line and enter:

    

## AWS Resources - The RDS Instance

Here is the [official AWS documentation on creating an RDS database](http://docs.aws.amazon.com/cli/latest/reference/rds/create-db-instance.html) with the command line.

Open a command line and enter:

    

## AWS Resources - The Elastic Load Balancer

Here is the [official AWS documentation on creating an elastic load balancer](http://docs.aws.amazon.com/cli/latest/reference/elb/) with the command line.

Open a command line and enter:


# Pulling Ansible into AWS

With the creation of our resources above, we were able to capture our instance-ids which define the resources.  These instance ids can now be added to our group_vars directory. This directory needs to contain three plain ascii files with no extensions:

* all
* production
* staging

Here's what goes into the all file:

    ---
    app_name: ansible_and_vagrant
    user_name: ubuntu

The all file is used universally for all environments.  We'll use the app_name to create our the directory where our app is installed i.e. /var/www/apps/ansible_and_vagrant.  We'll also use that name to create a shell script which cd's to the right directory.
    
The production file is used for the production environment and is where we'll put our instance ids.  So let's  modify this as follows:

    ---
    db_root_password: maria1234abcd
    aws_instance_id_vpc: 
    aws_instance_id_sg_instance: 
    aws_instance_id_ec2_app1: 
    aws_instance_id_ec2_app2: 
    aws_instance_id_ec2_worker1: 
    aws_instance_id_rds: 

The staging file would get its own password:

    ---
    db_root_password: mariastaging1234abcd
    
Just so you're aware, Ansible has what is referred to as the Ansible Vault which provides encryption of passwords and secrets.  This can be used to avoid plain text storage as above and I'd certainly recommend it.  However, given the length of this post so far, I'm going to skip it for now.
