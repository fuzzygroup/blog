---
layout: post
title: Begone Github Pages, Begone
date: 2022-07-05 04:49 -0400
category: ansible
tags: ["ansible", "jekyll"]
---
I had to admit publicly on Twitter the other night that, when a user reported an error in my blog, that I could fix it but he'd have to wait **23 minutes** for the fix.  That was astonishingly galling.  Here's the error he reported:




{:.center}
![23 minutes to fix a bug and deploy](/blog/assets/23minsucks.png)




Yep.  That's raw HTML bleeding into my high tech bibliography.  That's obviously wrong and clearly unacceptable.  I did one of those things that is supposed to work -- inserting raw HTML into a markdown file -- and something I could swear did work, once upon a time -- but oy.  And, clearly, I committed the greatest sin of all -- I failed to test a system after deployment.  **hangs head in shame**

The issue at hand here is that my blog is written in Jekyll and published on Github pages.  I used Github Pages since it is free and I know Github Pages should be here forever.  I mean -- it is Github -- they're a good guy.  They provide great tools and they're ethical, right?  But then:

> Github Copilot

That's a flag on the play!  Github Copilot is a clear violation of a number of open source licenses.  So, maybe, Github isn't just good and won't be here forever.  

Anyway -- Github pages is one of those bits of dark magic that feels like it shouldn't exist at all.  There is some funky setup and then you cast a magic spell by firelight, curse several times and finally you can just push to your repo and content appears.

The core problem is that my blog is huge:

    ❯ tree -d | wc -l 
        1935

    blog on  gh-pages via 💎 v2.7.1 on ☁️  (us-west-2) 
    ❯ ls -l _posts | wc -l 
        1079

    blog on  gh-pages via 💎 v2.7.1 on ☁️  (us-west-2) 
    ❯ ls -l _drafts | wc -l
         494
    

And please note that I say that my blog is huge but -- it is the 21st century -- 1,079 posts -- isn't that actually tiny in an age of 64 bit machines?  What is going on here Github?  

I've been blogging for 20 years now and Github pages apparently has some kind of non linear response to the number of files.  I verified this by testing my recipe blog (yes, I cook too) and there I saw a deploy in like 25 seconds.

Fsck that.  I'm a damn engineer not a magician.  I don't like magic.  It is time to tear this issue down to first principles, fix it and have a 23 second deploy not a 23 minute deploy.

## Getting a Starting Point

