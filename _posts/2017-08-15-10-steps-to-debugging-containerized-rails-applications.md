---
layout: post
title: 10 Steps to Debugging Containerized Applications
category: docker
tags: ["docker", "debugging", "rails", "monolith", "aws"]
description: Debugging Rails applications that span multiple containers can be tricky.  Problems in one container can fundamentally break things in other containers and a holistic view of everything is really necessary to debug effectively.  
---
I've recently been building a new product using Rails based on an approach that I call *Breaking the Monolith*.  Rather than build a traditional Rails monolith, I use multiple microservices / small Rails applications and deploy them all with Docker into a distributed system.  The hardest part about distributed systems is always **debugging** and I've written this guide as a step by step approach for how to go from a misbehaving application right down to a malfunctioning container -- this is the actual process that I follow.

All of this is being done on Ubuntu under AWS but the debugging process applies to any *nix type environment or Platform as a Service (PAAS).

# Disclaimer: But You Don't SSH into Containers...

A lot of the examples below are based around SSH'ing into a server and diagnosing the error in context.  I've seen a lot of things since the advent of containers that seemingly want you to believe, that in this brave new world, you just don't SSH in anymore.  Now, perhaps I am doing things wrong, but I have not found that to be the case at all.  It may be that once I am out of active development that I will no longer be SSH'ing into servers but, for now, SSH is still a dear old friend.

# 01: Failure Context - 504 Gateway Error

The general system for a failure on this application seems to be a 504 Gateway Error which basically means that the application load balancer (ALB) isn't receiving output back from one of the HTTP subsystems.

# 02.  Check the Url in Development after a Server Restart

Every single time you do a deploy with Docker, your entire Gem stack along with any initializers is rebuilt and that means that a stack level change that you made in development but failed to catch can break everything.  So the first diagnosis step is to stop the development server and make sure that things come back up correctly.  Each of my applications runs on a different port so I can't give a single example here -- do the ctrl+c on Puma and then restart it and check the status.

