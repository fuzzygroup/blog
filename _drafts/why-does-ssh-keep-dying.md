---
layout: post
title: Why Does SSH Keep Dying?
---
So as I've written here, we have a problem where SSH keeps dying and we're unable to log into our AWS boxes.  They respond to pings but they don't seem to still be running correctly as illustrated by this performance breakdown:

select hour(created_at) as h, count(*)  from page2016_q3s where date_created_at='2016-10-05' group by h;
+------+----------+
| h    | count(*) |
+------+----------+
|    0 |    11671 |
|    1 |     9219 |
|    2 |     8588 |
|    3 |     7098 |
|    4 |     2779 |
|    5 |      481 |
|    6 |      271 |
|    7 |      135 |
+------+----------+

These boxes are crawlers and they are supposed to be producing pages.

Options:

Here's what we know:

* crawling is unreliable - ruby level seg faults
* boxes respond to systems reachability checks and instance reachability checks
* installing fail2ban on all boxes made no difference
* locking down the ssh to only our known ip addresses made no difference
* number of open files by the ruby process is now relatively low: ls -l /proc/11805/fd | wc -l => 87
* even on a running box performance degrades over time (its arse slow now as I watch it run live)

2 basic hypotheses:

* this is tied to our app
* this is tied to aws

If its our app then the key question is what does the memory usage look like:

ps -o rss,sz,vsz 11805
  RSS    SZ    VSZ
8730588 2406688 9626752

pmap -p 11805

