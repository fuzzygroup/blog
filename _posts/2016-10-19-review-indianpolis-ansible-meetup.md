---
layout: post
title: Review - Indianpolis Ansible Meetup
category: ansible
tags: ["ansible", "tdd", "humor", "serverspec"]
---
I attended the Indianapolis Ansible meetup last night and it was a wonderful, albeit amusing, success.  The thrust of the meetup was watching an Ansible Fest video on TDD and Ansible.  And, well, it was a hoot!  I have rarely, if ever, watched a conference video that got something so damn wrong.  All the videos are [here](https://www.ansible.com/videos-ansiblefest-sf-2016) and most looked excellent.  The video we watched and that I mocked mercilessly is [here](https://www.ansible.com/beginners-guide-to-testing-infrastructure-as-code).  The problems with it were many including:

* The date on the video was 2016 but it felt like we had time traveled back a decade or more "there's this thing called extreme programming"
* The guy who made it terms himself a "Agile Coach" which confirms everything I've ever thought about methodologies
* He advocated that you test not your main ansible playbook but a playbook specifically designed for being tested.  Sheesh.  That's ludicrous.

All problems aside, Jason and Nick did a great job hosting a meetup and I'll definitely be back.  While the video was laughable, here's some of the things I learned:

* If you're going to test Ansible stuff then use [ServerSpec](http://serverspec.org) which is basically RSpec for machine configuration.
* I'm not the only one who despises the RSpec expect syntax - ServerSpec is using .should also.  Yay!
* [CloudOne](http://www.cloudone.com) is doing really interesting things with IOT right here in Indianapolis about 10 minutes from my house.  Bizarre!
* Brixx Pizza is not particularly good (the post meetup food).  Good flavor but horrible crust.
* I'm not the only one who finds almost everything on Ansible Galaxy to be poorly done and barely usable.
* Understanding the scope of your variables in Ansible is confusing to everyone not just me.  I recommended:

  * [https://coderwall.com/p/13lh6w/dump-all-variables](https://coderwall.com/p/13lh6w/dump-all-variables)
  * [https://github.com/f500/ansible-dumpall](https://github.com/f500/ansible-dumpall)
  
* They recommended [Ansible Genome](https://github.com/nickjj/ansigenome).

You can also use the [setup](http://stackoverflow.com/questions/18839509/where-can-i-get-a-list-of-ansible-pre-defined-variables) command which has a tricky syntax.  I finally got it to work with:

    ansible -m setup ficrawlerbig -i inventories/production2 -u ubuntu

and it produced this:

    ficrawlerbig | SUCCESS => {
        "ansible_facts": {
            "ansible_all_ipv4_addresses": [
                "172.31.36.55",
                "172.17.42.1"
            ],
            "ansible_all_ipv6_addresses": [
                "fe80::42c:36ff:fe65:9b93"
            ],
            "ansible_architecture": "x86_64",
            "ansible_bios_date": "05/11/2016",
            "ansible_bios_version": "4.2.amazon",
            "ansible_cmdline": {
                "BOOT_IMAGE": "/boot/vmlinuz-3.13.0-92-generic",
                "console": "ttyS0",
                "ro": true,
                "root": "UUID=87d0529b-216b-4930-9b54-45b0cdca9c06"
            },
            "ansible_date_time": {
                "date": "2016-10-19",
                "day": "19",
                "epoch": "1476872950",
                "hour": "10",
                "iso8601": "2016-10-19T10:29:10Z",
                "iso8601_basic": "20161019T102910892399",
                "iso8601_basic_short": "20161019T102910",
                "iso8601_micro": "2016-10-19T10:29:10.892455Z",
                "minute": "29",
                "month": "10",
                "second": "10",
                "time": "10:29:10",
                "tz": "UTC",
                "tz_offset": "+0000",
                "weekday": "Wednesday",
                "weekday_number": "3",
                "weeknumber": "42",
                "year": "2016"
            },
            "ansible_default_ipv4": {
                "address": "172.31.36.55",
                "alias": "eth0",
                "broadcast": "172.31.47.255",
                "gateway": "172.31.32.1",
                "interface": "eth0",
                "macaddress": "06:2c:36:65:9b:93",
                "mtu": 9001,
                "netmask": "255.255.240.0",
                "network": "172.31.32.0",
                "type": "ether"
            },
            "ansible_default_ipv6": {},
            "ansible_devices": {
                "xvda": {
                    "holders": [],
                    "host": "",
                    "model": null,
                    "partitions": {
                        "xvda1": {
                            "sectors": "16755795",
                            "sectorsize": 512,
                            "size": "7.99 GB",
                            "start": "16065"
                        }
                    },
                    "removable": "0",
                    "rotational": "0",
                    "sas_address": null,
                    "sas_device_handle": null,
                    "scheduler_mode": "deadline",
                    "sectors": "16777216",
                    "sectorsize": "512",
                    "size": "8.00 GB",
                    "support_discard": "0",
                    "vendor": null
                }
            },
            "ansible_distribution": "Ubuntu",
            "ansible_distribution_major_version": "14",
            "ansible_distribution_release": "trusty",
            "ansible_distribution_version": "14.04",
            "ansible_dns": {
                "nameservers": [
                    "172.31.0.2"
                ],
                "search": [
                    "us-west-2.compute.internal"
                ]
            },
            "ansible_docker0": {
                "active": false,
                "device": "docker0",
                "id": "8000.56847afe9799",
                "interfaces": [],
                "ipv4": {
                    "address": "172.17.42.1",
                    "broadcast": "global",
                    "netmask": "255.255.0.0",
                    "network": "172.17.0.0"
                },
                "macaddress": "56:84:7a:fe:97:99",
                "mtu": 1500,
                "promisc": false,
                "stp": false,
                "type": "bridge"
            },
            "ansible_domain": "us-west-2.compute.internal",
            "ansible_env": {
                "HOME": "/home/ubuntu",
                "LANG": "en_US.UTF-8",
                "LC_ALL": "en_US.UTF-8",
                "LC_MESSAGES": "en_US.UTF-8",
                "LOGNAME": "ubuntu",
                "MAIL": "/var/mail/ubuntu",
                "PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games",
                "PWD": "/home/ubuntu",
                "RAILS_ENV": "production",
                "SHELL": "/bin/bash",
                "SHLVL": "1",
                "SSH_CLIENT": "64.184.12.117 61220 22",
                "SSH_CONNECTION": "64.184.12.117 61220 172.31.36.55 22",
                "SSH_TTY": "/dev/pts/0",
                "TERM": "xterm-256color",
                "USER": "ubuntu",
                "XDG_RUNTIME_DIR": "/run/user/1000",
                "XDG_SESSION_ID": "93",
                "_": "/bin/sh"
            },
            "ansible_eth0": {
                "active": true,
                "device": "eth0",
                "ipv4": {
                    "address": "172.31.36.55",
                    "broadcast": "172.31.47.255",
                    "netmask": "255.255.240.0",
                    "network": "172.31.32.0"
                },
                "ipv6": [
                    {
                        "address": "fe80::42c:36ff:fe65:9b93",
                        "prefix": "64",
                        "scope": "link"
                    }
                ],
                "macaddress": "06:2c:36:65:9b:93",
                "module": "ixgbevf",
                "mtu": 9001,
                "pciid": "0000:00:03.0",
                "promisc": false,
                "type": "ether"
            },
            "ansible_fips": false,
            "ansible_form_factor": "Other",
            "ansible_fqdn": "ip-172-31-36-55.us-west-2.compute.internal",
            "ansible_gather_subset": [
                "hardware",
                "network",
                "virtual"
            ],
            "ansible_hostname": "ip-172-31-36-55",
            "ansible_interfaces": [
                "lo",
                "docker0",
                "eth0"
            ],
            "ansible_kernel": "3.13.0-92-generic",
            "ansible_lo": {
                "active": true,
                "device": "lo",
                "ipv4": {
                    "address": "127.0.0.1",
                    "broadcast": "host",
                    "netmask": "255.0.0.0",
                    "network": "127.0.0.0"
                },
                "ipv6": [
                    {
                        "address": "::1",
                        "prefix": "128",
                        "scope": "host"
                    }
                ],
                "mtu": 65536,
                "promisc": false,
                "type": "loopback"
            },
            "ansible_lsb": {
                "codename": "trusty",
                "description": "Ubuntu 14.04.4 LTS",
                "id": "Ubuntu",
                "major_release": "14",
                "release": "14.04"
            },
            "ansible_machine": "x86_64",
            "ansible_machine_id": "3b8fd0372b0e32185bef793d5787f9de",
            "ansible_memfree_mb": 60182,
            "ansible_memory_mb": {
                "nocache": {
                    "free": 62374,
                    "used": 2046
                },
                "real": {
                    "free": 60182,
                    "total": 64420,
                    "used": 4238
                },
                "swap": {
                    "cached": 0,
                    "free": 0,
                    "total": 0,
                    "used": 0
                }
            },
            "ansible_memtotal_mb": 64420,
            "ansible_mounts": [
                {
                    "device": "/dev/xvda1",
                    "fstype": "ext4",
                    "mount": "/",
                    "options": "rw,discard",
                    "size_available": 748208128,
                    "size_total": 8309932032,
                    "uuid": ""
                }
            ],
            "ansible_nodename": "ip-172-31-36-55",
            "ansible_os_family": "Debian",
            "ansible_pkg_mgr": "apt",
            "ansible_processor": [
                "GenuineIntel",
                "Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz",
                "GenuineIntel",
                "Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz",
                "GenuineIntel",
                "Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz",
                "GenuineIntel",
                "Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz",
                "GenuineIntel",
                "Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz",
                "GenuineIntel",
                "Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz",
                "GenuineIntel",
                "Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz",
                "GenuineIntel",
                "Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz",
                "GenuineIntel",
                "Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz",
                "GenuineIntel",
                "Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz",
                "GenuineIntel",
                "Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz",
                "GenuineIntel",
                "Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz",
                "GenuineIntel",
                "Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz",
                "GenuineIntel",
                "Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz",
                "GenuineIntel",
                "Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz",
                "GenuineIntel",
                "Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz"
            ],
            "ansible_processor_cores": 16,
            "ansible_processor_count": 16,
            "ansible_processor_threads_per_core": 1,
            "ansible_processor_vcpus": 16,
            "ansible_product_name": "HVM domU",
            "ansible_product_serial": "NA",
            "ansible_product_uuid": "NA",
            "ansible_product_version": "4.2.amazon",
            "ansible_python": {
                "executable": "/usr/bin/python",
                "has_sslcontext": false,
                "type": "CPython",
                "version": {
                    "major": 2,
                    "micro": 6,
                    "minor": 7,
                    "releaselevel": "final",
                    "serial": 0
                },
                "version_info": [
                    2,
                    7,
                    6,
                    "final",
                    0
                ]
            },
            "ansible_python_version": "2.7.6",
            "ansible_selinux": false,
            "ansible_service_mgr": "upstart",
            "ansible_ssh_host_key_dsa_public": "AAAAB3NzaC1kc3MAAACBAPWIrEktKYrh0VIi4NX/RsuaR4nCi4+MiHz4JOI0jUu1b5EtL8QNE2wXWFOi9NqYDWe35E3Gfep8xUKHsFlVtnEXqnIebPYXwtB39eIolnJP7zuVLDGLB2Ny5/+apN0Md6Kr6ewX75MsvLqb8QlTF8xcp2gzLJycAr4lW5uI+sI3AAAAFQDtkRxdu5rw6iIhDnHNAIO/G0NiewAAAIALCsKgsr9wB1273VND4VLHf9/TjSWBQkNX8BBE+oMlAbmLIPHpNnl7aHmdyyJ6EPXGztqYtF2uacMhSxj5T05I8pqQgjPRDzoJuk1DSS/Q0JmLBkmMHDZxEzsOBcMLzlwSxNaBRhXfMJhCAcv1/rVQeioMIzK0H7RinmO1ypmUmwAAAIBD+Mpmrt9fdTs+442QOOgmAtNI/BsdFBncVPkVHroRH5gyAgmkt/a0D1MFNmv+FF63NXrcmpsuAAwiYsn6vF0ijwEre59vsT7IB4xmsY+2Sv1t11lUUWgPI1RgHCUZnbuAbRhceran34eiIC8gGQO94RkTpuR4+mJeVE8p/kO96w==",
            "ansible_ssh_host_key_ecdsa_public": "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBMjrf03fvK2638wDbB+gsL6z5AQtXHFB37O6H8sJV0fJI++Jl1bOE5vEUQIJgm7KAjY5E78gBMbl93yY9uMJHdc=",
            "ansible_ssh_host_key_ed25519_public": "AAAAC3NzaC1lZDI1NTE5AAAAIP/0jQTWuLTf5s0puYbxJABXIs6vSv8DvLWWdRPr7Fb8",
            "ansible_ssh_host_key_rsa_public": "AAAAB3NzaC1yc2EAAAADAQABAAABAQDqBYCkVLZtWSjaN4bb5wJAKuxqWlWGoorvmRFsFkdNjUVP8HAV/ImcdJ/ifkPn0Vfoa0ioNHB0AJuyawUDKq6bS/8/rm4rcL2fuFSCfRXTUde+KWuMUOFyMGKRTuqJZxei3BLlbJCdsJRJGC5DDgQf9vlWhTYMlRMDgZKEai2Dii/2mHGN0gZRF/9OXkwRJvj3hASj43B4DnIJ5MKdfmjRDOA9NuGaL45KoA1j4Vjds96QZ4g8Wo1HBI/6iZZRohq58RvRvP/uIJrrQjcANXTYa4tIEgqHyIpuylLDWAtuDrj6/XninBs4oZu3++p8PE7eu++O0iq8IXk9B72VSKuF",
            "ansible_swapfree_mb": 0,
            "ansible_swaptotal_mb": 0,
            "ansible_system": "Linux",
            "ansible_system_capabilities": [
                ""
            ],
            "ansible_system_capabilities_enforced": "True",
            "ansible_system_vendor": "Xen",
            "ansible_uptime_seconds": 617356,
            "ansible_user_dir": "/home/ubuntu",
            "ansible_user_gecos": "Ubuntu",
            "ansible_user_gid": 1000,
            "ansible_user_id": "ubuntu",
            "ansible_user_shell": "/bin/bash",
            "ansible_user_uid": 1000,
            "ansible_userspace_architecture": "x86_64",
            "ansible_userspace_bits": "64",
            "ansible_virtualization_role": "guest",
            "ansible_virtualization_type": "xen",
            "module_setup": true
        },
        "changed": false
    }
  
Which isn't anything about the variables in my playbook but I think I have a much better handle on how to use ansible system level variables like the machine's memory size which would let me dynamically adjust my sidekiq thread count for example.

Here's an example of the dumpall approach:

create a playbook called playbook_dump_variables.yml and put this in it:
  
    - hosts: all
      tasks:
      - template:
          src: templates/dump_variables
          dest: /tmp/ansible_variables
      - fetch:
          src: /tmp/ansible_variables
          dest: "{{inventory_hostname}}_ansible_variables"

create a template called templates/dump_variables and put this in it:

    HOSTVARS (ANSIBLE GATHERED, group_vars, host_vars) :

    {{ hostvars[inventory_hostname] | to_yaml }}

    PLAYBOOK VARS:

    {{ vars | to_yaml }}
    
Run it with:

     ansible-playbook -i inventories/production2 playbook_dump_variables.yml -u ubuntu
     
Unfortunately this results in a low level python error ("RepresenterError: cannot represent an object: 172.31.36.55") at the Yaml class level as described [here](https://github.com/openshift/openshift-ansible/issues/2401) which seems to be tied to Ansible's Unicode implementation.

This is really a pity since I think it is exactly what is needed but people seem to be actively working on the bug which is at least good.