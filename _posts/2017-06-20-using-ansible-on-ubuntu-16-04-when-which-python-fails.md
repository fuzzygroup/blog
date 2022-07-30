---
layout: post
title: Using Ansible on Ubuntu 16.04 When which python Fails
category: ansible
tags: ["ansible", "devops"]
description: Ubuntu 16 or later doesn't have Python 2 in the path which is challenging for Ansible; here's how to work around that.
---
{% pizzaforukraine  %}

[Ansible](https://www.ansible.com) is my favorite devops tool.  I've used [Chef](https://www.chef.io/chef/) extensively and despite my Ruby background, well, I hated it.  I've slutted around with [TerraForm](https://www.terraform.io); I've played with [Puppet](https://puppet.com) and I've put [Salt](https://saltstack.com) on my food and servers but time in and time out, I always come back to Ansible.  I even like Ansible enough that I wrote about it recently on [a Quora post](https://www.quora.com/What-do-I-need-to-study-before-studying-Ansible-Im-from-a-networking-background-and-we-like-to-do-automation-via-Ansible/answer/Scott-Johnson-16).

One of the beautiful things about Ansible is that it **does not** require a server side agent.  Ansible works via SSH purely and that means that as long as you can login to the server then you can use Ansible to provision it, update it, deploy stuff, etc.  

I just deployed my first ever Ubuntu 16.04 LTS box on AWS the other day and one of my surprises was that a which python **failed**.  Oy vey.  This means that you can't use Ansible without installing Python -- or so I thought.  Happily a bit of googling and I discovered the [ansible_python_interpreter](https://docs.ansible.com/ansible/python_3_support.html) option which lets you override the default of Python 2 and use Python 3.  This gets, oddly, embedded in the inventories file:

    [web]
    site1 ansible_ssh_host=foo.com

    [web:vars]
    ansible_python_interpreter=/usr/bin/python3

The way to interpret this is all boxes in the [web] group use the /usr/bin/python3 executable.
