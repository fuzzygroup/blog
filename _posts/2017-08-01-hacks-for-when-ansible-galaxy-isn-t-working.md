---
layout: post
title: Hacks for When Ansible Galaxy Isn't Working
category: ansible
tags: ["ansible", "ansible-galaxy"]
description: When Ansible Galaxy won't function correctly then there is a work around albeit a mildly hacky one.
---
{% pizzaforukraine  %}

As of late I have manually bootstrapped a handful of machines into production using a text file with some command lines.  Yes this is a crap ass way to do it but one of the key things, Docker, is a damn pain in the ass to install.  Here's what I was using as the command lines:

    sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
    sudo apt-get update
    sudo apt-get install docker-ce
    sudo apt install docker-compose
    sudo groupadd docker
    sudo usermod -aG docker $USER
    sudo systemctl enable docker
    
Even for me that's damn ugly -- so it is clearly time for [Ansible](http://www.ansible.com/).  Ansible is a machine provisioning tool that lets you reduce commands like the above to something short, sweet and idempotent.  For this particular thing I wanted to use [Nick Janetakis' Ansible Galaxy role](https://nickjanetakis.com/blog/automate-installing-docker-and-docker-compose-with-ansible) to make installing this trivial.  Specifically I wanted what his blog post promises:

    - { role: nickjj.docker, tags docker}
    
which is all you need to setup Docker.  And that's actually what I got but I hit a few snags hence the workaround.

The problem that I hit was that his ansible galaxy role has some kind of version control conflict so that the version that gets installed when you type:

    ansible-galaxy install nickjj.docker
    
is actually the version from November 2016, not the current 17.xx version.  What I needed was the master version of the Github repo not the older tagged version.  A bit of googling and some interactions with Nick told me just clone it directly into my own project as a work around.  Here's how I did that:

    # Change into the right directory
    cd ~/me/fuzzygroup/hyde/seira_watch/ansible/roles
    
    git clone git@github.com:nickjj/ansible-docker.git
    
This created an ansible-docker folder in my roles directory and all that I needed to make it work was to change the nickjj.docker reference to:

    - { role: ansible-docker, tags docker}
    
Nick also helpfully pointed out that I could have also cloned to tmp and then renamed to nickjj-docker before copying it over and that would have worked just fine tool.  Thanks Nick!

Note 1: Another workaround supposedly would be to make a requirements.yml file and specify the branch there but I'm less certain on how to do that.

Note 2: I talked about this same type of problem [once before](http://fuzzyblog.io/blog/ansible/2016/10/09/ansible-quickie-fixing-a-poorly-designed-galaxy-role.html).