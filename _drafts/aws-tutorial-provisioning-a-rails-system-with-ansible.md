---
layout: post
title: AWS Tutorial - Provisioning a Rails System with Ansible
category: aws
tags: ["aws", "rails", "ansible", "provisioning"]
---

**Note:** This is currently draft status.  The github example hasn't been created yet and it is online solely for technical review.  -- Scott

Provisioning is the process of taking a machine resource or machine resources and getting them ready for use.  It generally includes software installation, resource configuration, shell level operations such as setting environment variables and so on.  When working in the cloud and the assumption is that machines are ephemeral and can be created / destroyed at will, provisioning is something that you want to happen automatically as needed.  This means that you want provisioning to be scripted so you can run it again as you need new resources

# Image Files versus Provisioning

There are several basic approaches to building AWS machines for production use:

* manual
* manual to image
* provisioning

With manual, everything you want to do to configure a machine is done, well, manually.  With manual to image, a machine is configured one time and then an **image** of the machine is made.  This image is a full disc clone of the machine with all its settings intact and an image can then be used to make additional machines.  With provisioning, a programmatic approach to building a machine is used with a toolkit such as puppet, chef, salt or ansible.  
# Building Resources Automatically versus Not

In this tutorial we're going to work with a pretty standard configuration:

* web1
* web2
* worker1

Web1 and Web2 are both front end apache boxes.  Worker1 is a generic compute resource intended for asynchronous, out of band tasks.  All machines will be t2.micro free instances since, well, they are free.  

Given that EC2 resources generally have a cost associated with them, we're NOT going to create the EC2 boxes automatically.  That will be covered in a later tutorial.  What we're going to do is create the three resources manually and assign all the network, vpc and security group settings manually.  We will then use the provisioning in this tutorial to configure all needed tools, software and other settings.

At this point you should be comfortable enough with the AWS Console or Command Line Interface to do this manually.  Here's how to do this easily:

1.  Create a single machine resource named web1 and set all the networking (subnet), vpc and security group parameters for the machine.
2.  Create an image file for this machine.
3.  Use that image file to create 2 more machines named web2 and worker1

Take the DNS names from web1, web2 and web3 and put them in a text file as we'll need them later in this tutorial.

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

# A Basic Ansible Concept Crash Course

Like a lot of configuration management software, Ansible relies on a handful of core concepts that it leverages in a pretty universal fashion.  Here's what you need to know:

* Yaml.  All configuration files are yaml and since we're Ruby folk, well, this should be old hat.
* Playbook.  The playbook is the master structure of what you want to build.  A playbook pulls in information from group vars, hosts or inventories and roles.
* Group Vars.  The group vars file stores variables that you want to use in your playbook or other places.  
* Hosts or Inventories.  A hosts file is an inventory of the machine resources you want to configure.
* Roles.  Roles are what you want done.

# Testing Ansible Scripts

