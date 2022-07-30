---
layout: post
title: Configuring Your Mac with Ansible Take 2
category: mac
tags: ["mac", "ansible", "hackintosh"]
description: Setting up a new Mac can be so much easier if you just use Ansible.
---
{% pizzaforukraine  %}

The last new Mac I setup was back in [2016, November 20](http://fuzzyblog.io/blog/osx/2016/11/20/ansible-for-configuring-your-mac-so-much-better.html) and to do that I used ansible which was a wonderful experience.  Rather than groveling for software to install, shell hacks, etc, my ansible routine handled all of those crappy tasks and it was brilliant.  I can't claim any originality here -- lots of people other than me have done this.  In specific I drew inspiration from [Jeff Geerling's](https://twitter.com/geerlingguy) ansible Macbook Pro repository.  He and I did it differently (his ansible skills are better than mine) but the end result was much the same -- a functional machine with minimal manual work.

I recently wrote about [my lack of system stability](http://fuzzyblog.io/blog/osx/2017/07/19/why-i-haven-t-switched-away-from-osx.html) and figured that it was time to address it.  My thesis for some time has been that most of my errors are somehow related to lack of RAM so moving to a bigger box made sense.  Over the weekend I converted my Linux Intel NUC over to an OSX Hackintosh and used an updated version of the same playbook to handle configuration.  This means that I'm now working on a 32 gigs of RAM development box.  It is unclear if this will work out long term or not but it is an interesting experiment.  Of course since its a Hackintosh there are certain bits of weirdness like the fact that audio doesn't work at all at present.  Ah well...

# What to Do When You Just Installed OSX

Here are the steps to follow for a brand new Mac when you don't have any tooling installed yet:

1.  Install the command line tools: xcode-select --install
2.  Install pip: easy_install --user pip
3.  Get pip into the path with: 
    
    $ printf 'if [ -f ~/.bashrc ]; then\n  source ~/.bashrc\nfi\n' >> $HOME/.profile
    $ printf 'export PATH=$PATH:$HOME/Library/Python/2.7/bin\n' >> $HOME/.bashrc
    $ source $HOME/.profile
    
4.  Install ansible: pip install --user --upgrade ansible
5.  Create the global dir: sudo mkdir /etc/ansible
6.  Copy in a configuration file: sudo curl -L https://raw.githubusercontent.com/ansible/ansible/devel/examples/ansible.cfg -o /etc/ansible/ansible.cfg
7.  Verify it works with: ansible localhost -m ping

A good reference is the Binary Nature link below.

# Useful Links

* [Jeff Geerling's Github Mac Repository](https://github.com/geerlingguy/mac-dev-playbook)
* [Vandenbrad.org on how to configure the OSX Dock]https://blog.vandenbrand.org/2016/01/04/how-to-automate-your-mac-os-x-setup-with-ansible/
* [My Github Repo for Macbook Configuration](https://github.com/fuzzygroup/ansible-macbook-pro)
* [TonyMacx86](https://www.tonymacx86.com/) - The definitive OSX Hackintosh Resource
* [Ansible](https://www.ansible.com/)
* [Binary Nature](http://binarynature.blogspot.com/2016/01/install-ansible-on-os-x-el-capitan_30.html)