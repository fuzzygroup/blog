---
layout: post
title: Getting Started with Ansible when You Know Literally Nothing
category: ansible
tags: ["ansible"]
description: While Ansible is a powerful devops tool, getting started with it can be challenging.  This post offers a case study on how to integrate Ansible with a conventional software development build process.
image: https://avatars3.githubusercontent.com/u/1507452?v=3&s=200
---
An old friend, let's call him GC, emailed me earier today about ansible:

> Hi Scott,

> I'm trying out ansible... But I'm a little at a loss as to what I do next.

> Goal: We have been working on an x86 assembly language interpreter available on the web, for student usage.

> We build and test it locally, push to GitHub... but then we have to remember to login to our pythonanywhere servers, do the appropriate pull, and restart the web server.

> This seems like exactly what ansible is for. But I've now installed it locally, and at pythonanywhere, and... well, I'm watching nice videos about the wonderful way ansible can automate this, and I can run ansible-console and see zillions of commands, and...

> Well, I *think* I need a playbook, and I *guess* I can invoke it from my makefile.

> On the remote, I need to:

> Get to the proper directory.

> Run git pull origin (dev or master)

> Restart the web server.

> I also think I need some sort of SSH key.

> Any guidance you can offer on getting going with this would be greatly appreciated!

> gc

Ansible is the best devops tool I've ever used but its yaml based syntax and mixture of different concepts - playbooks, roles, tasks and inventories can make this hard so let's break this down bit by bit and construct a conceptual model for this.

