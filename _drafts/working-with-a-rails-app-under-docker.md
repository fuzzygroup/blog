---
layout: post
title: Working With a Rails App Under Docker
---

# Working with a Rails App Under Docker

If you view Docker as similar to an operating system, and, yes, I know that's not technically correct, then it makes sense that there are a **lot** of commands that you need to know, just as you need to know a lot of commands to use an operating system.  In this section I'm going to give examples of each of the docker commands that I found myself using.

## Finding Your Process - docker ps

The docker ps command lists your running processes under Docker:

> docker ps

    docker ps
    CONTAINER ID        IMAGE                                                                                               COMMAND                  CREATED             STATUS              PORTS               NAMES
    c268d4b67dd6        fuzzygroup/shouldigem_web@sha256:cb55863d2a41d97ee2de5bc42354dae03c8ac30780d86557560e1a373567f116   "bundle exec sidek..."   10 minutes ago      Up 10 minutes                           shouldigem_sidekiq.1.klojjb9cnni0ceuwqunaxhuke
    7f04bfa41535        fuzzygroup/shouldigem_web@sha256:cb55863d2a41d97ee2de5bc42354dae03c8ac30780d86557560e1a373567f116   "/bin/sh -c 'puma ..."   10 minutes ago      Up 10 minutes                           shouldigem_web.1.r2m01ncqud8ynz2r0ui8fyvg5
    34e2624d5691        redis@sha256:9cd405cd1ec1410eaab064a1383d0d8854d1eef74a54e1e4a92fb4ec7bdc3ee7                       "docker-entrypoint..."   28 minutes ago      Up 28 minutes       6379/tcp            shouldigem_redis.1.wf9ggadw7c8pusgreaheojyz5

In this case I want to look at the 2nd one -- shouldigem_web.  I'll need to capture the container id to my clipboard so I can use it to view logs in the next command.

## Viewing Logs -- docker logs 

The docker logs command views the logs from your running processes under Docker:

docker logs 7f04bfa41535 | more

## Running Rails Console

I don't know about other folks but, even in production, I'm intensely dependent on the Rails console, particularly at the early stages where nothing ever works right.  What you can do with Docker is connect to your Rails container with an interactive terminal flag (-it).  Start by using docker ps to get the process id and then:

    docker exec -it 7f04bfa41535 sh
    
That launches an old school sh terminal (I didn't want the overhead of bash on my containers so I just left it with sh).  If you run an ls -l then this will all look familiar:


    /app # ls -l
    total 104
    -rw-r--r--    1 root     root           489 Apr 27 18:30 Dockerfile
    -rw-r--r--    1 root     root          1522 Apr 27 14:03 Gemfile
    -rw-r--r--    1 root     root          8737 Apr 27 14:11 Gemfile.lock
    -rw-r--r--    1 root     root          3963 Apr 24 21:34 Guardfile
    -rw-r--r--    1 root     root           534 Apr 26 19:16 README
    -rw-r--r--    1 root     root           534 Apr 26 19:17 README.md
    -rw-r--r--    1 root     root           227 Apr 24 21:31 Rakefile
    drwxr-xr-x   10 root     root          4096 Apr 25 07:05 app
    drwxr-xr-x    2 root     root          4096 Apr 24 21:35 bin
    drwxr-xr-x    5 root     root          4096 Apr 26 15:06 config
    -rw-r--r--    1 root     root           130 Apr 24 21:31 config.ru
    drwxr-xr-x    3 root     root          4096 Apr 24 22:40 db
    -rwxr-xr-x    1 root     root           687 Apr 27 19:01 deploy.sh
    drwxr-xr-x    3 root     root          4096 Apr 27 14:44 docker
    -rw-r--r--    1 root     root          1464 Apr 27 19:04 docker-compose.production.yml
    -rw-r--r--    1 root     root          1013 Apr 27 15:46 docker-compose.yml
    drwxr-xr-x    2 root     root          4096 Apr 27 13:17 docs
    drwxr-xr-x    5 root     root          4096 Apr 24 21:34 lib
    drwxr-xr-x    2 root     root          4096 Apr 24 21:34 log
    drwxr-xr-x    4 root     root          4096 Apr 27 19:05 public
    drwxr-xr-x    6 root     root          4096 Apr 24 22:37 spec
    drwxr-xr-x    6 root     root          4096 Apr 27 19:05 tmp
    -rw-r--r--    1 root     root          1283 Apr 27 18:36 ubuntu@ec2-52-14-213-243.us-east-2.compute.amazonaws.com
    drwxr-xr-x    3 root     root          4096 Apr 24 21:31 vendor

Yes Virginia -- that's a Rails app and you can just use bundle exec rails c:


    /app # bundle exec rails c
    Loading production environment (Rails 5.0.2)
    irb(main):001:0>
    
docker stack ps shouldigem

    ID            NAME                  IMAGE                             NODE             DESIRED STATE  CURRENT STATE               ERROR  PORTS
    wd1jlbwgx7m0  shouldigem_sidekiq.1  fuzzygroup/shouldigem_web:latest  ip-172-31-9-129  Running        Running 3 minutes ago
    xclwhnvhg9mm  shouldigem_web.1      fuzzygroup/shouldigem_web:latest  ip-172-31-9-129  Running        Running 3 minutes ago
    ugwqfsaqnsc3  shouldigem_sidekiq.1  fuzzygroup/shouldigem_web:latest  ip-172-31-9-129  Shutdown       Shutdown 3 minutes ago
    2lzgsunoay0y  shouldigem_web.1      fuzzygroup/shouldigem_web:latest  ip-172-31-9-129  Shutdown       Shutdown 3 minutes ago
    r2m01ncqud8y   \_ shouldigem_web.1  fuzzygroup/shouldigem_web:latest  ip-172-31-9-129  Shutdown       Shutdown 9 minutes ago
    klojjb9cnni0  shouldigem_sidekiq.1  fuzzygroup/shouldigem_web:latest  ip-172-31-9-129  Shutdown       Shutdown 9 minutes ago
    seegap6xlfy1  shouldigem_web.1      fuzzygroup/shouldigem_web:latest  ip-172-31-9-129  Shutdown       Shutdown about an hour ago
    akgkzn8ytfcc  shouldigem_sidekiq.1  fuzzygroup/shouldigem_web:latest  ip-172-31-9-129  Shutdown       Shutdown about an hour ago
    wf9ggadw7c8p  shouldigem_redis.1    redis:3.2-alpine                  ip-172-31-9-129  Running        Running 2 hours ago
    sp16ukp44u3e  shouldigem_sidekiq.1  fuzzygroup/shouldigem_web:latest  ip-172-31-9-129  Shutdown       Shutdown 2 hours ago
    o9kbzy6ojbat  shouldigem_web.1      fuzzygroup/shouldigem_web:latest  ip-172-31-9-129  Shutdown       Shutdown 2 hours ago

docker stack services shouldigem

    ID            NAME                MODE        REPLICAS  IMAGE
    f9dpr1o77x16  shouldigem_web      replicated  1/1       fuzzygroup/shouldigem_web:latest
    idhahasrpax2  shouldigem_sidekiq  replicated  1/1       fuzzygroup/shouldigem_web:latest
    zejrjetcdzgy  shouldigem_redis    replicated  1/1       redis:3.2-alpine



docker-compose build web

docker tag shouldigem_web fuzzygroup/shouldigem_web

docker push fuzzygroup/shouldigem_web