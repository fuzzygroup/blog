---
layout: post
title: Bad Ansible Error Message - No handler was ready to authenticate
category: ansible
tags: ["ansible"]
---
{% pizzaforukraine  %}

Of all the multitude of sins that software engineers wreak upon the world, I have a personal hatred for crappy error messages.  Crappy error messages are an unforgivable sin that condemn all the people that ever get the error message to waste inordinate amounts of time on thinking, tinkering, google and more.  Here is my command:

    python /etc/ansible/inventory/ec2.py --list    

What this is doing is executing the Ansible ec2.py script which talks to AWS and returns a list of resources.  And here is today's favorite crappy error message:

    Traceback (most recent call last):
      File "/etc/ansible/inventory/ec2.py", line 1701, in <module>
        Ec2Inventory()
      File "/etc/ansible/inventory/ec2.py", line 272, in __init__
        self.do_api_calls_update_cache()
      File "/etc/ansible/inventory/ec2.py", line 539, in do_api_calls_update_cache
        self.get_instances_by_region(region)
      File "/etc/ansible/inventory/ec2.py", line 593, in get_instances_by_region
        conn = self.connect(region)
      File "/etc/ansible/inventory/ec2.py", line 557, in connect
        conn = self.connect_to_aws(ec2, region)
      File "/etc/ansible/inventory/ec2.py", line 582, in connect_to_aws
        conn = module.connect_to_region(region, **connect_args)
      File "/var/lib/jenkins/.local/lib/python2.7/site-packages/boto/ec2/__init__.py", line 66, in connect_to_region
        connection_cls=EC2Connection, **kw_params)
      File "/var/lib/jenkins/.local/lib/python2.7/site-packages/boto/regioninfo.py", line 220, in connect
        return region.connect(**kw_params)
      File "/var/lib/jenkins/.local/lib/python2.7/site-packages/boto/regioninfo.py", line 290, in connect
        return self.connection_cls(region=self, **kw_params)
      File "/var/lib/jenkins/.local/lib/python2.7/site-packages/boto/ec2/connection.py", line 103, in __init__
        profile_name=profile_name)
      File "/var/lib/jenkins/.local/lib/python2.7/site-packages/boto/connection.py", line 1100, in __init__
        provider=provider)
      File "/var/lib/jenkins/.local/lib/python2.7/site-packages/boto/connection.py", line 569, in __init__
        host, config, self.provider, self._required_auth_capability())
      File "/var/lib/jenkins/.local/lib/python2.7/site-packages/boto/auth.py", line 1021, in get_auth_handler
        'Check your credentials' % (len(names), str(names)))
    boto.exception.NoAuthHandlerFound: No handler was ready to authenticate. 1 handlers were checked. ['HmacAuthV4Handler'] Check your credentials
    jenkins@ip-172-31-19-205:/home/ubuntu$ sudo^C
    jenkins@ip-172-31-19-205:/home/ubuntu$ mkdir ~/.aws
    jenkins@ip-172-31-19-205:/home/ubuntu$ mkdir ~/.aws/credentials
    jenkins@ip-172-31-19-205:/home/ubuntu$ rmdir ~/.aws/credentials
    jenkins@ip-172-31-19-205:/home/ubuntu$ nano ~/.aws/credentials
    jenkins@ip-172-31-19-205:/home/ubuntu$  python /etc/ansible/inventory/ec2.py --list
    {
      "_meta": {
        "hostvars": {
          "199.31.18.123": {
            
The trick here was reading enough of it to find "No handler was ready to authenticate."  I discovered this while setting up a new [Jenkins](https://jenkins.io/) server and the error was that Ansible's AWS credentials hadn't yet been copied up the server in the directory:

    /home/jenkins/.aws/credentials
    
Once I put them there this problem went away (another problem came up immediately but one down and N thousand to go).