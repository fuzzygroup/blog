---
layout: post
title: Using CapRover on AWS
category: caprover
tags: ["caprover", "aws"]
---
I am a Ruby on Rails guy and I **censored** hate deploying Ruby stuff.  I've been deploying Rails stuff now since 2007 and, quite honestly, it sucked in 2007 and it sucks today.  The only way I've ever found Rails deployment to not suck is by using Heroku which is absolutely magical and wonderful -- but expensive.  Now I've recently become hooked on Heroku and the ease of its Git push based deployment structure.  The problem is that I need more power / flexibility with respect to what I'm deploying and this has let me to the [CapRover](https://caprover.com/) open source project.  

This project aims to give you a version of Heroku but running on your own hardware.  Given that I'm an AWS guy, I wanted to use CapRover on AWS EC2 instances.  

## Setup - 1

I started by installing the CapRover software and here was the first problem that I hit: 

    sudo docker run -p 80:80 -p 443:443 -p 3000:3000 -v /var/run/docker.sock:/var/run/docker.sock -v /captain:/captain caprover/caprover
    docker: Error response from daemon: driver failed programming external connectivity on endpoint quizzical_snyder (f72be52bf809d139cc012debeadb87b813e02e8fd2ada6fbba97d4503d624c43): Error starting userland proxy: listen tcp 0.0.0.0:80: bind: address already in use.
    ERRO[0000] error waiting for container: context canceled

The issue here is that one of these 3 ports is already in use.  And the easiest way to figure this out is to run a succession of netstat commands:

    sudo netstat -pna | grep 3000
   
That returned nothing.  So onto the next one, 443:

    sudo netstat -pna | grep 443

Again this returned nothing, onto 80:

    sudo netstat -pna | grep 80
    tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      21331/nginx: master
    tcp6       0      0 :::80                   :::*                    LISTEN      21331/nginx: master
    unix  2      [ ACC ]     STREAM     LISTENING     16380    1/init               @ISCSIADM_ABSTRACT_NAMESPACE
    unix  3      [ ]         STREAM     CONNECTED     22180    949/dockerd
    unix  3      [ ]         STREAM     CONNECTED     38086    4225/python3
    unix  2      [ ]         DGRAM                    18052    1010/systemd-logind
    unix  3      [ ]         STREAM     CONNECTED     18081    954/dbus-daemon      /var/run/dbus/system_bus_socket
    unix  3      [ ]         STREAM     CONNECTED     38087    4225/python3
    unix  3      [ ]         STREAM     CONNECTED     18880    954/dbus-daemon
    unix  3      [ ]         STREAM     CONNECTED     18080    1010/systemd-logind    

So the issue here is that I already have Nginx on this box listening on port 80.  This is clearly **my issue** and related to my initial work on using Capistrano to partially deploy a Ruby app. 

I solved this by creating a new instance and working there.

## Setup - 2

I then installed docker using Snap and that led me to this error:

    sudo docker run -p 80:80 -p 443:443 -p 3000:3000 -v /var/run/docker.sock:/var/run/docker.sock -v /captain:/captain caprover/caprover
    docker: Error response from daemon: error while creating mount source path '/captain': mkdir /captain: read-only file system.
    ERRO[0000] error waiting for container: context canceled    

I've now used Docker for a bunch of years and this led to the typical, crap ass Docker troubleshooting approach of roaming thru Google, looking for a github issue that explains things.  I found one from a [January 19, 2019](https://github.com/moby/moby/issues/34427) issue which said "don't use the snap version of Docker".  

## Setup - 3

I'm personally an apt-get fan and I don't even know what we have Snaps but they are the new hotness so I did try them out.  Apparently this is my bad.

Ok then:

    snap remove docker  

And then I reinstalled docker using [this guide](https://phoenixnap.com/kb/how-to-install-docker-on-ubuntu-18-04).

    sudo apt-get update
    sudo apt-get remove docker docker-engine docker.io
    sudo apt install docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
    
At this point you need to log out and log back in and then do a:

    docker --version

At this point docker should be cleanly installed.

You probably want to be able to use docker without having to use sudo, so:

    sudo groupadd docker
    usermod -a -G docker ubuntu

## Setup - 4 

If you are using AWS then your next likely problem will be this error:

    docker run -p 80:80 -p 443:443 -p 3000:3000 -v /var/run/docker.sock:/var/run/docker.sock -v /captain:/captain caprover/caprover

    > caprover@0.0.0 start /usr/src/app
    > node ./bin/www

    Captain Starting ...
    Installing Captain Service ...

     Installation of CapRover is starting...
    For troubleshooting, please see: https://caprover.com/docs/troubleshooting.html

     >>> Checking System Compatibility <<<
       Docker Version passed.
       Ubuntu detected.
       X86 CPU detected.
       Total RAM 8363 MB

    Are your trying to run CapRover on a local machine or a machine without public IP?
    In that case, you need to add this to your installation command:
        -e MAIN_NODE_IP_ADDRESS='127.0.0.1'

    Otherwise, if you are running CapRover on a VPS with public IP:
    Your firewall may have been blocking an in-use port: 3000
    A simple solution on Ubuntu systems is to run "ufw disable" (security risk)
    Or [recommended] just allowing necessary ports:
    ufw allow 80,443,3000,996,7946,4789,2377/tcp; ufw allow 7946,4789,2377/udp;

    See docs for more details on how to fix firewall issues

    Finally, if you are an advanced user, and you want to bypass this check (NOT RECOMMENDED),
    you can append the docker command with an addition flag: -e BY_PASS_PROXY_CHECK='TRUE'

    Installation failed.
    Error: Port timed out: 3000
        at Timeout._onTimeout (/usr/src/app/built/utils/CaptainInstaller.js:136:20)
        at ontimeout (timers.js:436:11)
        at tryOnTimeout (timers.js:300:5)
        at listOnTimeout (timers.js:263:5)
        at Timer.processTimers (timers.js:223:10)

## Setup - 5

And this needs to be solved by adding to your AWS security group, a hole for port 3000.  Do this with the normal AWS user interface for security groups.  You should future proof yourself by allowing for by ipv4 and ipv6 addresses.

Once this is done then you can run:

    docker run -p 80:80 -p 443:443 -p 3000:3000 -v /var/run/docker.sock:/var/run/docker.sock -v /captain:/captain caprover/caprover        

And have it actually get CapRover up and running.  And, yes, I actually did a happy dance when this worked.  I might have been holding hands with the cat while I did this.  The cat was not amused.

## Setup - 6

At this point you need to install the local CapRover tooling to setup the server component.  So, on your own machine, do this:

    npm install -g caprover    

And then:

    caprover serversetup
  
which walks you thru this process:

    ------------
    CapRover CLI has recently been refactored. Please report potential bugs here: https://github.com/caprover/caprover-cli/issues
    ------------

    Setup CapRover machine on your server...

    ? have you already started CapRover container on your server? Yes
    ? IP address of your server: 18.216.143.180
    ? CapRover server root domain: cartazzi.com
    ? new CapRover password (min 8 characters): [hidden]
    ? enter new CapRover password again: [hidden]
    ? "valid" email address to get certificate and enable HTTPS: fuzzygroup@gmail.com
    ? CapRover machine name, with whom the login credentials are stored locally: captain-01

    CapRover server setup completed: it is available as captain-01 at https://captain.cartazzi.com

    For more details and docs see CapRover.com  
    

## Setup - 7

You will need an actual domain that you can bind to your ip address.  And you need to make sure that you assign *.domain.com (or whatever) to it.  

Since I'm an AWS guy, I went to the Route 53 domain manager and found an unused domain of mine, cartazzi.com and bound it to the ip address above.  I then added a *.cartazzi.com wildcard dns entry onto it.

## Setup - 8

Once all this is done then you can to: https://captain.cartazzi.com.  This gives you a web based ui where you can create an app that you can then use a heroku style push deploy to take your code live.  And all of this is magically hooked up to Lets Encrypt for proper https.

## Setup - 9

The magic of all this is tied to the Captain Definition file or captain-definition which is essentially a JSON formatted Dockerfile that defines how the application is built.  And this is where my Docker knowledge failed me.  Here's as far as I got:

    cat captain-definition
    {
      "schemaVersion": 2,
      "dockerfileLines": [
    	"FROM ubuntu:latest",
      "FROM ruby:2.6.5-stretch",
      "RUN rm /etc/localtime",
    	"RUN echo 'Etc/UTC' > /etc/timezone",
    	"RUN ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime",
    	"RUN apt-get update",
    	"RUN apt-get install -y tzdata",
    	"RUN apt-get install -y git",
    	"RUN apt-get install -y ruby",
    	"RUN apt-get install -y postgresql",
    	"RUN apt-get install -y libpq-dev",
    	"RUN apt-get install -y build-essential patch ruby-dev zlib1g-dev liblzma-dev",
    	"RUN apt-get install -y nodejs",
    	"RUN mkdir -p /usr/src/app",
    	"WORKDIR /usr/src/app",
    	"RUN gem install bundler",
    	"ADD ./src/Gemfile /usr/src/app/",
    	"ADD ./src/Gemfile.lock /usr/src/app/",
    	"RUN bundle install",
    	"COPY ./src /usr/src/app",
    	"ENV RACK_ENV production",
    	"EXPOSE 80",
    	"CMD [\"rackup\", \"config.ru\", \"--host\", \"0.0.0.0\", \"--port\", \"80\"]"
      ]
    }

Once you have written your captain-definition file, you deploy it with:

    caprover deploy --default

And, alas, this dies with errors:

    ❯ caprover deploy --default


    ------------
    CapRover CLI has recently been refactored. Please report potential bugs here: https://github.com/caprover/caprover-cli/issues
    ------------


    Preparing deployment to CapRover...

    Ensuring authentication...
    Saving tar file to: "/Users/sjohnson/Sync/fuzzygroup/adl/antihate/cts_home_page/temporary-captain-to-deploy.tar"
    Using last commit on "caprover": 2541bb79b9c936a4f624823ddb8a7544a7a0cc42

    Deploying cts-home-page to captain-01...

    Uploading [====================] 100%  (ETA 0.0s)
    Upload done.

    This might take several minutes. PLEASE BE PATIENT...

    ⠸ Building your source code...
    ------------------------- Mon Nov 11 2019 04:30:15 GMT+0000 (Coordinated Universal Time)
    ⠇ Building your source code...
    [[ TRUNCATED ]]
    ---> Using cache
    ---> e876ce01f153
    Step 7/23 : RUN apt-get install -y tzdata

    ---> Using cache
    ---> b2527a3e63c8
    Step 8/23 : RUN apt-get install -y git

    ---> Using cache
    ---> cba1d4e5691e
    Step 9/23 : RUN apt-get install -y ruby

    ---> Using cache
    ---> a5aa1c013480
    Step 10/23 : RUN apt-get install -y postgresql

    ---> Using cache
    ---> 6667fca6acaa
    Step 11/23 : RUN apt-get install -y libpq-dev

    ---> Using cache
    ---> b2f1f9d578da
    Step 12/23 : RUN apt-get install -y build-essential patch ruby-dev zlib1g-dev liblzma-dev

    ---> Using cache
    ---> 698c0e61c945
    Step 13/23 : RUN apt-get install -y nodejs

    ---> Using cache
    ---> a9e2578c2dab
    Step 14/23 : RUN mkdir -p /usr/src/app

    ---> Using cache
    ---> 30f161f073b3
    Step 15/23 : WORKDIR /usr/src/app

    ---> Using cache
    ---> 241cfd1f23d4
    Step 16/23 : RUN gem install bundler

    ---> Using cache
    ---> 1c3707fa9dc1
    Step 17/23 : ADD ./src/Gemfile /usr/src/app/

    {"message":"ADD failed: stat /var/lib/docker/tmp/docker-builder803139007/src/Gemfile: no such file or directory"}
    ADD failed: stat /var/lib/docker/tmp/docker-builder803139007/src/Gemfile: no such file or directory
    Build has failed!
    ----------------------
    Deploy failed!
    Error: {"message":"ADD failed: stat /var/lib/docker/tmp/docker-builder803139007/src/Gemfile: no such file or directory"}
    ADD failed: stat /var/lib/docker/tmp/docker-builder803139007/src/Gemfile: no such file or directory

    Something bad happened. Cannot deploy cts-home-page at captain-01.
    
## Conclusion

I am really, really impressed with CapRover and I intend to return to it.  While I didn't get everything working, what did work was **impressive** and the fact that Rails doesn't deploy is mostly a documentation issue, not a failing, at all, of CapRover.  The issues I had with AWS are also documentation issues.