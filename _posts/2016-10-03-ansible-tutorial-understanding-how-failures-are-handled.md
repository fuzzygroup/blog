---
layout: post
title: Ansible Tutorial 02 - Understanding How Failures Are Handled
---
I just used Ansible to provision 8 new boxes and at the end I saw this:

    PLAY RECAP *********************************************************************
    ficrawler10                : ok=53   changed=18   unreachable=0    failed=0
    ficrawler3                 : ok=53   changed=18   unreachable=0    failed=0
    ficrawler4                 : ok=53   changed=27   unreachable=0    failed=0
    ficrawler5                 : ok=15   changed=1    unreachable=0    failed=1
    ficrawler6                 : ok=53   changed=18   unreachable=0    failed=0
    ficrawler7                 : ok=53   changed=18   unreachable=0    failed=0
    ficrawler8                 : ok=53   changed=18   unreachable=0    failed=0
    ficrawler9                 : ok=53   changed=18   unreachable=0    failed=0
    
If you notice the box ficrawler5 has a state of failed=1 and this made me wonder:

* What happened?
* What happend after that failure?

RUNNING HANDLER [mtpereira.passenger : apache restart] *************************
changed: [ficrawler5]

PLAY RECAP *********************************************************************
ficrawler10                : ok=48   changed=6    unreachable=0    failed=0
ficrawler3                 : ok=48   changed=6    unreachable=0    failed=0
ficrawler4                 : ok=48   changed=6    unreachable=0    failed=0
ficrawler5                 : ok=53   changed=18   unreachable=0    failed=0
ficrawler6                 : ok=48   changed=6    unreachable=0    failed=0
ficrawler7                 : ok=48   changed=6    unreachable=0    failed=0
ficrawler8                 : ok=48   changed=6    unreachable=0    failed=0
ficrawler9                 : ok=48   changed=6    unreachable=0    failed=0

d

    TASK [aws_cloudwatch_memory : add command to cron] *****************************
    skipping: [ficrawler3]
    skipping: [ficrawler4]
    skipping: [ficrawler5]
    skipping: [ficrawler6]
    skipping: [ficrawler7]
    skipping: [ficrawler8]
    skipping: [ficrawler9]
    skipping: [ficrawler10]

    TASK [dockersj : command] ******************************************************
    changed: [ficrawler3]
     [WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo

    changed: [ficrawler7]
    changed: [ficrawler6]
    changed: [ficrawler4]
    changed: [ficrawler8]
    changed: [ficrawler9]
    changed: [ficrawler10]
    fatal: [ficrawler5]: FAILED! => {"changed": true, "cmd": "sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D", "delta": "0:02:00.060733", "end": "2016-10-03 17:05:26.068764", "failed": true, "rc": 2, "start": "2016-10-03 17:03:26.008031", "stderr": "gpg: requesting key 2C52609D from hkp server p80.pool.sks-keyservers.net\ngpg: keyserver timed out\ngpg: keyserver receive failed: keyserver error", "stdout": "Executing: gpg --ignore-time-conflict --no-options --no-default-keyring --homedir /tmp/tmp.Tz2C7bntoi --no-auto-check-trustdb --trust-model always --keyring /etc/apt/trusted.gpg --primary-keyring /etc/apt/trusted.gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D", "stdout_lines": ["Executing: gpg --ignore-time-conflict --no-options --no-default-keyring --homedir /tmp/tmp.Tz2C7bntoi --no-auto-check-trustdb --trust-model always --keyring /etc/apt/trusted.gpg --primary-keyring /etc/apt/trusted.gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D"], "warnings": ["Consider using 'become', 'become_method', and 'become_user' rather than running sudo"]}

    TASK [dockersj : Install docker] ***********************************************
    ok: [ficrawler3] => (item=[u'apt-transport-https', u'ca-certificates', u'docker', u'python-pip'])
    ok: [ficrawler4] => (item=[u'apt-transport-https', u'ca-certificates', u'docker', u'python-pip'])
    ok: [ficrawler6] => (item=[u'apt-transport-https', u'ca-certificates', u'docker', u'python-pip'])
    ok: [ficrawler8] => (item=[u'apt-transport-https', u'ca-certificates', u'docker', u'python-pip'])
    ok: [ficrawler7] => (item=[u'apt-transport-https', u'ca-certificates', u'docker', u'python-pip'])
    ok: [ficrawler10] => (item=[u'apt-transport-https', u'ca-certificates', u'docker', u'python-pip'])
    ok: [ficrawler9] => (item=[u'apt-transport-https', u'ca-certificates', u'docker', u'python-pip'])
    
    
    

git@github.com:appdatallc/honeybadger.git