One of the most interesting things about Ansible in my opinion is that you can test machine configuration using Vagrant.  Since you can specify your hosts using an external inventory file, by substituting a separate inventory file that points to a series of local vagrant resources, you can speed up testing of your Ansible playbook in a very dramatic fashion.  Dv talks about this in his [Ansible post](http://dasari.me/2016/08/26/ansible-for-aws-provisioning-configuration-management.html).

From an ansible perspective vagrant is your staging environment. This is very different from normal Ruby thinking so I wanted to make sure it was explicitly identified.

# A Basic Vagrant Crash Course

Note: This is an absolute crash course that gives you the bare minimum knowledge to be slightly dangerous with Vagrant.  Vagrant is a robust, powerful end to end tool that deserves far more coverage than I am giving it here.  The official [Ansible Vagrant docs](http://docs.ansible.com/ansible/guide_vagrant.html) are online and quite good.

Vagrant is a virtual machine implementation that generally sits on top of Virtual Box.  Your vagrant derived virtual machine is configured by a file name Vagrant file that exists in a given directory.

## Generating a Virtual Machine

At your command line, in the ~/yourapp/script/ansible directory give the following command:

    vagrant init ubuntu/trusty64; vagrant up --provider virtualbox

That will initialize a vagrant 64 bit virtual machine based on Ubuntu 14.04 trusty and tie it to Virtual Box.  If you want a different Linux flavor then you can get a list of them from the [Hashi Corp atlas](https://atlas.hashicorp.com/ubuntu/boxes/trusty64).

## Log into Your Virtual Machine

At your command line, in the ~/yourapp/script/ansible directory give the following command:

    vagrant ssh
    
The default username is vagrant and the password, if asked, is the empty string so just press ENTER.

## Understanding Your Vagrant File

The vagrant init command above generated a Vagrantfile that should look something like this:

    Vagrant.require_version ">= 1.7.0"

    Vagrant.configure(2) do |config|

      config.vm.box = "ubuntu/trusty64"

      # Disable the new default behavior introduced in Vagrant 1.7, to
      # ensure that all Vagrant machines will use the same SSH key pair.
      # See https://github.com/mitchellh/vagrant/issues/5005
      config.ssh.insert_key = false

      config.vm.provision "ansible" do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "playbook.yml"
      end
    end

As you can see a Vagrantfile uses Ruby as its its configuration syntax.
    
You may want to add this section so you can better understand what's going on during the boot process.  Sometimes a vagrant box may put up a login or grub prompt and without the .gui option you never see it and your vagrant box unhelpfully times out.

    config.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      vb.gui = true
    end
    
## Status / Stopping / Starting / Destroying Your Vagrant Virtual Machine

The basic vagrant commands are pretty simple:

  * vagrant -- with no commands, you get a list of commands
  * vagrant init -- creates the virtual machine
  * vagrant halt -- stops the virtual machine
  * vagrant up -- starts the virtual machine
  * vagrant ssh -- logs in
  * vagrant status -- gets the status of your virtual machine
  * vagrant destroy -- destroys everything; after this you need to re-init based on the vagrant file.  
  * vagrant provision -- runs the ansible provisioning attached to the vagrant 
  * vagrant reload -- destroys and recreates the current virtual machine
  
**Note:** If you're experimenting with different Vagrantfiles in the same directory then you need to **destroy** when you change out the Vagrantfile or you'll get the old virtual machine.  At times this is not very apparent.

My strong recommendation is that if you're going to experiment with different Vagrantfile(s) then you put each one in its own directory and adjust your pathing accordingly.  For example you could do:

      config.vm.provision "ansible" do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "../../playbook.yml"
      end
    
if you had a directory virtual_machines and sub directories "trusty64" and "jessie" (for Ubuntu trusty and Debian jessie).

## Vagrant Closing Thoughts and Recommended Followup

At this point you have a basic Vagrantfile that creates a virtual machine that we can use to test our Ansible provisioning routines.  We should now be ready to continue with Ansible.  As I noted at the beginning of this section, Vagrant is a rich, deep product and there is a lot to learn here.  A good example set of urls for learning more are below:

* [https://github.com/IronicBadger/ansible](https://github.com/IronicBadger/ansible)
* [https://www.linuxserver.io/index.php/2016/02/06/snapraid-mergerfs-docker-the-perfect-home-media-server-2016/](https://www.linuxserver.io/index.php/2016/02/06/snapraid-mergerfs-docker-the-perfect-home-media-server-2016/)
* [https://www.youtube.com/watch?v=lumHT3MAS_w](https://www.youtube.com/watch?v=lumHT3MAS_w)

In these resources the author uses Ansible and Vagrant to setup a full home media server including a multiple disc raided file system -- all tested with vagrant.  It is an impressive example.

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
    touch 
    
This gives us the core structure for an Ansible setup.  One of the core ideas in ansible is that of a Role.  A role is what you want to do so let's think about the process of getting a machine setup from scratch.  If you've ever brought up an AWS box from scratch then you know that one of the things you first do is:

    sudo apt-get update

You then proceed to installing software to get your machine's baseline toolset up and running.  This normally includes git, vim, etc.  For the purposes of this document I'm going to refer to this role as machine_setup and its going to be our first role.  Here's basic file structure you need to build.

    cd ~/wherever_your_rails_app_is_located    
    mkdir -p script/ansible/machine_setup
    mkdir -p script/ansible/machine_setup/defaults
    mkdir -p script/ansible/machine_setup/files
    mkdir -p script/ansible/machine_setup/handlers
    mkdir -p script/ansible/machine_setup/tasks
    mkdir -p script/ansible/machine_setup/templates
    mkdir -p script/ansible/machine_setup/vars
    
We may not use all of the support subdirectories but, for learning purposes, I thought it important to have them all.  Here are their functions:

* defaults -- values that you use to turn on / off sections of the install
* files -- configuration files to copy up to the server and install
* handlers -- a yaml file which defines things like unix services
* tasks -- what the role is actually doing; this is the meat of the role
* templates -- files that we use to template other files that we're going to generate
* vars -- variables specific to this role
  
## Three Tasks - baseos, main, users

There are three tasks that we need to look at: main.yml, baseos.yml and users.yml

**main.yml**:
    #--- (this line is commented out since it causes formatting issues with my blogging tool, jekyll)
    # machine specific setup
    - name: configure base-os
      include: base-os.yml
      when: base-os
      tags: baseos
    - name: configure users
      include: users.yml
      when: users
      tags: users
      
This routine basically kicks everything off and what its saying is "run base-os" and then "run users".  It is important to understand two things about Ansible .yml files:

* the --- at the start is actually optional.  You will almost always see it but it isn't actually required; it is a legacy convention.
* The name: is there solely for documentation; it is actually just a comment.

**base-os.yml**:
    #--- (this line is commented out since it causes formatting issues with my blogging tool, jekyll)
    - name: ensure os is up to date
      apt:
        update_cache: yes
        upgrade: full
        cache_valid_time: 300

    - name: install packages
      apt: pkg={{ item }} state=present
      with_items:
        - bash-completion
        - curl
        - exiftool
        - git
        - htop
        - iftop
        - iotop
        - mytop
        - jq
        - lynx
        - mc
        - ncdu
        - nmap
        - python
        - smartmontools
        - sudo
        - tmux
        - tree
        - wget
        - xfsprogs

      tags:
        - packages
        
This routine is the meat of it.  It is essentially doing two things:

* The initial apt-get update which brings a new machine up to date with the latest packages (name: ensure os is up to date)
* The installation of a baseline set of tools.  This syntax is actually the equivalent of a loop where with_items is the collection of data we're looping and apt: is what we're doing with it (name: install packages).
* The state=present bit indicates that we're operating in an idempotent fashion

**users.yml**:    
    ---
    - name: create user ubuntu
      user:
        name: ubuntu
        state: present
        groups: "sudo,docker"
        
This routine creates a single user and assigns them to two groups - sudo and docker.        
    
## A Test Application

A test Rails application of all this can be found at this url:

* https://github.com/fuzzygroup/rails_with_ansible_and_vagrant (tbd to be created)

## Ansible Recommended Reading

I cannot describe to you how much richer and deeper all of this can go.  Ansible is a very powerful bit of software.  Here are two books that you might want to consider:

* [https://leanpub.com/ansible-for-aws](https://leanpub.com/ansible-for-aws)
* [https://leanpub.com/ansible-for-devops](https://leanpub.com/ansible-for-devops)

I'm cheap and even I sprang for these.  Recommended.
    
# AWS Configuration - Reversing the Order of Things: EC2 Last

Historically I've built AWS projects by starting with servers i.e. the EC2 instances that I want.  However, the more that I work with AWS, the more I'm convinced that this is the actually entirely the wrong approach.  There are three reasons for this:

1.  When building AWS projects you need to think of the overall project first -- where as machine resources will come and go, the overall project will still exist.
2.  You want a single VPC or "virtual private cloud".  Think of this as a subnet which lets all your machines talk to each other.  By creating the VPC first it can be assigned to each resource as it is provisioned rather than after the fact.
3.  Each EC2 resource you create inherently comes with its own security group that defines networking / firewall structure.  Unless you're a real network wizard -- and if you are, why are you reading this; you should be writing this -- then I tend to argue for a single security group for simplicity's sake.

Since I am not truly a networking expert I find the VPC and Security Groups the hardest part of AWS to master. Thankfully Amazon has provided some [excellent documentation on both VPC and Security Groups](http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html).

**Important**: At the end of the creation process for each of these the Amazon Instance ID will be displayed as a part of a bit of JSON information.  Please make note of it in each case because you're going to need it in the next section

## Understanding our AWS Resources

What we're building is a Rails application with 3 ec2 instances:

* web1
* web2 
* worker1

Now, while there are three ec2 servers, we're actually going use more AWS resources than that.  We need the following types of resources:

* ec2 - These are the servers we're using.  All of them will be t2.micro free instances since that's all we need for a test application
* vpc - A VPC is a virtual private cloud.  Think of this as a private subnet that spans all your ec2 resources and connects them. 
* sg - A Security Group defines traffic rules that allow or deny connectivity both inbound or outbound for all your machines.  It is very, very important to understand that there is NO connectivity between machines unless you specifically allow it.
* elb - An Elastic Load Balancer acts as a proxy in front of your web machines to distribute traffic.  Historically load balancers have been one of those "oh crap I need a load balancer; damn it; no, no, no I'll just make my Apache box bigger to handle the traffic so I can delay doing a load balancer" types of technical moments.  AWS makes building a load balancer so trivial that even I now put a load balancer into a test application.  Honestly the hardest part of an ELB is realizing that it isn't a top level UI option in the AWS web ui but instead associated with your EC2 instances.  At least that's how I went looking for it the first dozen times I did this.  


# Putting it All Together and Running Everything

What we have been building to is an ansible playbook which is a collection of files and directories that define a set of resources which we want to configure.  Given that we're using a Vagrant virtual machine for testing, the easiest way to execute this is:

    vagrant provision

Now if you're talking about production, this is all executed with the ansible-playbook command as follows:

    ansible-playbook -i INVENTORY_FILE playbook_name
    
Here's an example how to execute this in production:    

    ansible-playbook -i inventories/production playbook.yml

But what if you want to generate to only run certain roles?  Well you can use the tags defined for each role to handle that:

    ansible-playbook -i inventories/production playbook.yml --tags "apache2"
    
The above line will run ONLY the apache2 role.
    
Here is the exact provisioning routine that Vagrant generated for us:
    
# Sidebar 1: Ansible Galaxy

When you look at the readme file in the directory of overall files for ansible, you will find references to ansible-galaxy, specifically:

ansible-galaxy install rvm_io.rvm1-ruby

What this is doing is installing into your local machine a role which acts like a software component.  Since we're approaching ansible from a Ruby context, think of it as a gem that you're calling.  

All the galaxy installs used for this are listed in the readme file and need to be executed locally BEFORE you run the vagrant provision or ansible-playbook routine.  There does not seem to be a way to automatically include an ansible-galaxy routine inside your playbook (at least that I have been able to find).

# Sidebar 2: The Vagrant / Ansible Development Process

One of the hardest things about mastering any new technology is figuring out a development process that works for you.  Here is what I found works for me:

1.  Write a single role at a time.
2.  Leave  #todo note for something you don't understand.  For example I have found that writing the handlers to start and stop a service is harder than the installation so my redis role initially was nothing more than:

    - name: Install redis-server and header libs
      apt: pkg={{ item }}
           state=present
      with_items:
        - redis-server
        
    until I could figure out how to get the handlers written.
    
3.  After each change you make, do a vagrant provision.  Yes this is slower than doing stuff all at once but it is vastly less likely to break.  If you only take one thing away form this development process, I hope that it is this -- doing a vagrant provision every time you change anything.  Ansible is idempotent which means that most changes only take the time for them to run rather than the full end to end process.

# Additional Reading

* [http://docs.ansible.com/ansible/playbooks_roles.html#dynamic-versus-static-includes](http://docs.ansible.com/ansible/playbooks_roles.html#dynamic-versus-static-includes)  **Absolutely Recommended!**
* [http://edunham.net/2015/06/08/playing_with_ansible.html](http://edunham.net/2015/06/08/playing_with_ansible.html)
* [http://docs.ansible.com/ansible/intro_adhoc.html](http://docs.ansible.com/ansible/intro_adhoc.html)
* [http://stackoverflow.com/questions/30119973/how-to-run-a-task-when-variable-is-undefined-in-ansible](http://stackoverflow.com/questions/30119973/how-to-run-a-task-when-variable-is-undefined-in-ansible)
* [http://docs.ansible.com/ansible/gem_module.html](http://docs.ansible.com/ansible/gem_module.html)
* [https://github.com/rvm/rvm1-ansible/issues/35](https://github.com/rvm/rvm1-ansible/issues/35)
* [https://github.com/rvm/rvm1-ansible/issues/56](https://github.com/rvm/rvm1-ansible/issues/56)
* [https://github.com/mtpereira/ansible-passenger](https://github.com/mtpereira/ansible-passenger)
* [https://github.com/jlund/mazer-rackham](https://github.com/jlund/mazer-rackham)
* [https://github.com/ansible/ansible-modules-extras](https://github.com/ansible/ansible-modules-extras)
* [http://docs.ansible.com/ansible/file_module.html](http://docs.ansible.com/ansible/file_module.html)
* [https://github.com/yankurniawan/ansible-for-aws](https://github.com/yankurniawan/ansible-for-aws)
* [http://docs.ansible.com/ansible/playbooks_vault.html](http://docs.ansible.com/ansible/playbooks_vault.html)
* [http://stackoverflow.com/questions/31343753/ansible-variable-defined-in-group-vars-all-not-found](http://stackoverflow.com/questions/31343753/ansible-variable-defined-in-group-vars-all-not-found)
* [https://github.com/rvm/rvm1-ansible/issues/26](https://github.com/rvm/rvm1-ansible/issues/26)
* [http://docs.ansible.com/ansible/apt_module.html](http://docs.ansible.com/ansible/apt_module.html)
* [http://docs.ansible.com/ansible/apt_key_module.html](http://docs.ansible.com/ansible/apt_key_module.html)
* [http://docs.ansible.com/ansible/shell_module.html](http://docs.ansible.com/ansible/shell_module.html)
* 
* 
* 


    
