---
layout: post
title: Making a Streamlit Machine Learning App into a SystemD Service for Deployment via Ansible
category: python
tags: ["python", "streamlit", "systemd", "linux"]
---
{:.center}
![IMG_7931.jpeg](/blog/assets/IMG_7931.jpeg)

As I [documented recently](https://fuzzyblog.io/blog/python/2019/10/17/a-step-by-step-guide-to-running-streamlit-pytorch-and-bert-on-a-cheap-aws-instance.html), I've become quite the fan of [Streamlit](https://streamlit.io) for taking Machine Learning applications written in Python and making them easily available on the web.  Streamlit is a very cool toolkit for taking a Python Machine Learning app and adding a simple UI to it and then hosting it via a built in web server.  I haven't seen anything really like in the Ruby world and I'm quite impressed by its elegance and simplicity.

**Note**: Before you start down the path of implementing this the way I did, see the last section titled "Note: " after the Jenkins section.

So we have a custom internal app using Streamlit and I am, at present, the only person who can deploy it.  That's, well, stupid.  Deployment always needs to be something that anyone on the technical team should be able to do.  This became increasingly obvious to me when I had to pull over, on Monday afternoon, and deploy fixes to it -- in the first snow of the season.  And, yes, I've been a consultant for a lot of my career so I'm ok with this but it still is sub optimal.

Here's what a deploy using Streamlit onto an Ubuntu server looks like:

1.  SSH into the box.
2.  Change into the right directory.
3.  Do a ps auwwx | grep streamlit and grab the pid (process id).
4.  Do a kill pid.
5.  Do a **git pull**.
6.  Source the python virtual environment with: **source ./venv/bin/active** 
7.  Restart it with the syntax: **nohup streamlit run dashboard.py**

All of this should be able to be automated with [Ansible](https://www.ansible.com/).  Well, let's make that most of it.  The flaw in the ointment is the last thing.  Apparently the only thing that Ansible can't automate is something with nohup.  Now I'm sure if I dug in enough I could either understand it find a way around it but a seemingly solid [Stack Overflow post argues that the right approach is to use SystemD and services rather than nohup](https://stackoverflow.com/questions/53345184/how-can-i-run-nohup-command-in-ansible-playbook-task) and that seems like a good idea actually.  Ansible can easily start and stop SystemD services so we can throw out the entire pid / kill stuff.  

## A Shell Script and a System D Unit File

I don't claim to be a SystemD advocate per se but it is now the current reigning standard so it is better to use it than fight against it (SystemD was pretty controversial within the Unix world).  The basics of SystemD are explained here:

* [RedHat Overview of SystemD](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/sect-managing_services_with_systemd-unit_files)
* [Linode on SystemD](https://www.linode.com/docs/quick-answers/linux/start-service-at-boot/)

The core idea is that your program is a service which runs in the background and can be controlled thru a simple set of commands.  Our service is going to be called rundashboard, so our commands become:

* sudo systemctl start rundashboard
* sudo systemctl stop rundashboard
* sudo systemctl status rundashboard

Here's an example of the output of sudo systemctl status rundashboard 

    sudo systemctl status rundashboard
    ● rundashboard.service - Example systemd service.
       Loaded: loaded (/etc/systemd/system/rundashboard.service; dis
       Active: active (running) since Wed 2019-11-13 17:55:37 UTC; 5
     Main PID: 10449 (bash)
        Tasks: 6 (limit: 4915)
       CGroup: /system.slice/rundashboard.service
               ├─10449 /bin/bash /usr/bin/rundashboard.sh
               └─10459 /home/ubuntu/hate-language-modeling/venv/bin/

From an implementation perspective we need to things:

* A shell script which starts our service
* A SystemD unit file which installs our service into the underlying Unix system

**Note**: I'm not a SystemD expert so I'm absolutely certain that there are subtleties of SystemD that I'm overlooking.

### The Shell Script

Here's the shell script:

```bash
#!/bin/bash
cd /home/ubuntu/hate-language-modeling
source ./venv/bin/activate
nohup streamlit run dashboard.py
```

### The SystemD Unit File

Here's the SystemD unit file:

```bash
[Unit]
Description=Run Streamlit Dashboard.

[Service]
Type=simple
ExecStart=/bin/bash /usr/bin/rundashboard.sh

[Install]
WantedBy=multi-user.target
```

### Installing This

The shell script needs to be copied to to /usr/bin:

    sudo mv rundashboard.sh /usr/bin/rundashboard.sh

The unit file needs to be copied to /etc/systemd/system/ and set to 644 permissions:

    sudo cp rundashboard.service /etc/systemd/system
    sudo chmod 644 /etc/systemd/system/rundashboard.service

## An Ansible Playbook for Deploying Streamlit

While there are lots of ways to use Ansible, I tend to follow a pretty standard approach:

* inventory file that defines the machines on which things are executing
* playbook that defines the role to be run
* role that lists out the tasks to be done

### Inventory File

Given that my specific machines have different IP addresses than yours, I've obfuscated them below.  

```yaml
aws_box1 ansible_ssh_host=1.2.3.4  ansible_ssh_private_key=/Users/sjohnson/Downloads/adl_fuzzygroup.pem ansible_python_interpreter=/usr/bin/python3

aws_box2 ansible_ssh_host=5.6.7.8 ansible_ssh_private_key=/Users/sjohnson/Downloads/adl_fuzzygroup.pem ansible_python_interpreter=/usr/bin/python3
```

### Playbook

Here's the playbook:

```yaml
- hosts: aws_box1
  remote_user: ubuntu
  roles: 
    - { role: deploy_hate-language-modeling_git_clone, tags: deploy }

- hosts: aws_box1
  become: true
  remote_user: ubuntu
  roles: 
    - { role: deploy_hate-language-modeling_systemd_setup, tags: deploy }
    
- hosts: aws_box1
  remote_user: ubuntu
  roles: 
    - { role: deploy_hate-language-modeling_git_pull, tags: deploy }
    
- hosts: aws_box1
  become: true
  remote_user: ubuntu
  roles:
    - { role: deploy_hate-language-modeling_systemd_start, tags: deploy }
```

You'll notice that this is split into four different sections.  The reason for this is that to handle the systemd stuff, the ansible role needs to run as root (the become: true) whereas the git pull / git clone needs to run as the ubuntu user.  And, yes, I know there is an ansible git module that is supposed to work.  And, this time, as **every other** time I have tried to use it, I failed; hence the work around.

### The Git Clone Role

```yaml
- name: Do a git clone if not already checked out
  shell: git clone git@github.com:adl-tech/hate-language-modeling.git
  args:
    chdir: /home/ubuntu/
    executable: /bin/bash
    creates: /home/ubuntu/hate-language-modeling
```

### The Systemd Role Setup Role

An Ansible role is basically a YAML representation of the state of the server that you are trying to achieve.  And, in this case, we need to upload some files into certain locations so we need a files directory which stores them.  Here is the structure of the role that you need to create in your filesystem:

    roles/deploy_hate-language-modeling
    ├── files
    │   ├── rundashboard.service
    │   └── rundashboard.sh
    └── tasks
        └── main.yml

Here's the role itself:

```yaml
- name: install the service
  copy:
    src: files/rundashboard.service
    dest: /etc/systemd/system
    owner: root
    group: root
    mode: '0644'

- name: install the shell script
  copy:
    src: files/rundashboard.sh
    dest: /usr/bin/
    owner: root
    group: root
    mode: '0755'
    
- name: Stop the service if is already running
  systemd:
    name: rundashboard
    state: stopped
```

### The Git Pull Role

```yaml
- name: Do a git pull
  shell: git pull origin dev
  args:
    chdir: /home/ubuntu/hate-language-modeling/
    executable: /bin/bash
```

### The Systemd Start Role

```yaml
- name: start the service
  systemd:
    name: rundashboard
    state: started
```

### Running All This

If you've put all the pieces together correctly then you can run this as follows:

    sudo ansible-playbook -i inventories/inventory.txt playbook_deploy_hate-language-modeling.yml
    
**Note**: I have to run my ansible-playbook with sudo due to messed up python installs on my personal MacBook.  That's a me thing / my mistake not an Ansible thing.

When it runs you should see output like the following (depending on whether or not you have the delightful cowsay installed locally):

```
 _________________
< PLAY [aws_box1] >
 -----------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

 ________________________
< TASK [Gathering Facts] >
 ------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [aws_box1]
 __________________________________________________________
/ TASK [deploy_hate-language-modeling_git_clone : Do a git \
\ clone if not already checked out]                        /
 ----------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [aws_box1]
 _________________
< PLAY [aws_box1] >
 -----------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

 ________________________
< TASK [Gathering Facts] >
 ------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [aws_box1]
 _____________________________________________________________
/ TASK [deploy_hate-language-modeling_systemd_setup : install \
\ the service]                                                /
 -------------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [aws_box1]
 _____________________________________________________________
/ TASK [deploy_hate-language-modeling_systemd_setup : install \
\ the shell script]                                           /
 -------------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [aws_box1]
 __________________________________________________________
/ TASK [deploy_hate-language-modeling_systemd_setup : Stop \
\ the service if is already running]                       /
 ----------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [aws_box1]
 _________________
< PLAY [aws_box1] >
 -----------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

 ________________________
< TASK [Gathering Facts] >
 ------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [aws_box1]
 _________________________________________________________
/ TASK [deploy_hate-language-modeling_git_pull : Do a git \
\ pull]                                                   /
 ---------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

changed: [aws_box1]
 _________________
< PLAY [aws_box1] >
 -----------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

 ________________________
< TASK [Gathering Facts] >
 ------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [aws_box1]
 ___________________________________________________________
/ TASK [deploy_hate-language-modeling_systemd_start : start \
\ the service]                                              /
 -----------------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

changed: [aws_box1]
 ____________
< PLAY RECAP >
 ------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

aws_box1                   : ok=10   changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0


adl/antihate/ansible on ☁️  us-west-2 took 25s
❯
```

## Next Step: Jenkins

Right now our application can be deployed by any developer who has:

* a command line
* ansible installed locally

The real goal here is actually to make it so anyone on our team can deploy this.  And that means that we need a web based user interface that can be wrapped around the Ansible scripting.  In my next bit of writing on this topic, I'll walk thru Jenkins and how to do all that.

**Note**: This ended up being considerably more tricky than is addressed above.  My email is fuzzygroup at gmail.com and you are welcome to reach out to me if you want clarification.  I spent a lot of time writing this up and I can't put more time into it right now but if anyone really needs this, I'll make it a priority.