...
00007f7a2a8ad000   1044K r-x-- /lib/x86_64-linux-gnu/libm-2.19.so
00007f7a2a9b2000   2044K ----- /lib/x86_64-linux-gnu/libm-2.19.so
00007f7a2abb1000      4K r---- /lib/x86_64-linux-gnu/libm-2.19.so
00007f7a2abb2000      4K rw--- /lib/x86_64-linux-gnu/libm-2.19.so
00007f7a2abb3000     36K r-x-- /lib/x86_64-linux-gnu/libcrypt-2.19.so
00007f7a2abbc000   2048K ----- /lib/x86_64-linux-gnu/libcrypt-2.19.so
00007f7a2adbc000      4K r---- /lib/x86_64-linux-gnu/libcrypt-2.19.so
00007f7a2adbd000      4K rw--- /lib/x86_64-linux-gnu/libcrypt-2.19.so
00007f7a2adbe000    184K rw---   [ anon ]
00007f7a2adec000     12K r-x-- /lib/x86_64-linux-gnu/libdl-2.19.so
00007f7a2adef000   2044K ----- /lib/x86_64-linux-gnu/libdl-2.19.so
00007f7a2afee000      4K r---- /lib/x86_64-linux-gnu/libdl-2.19.so
00007f7a2afef000      4K rw--- /lib/x86_64-linux-gnu/libdl-2.19.so
00007f7a2aff0000    100K r-x-- /lib/x86_64-linux-gnu/libpthread-2.19.so
00007f7a2b009000   2044K ----- /lib/x86_64-linux-gnu/libpthread-2.19.so
00007f7a2b208000      4K r---- /lib/x86_64-linux-gnu/libpthread-2.19.so
00007f7a2b209000      4K rw--- /lib/x86_64-linux-gnu/libpthread-2.19.so
00007f7a2b20a000     16K rw---   [ anon ]
00007f7a2b20e000   1768K r-x-- /lib/x86_64-linux-gnu/libc-2.19.so
00007f7a2b3c8000   2048K ----- /lib/x86_64-linux-gnu/libc-2.19.so
00007f7a2b5c8000     16K r---- /lib/x86_64-linux-gnu/libc-2.19.so
00007f7a2b5cc000      8K rw--- /lib/x86_64-linux-gnu/libc-2.19.so
00007f7a2b5ce000     20K rw---   [ anon ]
00007f7a2b5d3000   2936K r-x-- /usr/local/rvm/rubies/ruby-2.3.1/lib/libruby.so.2.3.0
00007f7a2b8b1000   2044K ----- /usr/local/rvm/rubies/ruby-2.3.1/lib/libruby.so.2.3.0
00007f7a2bab0000     24K r---- /usr/local/rvm/rubies/ruby-2.3.1/lib/libruby.so.2.3.0
00007f7a2bab6000     12K rw--- /usr/local/rvm/rubies/ruby-2.3.1/lib/libruby.so.2.3.0
00007f7a2bab9000     72K rw---   [ anon ]
00007f7a2bacb000    140K r-x-- /lib/x86_64-linux-gnu/ld-2.19.so
00007f7a2bb0c000    264K rw---   [ anon ]
00007f7a2bb4e000     28K r--s- /usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache
00007f7a2bb55000   1572K r---- /usr/lib/locale/locale-archive
00007f7a2bcde000     20K rw---   [ anon ]
00007f7a2bce7000      4K -----   [ anon ]
00007f7a2bce8000     20K rw---   [ anon ]
00007f7a2bced000      4K r---- /lib/x86_64-linux-gnu/ld-2.19.so
00007f7a2bcee000      4K rw--- /lib/x86_64-linux-gnu/ld-2.19.so
00007f7a2bcef000      4K rw---   [ anon ]
00007ffc58554000   8188K rw---   [ stack ]
00007ffc58d94000      8K r-x--   [ anon ]
ffffffffff600000      4K r-x--   [ anon ]
 total          9626752K
 
 free -g
              total       used       free     shared    buffers     cached
 Mem:            14          9          5          0          0          0
 -/+ buffers/cache:          8          6
 Swap:            0          0          0
 
 
  free -t
              total       used       free     shared    buffers     cached
 Mem:      15666140    9563776    6102364        380     167416     430584
 -/+ buffers/cache:    8965776    6700364
 Swap:            0          0          0
 Total:    15666140    9563776    6102364
 
 
 vmstat 1
 procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
  r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
  3  0      0 6101168 167520 430744    0    0     7    14  525  440 46  0 54  0  0
  1  0      0 6101208 167520 430744    0    0     0   164  437  231 50  0 50  0  0
  4  0      0 6101160 167520 430744    0    0     0     0  588  388 50  0 50  0  0
  1  0      0 6101120 167520 430744    0    0     0     0  650  467 49  1 50  0  0
  2  0      0 6101192 167520 430744    0    0     0     0  602  372 50  0 50  0  0
  1  0      0 6101248 167520 430744    0    0     0     0  477  252 50  0 50  0  0
  1  0      0 6101168 167524 430740    0    0     0    24  531  348 50  0 50  0  0
  1  0      0 6101144 167524 430748    0    0     0     0  600  406 50  0 50  0  0
  1  0      0 6101168 167524 430748    0    0     0     0  456  243 50  0 50  0  0
  1  0      0 6101184 167524 430748    0    0     0     0  378  163 50  0 50  0  0
  1  0      0 6101136 167524 430748    0    0     0     0  367  164 50  0 50  0  0
  1  0      0 6101136 167524 430748    0    0     0     0  398  208 50  1 50  0  0
  1  0      0 6101152 167528 430748    0    0     0    12  435  234 50  0 50  0  0
  1  0      0 6101080 167528 430748    0    0     0     0  417  219 50  0 50  0  0
  1  0      0 6101152 167528 430748    0    0     0     0  434  224 50  1 50  0  1
  1  0      0 6101152 167528 430748    0    0     0     0  376  182 50  0 50  0  0
  2  0      0 6101120 167528 430748    0    0     0     0  370  167 50  0 50  0  0
  1  0      0 6101112 167528 430748    0    0     0     0  574  402 50  0 50  0  0
  1  0      0 6101104 167536 430740    0    0     0    12  389  184 50  0 50  0  0
  
  

Options

* kill apache on all boxes
* Throw a crap ton more memory at it and see if is
* look at 1 minute cloudwatch monitoring logs on a downed box
* We introduced a new redis based url resolver so one option would be to pull it and revert to the old url resolver.
* brute force it - kill the crawling process say every 30 minutes and restart it 
* We use daemontools supervise to keep restarting downed crawl processes; remove that and see if boxes stay up longer (i.e. try and confirm the)
* we're on shared instances; could this be a noisy neighbor 
* look at the old running system and see how it differed
* turn off sendmail on all boxes
* leave tail -f /var/log/syslog running on a terminal and watch it
* look at something external
* leave output of running system on a terminal and watch it