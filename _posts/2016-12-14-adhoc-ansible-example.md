---
layout: post
title: Adhoc Ansible Example
category: ansible
tags: ["ansible", "adhoc"]
---
I've never been a fan of adhoc ansible -- I'm more of a playbook and role kind of guy but this was pretty useful earlier today:

    ansible -i inventories/machines workers -m shell -a 'python --version'
    
And that gave me the python version on roughly a dozen or so machines allowing me to focus in on the one box where it was was incorrect.