For about a decade now, when I have a deploy and / or DevOps issue, I turn to my friend [Nick Janetakis](https://nickjanetakis.com/).  Nick is a Docker Captain, a certified wizard with Docker, an expert in Ansible and he recently has mastered Kubernetes.  He sells courses on Docker and if you are using containers, you should buy one.

So I mention this to Nick and he tells me he just uses Ansible and rsync to build his blog and replicate it onto a server. I know Ansible -- Nick taught it to me although I haven't used it in a few years now.  And I have a cluster of servers fronted by a load balancer.  And those boxes are ssh'able which is an Ansible requirement.

Mission Control - we have conceptually solved the problem!

## The Ansible Source Code

Nick was kind enough to give me his Ansible source code for his blog deployer.  I took it and made a few rough edits to preserve his privacy.  Any errors or inconsistencies are mine not his.  A very big difference is that Nick uses Ansible to rsync his files to a single box.  I need to rsync my files to two boxes.

    #
    # Root of all my blogs are at: 
    #
    #   /Users/sjohnson/Sync/blogging/blog/
    #

    #
    # Ansible deployer is to live at:
    # 
    # /Users/sjohnson/Sync/blogging/deployer/
    #

    # File 1:

    deployer/defaults/main.yml:

    ---

    # These paths are local on your dev box.
    sjohnson_local_user: 'sjohnson'
    sjohnson_local_source_path: '/Users/sjohnson/Sync/blogging/blog/'
    #sjohnson_local_build_command: 'bundle exec jekyll build'
    sjohnson_local_build_command: 'bundle exec jekyll build --incremental && git add . && git commit -m "$1" && git push origin gh-pages'

    # This is where the files get rsync'd to.
    sjohnson_remote_path: '/home/deploy/blogging/blog'


    deployer/tasks/main.yml:

    ---

    - name: Install role dependencies
      apt:
        name: 'rsync'
        state: 'present'

    - name: Ensure remote path exists
      file:
        path: '{{ sjohnson_remote_path }}'
        state: 'directory'
        owner: 'root'
        group: 'root'
        mode: '0755'
      changed_when: false

    - name: Build local version of fuzzyblog.com/blog/
      delegate_to: 'localhost'
      become: True
      become_user: '{{ sjohnson_local_user }}'
      command: '{{ sjohnson_local_build_command }}'
      environment:
        JEKYLL_ENV: 'production'
        RUBYOPT: '-W0'
      args:
        chdir: '{{ sjohnson_local_source_path }}'

    - name: Sync sjohnson.com to remote path
      synchronize:
        src: '{{ sjohnson_local_source_path }}/_site'
        dest: '{{ sjohnson_remote_path }}'

    ---

    I don't know if rsync works the same on macOS since it runs locally but we'll soon find out.

    Then in your playbook file:

      roles:
        - { role: ansible-sjohnson, tags: sjohnson }

    And you can run it with ansible-playbook,optionally passing in your inventory and any host limits (this is based on how you have things set up

## Hello Ansible My Old Friend

When Nick suggested Ansible for this to me, I do remember using it but it has been a while.  When I checked my personal box for ansible stuff in the shell history, it appears about line 3000'ish:

    3324  ansible-galaxy install naftulikay.rust-dev
    3325  ansible-galaxy install fubarhouse.rust
    3467  ansible-playbook playbook_0100_create_datastreamer.yml
    

If I look for something recent that I used regularly, it appears around line 10000:

    history | grep blogging | tail -n5
    10330* ls /Users/sjohnson/Sync/blogging/deployer/vhosts/blogging/
    10331* ls -al /Users/sjohnson/Sync/blogging/deployer/vhosts/blogging/
    10332* touch /Users/sjohnson/Sync/blogging/deployer/vhosts/blogging/

So I do this but it has been a bit.  And then when I started to think about it, I remember that **I've given talks on Ansible** and I found these:

* [Talk](https://www.youtube.com/watch?v=CZz7YztSf7s&t=7s)
* [Slides](https://fuzzyblog.io/blog/ansible/2016/10/04/ansible-basics-presentation-at-indy-elixir-meetup.html)

Realizing how well I used to use this gave me a huge confidence boost.  And my own slides made me realize that I've got to resurrect a paradigm shift.

## Sidebar: Changing the Language Paradigm - Declarative vs, Procedural

I'm a language wonk in terms of uncompiled, interpreted programming languages.  I rarely deal with compilation as I tend to work on the interpreted, scripting side of the house but if its weird, I've looked at it:

1. This started in the '80s for me when my long lost buddy Mukesh Prasad was hacking at Yale on a odd language called Clu.  
2. Quintus Prolog on Sun 2 boxes in university was a thing.  Yes I did my project with Borland's Turbo Prolog aka Turbo Paslog but still.
3. DigiTalk's SmallTalk/V; 'nuff said.  I hated that utterly vertical learning curve; you could do anything once you learned everything.  And the idea of "image" / the utter vitriolic hate for the realities of the file system.
3. And then Gene Callahan, an engineer under me, took my desire for a document processing tool with a user interface and built me a user interface that generated HyperAwk under the hood (yes I once sold commercially my own version of Awk).
4. After writing literally tens of thousands of lines of HyperAwk to generate large scale hypertext document repositories, I was hooked on oddball languages.

Languages matter because they define how we communicate.  Change the language paradigm and you have altered how we understand problems and solve problems.  

Ansible is a **declarative** programming language although can you call it a language when something like iteration is fiendishly difficult (if you are iterating in Ansible then you are usually doing it wrong).

This problem getting my blog onto a server is a DevOps problem. There are two basic approaches to DevOps:

* Procedural
* Declarative

An example of Procedural is when you write step by step descriptions of what to do to your servers. This is the tool Chef as an example.  I've done this -- a lot -- and it flat out doesn't work (or at least it never did for me).

An example of Declarative is Ansible or Terraform.  Ansible and Terraform work by you describing a **state** that you want to achieve.  This state is descriptive and usually represented in yaml files.  You then execute that state by, for Ansible, a playbook which then makes your machine become that state.  

Given that you rarely know exactly the state a machine is in, the Declarative approach tends to win.  Decisively.  Always.  

And, in closing, I'd can't mention language paradigms without referencing [Heinlein's speed talk in Gulf](https://minerva.fandom.com/wiki/Gulf#Examples_of_Speedtalk).  Here a different language helped the characters avoid an apocalypse by improving their ability to communicate rapidly.

## Analysis of My Hosted Boxes

I have a load balanced cluster of boxes run by a product called HatchBox which is a Ruby on Rails deployment engine.  My blog, however, is a Jekyll thing and not anything with which HatchBox can help me.  Still I pay for the boxes -- they are mine -- even though they "belong" to HatchBox.  This means I can, as long as I can figure it out from first principles and / or experimentation, do whatever the fsck I want.  These are linux boxes, Ubuntu 18, and I have SSH access so I guess I need to ssh in and dig about.

### Step 1: Login

I'm a strong believer that any Rails developer should be conversant with SSH so I put into each of my Rails apps, under bin, a series of ssh shell scripts:

     ls -l bin | grep ssh
    -rwxr-xr-x@ 1 sjohnson  staff   120 Jun  2 00:25 sshweb1
    -rwxr-xr-x@ 1 sjohnson  staff    92 Jun  2 00:25 sshweb2
    -rwxr-xr-x@ 1 sjohnson  staff    89 Jun  2 00:25 sshworker1

I'm a firm believer that you should alway have a great developer experience and at the heard of that is making things easy.  Digging around for credentials and / or documentation to do something simple like ssh is just silly.

So let's login:

    ❯ bin/sshweb1

And then we get:

    deploy@cartazzi3-web1:~/Cartazzi/current$ 
    
    pwd
    
    /home/deploy/Cartazzi/current

What this tells is is the following:

* We are logged in as the user deploy
* We are on a box named cartazz3-web1
* We are in the directory /home/deploy/Cartazzi/current

Ok.  This is all good.  Now we know that this is a web box so let's figure how what web server - passenger, apache, etc we are using:

    deploy@cartazzi3-web1:~/Cartazzi/current$ ps auwwx | grep httpd
    deploy   31360  0.0  0.0  14664  1016 pts/1    S+   09:21   0:00 grep httpd

    deploy@cartazzi3-web1:~/Cartazzi/current$ ps auwwx | grep apache
    deploy   31364  0.0  0.0  14664  1104 pts/1    S+   09:21   0:00 grep apache

    deploy@cartazzi3-web1:~/Cartazzi/current$ ps auwwx | grep nginx
    deploy   10198  0.0  0.6 242324 27660 ?        S    Jun29   0:18 nginx: worker process
    deploy   10201  0.0  0.6 242324 26596 ?        S    Jun29   0:00 nginx: worker process
    root     18030  0.0  0.7 240028 30408 ?        Ss   Jun22   0:00 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
    deploy   31368  0.0  0.0  14664  1080 pts/1    S+   09:21   0:00 grep nginx

Ok this tells us we need to figure out where our nginx files are located.  A quick google tells me to look into /etc/nginx/sites-enabled so:

    deploy@cartazzi3-web1:~/Cartazzi/current$ ls -l /etc/nginx/sites-enabled/
    total 88
    -rw-r----- 1 root root 684 Jun  1 23:14 Cartazzi
    -rw-r----- 1 root root 788 May 26 14:20 PIZZAFORUKRAINE
    ... (directories omitted for security purposes)
    -rw-r----- 1 root root 642 Jul  5  2020 scotts_feed_finder
    -rw-r----- 1 root root 629 Jul  5  2020 wipmarks

What this tells us is that we have a directory called sites-enabled with small files, each one named for the site.

The whole sites-enabled and sites-available thing is old school Internet hosting that, I believe, dates back to the original Apache foundation.  The idea was that you had site content stored in sites-available and then a symlink back to it from sites-enabled.  Or something like that -- it has been a bit.

Let's also look into sites-available:

    deploy@cartazzi3-web1:~/Cartazzi/current$ ls -l /etc/nginx/sites-available/
    total 4
    -rw-r--r-- 1 root root 2416 Apr  6  2018 default
    deploy@cartazzi3-web1:~/Cartazzi/current$ ls -l /etc/nginx/sites-available/

This feels odd so we're going to just ignore it and move on.  Let's see what's in one of those small files:

    deploy@cartazzi3-web1:~/Cartazzi/current$ less /etc/nginx/sites-enabled/scotts_feed_finder
    /etc/nginx/sites-enabled/scotts_feed_finder: Permission denied

We're going to need to sudo su for access to this file.  Those details are of course omitted.

    cat /etc/nginx/sites-enabled/scotts_feed_finder
    
    server {
      listen 80;
      listen [::]:80;
    
      server_name www.scottsfeedfinder.com scottsfeedfinder.com nzrv.hatchboxapp.com;
      root /home/deploy/scotts_feed_finder/current/public;
    
    
      passenger_enabled on;
      passenger_app_env production;
    
      location /cable {
        passenger_app_group_name scotts_feed_finder_websocket;
        passenger_force_max_concurrent_requests_per_process 0;
      }
    
    
      # Allow uploads up to 100MB in size
      client_max_body_size 100m;
    
      location ~ ^/(assets|packs) {
        expires max;
        gzip_static on;
      }
    
      error_page 404 500 502 503 504 = /error.html;
      location = /error.html {
        root /var/www/html/hatchbox;
      }
    }

What all of this tells us is that we have:

* A root directory of content located in /home/deploy/
* NGINX listening on Port 80
* NGINX serving content from the directory /home/deploy/scotts_feed_finder/current/public

Something called Passenger is in the middle of all this.  Passenger is a bit of application code that embeds Ruby into a web server so it can run a Rails app.  

Let's run ps auwwx  and look at the processes:

    deploy@cartazzi3-web1:~/Cartazzi/current$ ps auwwx
    USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
    root         1  0.0  0.2 225420  8880 ?        Ss    2020  10:07 /lib/systemd/systemd --system --deserialize 36
    root         2  0.0  0.0      0     0 ?        S     2020   0:08 [kthreadd]
    root         4  0.0  0.0      0     0 ?        I<    2020   0:00 [kworker/0:0H]
    root         6  0.0  0.0      0     0 ?        I<    2020   0:00 [mm_percpu_wq]
    root         7  0.0  0.0      0     0 ?        S     2020  16:45 [ksoftirqd/0]
    root         8  0.0  0.0      0     0 ?        I     2020 139:21 [rcu_sched]
    root         9  0.0  0.0      0     0 ?        I     2020   0:00 [rcu_bh]
    root        10  0.0  0.0      0     0 ?        S     2020   0:15 [migration/0]
    root        11  0.0  0.0      0     0 ?        S     2020   3:59 [watchdog/0]
    root        12  0.0  0.0      0     0 ?        S     2020   0:00 [cpuhp/0]
    root        13  0.0  0.0      0     0 ?        S     2020   0:00 [cpuhp/1]
    root        14  0.0  0.0      0     0 ?        S     2020   3:49 [watchdog/1]
    root        15  0.0  0.0      0     0 ?        S     2020   0:14 [migration/1]
    root        16  0.0  0.0      0     0 ?        S     2020  17:25 [ksoftirqd/1]
    root        18  0.0  0.0      0     0 ?        I<    2020   0:00 [kworker/1:0H]
    root        19  0.0  0.0      0     0 ?        S     2020   0:00 [kdevtmpfs]
    root        20  0.0  0.0      0     0 ?        I<    2020   0:00 [netns]
    root        21  0.0  0.0      0     0 ?        S     2020   0:00 [rcu_tasks_kthre]
    root        22  0.0  0.0      0     0 ?        S     2020   0:00 [kauditd]
    root        24  0.0  0.0      0     0 ?        S     2020   0:49 [khungtaskd]
    root        25  0.0  0.0      0     0 ?        S     2020   0:00 [oom_reaper]
    root        26  0.0  0.0      0     0 ?        I<    2020   0:00 [writeback]
    root        27  0.0  0.0      0     0 ?        S     2020   0:00 [kcompactd0]
    root        28  0.0  0.0      0     0 ?        SN    2020   0:00 [ksmd]
    root        29  0.0  0.0      0     0 ?        SN    2020   0:00 [khugepaged]
    root        30  0.0  0.0      0     0 ?        I<    2020   0:00 [crypto]
    root        31  0.0  0.0      0     0 ?        I<    2020   0:00 [kintegrityd]
    root        32  0.0  0.0      0     0 ?        I<    2020   0:00 [kblockd]
    root        33  0.0  0.0      0     0 ?        I<    2020   0:00 [ata_sff]
    root        34  0.0  0.0      0     0 ?        I<    2020   0:00 [md]
    root        35  0.0  0.0      0     0 ?        I<    2020   0:00 [edac-poller]
    root        36  0.0  0.0      0     0 ?        I<    2020   0:00 [devfreq_wq]
    root        37  0.0  0.0      0     0 ?        I<    2020   0:00 [watchdogd]
    root        41  0.0  0.0      0     0 ?        S     2020   3:59 [kswapd0]
    root        42  0.0  0.0      0     0 ?        I<    2020   0:00 [kworker/u5:0]
    root        43  0.0  0.0      0     0 ?        S     2020   0:00 [ecryptfs-kthrea]
    root        85  0.0  0.0      0     0 ?        I<    2020   0:00 [kthrotld]
    root        86  0.0  0.0      0     0 ?        I<    2020   0:00 [acpi_thermal_pm]
    root        87  0.0  0.0      0     0 ?        S     2020   0:00 [scsi_eh_0]
    root        88  0.0  0.0      0     0 ?        I<    2020   0:00 [scsi_tmf_0]
    root        89  0.0  0.0      0     0 ?        S     2020   0:00 [scsi_eh_1]
    root        90  0.0  0.0      0     0 ?        I<    2020   0:00 [scsi_tmf_1]
    root        96  0.0  0.0      0     0 ?        I<    2020   0:00 [ipv6_addrconf]
    root       105  0.0  0.0      0     0 ?        I<    2020   0:00 [kstrp]
    root       122  0.0  0.0      0     0 ?        I<    2020   0:00 [charger_manager]
    root       160  0.0  0.0      0     0 ?        S     2020   0:00 [scsi_eh_2]
    root       161  0.0  0.0      0     0 ?        I<    2020   5:37 [kworker/0:1H]
    root       162  0.0  0.0      0     0 ?        I<    2020   0:00 [scsi_tmf_2]
    root       266  0.0  0.0      0     0 ?        I<    2020   0:00 [raid5wq]
    root       315  0.0  0.0      0     0 ?        S     2020  17:52 [jbd2/vda1-8]
    root       316  0.0  0.0      0     0 ?        I<    2020   0:00 [ext4-rsv-conver]
    root       318  0.0  0.0      0     0 ?        I<    2020   5:34 [kworker/1:1H]
    root       365  0.0  0.0      0     0 ?        I    09:47   0:00 [kworker/u4:1]
    root       396  0.0  0.0      0     0 ?        I<    2020   0:00 [iscsi_eh]
    root       406  0.0  0.0      0     0 ?        I<    2020   0:00 [ib-comp-wq]
    root       407  0.0  0.0      0     0 ?        I<    2020   0:00 [ib_mcast]
    root       411  0.0  0.0      0     0 ?        I<    2020   0:00 [ib_nl_sa_wq]
    root       413  0.0  0.0      0     0 ?        I<    2020   0:00 [rdma_cm]
    root       435  0.2  0.1 108084  7200 ?        Ss   09:50   0:00 sshd: deploy [priv]
    deploy     697  0.0  0.1 108084  4456 ?        S    09:50   0:00 sshd: deploy@pts/2
    deploy     700  0.0  0.0  13320  3300 pts/2    Ss   09:50   0:00 bash -c cd /home/deploy/Cartazzi/current ; bash --login
    deploy     701  1.0  0.1  23084  5464 pts/2    S    09:50   0:00 bash --login
    deploy     755  0.0  0.0  37608  3672 pts/2    R+   09:50   0:00 ps auwwx
    message+   894  0.0  0.0  50560  3156 ?        Ss    2020   5:44 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
    root       919  0.0  0.0 110412   220 ?        Ssl   2020  43:07 /usr/sbin/irqbalance --foreground
    root       921  0.0  0.0 824836  2412 ?        Ssl   2020   7:46 /usr/bin/lxcfs /var/lib/lxcfs/
    daemon     922  0.0  0.0  28332   876 ?        Ss    2020   0:00 /usr/sbin/atd -f
    root       923  0.0  0.0  70700  3004 ?        Ss    2020   1:34 /lib/systemd/systemd-logind
    root       945  0.0  0.0  16412   516 ttyS0    Ss+   2020   0:00 /sbin/agetty -o -p -- \u --keep-baud 115200,38400,9600 ttyS0 vt220
    root       952  0.0  0.0  14888   328 tty1     Ss+   2020   0:00 /sbin/agetty -o -p -- \u --noclear tty1 linux
    root       956  0.0  0.2 187668  9328 ?        Ssl   2020   0:00 /usr/bin/python3 /usr/share/unattended-upgrades/unattended-upgrade-shutdown --wait-for-signal
    uuidd     1895  0.0  0.0  28596   188 ?        Ss    2020   0:00 /usr/sbin/uuidd --socket-activation
    root      7117  0.0  0.0 288884  2876 ?        Ssl  Jan27   0:38 /usr/lib/policykit-1/polkitd --no-debug
    root      8571  0.0  0.0      0     0 ?        I<    2020   0:00 [xfsalloc]
    root      8573  0.0  0.0      0     0 ?        I<    2020   0:00 [xfs_mru_cache]
    root      9914  0.0  0.7 413528 28396 ?        Ssl  Jun29   0:04 Passenger watchdog
    root     10077  1.0  7.9 1232568 322484 ?      Sl   Jun29  93:15 Passenger core
    deploy   10198  0.0  0.6 242324 27660 ?        S    Jun29   0:18 nginx: worker process
    deploy   10201  0.0  0.6 242324 26596 ?        S    Jun29   0:00 nginx: worker process
    avahi    15527  0.0  0.0  47208  3608 ?        Ss   May30   0:04 avahi-daemon: running [cartazzi3-web1.local]
    avahi    15528  0.0  0.0  47084   336 ?        S    May30   0:00 avahi-daemon: chroot helper
    root     15604  0.0  0.0  45240  2492 ?        Ss   May30   0:14 /sbin/wpa_supplicant -u -s -O /run/wpa_supplicant
    root     15681  0.0  0.2 434324  9592 ?        Ssl  May30   0:00 /usr/sbin/ModemManager --filter-policy=strict
    root     16753  0.0  0.1  72304  5464 ?        Ss   May31   0:26 /usr/sbin/sshd -D
    root     17821  0.0  0.2 171256 10904 ?        Ssl  May06   0:00 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
    deploy   17913  0.0  3.3 496612 134852 ?       Sl   Jul04   0:03 Passenger RubyApp: /home/deploy/jobhound2/current (produc
    root     18030  0.0  0.7 240028 30408 ?        Ss   Jun22   0:00 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
    root     18342  0.0  0.0  31856  1928 ?        Ss   May12   0:08 /usr/sbin/cron -f
    do-agent 18493  0.0  0.3 1384676 12196 ?       Ssl  Jan07  36:06 /opt/digitalocean/bin/do-agent --syslog
    deploy   19411  0.0  2.7 569880 112428 ?       Sl   Jul04   0:00 Passenger RubyApp: /home/deploy/scotts_feed_finder/curren
    root     25175  0.0  0.0      0     0 ?        I    07:41   0:00 [kworker/0:1]
    deploy   25562  0.1 13.0 1067256 526176 ?      Sl   Jun29   8:57 Passenger RubyApp: /home/deploy/covidnearme.org/current (
    root     27347  0.0  0.0      0     0 ?        I    Jul03   0:03 [kworker/0:2]
    deploy   28128  0.0  3.2 770900 132232 ?       Sl   Jul04   0:04 Passenger RubyApp: /home/deploy/PIZZAFORUKRAINE/current (
    root     28262  0.0  0.0      0     0 ?        I    08:37   0:00 [kworker/u4:0]
    root     28923  0.0  0.0 105904   180 ?        Ss    2020   0:00 /sbin/lvmetad -f
    root     29350  0.0  0.0      0     0 ?        I    Jun30   0:07 [kworker/1:0]
    syslog   29469  0.0  0.0 263048  3576 ?        Ssl  Jun30   0:05 /usr/sbin/rsyslogd -n
    root     30026  0.0  0.1 107992  7284 ?        Ss   09:13   0:00 sshd: deploy [priv]
    deploy   30028  0.0  0.1  76668  7704 ?        Ss   09:13   0:00 /lib/systemd/systemd --user
    deploy   30029  0.0  0.0 259400  2748 ?        S    09:13   0:00 (sd-pam)
    systemd+ 30311  0.0  0.1  71856  4812 ?        Ss   May26   0:04 /lib/systemd/systemd-networkd
    deploy   30327  0.0  0.0 107992  3524 ?        S    09:13   0:00 sshd: deploy@pts/0
    deploy   30328  0.0  0.0  13320  3388 pts/0    Ss   09:13   0:00 bash -c cd /home/deploy/Cartazzi/current ; bash --login
    deploy   30329  0.0  0.1  23084  5408 pts/0    S+   09:13   0:00 bash --login
    systemd+ 30345  0.0  0.1  70624  5832 ?        Ss   May26   0:07 /lib/systemd/systemd-resolved
    systemd+ 30381  0.0  0.0 141784  2812 ?        Ssl  May26   0:04 /lib/systemd/systemd-timesyncd
    root     30415  0.0  3.2 224732 133124 ?       S<s  May26   2:03 /lib/systemd/systemd-journald
    root     31027  0.0  0.1 108084  7156 ?        Ss   09:21   0:00 sshd: deploy [priv]
    deploy   31291  0.0  0.1 108084  4452 ?        S    09:21   0:00 sshd: deploy@pts/1
    deploy   31292  0.0  0.0  13320  3384 pts/1    Ss   09:21   0:00 bash -c cd /home/deploy/Cartazzi/current ; bash --login
    deploy   31293  0.0  0.1  23084  5364 pts/1    S+   09:21   0:00 bash --login
    root     31912  0.0  0.0 288088  3008 ?        Ssl   2020  23:00 /usr/lib/accountsservice/accounts-daemon
    deploy   32166  0.0  3.2 609508 131396 ?       Sl   09:33   0:00 Passenger RubyApp: /home/deploy/netlabelerfuzzygroup/curr
    root     32187  0.0  0.0      0     0 ?        I    09:33   0:00 [kworker/1:1]
    root     32260  0.0  0.1  43312  4168 ?        Ss   May26   0:08 /lib/systemd/systemd-udevd
    root     32302  0.0  0.0      0     0 ?        I    09:37   0:00 [kworker/u4:2]

If you look here:

    root      9914  0.0  0.7 413528 28396 ?        Ssl  Jun29   0:04 Passenger watchdog
    root     10077  1.0  7.9 1232568 322484 ?      Sl   Jun29  93:15 Passenger core
    deploy   10198  0.0  0.6 242324 27660 ?        S    Jun29   0:18 nginx: worker process
    deploy   10201  0.0  0.6 242324 26596 ?        S    Jun29   0:00 nginx: worker process
    avahi    15527  0.0  0.0  47208  3608 ?        Ss   May30   0:04 avahi-daemon: running [cartazzi3-web1.local]
    avahi    15528  0.0  0.0  47084   336 ?        S    May30   0:00 avahi-daemon: chroot helper
    root     15604  0.0  0.0  45240  2492 ?        Ss   May30   0:14 /sbin/wpa_supplicant -u -s -O /run/wpa_supplicant
    root     15681  0.0  0.2 434324  9592 ?        Ssl  May30   0:00 /usr/sbin/ModemManager --filter-policy=strict
    root     16753  0.0  0.1  72304  5464 ?        Ss   May31   0:26 /usr/sbin/sshd -D
    root     17821  0.0  0.2 171256 10904 ?        Ssl  May06   0:00 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
    deploy   17913  0.0  3.3 496612 134852 ?       Sl   Jul04   0:03 Passenger RubyApp: /home/deploy/jobhound2/current (produc
    root     18030  0.0  0.7 240028 30408 ?        Ss   Jun22   0:00 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
    root     18342  0.0  0.0  31856  1928 ?        Ss   May12   0:08 /usr/sbin/cron -f
    do-agent 18493  0.0  0.3 1384676 12196 ?       Ssl  Jan07  36:06 /opt/digitalocean/bin/do-agent --syslog
    deploy   19411  0.0  2.7 569880 112428 ?       Sl   Jul04   0:00 Passenger RubyApp: /home/deploy/scotts_feed_finder/curren

then you can see that we have an NGINX worker process running as the deploy user and something called Passenger RubyApp:

    Passenger RubyApp: /home/deploy/jobhound2/current

also running as the deploy user.  And there is:

    root      9914  0.0  0.7 413528 28396 ?        Ssl  Jun29   0:04 Passenger watchdog
    root     10077  1.0  7.9 1232568 322484 ?      Sl   Jun29  93:15 Passenger core
    root     18030  0.0  0.7 240028 30408 ?        Ss   Jun22   0:00 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;

So basically what is going on is

* NGINX master process runs
* It launches Passenger watchdog
* It launches Passenger core
* An NGINX worker process running as deploy serves a site
* Which is then in turn served by: Passenger RubyApp: /home/deploy/jobhound2/current (production)

The only thing that bothers me about this description is that the process IDs (pids) for the NGINX master process are higher than that of Passenger Watchdog and Passenger core.  That feels off but I think I can ignore that one detail for now.

If you notice there is NO mention of SSL.  The reason for this is that I have a cluster and the SSL, logically, must be being handled by the inbound load balancer.  I don't fully understand Let's Encrypt but this feels right.

A final note is to look at the ifconfig for this box:

    ifconfig
    eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
            inet 138.68.246.223  netmask 255.255.240.0  broadcast 138.68.255.255
            inet6 fe80::d465:a6ff:fee0:c65e  prefixlen 64  scopeid 0x20<link>
            inet6 2604:a880:2:d0::1f7d:d001  prefixlen 64  scopeid 0x0<global>
            ether d6:65:a6:e0:c6:5e  txqueuelen 1000  (Ethernet)
            RX packets 53168440  bytes 19614162056 (19.6 GB)
            RX errors 0  dropped 0  overruns 0  frame 0
            TX packets 29685551  bytes 5395055436 (5.3 GB)
            TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

    eth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
            inet 10.138.162.178  netmask 255.255.0.0  broadcast 10.138.255.255
            inet6 fe80::84b0:beff:fe1e:564  prefixlen 64  scopeid 0x20<link>
            ether 86:b0:be:1e:05:64  txqueuelen 1000  (Ethernet)
            RX packets 229471001  bytes 1520569423316 (1.5 TB)
            RX errors 0  dropped 0  overruns 0  frame 0
            TX packets 158520250  bytes 53928037929 (53.9 GB)
            TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

    lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
            inet 127.0.0.1  netmask 255.0.0.0
            inet6 ::1  prefixlen 128  scopeid 0x10<host>
            loop  txqueuelen 1000  (Local Loopback)
            RX packets 782802  bytes 71859387 (71.8 MB)
            RX errors 0  dropped 0  overruns 0  frame 0
            TX packets 782802  bytes 71859387 (71.8 MB)
            TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        
And we need to validate that there is sufficient disk capacity to hold my blog:
        
        df -h
        Filesystem      Size  Used Avail Use% Mounted on
        udev            2.0G     0  2.0G   0% /dev
        tmpfs           395M  688K  394M   1% /run
        /dev/vda1        78G   35G   44G  45% /
        tmpfs           2.0G     0  2.0G   0% /dev/shm
        tmpfs           5.0M     0  5.0M   0% /run/lock
        tmpfs           2.0G     0  2.0G   0% /sys/fs/cgroup
        /dev/vda15      105M  6.7M   98M   7% /boot/efi
        tmpfs           395M     0  395M   0% /run/user/1000

 My blog is only a few gigs so the 44g available should be fine.
 
 This gives us a plan:
 
1. Have an ansible job which runs locally.
2. This job needs to rsync my blog content up to /home/deploy/blogging/blog on web1
3. This job needs to rsync my blog content up to /home/deploy/blogging/blog on web2
4. I need to create a test.fuzzyblog.io DNS entry that I can assign to the load balancer.
5. An NGINX site definition needs exist on both web1 and web2 (web2 is presumably the same as web1)
 
This will requires changes to Nick's otherwise stellar ansible work (he had no idea what a HatchBox system looked like; he just uses it for a single box running NGINX and Let's Encrypt).
 
## Execution - Let's Get Rid of Github Pages
 
### Step 1: Create a DNS Entry
 
So we need to test this both directly and via the load balancer.  Here are the ip addresses of our servers:
 
    Load Balancer: 138.68.227.244
    Web 1: 138.68.246.223
 
Because I view my blog's operation as mission critical -- I know it isn't; it is just silly -- but still I believe in a large number of 9s so we need to create test dns entries i.e. 

test.fuzzyblog.io
test
 
so we need to create DNS records for:
 
 ❯ ping test.fuzzyblog.io
 PING test.fuzzyblog.io (138.68.227.244): 56 data bytes
 64 bytes from 138.68.227.244: icmp_seq=0 ttl=47 time=66.966 ms
 64 bytes from 138.68.227.244: icmp_seq=1 ttl=47 time=65.966 ms
 64 bytes from 138.68.227.244: icmp_seq=2 ttl=47 time=74.112 ms
 ^C
 --- test.fuzzyblog.io ping statistics ---
 3 packets transmitted, 3 packets received, 0.0% packet loss
 round-trip min/avg/max/stddev = 65.966/69.015/74.112/3.627 ms

 cartazzi on  main [!] via  v16.3.0 via 💎 v3.0.0 on ☁️  (us-west-2) took 2s
 ❯ ping web1.fuzzyblog.io
 PING web1.fuzzyblog.io (138.68.246.223): 56 data bytes
 64 bytes from 138.68.246.223: icmp_seq=0 ttl=47 time=64.005 ms
 64 bytes from 138.68.246.223: icmp_seq=1 ttl=47 time=111.340 ms
 ^C
 --- web1.fuzzyblog.io ping statistics ---
 3 packets transmitted, 2 packets received, 33.3% packet loss
 round-trip min/avg/max/stddev = 64.005/87.672/111.340/23.668 ms
 
 test.fuzzyblog.io mapping to the load balancer
 web1.fuzzyblog.io mapping to web1
 
 ### Step 2: Create an NGINX definition file
 
The NGINX definition files aka the vhost files need to be installed on the server.  Since those files are owned by root, we will place them there manually -- at least initially -- to simplify things.  Although Ansible can work with user accounts other than deploy, it is easier for Ansible to simply work with deploy as that is the default SSH account on the public key installed on the machine.

We will store the vhost files locally in:

    mkdir -p /Users/sjohnson/Sync/blogging/deployer/vhosts/blogging/

And we can create the starting file with:

    touch /Users/sjohnson/Sync/blogging/deployer/vhosts/blogging/blog 
    touch /Users/sjohnson/Sync/blogging/deployer/vhosts/blogging/recipes

And our file can be MUCH, MUCH simpler than the vhost file for a Rails app since we aren't going to do anything but serve content:

    server {
      listen 80;
      listen [::]:80;
    
      server_name test.fuzzyblog.io;
      root /home/deploy/blogging/blog/_site;
    
    }
 
To get to the vhost file above, you need to understand how Jekyll or another static site generator operates:

1. You have a directory of content in: /Users/sjohnson/Sync/blogging/blog/
2. With your actual blog posts located in: /Users/sjohnson/Sync/blogging/blog/_posts
3. When Jekyll gets a build instruction, it compiles all files on the site into /Users/sjohnson/Sync/blogging/blog/_site

So our deployment engine is going to do nothing but rsync the files locally from:

    /Users/sjohnson/Sync/blogging/blog/_site

to the server location:

    /home/deploy/blogging/blog/_site




For right now we simply need to create a test index.html file in:

/home/deploy/blogging/blog/_site on the server and see if we can get to it after we place the above vhost there.  If that works then we will have a working deployment strategy with only the Ansible and rsync bits to finish.
 
**Note**: At this point I'm quite confident that I know what is going to happen and I'd like to get my recipes off Github pages also.
 
 touch /Users/sjohnson/Sync/blogging/deployer/vhosts/fuzzyblog.io/blog
 
 cat /etc/nginx/sites-enabled/scotts_feed_finder

 server {
   listen 80;
   listen [::]:80;

   server_name www.scottsfeedfinder.com scottsfeedfinder.com nzrv.hatchboxapp.com;
   root /home/deploy/scotts_feed_finder/current/public;


   passenger_enabled on;
   passenger_app_env production;

   location /cable {
     passenger_app_group_name scotts_feed_finder_websocket;
     passenger_force_max_concurrent_requests_per_process 0;
   }


   # Allow uploads up to 100MB in size
   client_max_body_size 100m;

   location ~ ^/(assets|packs) {
     expires max;
     gzip_static on;
   }

   error_page 404 500 502 503 504 = /error.html;
   location = /error.html {
     root /var/www/html/hatchbox;
   }
 }
 
 ### Step 3: Verify if We Can Serve Hello World from web1.cartazzi.com 
 
 
 cartazzi on  main [!] via  v16.3.0 via 💎 v3.0.0 on ☁️  (us-west-2) took 2s
 ❯ bin/sshweb1
 deploy@cartazzi3-web1:~/Cartazzi/current$ mkdir -p /Users/sjohnson/Sync/blogging/deployer/vhosts/blogging/
 mkdir: cannot create directory ‘/Users’: Permission denied
 deploy@cartazzi3-web1:~/Cartazzi/current$ mkdir -p /Users/sjohnson/Sync/blogging/deployer/vhosts/blogging^C
 deploy@cartazzi3-web1:~/Cartazzi/current$ ls /Users/sjohnson/Sync/blogging/deployer/vhosts/blogging/
 ls: cannot access '/Users/sjohnson/Sync/blogging/deployer/vhosts/blogging/': No such file or directory
 deploy@cartazzi3-web1:~/Cartazzi/current$ client_loop: send disconnect: Broken pipe

 cartazzi on  main [!] via  v16.3.0 via 💎 v3.0.0 on ☁️  (us-west-2) took 13m13s
 ❯ bin/sshweb1
 deploy@cartazzi3-web1:~/Cartazzi/current$ sudo su
 [sudo] password for deploy:
 root@cartazzi3-web1:/home/deploy/Cartazzi/releases/20220608082805# history | grep cd
     9  cd db/migrate/
    12  cd /home/deploy/
    14  cd netlabelerfuzzygroup/
    16  cd repo/
    36  cd /var/log/
    40  cd nginx/
 server {
    55  cd /etc/nginx/sites-available/
    57  cd ../sites-enabled/
    59  cd wipmarks
    71  cd ..
    75  cd sites-available/
    78  cd ../sites-enabled/
   140  cd ../../current
   142  cd ..
   143  cd current
   149  cd /etc/nginx/
   166  history | grep cd
 root@cartazzi3-web1:/home/deploy/Cartazzi/releases/20220608082805# cd /etc/nginx/sites-available/
 root@cartazzi3-web1:/etc/nginx/sites-available# ls
 default
 root@cartazzi3-web1:/etc/nginx/sites-available# cd ../sites_enabled
 bash: cd: ../sites_enabled: No such file or directory
 root@cartazzi3-web1:/etc/nginx/sites-available# cd /etc/nginx/sites-available/
 root@cartazzi3-web1:/etc/nginx/sites-available# ls
 default
 root@cartazzi3-web1:/etc/nginx/sites-available# cd cd /etc/nginx/sites-enabled/
 bash: cd: too many arguments
 root@cartazzi3-web1:/etc/nginx/sites-available# cd /etc/nginx/sites-enabled/
 root@cartazzi3-web1:/etc/nginx/sites-enabled# ls
 Cartazzi          cartazzi_home_page  covidnearmefoundation  easyhire   jobhound2             netlabelerfuzzygroup    read_with_scott     wipmarks
 PIZZAFORUKRAINE   cartazzi_marketing  dev_home_page2         ground_me  my_x_is_y-home_page2  pizzaforukraine2_take2  read_with_scott2
 PIZZAFORUKRAINE2  covidnearme.org     drunklog               hirethem   my_x_is_y-web-app     police_crawl            scotts_feed_finder
 root@cartazzi3-web1:/etc/nginx/sites-enabled# ls -l
 total 88
 -rw-r----- 1 root root 684 Jun  1 23:14 Cartazzi
 -rw-r----- 1 root root 788 May 26 14:20 PIZZAFORUKRAINE
 -rw-r----- 1 root root 700 May 26 14:18 PIZZAFORUKRAINE2
 -rw-r----- 1 root root 600 Jun 23 08:29 cartazzi_home_page
 -rw-r----- 1 root root 816 Jun 23 08:22 cartazzi_marketing
 -rw-r----- 1 root root 626 Jul  5  2020 covidnearme.org
 -rw-r----- 1 root root 662 May 31 16:55 covidnearmefoundation
 -rw-r----- 1 root root 588 Jul  5  2020 dev_home_page2
 -rw-r----- 1 root root 712 May 31 16:54 drunklog
 -rw-r----- 1 root root 576 Jul  5  2020 easyhire
 -rw-r----- 1 root root 686 Dec 23  2021 ground_me
 -rw-r----- 1 root root 626 Nov  6  2020 hirethem
 -rw-r----- 1 root root 714 May 26 13:16 jobhound2
 -rw-r----- 1 root root 675 Sep 27  2020 my_x_is_y-home_page2
 -rw-r----- 1 root root 658 Sep 28  2020 my_x_is_y-web-app
 -rw-r----- 1 root root 634 Jul  5  2020 netlabelerfuzzygroup
 -rw-r----- 1 root root 712 Apr 22 22:09 pizzaforukraine2_take2
 -rw-r----- 1 root root 655 Jul  6  2020 police_crawl
 -rw-r----- 1 root root 698 Jun 28 08:29 read_with_scott
 -rw-r----- 1 root root 700 Jun 29 03:44 read_with_scott2
 -rw-r----- 1 root root 642 Jul  5  2020 scotts_feed_finder
 -rw-r----- 1 root root 629 Jul  5  2020 wipmarks
 root@cartazzi3-web1:/etc/nginx/sites-enabled# mkdir blogging
 root@cartazzi3-web1:/etc/nginx/sites-enabled# cd blogging/
 root@cartazzi3-web1:/etc/nginx/sites-enabled/blogging# touch blog
 root@cartazzi3-web1:/etc/nginx/sites-enabled/blogging# vi blog
 root@cartazzi3-web1:/etc/nginx/sites-enabled/blogging# history | grep nginx
     1  tail -f /var/log/nginx/error.log
     4  grep 73532ef2 /var/log/nginx/*
     5  passenger-config --detect-nginx
    22  ls -l /var/log/nginx/
    23  tail -f /var/log/nginx/error.log
    28  ls /etc/nginx/
    30  tail -f /var/log/nginx/error.log
    31  ls -l /var/log/nginx/
    32  tail -f /var/log/nginx/error.log.1
    34  tail -f /var/log/nginx/error.log.1
    40  cd nginx/
    55  cd /etc/nginx/sites-available/
    62  systemctl nginx restart
    63  systemctl restart nginx
    64  systemctl status nginx.service
    66  systemctl restart nginx
    74  vi nginx.conf
    82  systemctl restart nginx
    83  systemctl status nginx.service
    85  systemctl restart nginx
    87  systemctl restart nginx
    98  apt-get install -y libnginx-mod-http-passenger nginx-extras=1.17.10-0ubuntu1 libnginx-mod-http-auth-pam=1.17.10-0ubuntu1 libnginx-mod-http-cache-purge=1.17.10-0ubuntu1 libnginx-mod-http-dav-ext=1.17.10-0ubuntu1 libnginx-mod-http-echo=1.17.10-0ubuntu1 libnginx-mod-http-fancyindex=1.17.10-0ubuntu1 libnginx-mod-http-geoip=1.17.10-0ubuntu1 libnginx-mod-http-geoip2=1.17.10-0ubuntu1 libnginx-mod-http-headers-more-filter=1.17.10-0ubuntu1 libnginx-mod-http-image-filter=1.17.10-0ubuntu1 libnginx-mod-http-lua=1.17.10-0ubuntu1 libnginx-mod-http-perl=1.17.10-0ubuntu1 libnginx-mod-http-subs-filter=1.17.10-0ubuntu1 libnginx-mod-http-uploadprogress=1.17.10-0ubuntu1 libnginx-mod-http-upstream-fair=1.17.10-0ubuntu1 libnginx-mod-http-xslt-filter=1.17.10-0ubuntu1 libnginx-mod-mail=1.17.10-0ubuntu1 libnginx-mod-nchan=1.17.10-0ubuntu1 libnginx-mod-stream=1.17.10-0ubuntu1 nginx-common=1.17.10-0ubuntu1 libnginx-mod-http-ndk=1.17.10-0ubuntu1 git-core libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev nodejs imagemagick yarn libsass-dev build-essential patch ruby-dev zlib1g-dev liblzma-dev libgmp-dev postgresql-client libpq-dev mysql-client libmysqlclient-dev
   100  sudo apt-get -y --allow-unauthenticated install nginx
   101  apt-get install -y libnginx-mod-http-passenger nginx-extras=1.17.10-0ubuntu1 libnginx-mod-http-auth-pam=1.17.10-0ubuntu1 libnginx-mod-http-cache-purge=1.17.10-0ubuntu1 libnginx-mod-http-dav-ext=1.17.10-0ubuntu1 libnginx-mod-http-echo=1.17.10-0ubuntu1 libnginx-mod-http-fancyindex=1.17.10-0ubuntu1 libnginx-mod-http-geoip=1.17.10-0ubuntu1 libnginx-mod-http-geoip2=1.17.10-0ubuntu1 libnginx-mod-http-headers-more-filter=1.17.10-0ubuntu1 libnginx-mod-http-image-filter=1.17.10-0ubuntu1 libnginx-mod-http-lua=1.17.10-0ubuntu1 libnginx-mod-http-perl=1.17.10-0ubuntu1 libnginx-mod-http-subs-filter=1.17.10-0ubuntu1 libnginx-mod-http-uploadprogress=1.17.10-0ubuntu1 libnginx-mod-http-upstream-fair=1.17.10-0ubuntu1 libnginx-mod-http-xslt-filter=1.17.10-0ubuntu1 libnginx-mod-mail=1.17.10-0ubuntu1 libnginx-mod-nchan=1.17.10-0ubuntu1 libnginx-mod-stream=1.17.10-0ubuntu1 nginx-common=1.17.10-0ubuntu1 libnginx-mod-http-ndk=1.17.10-0ubuntu1 git-core libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev nodejs imagemagick yarn libsass-dev build-essential patch ruby-dev zlib1g-dev liblzma-dev libgmp-dev postgresql-client libpq-dev mysql-client libmysqlclient-dev
   102  deb http://nginx.org/packages/mainline/ubuntu/ focal nginx
   103  nano -w /etc/apt/sources.list.d/nginx.list
   104  apt-get install -y libnginx-mod-http-passenger nginx-extras=1.17.10-0ubuntu1 libnginx-mod-http-auth-pam=1.17.10-0ubuntu1 libnginx-mod-http-cache-purge=1.17.10-0ubuntu1 libnginx-mod-http-dav-ext=1.17.10-0ubuntu1 libnginx-mod-http-echo=1.17.10-0ubuntu1 libnginx-mod-http-fancyindex=1.17.10-0ubuntu1 libnginx-mod-http-geoip=1.17.10-0ubuntu1 libnginx-mod-http-geoip2=1.17.10-0ubuntu1 libnginx-mod-http-headers-more-filter=1.17.10-0ubuntu1 libnginx-mod-http-image-filter=1.17.10-0ubuntu1 libnginx-mod-http-lua=1.17.10-0ubuntu1 libnginx-mod-http-perl=1.17.10-0ubuntu1 libnginx-mod-http-subs-filter=1.17.10-0ubuntu1 libnginx-mod-http-uploadprogress=1.17.10-0ubuntu1 libnginx-mod-http-upstream-fair=1.17.10-0ubuntu1 libnginx-mod-http-xslt-filter=1.17.10-0ubuntu1 libnginx-mod-mail=1.17.10-0ubuntu1 libnginx-mod-nchan=1.17.10-0ubuntu1 libnginx-mod-stream=1.17.10-0ubuntu1 nginx-common=1.17.10-0ubuntu1 libnginx-mod-http-ndk=1.17.10-0ubuntu1 git-core libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev nodejs imagemagick yarn libsass-dev build-essential patch ruby-dev zlib1g-dev liblzma-dev libgmp-dev postgresql-client libpq-dev mysql-client libmysqlclient-dev
   105  nano -w /etc/apt/sources.list.d/nginx.list
   108  nano -w /etc/apt/sources.list.d/nginx.list
   110  sudo add-apt-repository ppa:nginx/focal:universe:updates
   112  apt-get source nginx
     server {
   117  nano -w //etc/apt/sources.list.d/nginx.list
   118  rm //etc/apt/sources.list.d/nginx.list
   120  apt-get install -y libnginx-mod-http-passenger nginx-extras=1.17.10-0ubuntu1 libnginx-mod-http-auth-pam=1.17.10-0ubuntu1 libnginx-mod-http-cache-purge=1.17.10-0ubuntu1 libnginx-mod-http-dav-ext=1.17.10-0ubuntu1 libnginx-mod-http-echo=1.17.10-0ubuntu1 libnginx-mod-http-fancyindex=1.17.10-0ubuntu1 libnginx-mod-http-geoip=1.17.10-0ubuntu1 libnginx-mod-http-geoip2=1.17.10-0ubuntu1 libnginx-mod-http-headers-more-filter=1.17.10-0ubuntu1 libnginx-mod-http-image-filter=1.17.10-0ubuntu1 libnginx-mod-http-lua=1.17.10-0ubuntu1 libnginx-mod-http-perl=1.17.10-0ubuntu1 libnginx-mod-http-subs-filter=1.17.10-0ubuntu1 libnginx-mod-http-uploadprogress=1.17.10-0ubuntu1 libnginx-mod-http-upstream-fair=1.17.10-0ubuntu1 libnginx-mod-http-xslt-filter=1.17.10-0ubuntu1 libnginx-mod-mail=1.17.10-0ubuntu1 libnginx-mod-nchan=1.17.10-0ubuntu1 libnginx-mod-stream=1.17.10-0ubuntu1 nginx-common=1.17.10-0ubuntu1 libnginx-mod-http-ndk=1.17.10-0ubuntu1 git-core libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev nodejs imagemagick yarn libsass-dev build-essential patch ruby-dev zlib1g-dev liblzma-dev libgmp-dev postgresql-client libpq-dev mysql-client libmysqlclient-dev
   121  sudo apt-get install nginx
   125  history | grep nginx
   127  tail -f /var/log/nginx/error.log
   130  tail -f /var/log/nginx/error.log
   132  tail -f /var/log/nginx/error.log
   135  tail -f /var/log/nginx/error.log
   137  tail -f /var/log/nginx/error.log
   139  tail -f /var/log/nginx/error.log
   148  history | grep nginx
   149  cd /etc/nginx/
   151  vi nginx.conf
   152  systemctl restart nginx
   153  systemctl status nginx.service
   154  vi nginx.conf
   155  systemctl restart nginx
   156  systemctl status nginx.service
   157  cat /run/nginx.pid
   160  ess /etc/nginx/sites-enabled/scotts_feed_finder
   161  less /etc/nginx/sites-enabled/scotts_feed_finder
   162  cat /etc/nginx/sites-enabled/scotts_feed_finder
   167  cd /etc/nginx/sites-available/
   170  cd /etc/nginx/sites-available/
   172  cd cd /etc/nginx/sites-enabled/
   173  cd /etc/nginx/sites-enabled/
   180  history | grep nginx
 root@cartazzi3-web1:/etc/nginx/sites-enabled/blogging# systemctl restart nginx
 Job for nginx.service failed because the control process exited with error code.
 See "systemctl status nginx.service" and "journalctl -xe" for details.
 root@cartazzi3-web1:/etc/nginx/sites-enabled/blogging# systemctl status nginx.service
 ● nginx.service - A high performance web server and a reverse proxy server
    Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
    Active: failed (Result: exit-code) since Tue 2022-07-05 15:54:47 UTC; 7s ago
      Docs: man:nginx(8)
   Process: 19031 ExecStop=/sbin/start-stop-daemon --quiet --stop --retry QUIT/5 --pidfile /run/nginx.pid (code=exited, status=0/SUCCESS)
   Process: 19052 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=1/FAILURE)
  Main PID: 18030 (code=exited, status=0/SUCCESS)

 Jul 05 15:54:47 cartazzi3-web1 systemd[1]: Starting A high performance web server and a reverse proxy server...
 Jul 05 15:54:47 cartazzi3-web1 nginx[19052]: nginx: [crit] pread() "/etc/nginx/sites-enabled/blogging" failed (21: Is a directory)
 Jul 05 15:54:47 cartazzi3-web1 nginx[19052]: nginx: configuration file /etc/nginx/nginx.conf test failed
 Jul 05 15:54:47 cartazzi3-web1 systemd[1]: nginx.service: Control process exited, code=exited status=1
 Jul 05 15:54:47 cartazzi3-web1 systemd[1]: nginx.service: Failed with result 'exit-code'.
 Jul 05 15:54:47 cartazzi3-web1 systemd[1]: Failed to start A high performance web server and a reverse proxy server.
 root@cartazzi3-web1:/etc/nginx/sites-enabled/blogging# touch /etc/nginx/sites-enabled/blog
 root@cartazzi3-web1:/etc/nginx/sites-enabled/blogging# vi /etc/nginx/sites-enabled/blog
 root@cartazzi3-web1:/etc/nginx/sites-enabled/blogging# rm /etc/nginx/sites-enabled/blogging/blog
 root@cartazzi3-web1:/etc/nginx/sites-enabled/blogging# rmdir /etc/nginx/sites-enabled/blogging/
 root@cartazzi3-web1:/etc/nginx/sites-enabled/blogging# systemctl restart nginx
 root@cartazzi3-web1:/etc/nginx/sites-enabled/blogging#
 
 
 wget http://test.fuzzyblog.io
 --2022-07-05 12:01:46--  http://test.fuzzyblog.io/
 Resolving test.fuzzyblog.io (test.fuzzyblog.io)... 138.68.227.244
 Connecting to test.fuzzyblog.io (test.fuzzyblog.io)|138.68.227.244|:80... connected.
 HTTP request sent, awaiting response... 500 Internal Server Error
 2022-07-05 12:01:50 ERROR 500: Internal Server Error.
 
 
 /tmp/test on ☁️  (us-west-2) took 4s 
 ❯ ping fuzzyblog.io
 PING fuzzyblog.io (185.199.108.153): 56 data bytes
 64 bytes from 185.199.108.153: icmp_seq=0 ttl=54 time=11.577 ms
 p64 bytes from 185.199.108.153: icmp_seq=1 ttl=54 time=39.267 ms
 ^C
 --- fuzzyblog.io ping statistics ---
 2 packets transmitted, 2 packets received, 0.0% packet loss
 round-trip min/avg/max/stddev = 11.577/25.422/39.267/13.845 ms

 /tmp/test on ☁️  (us-west-2) 
 ❯ ping test.fuzzyblog.io
 PING test.fuzzyblog.io (138.68.227.244): 56 data bytes
 64 bytes from 138.68.227.244: icmp_seq=0 ttl=47 time=96.362 ms
 ^C
 --- test.fuzzyblog.io ping statistics ---
 1 packets transmitted, 1 packets received, 0.0% packet loss
 round-trip min/avg/max/stddev = 96.362/96.362/96.362/0.000 ms

 
 ### Step 2.5 Changing Over to the Load Balancer
 
 1  sudo certbot renew
    2  exit
    3  history | grep certbot
    4  sudo certbot renew
    5  history | grep nginx
    6  sudo systemctl stop nginx
    7  sudo systemctl start nginx
    8  sudo updatedb
    9  wget https://raw.githubusercontent.com/rubo77/log4j_checker_beta/main/log4j_checker_beta.sh -q -O - | bash
   10  sudo apt-get install unzip
   11  wget https://raw.githubusercontent.com/rubo77/log4j_checker_beta/main/log4j_checker_beta.sh -q -O - | bash
   12  exit
   13  lx
   14  ls
   15  l;s
   16  ls
   17  cd /
   18  ls
   19  ps auwwx | grep ng
   20  history
 
 ### Step 3: Let's run rsync
 
 ### Step 4: 