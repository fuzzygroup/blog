---
layout: post
title: Optimizing Your Filesystem for MySQL
category: mysql
tags: ["mysql", "filesystem", "performance"]

---
At the lower level of the computer, before most of us think about things, lies the filesystem.  When you grow up originally on a DOS / Windows environment, the filesystem really is "C:\" and you tend not to think about it.  That's a damn restrictive view of the world.  When you're in a Linux environment, as most server side things are these days, the filesystem could be:

* ext3
* ext4
* xfs
* ...

Each filesystem has its own unique characteristics and tendencies but there are some things that you can do to optimize performance.  Bear in mind that the filesystem is low level so when you optimize performance, you should increase performance across the board because, at some level, everything touches the filesystem at some point.

##IMPORTANT :: When Things Go South … And they Will

In order to change your filesystem options, what you do, on a Linux system, is edit the file /etc/fstab which defines how the filesystem is setup or "mounted".  When /etc/fstab has errors, Linux, sensibly, starts the filesystem in read only mode because errors, at this level, are bad.  Here's what to do at the command prompt when this happens:

<pre>
mount -o rw /dev/sda1 /mnt/sda1  
</pre>

Change /dev/sda1 to your drive.  Then edit /etc/fstab and fix the incorrect option.  Then either unmount and remount or reboot.  Or you can just do this:

<pre>
mount -a
</pre>

Before you actually using mount -a, you can verify your /etc/fstab file with:

<pre>
mount -fav
</pre>

The f stands for "fake" (i.e. don't actually do it).

##Here there Be Magic or Improving Performance

The file /etc/fstab defines how your filesystem is setup and this is what you'll be changing.  The real magic is to eliminate certain defaults like atime which tells the filesystem "Write the last time the file was accessed whenever it is read or written to".  Yep.  When you read you also write by default.  That's a big, big deal.  Here's one example of how to do this:

/dev/sda1 / ext4 defaults,noatime,nodirtime,relatime 0 1
One thing to bear in mind that on current Ubuntunu -- 14.4 -- I've found that on ext4, eliminating nodirtime led to the drive having errors and being opened in read only mode.  I do not understand why but, as a I documented, its easily fixed.

Here's how the Mozilla project chose to optimize their MySQL servers:

<pre>
errors=remount-ro,noatime,nodirtime,data=writeback,barrier=0,nobh,dioread_nolock 0 1
</pre>

So if your disk was /dev/sda1 and mounted as /var/lib/mysql and using ext4 then you'd have this line:

<pre>
/dev/sda1 /var/lib/mysql ext4 errors=remount-ro,noatime,nodirtime,data=writeback,barrier=0,nobh,dioread_nolock 0 1 
</pre>

##My Own Boxes

Here's a before and after from one of my own boxes:

Before:

<pre>
  /dev/vgdata1/lvdata1    /var/lib/mysql  ext4    defaults        0       1
</pre>
After:

<pre>
/dev/vgdata1/lvdata1    /var/lib/mysql     ext4   errors=remount-ro,noatime,data=writeback,barrier=0,nobh,dioread_nolock 0 1
</pre>

Now, here's the embarrassing truth, I did all this research and then made this change -- and it made no difference -- FOR WHAT I WAS BENCHMARKING.  Now, that's not to say that this wasn't worthwhile, its to say that this kind of stuff is hard.  And depending on your work load, your mileage may vary.  If you're going to do this then I'd recommend Bonnie++ for benchmarking and do some formal testing not just throw a bunch my MySQL data into it and do a quick comparison (my adhoc, back of the envelope, rushed in a Data Center test while talking to my vendor).

##Sources

Here's where I could some of this information:

* http://www.linuxquestions.org/questions/linux-general-1/cannot-edit-fstab-in-recovery-mode-filesystem-is-read-only-540195/
* http://www.softpanorama.org/Commercial_linuxes/Troubleshooting/errors_in_fstab.shtml
* http://ubuntuforums.org/archive/index.php/t-2077360.html
* http://blog.smartlogicsolutions.com/2009/06/04/mount-options-to-improve-ext4-file-system-performance/
* https://bugzilla.mozilla.org/show_bug.cgi?id=874039
* http://serverfault.com/questions/174181/how-do-you-validate-fstab-without-rebooting
* http://serverfault.com/questions/29193/what-is-the-best-linux-filesystem-for-mysql-innodb
* https://en.wikipedia.org/wiki/Fstab
* http://www.coker.com.au/bonnie++/
* http://www.mysqlperformanceblog.com/2012/03/15/ext4-vs-xfs-on-ssd/  Recommended Reading
 

 

 