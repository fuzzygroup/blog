---
layout: post
title: AWS, Ansible and Boto or Virtualization IS the Answer
category: aws
tags: ["aws", "ansible", "boto", "virtualization", "vagrant"]
---
Historically I haven't been a fan of virtualization whether its Docker, Vagrant or something else.  This whole let's run a computer inside a computer trend, well, it feels lazy.  It feels like we have an excess of performance so let's virtualize!  Today, however, I think I may have turned a corner and started to become a fan.  

The situation in question was using Ansible to dynamically create EC2 instances.  [Nick](http://www.nickjanetakis.com/) and I have been hard at this for the past several days and we're nearing the end -- we can just about *taste* it.  Well, we could taste it and then yesterday we hit this crap:

    TASK [ec2_create_appdata_proxy : create_instance] ******************************
    fatal: [54.244.41.180]: FAILED! => {"changed": false, "failed": true, "msg": "boto required for this module"}
    fatal: [54.218.52.37]: FAILED! => {"changed": false, "failed": true, "msg": "boto required for this module"}
    	to retry, use: --limit @/Users/sjohnson/Dropbox/appdatallc/ansible/playbook_appdata_proxy_create_instances.retry

This was on:

* a brand new MacBook Pro
* clean OS install of whatever damn name comes after Capitan - Yosemite maybe?
* fresh installs of everything
* all components installed thru Ansible itself via my MacBook Pro configuration script

And no matter what we did, neither of us could come up with a way around this including:

* all kinds of sudo manipulations
* installing python's equivalent to rvm -- mkvirtual

While I don't know Nick's age or industry experience, he's a Docker expert, a Udemy star and smart.  My suspicion is that between the two of us we have an aggregate of 40 + industry years.  At least on the Ruby side alone we probably have close to 2 decades of experience.  And yet neither of us could get past an *install issue*: 

* Boto was present
* Boto worked via the command line
* Python was present (Boto is a python thing)

Now I tend to have boxes that run for years and cruft does accumulate.  But this wasn't that circumstance by any means.  This was a box that is so new that it is glorious to use.  And, even so, I'm hitting this crap.  So I know that cruft isn't the issue.  

Nick and I walked away from a morning of pair programming fairly pissed to be honest.  I took the position of "Well, let's provision an instance on AWS and do all our Ansible execution from there."  Nick took the position of "Let's try using Vagrant as a way to run Ansible locally and create the EC2 resources we need" -- and Nick was **right**.

# The Vagrant File

Let's start with the Vagrant file:

    VAGRANTFILE_API_VERSION = '2'

    $provision = <<SCRIPT
    sudo apt-get install -y software-properties-common
    sudo apt-add-repository -y ppa:ansible/ansible
    sudo apt-add-repository -y ppa:chris-lea/python-boto
    sudo apt-get update
    sudo apt-get install -y ansible python-boto python-apt curl git unzip
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
    unzip awscli-bundle.zip
    yes | sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
    sudo rm -rf awscli*
    SCRIPT

    Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
      config.vm.box = 'ubuntu/trusty64'
      config.ssh.insert_key = false

      config.vm.provider :virtualbox do |vm|
        vm.name = 'appdataansible'
        vm.memory = 512
        vm.cpus = 1
        vm.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
        vm.customize ['modifyvm', :id, '--ioapic', 'on']
      end

      config.vm.define :appdataansible
      config.vm.hostname = 'appdataansible'

      # When re-creating VMs, run ssh-keygen -R 192.168.88.2 to fix connect issues.
      config.vm.network :private_network, ip: '192.168.88.2'

      config.vm.provision 'shell', inline: $provision
      config.vm.provision 'file', source: '~/.aws', destination: '~/.aws'
  
      # TODO: Copy in your pem file for appdata (I didn't know the file name)
      config.vm.provision 'file', source: '/Users/sjohnson/.ssh/appdata_aws.pem', destination: '~/.ssh/appdata_aws.pem'
    end
    
All I did was:

* create a text file called Vagrantfile in my ansible root directory (where all my playbooks reside)
* Ran the command: **vagrant up**

This started the virtual machine and it loaded in all my AWS credentials from ~/.aws/credentials.  Once this was running I had an Ubuntu 14.04 distro running locally i.e. "trusty" and I could use it to execute my playbooks as follows:

    ansible-playbook  -i inventories/dummy playbook_appdata_proxy_create_elb.yml -vvv
    
That's the exact syntax I would have used locally.  Even -vvv for extended output is fully available.

Commands I used successfully within vagrant:

* ssh -i ~/.ssh/appdata_aws.pem ubuntu@ec2-54-149-81-245.us-west-2.compute.amazonaws.com (for logging directly into a created instance)
* aws ec2  describe-instances | grep PublicDnsName (for grabbing the DNS names from created instances)

Commands I used to get vagrant going:

* vagrant up (to build it)
* vagrant halt (when I needed to stop it)
* vagrant ssh (to get into it)
* cd /vagrant (to get into my locally mounted filesystem within vagrant)

End to end we spent less than 2 hours to get: 

* vagrant running
* a considerable amount of Ansible development done
* something actually working

Given how hard it can be at times to deal with virtual environments like rvm or its python equivalent and to deal with software troubleshooting this whole process really makes me wonder about whether I should be using Vagrant for other issues.  **Recommended**.