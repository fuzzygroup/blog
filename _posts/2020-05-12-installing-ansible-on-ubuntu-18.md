---
layout: post
title: Installing Ansible on Ubuntu 18 on AWS
category: ansible
tags: ["ansible", "linux", "ubuntu"]
---
{:.center}
![IMG_2290.jpeg](/blog/assets/IMG_2290.jpeg)

Ansible is an Open Source DevOps engine for systems configuration.  Here is the process for installing Ansible on Ubuntu 18 for AWS.

    sudo apt-add-repository ppa:ansible/ansible
    sudo apt update
    sudo apt install ansible
    
As with a bunch of my shorter blog posts around installing software, this one is because I needed to install Ansible on a server for work and I figured that documenting it was likely useful (this is now the second time I've had to do it for this job and there will undoubtedly be a third).