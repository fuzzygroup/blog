---
layout: post
title: Linux, Docker and Where Did My Disc Space Go?
category: pipeline
tags: ["linux", "docker", "pipeline"]
---
{:.center}
![IMG_3897.jpeg](/blog/assets/IMG_3897.jpeg)

Some computing problems fall into the category of evergreen -- no matter what you do, they will always, always, always occur -- they are evergreen just like a pine tree.  Today's version of this is storage.  I've been running an EC2 node which has a SystemD service (no flames; I actually like SystemD although I do regard it as a betrayal of Unix's heritage but ...) which processes some data via a Ruby application which is run through Docker.  

I was monitoring the underlying processing queue and I noticed that this box had seemingly stopped processing leading to a slow down in my data pipeline.  When I dug into the box, I noticed that the box was out of disc space.  This led to the first question "#*#$&#$# where did my disc space go" and caused me to invoke this shell incantation:

    cd / && sudo du -h --max-depth=1

which gave me this:

    16K	./opt
    105M	./boot
    789M	./snap
    56K	./root
    234M	./lib
    40K	./tmp
    763M	./home
    844K	./run
    0	./dev
    16G	./var
    1.6G	./usr
    15M	./sbin
    15M	./bin
    du: cannot access './proc/17764/task/17764/fd/4': No such file or directory
    du: cannot access './proc/17764/task/17764/fdinfo/4': No such file or directory
    du: cannot access './proc/17764/fd/3': No such file or directory
    du: cannot access './proc/17764/fdinfo/3': No such file or directory
    0	./proc
    4.0K	./mnt
    4.0K	./srv
    4.0K	./lib64
    0	./sys
    16K	./lost+found
    4.0K	./media
    5.5M	./etc
    20G	.
  
Looking at the above, I could see that the bulk of the data was in /var so I changed into var and did it again:

    cd /var && sudo du -h --max-depth=1

which gave me:

    4.0K	./local
    4.0K	./opt
    36K	./snap
    4.0K	./mail
    11G	./lib
    24K	./tmp
    5.3G	./log
    768K	./backups
    82M	./cache
    4.0K	./crash
    28K	./spool
    16G	.

Clearly I could have looked at log but I chose to go after lib which was twice as large:

     cd lib && sudo du -h --max-depth=1 

    cd lib && sudo du -h --max-depth=1
    20K	./update-notifier
    544K	./usbutils
    16K	./amazon
    0	./lxcfs
    8.0K	./sudo
    12K	./grub
    11G	./docker
    32K	./polkit-1
    33M	./dpkg
    28K	./pam
    4.0K	./unattended-upgrades
    4.0K	./misc
    4.0K	./dhcp
    4.0K	./git
    4.0K	./os-prober
    4.0K	./python
    8.0K	./logrotate
    12K	./AccountsService
    338M	./snapd
    432K	./systemd
    4.0K	./lxd
    129M	./apt
    4.0K	./landscape
    12K	./private
    184K	./containerd
    120K	./ucf
    4.0K	./ubuntu-release-upgrader
    11M	./mlocate
    4.0K	./command-not-found
    680K	./cloud
    8.0K	./vim
    4.0K	./plymouth
    12K	./update-manager
    4.0K	./man-db
    4.0K	./dbus
    8.0K	./ureadahead
    16K	./initramfs-tools
    11G	.

And that told me that that culprit was **Docker**!  A vague memory of having this issue earlier in my life led me to these docker commands:

    docker system df

which revealed:

    root@ip-172-31-15-140:/var/lib/docker/overlay2/fbacd11ec88524762f258c92223fa8499fb4514c4a2d494e4cf5078d924be626# docker system df
    TYPE                TOTAL               ACTIVE              SIZE                RECLAIMABLE
    Images              35                  9                   9.139GB             8.929GB (97%)
    Containers          37                  1                   2.287GB             2.287GB (100%)
    Local Volumes       0                   0                   0B                  0B
    Build Cache         0                   0                   0B                  0B

and then the logical successor to docker system df was:

    docker system prune -f

After that I had disc space again and then I could start my SystemD service with:

    systemctl status
    systemctl status service.service
    systemctl start service.service

Yes my service is unimaginatively named "service.service"

## In Case Rails is Part of Your System

I ran out of disc space today (July 27, 2020) on a production system running Rails and I started to follow the process above and then I thought -- "Wait -- Rails log". and I:

1. Changed into right user for the Rails process.
2. Changed into the right directory for the Rails app (i.e. RAILS_ROOT/current).
3. Executed a **du -h log**
4. Ran a **bundle exec rake log:clear** when I saw the size of the logs was 90 gigs.

## References

* [Docker Clean Up Commands](https://medium.com/@ruwanka/tidy-and-sparkling-docker-environment-with-new-docker-cleanup-commands-19277f48fd89#:~:text=Reclaim%20Your%20precious%20space,to%20any%20of%20running%20containers.)
*.[Overlay2 infinitely eats space](https://github.com/moby/moby/issues/33775)
* [Mary Rose Cook](https://maryrosecook.com/blog/post/freeing-disk-space-on-your-linux-server)