**Note:** If you want a set of introductory slides on Ansible, [here are a set of slides](http://fuzzyblog.io/blog/assets/ansible_basics.pdf) that I gave in Fall 2016 at an Elixir Meetup.

# Definitions

Let's start with some definitions:

* Playbook - A collection of logical tasks that are designed to accomplish a purpose.  Think of a playbook as an executable of limited scope.  Playbooks execute roles.
* Role - A specific thing that you want the playbook to accomplish.  If you had a Playbook that had as its goal to install Ruby then it might have roles of: download source, compile source and then copy the final executable into pace.
* Tasks - A task is a collection of things that a role does.
* Inventory - an inventory is a collection of hosts that you want to execute a playbook on.  This is generally just an ASCII file formatted as a .ini file

# What Actually Is Ansible?

Part of what makes Ansible confusing is that its not an imperative, from start to finish scripting language.  Ansible is instead a *state description system* where what you're doing is describing the state of the system that you want to achieve, as a series of yaml documents, and then Ansible itself reconciles the target system with that state description until it matches.  If you ever did expert systems development then think of Ansible as a problem solving engine and that's actually pretty close to the truth.

# Solving Our Problem

There are at least three ways that we could solve this problem:

* **Local to Remote**

* **Remote to Remote**

* **On Remote**

The difference between these two is **where** Ansible is executing and the reason that's important is that Ansible operates via SSH automation at its core.  This means that the underlying concept of *connection* is key to Ansible.  You can operate Ansible either via a connection from your local machine to a series of remote hosts (your inventory) or you can operate it on a remote host solely (the connection: local approach).  My suspicion is that either approach could be made to work so let's explore both.

## Local to Remote

With a local to remote approach, the ansible code executes initially on your local machine but connects to each of the machines identified in your inventory.  This connection is done through SSH automation.  I know a lot of my readers are people from the Ruby community so perhaps this analogy might help -- if you're at all familiar with [Capistrano](http://capistranorb.com/) then think of this aspect of Ansible as a vastly more generalized Capistrano.

## Remote to Remote

A Remote to Remote approach is actually very similar to local to remote.  The only real difference is that you use a dedicated ansible box on your network to handle running your Ansible code.  This can have some pretty dramatic performance improvements since your remote box is at the same "level" as your ansible code itself.

## On Remote

Another approach would be to run the ansible process solely on the remote machine directly.  I've done less of this but it should certainly be possible.

## Choosing Local to Remote

Local to Remote feels like the cleanest match for this problem given my limited knowledge -- I know only what was in the email printed above (slight readability / formatting changes).  

## Starting with a Make File

GC is a solid, low level software developer so his thinking of ansible as something you run directly from the makefile doesn't surprise me at all.  In an earlier life he implemented the HyperAwk programming language for me using Borland's Turbo Pascal (yes I've known him that long).  HyperAwk was a variant on the Awk programming language that read directly from binary word processing files (Word, WordPerfect, Ami Pro, Samna) and then constructed hypertext documents from them.  I miss HyperAwk but I digress.

Let's start with a sample makefile.  Here's one from the [Gnu folks](https://www.gnu.org/software/make/manual/html_node/Simple-Makefile.html):

    edit : main.o kbd.o command.o display.o 

    main.o : main.c defs.h
            cc -c main.c
    kbd.o : kbd.c defs.h command.h
            cc -c kbd.c
    command.o : command.c defs.h command.h
            cc -c command.c
    display.o : display.c defs.h buffer.h
            cc -c display.c
    insert.o : insert.c defs.h buffer.h
            cc -c insert.c
    search.o : search.c defs.h buffer.h
            cc -c search.c
    files.o : files.c defs.h buffer.h command.h
            cc -c files.c
    utils.o : utils.c defs.h
            cc -c utils.c
    clean :
            rm edit main.o kbd.o command.o display.o \
               insert.o search.o files.o utils.o
             
And while GC's makefile is certainly different, conceptually it should be much the same - a series of steps which result in the production of a binary file.  In GC's case that binary is checked into a version control system and that's what our Ansible playbook will operate on.

What we're going to need to do is invoke our Ansible playbook at the end of the clean: stage with a line something like this:

    ansible-playbook -i /Users/sjohnson/me/fuzzygroup/ansible/gc01/inventories/hosts /Users/sjohnson/me/fuzzygroup/ansible/gc01/playbook_deployer.yml

As I don't know anything about the paths in GC's build system, I'm specifying absolute paths to everything but there's nothing stopping GC from embedding his ansible code into the build process itself -- that's a choice that he could certainly make.  Obviously he would change the /sjohnson/ to something on his local system.

## The Inventory File

The file /Users/sjohnson/me/fuzzygroup/ansible/gc01/inventories/hosts is just an ASCII file that might look something like this:

    [production]
    ansible_ssh_host=ec2-99-39-100-178.us-east-1.compute.amazonaws.com        ansible_ssh_private_key_file=/Users/sjohnson/.ssh/aws.pem
    
If we wanted this to execute on say 10 different hosts then we'd simply enumerate all 10 hosts here.  And if our local machine's SSH keys are setup to reach the remote box directly then we wouldn't even have to specify a .pem file.  The example above shows how I generally configure ansible to talk to AWS since that's a very, very common use case.

## The Roles We Need

Here are the roles that we're likely to need:

* git_pull
* web_server_restart

Ansible like a lot of open source tools can be used in many different ways.  I've looked at a lot of Ansible code on the web and I've written probably close to 10K lines of Ansible by now and I have a pretty opinionated approach to Ansible development by this point.  I treat Ansible code just as if it was "real" source code and I use a very disciplined approach to the files and structure of an ansible "application" -- don't kid yourself, Ansible is a real application development tool even if it doesn't seem like it.  If you have any doubts on Ansible as a development environment, please read [this post of mine](http://fuzzyblog.io/blog/aws/2017/03/06/using-ansible-as-a-development-tool-with-rails.html).

Before we delve too deep into the specific ansible code, let's look at the file structure that makes up what we need to do.  Here is tree's output:

    ~/me/fuzzygroup/ansible/gc01
    20:19 $ tree
    .
    ├── docs
    │   └── readme.txt
    ├── inventories
    │   └── hosts
    └── roles
        ├── git_pull
        │   └── tasks
        │       └── main.yml
        └── web_server_restart
            └── tasks
                └── main.yml

## The Playbook

Here is the playbook that we'll need:

    - hosts: production
      become: yes
      remote_user: ubuntu
      vars:
        - checkout_path: "/home/gc/code"
        - repo: "git://foosball.example.org/path/to/repo.git"
        - version: "release-0.22"
      roles:
        - { role: git_pull, tags: git}
        - { role: web_server_restart, tags: web_server}
        
Each bit of this has the following purpose:

* hosts - identifies a group of hosts in the inventory file. 
* become - tells Ansible to do its operations using sudo 
* remote_user - tells ansible what user to run as on the remote host
* vars - defines a series of variables to be used inside roles
* roles - defines the roles to be called in order

## The Checkout Role

Ansible uses what are called modules to interface with things and, happily, there is a [Git module](https://docs.ansible.com/ansible/git_module.html).  We can use that to handle the checkout and that reduces the complexity down to just a few lines: 

    # https://docs.ansible.com/ansible/git_module.html
    - name: Check out from the Git Repo
      git:
        repo: "{{ repo }}"
        dest: "{{ checkout_path }}"
        version: {{ version }}

## The Web Server Restart

Restarting the web server is a hard to define thing since web servers vary considerably so all I can do here is provide an example based on what I use for a web server -- Apache:

    # https://docs.ansible.com/ansible/shell_module.html
    - name: Restart web server
      shell: 
        cmd: "apache2ctl restart"
        
# Example Repo

All the code referenced above is located in this [git repo](https://github.com/fuzzygroup/ansible_gc).

# Learning More

This is barely touching the surface of Ansible.  Not only did I completely ignore Ansible's idempotent nature but I also skipped a ton of other important things such as AWS automation, the *censored* nature of Ansible Galaxy, python Boto support and more.  Here are some pointers:

* [My Blog on Ansible](http://fuzzyblog.io/blog/category.html#ansible)
* [Jeff Geerling](https://www.jeffgeerling.com/) / [His Github](https://github.com/geerlingguy)
* [Ansible for Devops](https://leanpub.com/ansible-for-devops)
* [Ansible for AWS](https://leanpub.com/ansible-for-aws)

The last two resources are ebooks and they are both excellent.