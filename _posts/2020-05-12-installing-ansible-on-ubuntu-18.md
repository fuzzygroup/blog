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
    sudo apt install python-pip
    pip install boto3 --user

As with a bunch of my shorter blog posts around installing software, this one is because I needed to install Ansible on a server for work and I figured that documenting it was likely useful (this is now the second time I've had to do it for this job and there will undoubtedly be a third).

## Sources

* [Installing Ansible on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-18-04)
* [Installing Boto on Linux](https://crunchify.com/how-to-install-boto3-and-set-amazon-keys-a-python-interface-to-amazon-web-services/)