**Note**: If you don't have a simple health check for your application then I would strongly recommend it.  Here's a [simple gist showing a /health url](https://gist.github.com/fuzzygroup/7dec79f94deac117ce591598243f596a) for a Rails application. 

If your Rails app is running on say port 3200 then you can just do: 

    curl http://localhost:3200/health
    
and you should see:

    ok

# 03: Test the Health Check Logged into the Server

Once you've verified that things are correct in development, the next step is to log into the server and run the same curl test on the server where the failure is occurring.  In order to make this type of debugging extremely simple for me, I run all my applications server side on exactly the same port structure that I do in development.  Even http services like the main web site run on their development port since I can let the load balancer handle translation back to 80.  Having a deployment environment that mirrors development is a huge conceptual boon. Assuming our same 3200 port example, we would:

    curl http://localhost:3200/health
    
and you should see:

    ok

**Note:** If the failure is happening solely within the same subsystem then this usually is sufficient to reveal the problem.

# 04: Check the Application Docker Logs

The next step is the application level Docker logs.  My deployer engine, Dockerano, generates a per application shell script which generates logs for the "main" container called dshell so I see something like this

    ./dlogs

    web_1        | 2017-08-11T21:51:59.474344180Z /app/config/initializers/constants_global.rb:6: warning: previous definition of REAL_SKYPE was here
    web_1        | 2017-08-11T21:51:59.474348492Z /app/config/initializers/constants_system.rb:6: warning: already initialized constant STATUS_OK
    web_1        | 2017-08-11T21:51:59.474352887Z /app/config/initializers/constants_global.rb:7: warning: previous definition of STATUS_OK was here
    web_1        | 2017-08-11T21:51:59.474356555Z /app/config/initializers/constants_system.rb:7: warning: already initialized constant HYDE_API_KEY
    web_1        | 2017-08-11T21:51:59.474360577Z /app/config/initializers/constants_global.rb:8: warning: previous definition of HYDE_API_KEY was here
    web_1        | 2017-08-11T21:51:59.783745567Z /app/config/initializers/seira_servers.rb:1: warning: already initialized constant HYDE_API_KEY
    web_1        | 2017-08-11T21:51:59.783780705Z /app/config/initializers/constants_system.rb:7: warning: previous definition of HYDE_API_KEY was here
    web_1        | 2017-08-11T21:52:00.421398929Z /app/app/controllers/home_controller.rb:124: warning: key :course is duplicated and overwritten on line 129
    web_1        | 2017-08-11T21:52:00.421438372Z /app/app/controllers/home_controller.rb:147: warning: key :course is duplicated and overwritten on line 153
    web_1        | 2017-08-11T21:52:01.118340090Z * Listening on tcp://0.0.0.0:3210
    web_1        | 2017-08-11T21:52:01.118720653Z Use Ctrl-C to stop
    
What this is doing under the hood is a simple: 

    #!/bin/bash
    docker-compose -f docker-compose.production.yml logs -f -t web

# 05: Check the Free Disc Space 

As with anything, ever, resource consumption can always be an issue and our normal OS tools include df:

    df -h
    Filesystem      Size  Used Avail Use% Mounted on
    udev            3.9G     0  3.9G 0% /dev
    tmpfs           799M   83M  716M11% /run
    /dev/xvda1       16G  7.0G  8.5G46% /
    tmpfs           3.9G  7.0M  3.9G 1% /dev/shm
    tmpfs           5.0M     0  5.0M 0% /run/lock
    tmpfs           3.9G     0  3.9G 0% /sys/fs/cgroup
    tmpfs           799M     0  799M 0% /run/user/1000

I spent a lot of time on this project trying desperately to use T2.micro instances because, well, they're cheap and, at best, it was a false economy.  Severe bloat within the Docker AUFS filesystem found me continually running out of disc space after multiple deploys even though my containers were actually tiny.  This is a [known Docker Moby issue](https://github.com/moby/moby/issues/22207) that has been open for over a year and a half now and is still **unassigned** to anyone.  

In order to avoid this bug, I ended up moving from multiple T2.micro instances to a single m4.large instance and then doubling the underlying storage from 8 gigs to 16.  And, when I did that, a lot of my issues just magically disappeared.  Being cheap truly was a false economy here because I ended up with fewer instances and not only did my reliability go up but my bill went down.

# 06: Check the CPU Usage and Ram Usage

If you don't have htop installed on all your instances then you really, really should.  htop kicks the absolute snot out of classic top.  Install it with:

    sudo apt-get install htop

And then invoke it with: 

    htop

At this point you can easily see the underlying machine load, etc.

# 07: Look at Individual Container Status

If you're having an issue with a given application then you want to look at all the containers for that application.  The easiest way is to grep by name.  Let's say that your underlying application is called seirawatchwebapp:

    docker ps | grep seirawatchwebapp
    23c1b98a2add        fuzzygroup/seirawatchwebapp_web   "bundle exec clock..."   11 hours ago        Restarting (10) 9 seconds ago                              seirawatchwebapp_clockwork_1
    6eb89122ee73        fuzzygroup/seirawatchwebapp_web   "bundle exec sidek..."   11 hours ago        Up 11 hours                                                seirawatchwebapp_sidekiq_1
    36f49f07273f        fuzzygroup/seirawatchwebapp_web   "/bin/sh -c 'puma ..."   11 hours ago        Up 11 hours                     0.0.0.0:3210->3210/tcp     seirawatchwebapp_web_1
    49d72363de84        redis:3.2-alpine                  "docker-entrypoint..."   11 hours ago        Up 11 hours                     0.0.0.0:32820->6379/tcp    seirawatchwebapp_redis_1

The thing to be concerned about here is 23c1b98a2add and the reason is that it generally shouldn't be continuously restarting which is what this view shows.

# 08: Application Level logs - Timber.io

I've recently started using [Timber.io](https://www.timber.io) which is a cross application logging environment and I've been very, very happy with it.  If you haven't looked at Timber.io for your Rails development, I'd recommend it.  Even the free tier is actually quite useful.

Timber.io is a full web app rather than a command line tool so you need to log into the Timber service and then select your application where you want to view the logs.

# 09: Check Your Error Logger

If you aren't running a dedicated error tracker, whether HoneyBadger, BugSnag or Errbit, you really, really should.  

# 10: The Answer: Check All Your Containers

What I'm building is a multi-container system, a distributed system in truth, with formal APIs between each of the components and what this means is that a container failure in subsystem X can affect subsystem Y or subsystem Z without it being clear as to why.  The trouble with this type of debugging is getting a high enough level view to understand it as a whole.  

The easiest way to do this on a single machine is to use the **docker stats** command:

    docker stats
    
    CONTAINER           CPU %               MEM USAGE / LIMIT     MEM %               NET I/O             BLOCK I/O           PIDS
    b17d34bf7268        0.01%               207.6MiB / 7.795GiB   2.60%               1.1MB / 1.53MB      20.5kB / 7.68MB     23
    5c5460a763b1        0.00%               210.4MiB / 7.795GiB   2.64%               3.62MB / 900kB      1.18MB / 0B         4
    ec28ede65792        0.06%               133.4MiB / 7.795GiB   1.67%               12.9MB / 16.9MB     0B / 0B             9
    bb5839c2a6a7        0.00%               130.9MiB / 7.795GiB   1.64%               1.13MB / 1.61MB     86kB / 16.6MB       13
    5e78dbc9489e        0.09%               6.215MiB / 7.795GiB   0.08%               16.9MB / 12.9MB     69.6kB / 434kB      3
    2d5b14feb009        0.03%               119.3MiB / 7.795GiB   1.49%               8.48MB / 15.4MB     0B / 0B             7
    13d42ed0ba35        0.01%               120.7MiB / 7.795GiB   1.51%               2.51MB / 3.88MB     401kB / 37.7MB      12
    3fbd80153022        0.08%               6.219MiB / 7.795GiB   0.08%               15.4MB / 8.46MB     24.6kB / 434kB      3
    c520fc5504f1        --                  -- / --               --                  --                  --                  --
    26ee413fab7f        0.01%               116.2MiB / 7.795GiB   1.46%               1.23MB / 1.62MB     77.8kB / 16.7MB     11
    1ab35bf6514c        0.07%               6.219MiB / 7.795GiB   0.08%               85.3kB / 0B         127kB / 0B          3
    ac1462fccc60        0.00%               106.1MiB / 7.795GiB   1.33%               1.14MB / 1.37MB     172kB / 7.92MB      10
    422787e2d5ab        0.12%               16.15MiB / 7.795GiB   0.20%               75.9MB / 52MB       754kB / 425MB       3
    b19bb9629925        0.00%               235.6MiB / 7.795GiB   2.95%               93.4MB / 116MB      508kB / 8.19kB      3
    79f484ac7c89        0.18%               388MiB / 7.795GiB     4.86%               6.35GB / 25.4GB     5.24MB / 12.3kB     15
    e34789eed4cc        0.00%               108.5MiB / 7.795GiB   1.36%               22.2kB / 17.7kB     0B / 0B             4
    6f0cd03996a3        0.12%               116.4MiB / 7.795GiB   1.46%               6.33MB / 13MB       45.1kB / 0B         6
    4d8486ff6046        0.23%               344.9MiB / 7.795GiB   4.32%               1.17MB / 1.69MB     1.16MB / 16.7MB     28
    4d978af45ff2        0.16%               6.219MiB / 7.795GiB   0.08%               13MB / 6.34MB       102kB / 442kB       3
    533d96fc2ce1        0.24%               120.7MiB / 7.795GiB   1.51%               9.18MB / 16.7MB     258kB / 0B          6
    6b60a945bff7        0.01%               188.3MiB / 7.795GiB   2.36%               14.5MB / 4.69MB     2.03MB / 0B         10
    9c2e8ec55a06        0.10%               6.215MiB / 7.795GiB   0.08%               16.7MB / 9.17MB     369kB / 475kB       3
    
The curious thing here is that one container, c520fc5504f1, is showing -- for CPU % and all other metrics.  Let's zoom in on that one.  Personally I find the view above to be more granular than needed and missing the application specific details that I need so my deployer generates a dstats shell script which does this:

    ./dstats 
    CONTAINER                      CPU %               MEM USAGE / LIMIT     CONTAINER ID
    seirawatchshop_sidekiq_1       --                  -- / --               c520fc5504f1321d44078ea3df8a2f1ffc9147d0cb117564e913596eda76db32
    seirawatchshop_web_1           0.01%               91.61MiB / 7.795GiB   cc24d6bcc576cc1ce0c7d04ba8af6b51a1b7599fbbfdcf0c1cb98bd1553e1224
    seirawatchshop_redis_1         0.09%               6.215MiB / 7.795GiB   796829845da6dd5f5f63b7449ce3c95581e386e691626344b5b59010b088311d
    seirasearch_web_1              0.47%               207.6MiB / 7.795GiB   b17d34bf72689e75f6332f387f964e1e3f2803c3cf544d3bb7de6d7b501c2a38
    seirawatchwebapp_clockwork_1   0.01%               210.4MiB / 7.795GiB   5c5460a763b11f4347a0dc806cc7ff5b1314220a9d93ed55f729d4853c1d094f
    seirawatchwebapp_sidekiq_1     0.32%               133.4MiB / 7.795GiB   ec28ede65792d435c7b3042909925a17c79182e820dfa16964be151b07241c07
    seirawatchwebapp_web_1         0.00%               131MiB / 7.795GiB     bb5839c2a6a7e87e694baa84d1f7b102c54aebde6991203da14836fa60006742
    seirawatchwebapp_redis_1       0.14%               6.215MiB / 7.795GiB   5e78dbc9489ecd3b050715b0aa1fe002cebb4636a858e17f93da56f5736aae2d
    seirawatchsite_sidekiq_1       0.10%               119.3MiB / 7.795GiB   2d5b14feb009aa4eaf72cde6969bb271a6c81d6cd196a9648a5c64184ffab242
    seirawatchsite_web_1           0.02%               121.1MiB / 7.795GiB   13d42ed0ba35bd56ffa0977fde429759f4713ec8e58ae0715e273d040a7a276c
    seirawatchsite_redis_1         0.10%               6.219MiB / 7.795GiB   3fbd801530227940730abe8197b24d3e24d52edf9bdfb4145d30e3ae40399418
    seirawebappapi_web_1           0.00%               106.1MiB / 7.795GiB   ac1462fccc60a569d86ce0a0b7939a66af42ae07328a261265d90bcc6928c372
    seiracrawler_redis_1           0.15%               16.15MiB / 7.795GiB   422787e2d5ab64647fd67a0c9c25af2a8ecdbb7ce3ab0a6bc7ca16ededb5a93b
    seiracrawler_rake_1            0.01%               236.5MiB / 7.795GiB   b19bb96299253434c9ea94f4e1c9640b255e5f359c3af7060acd49a6070ffc01
    seiracrawler_sidekiq_1         0.14%               400MiB / 7.795GiB     79f484ac7c8958742dc744da0404652ff100a9e299080014a4d64b5b78ea000c
    seiraadmin_clockwork_1         0.01%               108.5MiB / 7.795GiB   e34789eed4cc4a6bf7173ef3f278033799272e116f3f670ceb0754b521065b0d
    seiraadmin_sidekiq_1           0.08%               116.4MiB / 7.795GiB   6f0cd03996a3414ee7bc0c3fb76adb542d06e3c1c0f7fa1fe108f156a9d9ac0f
    seiraadmin_web_1               0.25%               121.3MiB / 7.795GiB   4d8486ff604656515f0e0e433b99486cf91131ce4a93b82701aa42ef77015155
    seiraadmin_redis_1             0.11%               6.219MiB / 7.795GiB   4d978af45ff2db55c08212e404264422a39f4ee4fa4b6656b149a37df65bf147
    shouldigem_sidekiq_1           0.06%               120.7MiB / 7.795GiB   533d96fc2ce1fb492faa477dfd171e370a30c107becce00e5a52d56bfe3b2622
    shouldigem_web_1               0.10%               187.1MiB / 7.795GiB   6b60a945bff74748f3c447ff7b57f75ef12518758c79e75bd587d59531771f3e
    shouldigem_redis_1             0.09%               6.215MiB / 7.795GiB   9c2e8ec55a066d382d0ee0ceadfb3e061196127f6b334e16b73e43551ee4f435

Note 1: Source for dstats is [here](https://gist.github.com/fuzzygroup/b4293b4a7d15a9d8ea88a50ddb2ab3f0).

Note 2: If you're curious about how to configure the output of docker stats then see [this link](https://docs.docker.com/engine/reference/commandline/stats/#formatting).

If I then docker ps and grep either with the name or the process id, I will see the same container:

    docker ps | grep seirawatchshop_sidekiq_1
    631359e0cec8        fuzzygroup/seirawatchshop_web     "bundle exec sidek..."   10 hours ago        Restarting (1) 46 seconds ago                             seirawatchshop_sidekiq_1

    docker ps | grep 631359e0cec8
    631359e0cec8        fuzzygroup/seirawatchshop_web     "bundle exec sidek..."   9 hours ago         Restarting (1) 26 seconds ago                             seirawatchshop_sidekiq_1

Once we have this then we can get just the logs on this one container:

    docker logs 631359e0cec8
    
    Error connecting to Redis on 127.0.0.1:6379 (Errno::ECONNREFUSED)
    /usr/local/bundle/gems/redis-3.3.3/lib/redis/client.rb:345:in `rescue in establish_connection'
    /usr/local/bundle/gems/redis-3.3.3/lib/redis/client.rb:331:in `establish_connection'
    /usr/local/bundle/gems/redis-3.3.3/lib/redis/client.rb:101:in `block in connect'
    /usr/local/bundle/gems/redis-3.3.3/lib/redis/client.rb:293:in `with_reconnect'
    /usr/local/bundle/gems/redis-3.3.3/lib/redis/client.rb:100:in `connect'
    /usr/local/bundle/gems/redis-3.3.3/lib/redis/client.rb:364:in `ensure_connected'
    /usr/local/bundle/gems/redis-3.3.3/lib/redis/client.rb:221:in `block in process'
    /usr/local/bundle/gems/redis-3.3.3/lib/redis/client.rb:306:in `logging'
    /usr/local/bundle/gems/redis-3.3.3/lib/redis/client.rb:220:in `process'
    /usr/local/bundle/gems/redis-3.3.3/lib/redis/client.rb:120:in `call'
    /usr/local/bundle/gems/redis-3.3.3/lib/redis.rb:251:in `block in info'
    /usr/local/bundle/gems/redis-3.3.3/lib/redis.rb:58:in `block in synchronize'
    /usr/local/lib/ruby/2.3.0/monitor.rb:214:in `mon_synchronize'
    /usr/local/bundle/gems/redis-3.3.3/lib/redis.rb:58:in `synchronize'
    /usr/local/bundle/gems/redis-3.3.3/lib/redis.rb:250:in `info'
    /usr/local/bundle/gems/sidekiq-4.2.7/lib/sidekiq.rb:113:in `block in redis_info'
    /usr/local/bundle/gems/sidekiq-4.2.7/lib/sidekiq.rb:95:in `block in redis'
    /usr/local/bundle/gems/connection_pool-2.2.1/lib/connection_pool.rb:64:in `block (2 levels) in with'
    /usr/local/bundle/gems/connection_pool-2.2.1/lib/connection_pool.rb:63:in `handle_interrupt'
    /usr/local/bundle/gems/connection_pool-2.2.1/lib/connection_pool.rb:63:in `block in with'
    /usr/local/bundle/gems/connection_pool-2.2.1/lib/connection_pool.rb:60:in `handle_interrupt'
    /usr/local/bundle/gems/connection_pool-2.2.1/lib/connection_pool.rb:60:in `with'
    /usr/local/bundle/gems/sidekiq-4.2.7/lib/sidekiq.rb:92:in `redis'
    /usr/local/bundle/gems/sidekiq-4.2.7/lib/sidekiq.rb:106:in `redis_info'
    /usr/local/bundle/gems/sidekiq-4.2.7/lib/sidekiq/cli.rb:71:in `run'
    /usr/local/bundle/gems/sidekiq-4.2.7/bin/sidekiq:12:in `<top (required)>'
    /usr/local/bundle/bin/sidekiq:22:in `load'
    /usr/local/bundle/bin/sidekiq:22:in `<top (required)>'

So what's going on here is clearly at the Sidekiq stack layer and it is some type of connection to the underlying containerized Redis instance.  Once we know that, troubleshooting this should actually be pretty simple; it eventually turned out to be a missing pair of files - config/sidekiq.yml.erb and config/initializers/sidekiq.rb that had been overlooked in my initial configuration.

Just as a sidebar, a docker ps -a is also sometimes useful:

    docker ps -a
    CONTAINER ID        IMAGE                             COMMAND                  CREATED             STATUS                          PORTS       NAMES
    b17d34bf7268        fuzzygroup/seirasearch_web        "/bin/sh -c 'puma ..."   9 hours ago         Up 9 hours                      0.0.0.0:3230->3230/tcp    seirasearch_web_1
    5c5460a763b1        fuzzygroup/seirawatchwebapp_web   "bundle exec clock..."   9 hours ago         Up 9 hours       seirawatchwebapp_clockwork_1
    ec28ede65792        fuzzygroup/seirawatchwebapp_web   "bundle exec sidek..."   9 hours ago         Up 9 hours       seirawatchwebapp_sidekiq_1
    bb5839c2a6a7        fuzzygroup/seirawatchwebapp_web   "/bin/sh -c 'puma ..."   9 hours ago         Up 9 hours                      0.0.0.0:3210->3210/tcp    seirawatchwebapp_web_1
    5e78dbc9489e        redis:3.2-alpine                  "docker-entrypoint..."   9 hours ago         Up 9 hours                      0.0.0.0:32779->6379/tcp   seirawatchwebapp_redis_1
    2d5b14feb009        fuzzygroup/seirawatchsite_web     "bundle exec sidek..."   9 hours ago         Up 9 hours       seirawatchsite_sidekiq_1
    13d42ed0ba35        fuzzygroup/seirawatchsite_web     "/bin/sh -c 'puma ..."   9 hours ago         Up 9 hours                      0.0.0.0:3200->3200/tcp    seirawatchsite_web_1
    3fbd80153022        redis:3.2-alpine                  "docker-entrypoint..."   9 hours ago         Up 9 hours                      0.0.0.0:32777->6379/tcp   seirawatchsite_redis_1
    631359e0cec8        fuzzygroup/seirawatchshop_web     "bundle exec sidek..."   9 hours ago         Restarting (1) 58 seconds ago       seirawatchshop_sidekiq_1
    26ee413fab7f        fuzzygroup/seirawatchshop_web     "/bin/sh -c 'puma ..."   9 hours ago         Up 9 hours                      0.0.0.0:3205->3205/tcp    seirawatchshop_web_1
    1ab35bf6514c        redis:3.2-alpine                  "docker-entrypoint..."   9 hours ago         Up 9 hours                      0.0.0.0:32775->6379/tcp   seirawatchshop_redis_1
    ac1462fccc60        fuzzygroup/seirawebappapi_web     "/bin/sh -c 'puma ..."   9 hours ago         Up 9 hours                      0.0.0.0:3220->3220/tcp    seirawebappapi_web_1
    422787e2d5ab        redis:3.2-alpine                  "docker-entrypoint..."   9 hours ago         Up 9 hours                      0.0.0.0:32774->6379/tcp   seiracrawler_redis_1
    b19bb9629925        fuzzygroup/seiracrawler_rake      "bundle exec clock..."   9 hours ago         Up 9 hours       seiracrawler_rake_1
    79f484ac7c89        fuzzygroup/seiracrawler_rake      "bundle exec sidek..."   9 hours ago         Up 9 hours       seiracrawler_sidekiq_1
    e34789eed4cc        fuzzygroup/seiraadmin_web         "bundle exec clock..."   9 hours ago         Up 9 hours       seiraadmin_clockwork_1
    6f0cd03996a3        fuzzygroup/seiraadmin_web         "bundle exec sidek..."   9 hours ago         Up 9 hours       seiraadmin_sidekiq_1
    4d8486ff6046        fuzzygroup/seiraadmin_web         "/bin/sh -c 'puma ..."   9 hours ago         Up 9 hours                      0.0.0.0:3203->3203/tcp    seiraadmin_web_1
    4d978af45ff2        redis:3.2-alpine                  "docker-entrypoint..."   9 hours ago         Up 9 hours                      0.0.0.0:32773->6379/tcp   seiraadmin_redis_1
    533d96fc2ce1        fuzzygroup/shouldigem_web         "bundle exec sidek..."   10 hours ago        Up 10 hours       shouldigem_sidekiq_1
    6b60a945bff7        fuzzygroup/shouldigem_web         "/bin/sh -c 'puma ..."   10 hours ago        Up 10 hours                     0.0.0.0:3500->3500/tcp    shouldigem_web_1
    9c2e8ec55a06        redis:3.2-alpine                  "docker-entrypoint..."   10 hours ago        Up 10 hours                     0.0.0.0:32770->6379/tcp   shouldigem_redis_1
    6c2b013947d1        google/cadvisor:latest            "/usr/bin/cadvisor..."   11 hours ago        Exited (137) 11 hours ago       cadvisor2
    34e1edbad906        google/cadvisor:latest            "/usr/bin/cadvisor..."   11 hours ago        Created       cadvisor1
    8478172d0f2b        google/cadvisor:latest            "/usr/bin/cadvisor..."   11 hours ago        Exited (137) 11 hours ago       cadvisor
    5b5c1709c1af        errbit/errbit:latest              "bundle exec puma ..."   3 days ago          Exited (0) 10 hours ago       errbit_errbit_1
    ac91a943e789        mongo:3.2                         "docker-entrypoint..."   3 days ago          Exited (0) 10 hours ago       errbit_mongo_1

# 11: Go Nuclear - Restart the Docker Daemon

The absolute nuclear approach here is to simply restart the [docker daemon](https://docs.docker.com/engine/admin/) itself.  On Ubuntu, this is:

    sudo service docker restart
    
I'm not going to go so far as to say that you don't have to, rarely, restart the docker daemon but it is just that -- **rare**.  Your problems are far, far, far more likely to be application side errors, even when it looks like Docker is at fault.  I've mistakenly pointed the finger at Docker too many times -- and I was **wrong**.

# Pitch for a Friend: Learn from Nick

All my Docker knowledge came from Nick Janetakis’ [Dive into Docker](https://diveintodocker.com/) course and he does a great job teaching about Docker. He also kibitzed with me on this debugging process although he never saw the final draft before it went live.  Any errors are mine not his.  Strongly recommended.
