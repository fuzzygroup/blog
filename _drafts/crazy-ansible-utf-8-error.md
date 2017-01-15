---
layout: post
title: Crazy Ansible UTF-8 Error
---
issue is that instance_id was set ot a string ar not a hash_

 from_email {{ ssh_name }}-{{ instance_id['content'] }}@{{ ansible_hostname }}