---
layout: post
title: Updating to the Latest Ansible on Ubuntu
category: ansible
tags: ["ansible", "ubuntu"]
---
One of the tricky bits about Ansible is that new features in the "language" always require the latest version of Ansible itself.  And, while logical, this can easily bite you.  Here's an example:

```yaml
    TASK [deploy_hate-language-modeling_systemd_start : just force systemd to re-execute itself (2.8 and above)] ***
    fatal: [aws_master2]: FAILED! => {"changed": false, "msg": "Unsupported parameters for (systemd) module: daemon_reexec Supported parameters include: daemon_reload, enabled, masked, name, no_block, state, user"}
    	to retry, use: --limit @/home/ubuntu/ansible/playbook_deploy_hate-language-modeling_master.retry
```    

What that translates to is that Ansible itself doesn't know how to use the parameter **daemon_reexec**.  And when you've been using an Ansible feature successfully and then it doesn't work on the server, that usually is a rock solid signal "update ansible".  

Here's how to do this on Ubuntu:

    sudo apt update
    sudo apt install software-properties-common
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt install ansible
