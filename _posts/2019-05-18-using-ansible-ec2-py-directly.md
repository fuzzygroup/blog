---
layout: post
title: Using Ansible ec2.py Directly
category: ansible
tags: ["ansible", "devops", "python", "aws"]
---
{% pizzaforukraine  %}

This is a shorty but it is incredibly useful when you need to diagnose [Ansible](https://www.ansible.com/) weirdness.  

*Note:* I know this is obvious but when you have used Ansible and AWS extensively, you get used to ec2.py just being a component to Ansible and you don’t even think about calling it directly.

We recently had a situation where all of our Ansible driven deploys were failing.  And the reason for this wasn’t easy to diagnose because all of our deploys were wrapped up in fairly complex shell logic.  What helped us sort it out was breaking the underlying Ansible execution pipeline apart and calling [ec2.py](https://github.com/ansible/ansible/blob/devel/contrib/inventory/ec2.py) directly.  ec2.py is the open source bit that talks to an AWS environment and returns a massive data structure that represents the "inventory" of servers, volumes, network connections, etc.

Here’s the way to call ec2.py directly

    AWS_ACCESS_KEY_ID=some_access_key AWS_SECRET_ACCESS_KEY=some_secret_key /etc/ansible/inventory/ec2.py
    
As long as your ec2.py is executable (and it damn well should be), this will return the normal giant JSON hash of data that represents your AWS environment.  And if it doesn't return a giant JSON hash, well, then you know you have a problem.