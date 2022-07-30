---
layout: post
title: Ansible Unable to Find Boto Errors
category: ansible
tags: ["ansible", "boto", "aws"]
---
{% pizzaforukraine  %}

Over the past several days I have been doing quite a bit of work with the ansible [EC2](http://docs.ansible.com/ansible/ec2_module.html) and [AMI](http://docs.ansible.com/ansible/ec2_ami_module.html) modules for dynamically creating instances and AMIs on AWS.  Ansible, however, doesn't actually talk directly to AWS; it talks to AWS thru a python module named [**boto**](https://github.com/boto/boto).

There are a number of common problems that you might find when you the error "boto required for this module" or "unable to find boto":

* Make sure boto is installed: *sudo pip install boto*
* Uninstall ansible entirely and then install it via Python: *sudo pip install ansible*
* Run your playbook using sudo to ensure that the version of python is the one that comes from sudo
* Eliminate *connection: local* at the playbook level and move it to the task level

**Note**: If you uninstall Ansible using HomeBrew or apt-get, you may find that your Galaxy roles have been uninstalled.  This can very badly impact your playbook execution so be careful.  If you want to avoid this then use the -p option when you install a role to specify that the role goes into a local directory of your choosing; [Stack Overflow Explanation](http://stackoverflow.com/questions/22201306/ansible-galaxy-roles-install-in-to-a-specific-directory).  

The last one of these, eliminating connection: local, requires a bit of explaining.  Details can be found [here](https://github.com/ansible/ansible/issues/15019).  When I first encountered this problem, my playbook looked like this:

    - hosts: "fi_app_metadata_monthly"
      become: yes
      remote_user: ubuntu
      connection: local
      vars:
        - redis_ami_id: "ami-XXXX"
        - redis_security_group_id: "sg-YYY"
        - redis_instance_type: "t2.micro"
        - redis_tag_name: "dynamic_redis_fi_app_metadata_update"
        - redis_instance_count: 1
        - template_instance_id: "i-UUUUUUUU" # in future this comes in from command line
        - number_of_instances: 3                      
        - instance_type: "m3.large"                   
        - region: "us-west-2"
        - vpc_subnet_id: "subnet-IIIIII"
        - vpc_id: "vpc-RRRR"
        - group_id: "sg-YYYY"
        - aws_access_key: "ERRERERE"
        - key_name: "appdata_aws"
        - aws_secret_key: "ERERERE"
        - farm_job_name: "monthly_fi_app_metadata_update_2017-01"
        - farmer_address: "ec2-9-9-9-9.us-west-2.compute.amazonaws.com"
        - tag_name: "fi_app_metadata"
        - rake_task: "bundle exec rake fi_farm_work:fi_app_metadata_update --trace"
      roles:
        - { role: ec2_make_redis_instance_from_ami, tags: ec2_make_redis_instance_from_ami}
    
When the above playbook was run, it resulted in boto not being found errors.  The solution was to remove the line *connection: local* from the playbook and move it to the task level:

    - name: make the redis instance from the ami
      # note - you used to be able to do this at the role level; now it has to be at the task level
      # note - think of this as you are setting the connection context for the task being executed
      connection: local
      ec2:
        aws_access_key: "{{ aws_access_key }}"
        aws_secret_key: "{{ aws_secret_key }}"
        region: "{{ region }}"
        image: "{{ redis_ami_id }}"
        ...

This is one of those code errors that, honestly, I just don't understand.  From talking with another Ansible buddy, [Nick](https://nickjanetakis.com/), he confirmed that it used to work at the playbook level.  Perhaps this is just one of those perplexing changes that results from other other architectural work going on at the project level.