---
layout: post
title: AWS Tutorial 13 - Adding Idempotency to Our CloudWatch Monitoring Playbook
category: aws
tags: ["aws", "ansible", "cloudwatch"]
---
In Tutorial 11 we used an Ansible playbook to set up CloudWatch memory monitoring on a series of Ubuntu EC2 instances.  This worked perfectly -- **once**.  I noticed, after I published the blog post, that if I tried to re-run the Ansible script playbook that it fail on a second run.  Initially I chalked this up to plain old randomness but then I actually **thought** about it and it all came into focus.

# Ansible is All About Idempotency and This Was Not

http://docs.ansible.com/ansible/stat_module.html
https://raymii.org/s/tutorials/Ansible_-_Only_if_a_file_exists_or_does_not_exist.html

http://www.caphrim.net/ansible/2015/05/25/be-careful-with-unarchive.html

