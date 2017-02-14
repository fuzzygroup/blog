---
layout: post
title: A Return to Adventures in Partition Resizing
---
sudo mount /dev/xvdf /mnt/fidb -t ext4
mount: wrong fs type, bad option, bad superblock on /dev/xvdf,
       missing codepage or helper program, or other error
       In some cases useful info is found in syslog - try
       dmesg | tail  or so

__AWS_PRODUCTION__ ubuntu@ip-172-31-33-48:~$ ls /mnt/xvdf
ls: cannot access /mnt/xvdf: No such file or directory
__AWS_PRODUCTION__ ubuntu@ip-172-31-33-48:~$ dmesg | tail
[14538263.738773] EXT4-fs (xvdf): VFS: Can't find ext4 filesystem
[14538263.741517] FAT-fs (xvdf): bogus number of reserved sectors
[14538263.743975] FAT-fs (xvdf): Can't find a valid FAT filesystem
[14538263.764888] EXT4-fs (xvdf): VFS: Can't find ext4 filesystem
[14538263.767821] EXT4-fs (xvdf): VFS: Can't find ext4 filesystem
[14538263.770590] EXT4-fs (xvdf): VFS: Can't find ext4 filesystem
[14538263.773375] FAT-fs (xvdf): bogus number of reserved sectors
[14538263.775804] FAT-fs (xvdf): Can't find a valid FAT filesystem
[14538263.797374] ISOFS: Unable to identify CD-ROM format.
[14538404.100844] EXT4-fs (xvdf): VFS: Can't find ext4 filesystem
__AWS_PRODUCTION__ ubuntu@ip-172-31-33-48:~$ lsblk
NAME                              MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
xvda                              202:0    0     8G  0 disk
└─xvda1                           202:1    0     8G  0 part /
xvdf                              202:80   0     8G  0 disk
└─xvdf1                           202:81   0     8G  0 part
loop0                               7:0    0   100G  0 loop
└─docker-202:1-149816-pool (dm-0) 252:0    0   100G  0 dm
loop1                               7:1    0     2G  0 loop
└─docker-202:1-149816-pool (dm-0) 252:0    0   100G  0 dm
__AWS_PRODUCTION__ ubuntu@ip-172-31-33-48:~$ sudo mount /dev/xvdf1 /mnt/fidb -t ext4
__AWS_PRODUCTION__ ubuntu@ip-172-31-33-48:~$ ls /mnt/xvdf
ls: cannot access /mnt/xvdf: No such file or directory
__AWS_PRODUCTION__ ubuntu@ip-172-31-33-48:~$ ^C
__AWS_PRODUCTION__ ubuntu@ip-172-31-33-48:~$ ls /mnt