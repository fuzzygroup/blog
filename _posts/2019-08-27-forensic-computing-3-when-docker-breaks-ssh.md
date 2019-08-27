---
layout: post
title: Forensic Computing 3 - When Docker Breaks SSH
category: docker
tags: ["docker", "linux", "networking", "ssh"]
---
I've written a few of these now.  I term it "forensic computing" when I've been given a problem to solve that I really have no idea how to approach and it is just a damn mystery.  The problem here was that for my day job:

* We are an AWS shop and all of this happens on AWS
* We moved from OpenVPN as a VPN client to something called TunnelBlick
* We lost the ability to ssh in - or ping - our Jenkins slave box.  Not any other box.  Even the Jenkins master box was fine.  This only affected the Jenkins slave box.
* Of all the computers we own, only I had the ability to SSH in / ping the Jenkins slave box
* Given that I'm a cranky, old engineer, of all the people we had, only I refused to install the new VPN client (in my defense; I saw that a number of people had problems with it and I *have* to have VPN access at all time).

**Note 1**: I should note that even though I'm the one writing this up, our Director of Cloud Operations (ST) was instrumental to solving this and his assistance was greatly appreciated.

**Note 2**: Yes the answer is in the title but keep reading, it gets interesting.

So all I really knew as I started looking into this was that, somehow, the VPN was likely involved because this problem only started after the new VPN came into being.

# Step 1: Confirmation

The first step was to confirm that this problem still exists.  We did this by both of us pinging the Jenkins slave box. And sure enough:

Me: worked
ST: failed

The fact that ping itself failed was very interesting because ping is such a core bit of Internet technology.  SSH can be mildly complicated but ping is **simple**.  Ping should always work.  Always.

# Step 2: Firewall Settings

The next step was to take the obvious dive into firewall settings at the EC2 instance level and make sure that the Jenkins slave box had the same firewall settings as the Jenkins master box.  Not only were there the same firewall settings but they were in the same order.

This left us with the conclusion that it was something about the actual box itself -- but what???

# Step 3: So What's Different About the Jenkins Slave???

A brief description here of Jenkins is likely necessary as not everyone who reads my stuff is, "Engineer Nerdy AF", which is the description of the (few) readers I generally have.  

[Jenkins](https://jenkins.io/) is described as:: "The leading open source automation server, Jenkins provides hundreds of plugins to support building, deploying and automating any project."

Jenkins is a big Java program that runs as both the Master node which controls everything and then as Slave nodes which do the actual work.

So, for us, everyone could access the Jenkins Master box but only I could access the Jenkins Slave box.

When you look at Linux networking issues, two key tools are UFW (another firewall) and iptables.  Here's the result of ufw:

    sudo ufw status verbose
    Status: inactive

This ruled out ufw as a source of the problems so it was onto iptables:

    sudo iptables -L
    Chain INPUT (policy ACCEPT)
    target     prot opt source               destination
    
    Chain FORWARD (policy DROP)
    target     prot opt source               destination
    DOCKER-USER  all  --  anywhere             anywhere
    DOCKER-ISOLATION-STAGE-1  all  --  anywhere             anywhere
    ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
    DOCKER     all  --  anywhere             anywhere
    ACCEPT     all  --  anywhere             anywhere
    ACCEPT     all  --  anywhere             anywhere
    ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
    DOCKER     all  --  anywhere             anywhere
    ACCEPT     all  --  anywhere             anywhere
    ACCEPT     all  --  anywhere             anywhere

    Chain OUTPUT (policy ACCEPT)
    target     prot opt source               destination

    Chain DOCKER (2 references)
    target     prot opt source               destination
    ACCEPT     tcp  --  anywhere             ip-172-18-0-2.some-aws-region-8.compute.internal  tcp dpt:6379
    ACCEPT     tcp  --  anywhere             ip-172-18-0-3.some-aws-region-8.compute.internal  tcp dpt:postgresql

    Chain DOCKER-ISOLATION-STAGE-1 (1 references)
    target     prot opt source               destination
    DOCKER-ISOLATION-STAGE-2  all  --  anywhere             anywhere
    DOCKER-ISOLATION-STAGE-2  all  --  anywhere             anywhere
    RETURN     all  --  anywhere             anywhere

    Chain DOCKER-ISOLATION-STAGE-2 (2 references)
    target     prot opt source               destination
    DROP       all  --  anywhere             anywhere
    DROP       all  --  anywhere             anywhere
    RETURN     all  --  anywhere             anywhere

    Chain DOCKER-USER (1 references)
    target     prot opt source               destination
    RETURN     all  --  anywhere             anywhere

And this is where ST came fully into play -- he looked at the iptables and almost immediately seized on the 172-18 address as a key issue.  

And since the 172-18 issue was tied to  [Docker](https://www.docker.com/), we were on the hunt for how Docker might mess with networking that would break SSH.   

# Step 4: So Docker ...

A good friend of mine is a [Docker instructor](https://nickjanetakis.com/) so I'm pretty familiar with Docker.  Here are some things about Docker:

* Docker is always running so it is a candidate for interfering with stuff
* Docker has pretty extensive networking facilities 
* Docker modifies existing system stuff like the Routes table

So, technically, Docker could mess with SSH even if it feels absolutely bizarre for this to even be possible.

# Step 5: Proving This

The first step was for us to prove this and rather than mess with Docker configuration, the much easier approach was just to turn off Docker using:

    systemctl stop docker

And after that, we repeated the earlier ping test:

Me: worked
ST: worked

And that told us that, Yes Virginia, Docker really can break SSH, DAMN IT!  At least for **us** and how we do networking / VPN.

# Step 6: Addressing This

So our basic thesis is this:

1. Docker starts up.
2. Docker grabs network addresses in the range of 172.18.
3. We use 172.18 ourselves in a VPN context.
4. This prevents the Jenkins slave box from being accessible via SSH or even ping.
5. We need to tell Docker NOT to use these addresses.

And with that thesis, we knew what was next -- Google.  The research that we did and things we found are listed below under References.

# Step 7: Fixing This or Docker is a Dirty, Lazy Teenager

Our first thought was that the 172-18 network address specification was located in docker-compose.yml.  And, while we knew that existed, we had no idea where it was but a quick:

    sudo find / -name "docker-compose.yml"

revealed its location.  Groveling through it, though, proved to be a wash -- no networking commands.  A similar trawl through files on the machine proved fruitless as there were no Dockerfile(s) telling us what was going on.  

Google, as always, delivered the answer.  We learned that the core Docker daemon (the background program governing all of Docker) itself can be customized with a file called daemon.json.  So we did this:

    sudo vi /etc/docker/daemon.json

and we discovered that by default, it simply isn't there.  Here's what we started with from the Internet:

    {
      "bip": "192.168.1.5/24",
      "fixed-cidr": "192.168.1.5/25",
      "fixed-cidr-v6": "2001:db8::/64",
      "mtu": 1500,
      "default-gateway": "10.20.1.1",
      "default-gateway-v6": "2001:db8:abcd::89",
      "dns": ["10.20.1.2","10.20.1.3"]
    }

And here's what ended up working:

    {
      "default-address-pools":[
        {"base":"10.10.0.0/16","size":24},
        {"base":"10.11.0.0/16","size":24}
      ]
    }

And we were certain that we were **right** and all would be good -- only it didn't *censored* work.  Now I have been using Docker on and off for a bunch of years and this experience made me remember my opinion of Docker's engineering practices.  Docker often seems to run engineering as if they are dirty, lazy teenagers.  Specifically Docker doesn't seem to clean up after itself (example - tickets stay open way too long; things are poorly documented, etc).  

**Note**: I am a parent to teenagers.  I can say this.

So my suspicion was that Docker had modified something at the machine level and I needed to find out what that change was and delete it.  At this point, I'm going to cut to the chase now because this is way too long.  The short answer was a change was left behind by Docker in the routes table that needed to be deleted.  A quick look at routes gave us:

    sudo ip route show

    default via 172.31.16.1 dev ens5 proto dhcp src 172.31.23.113 metric 100
    10.10.0.0/24 dev docker0 proto kernel scope link src 10.10.0.1 linkdown
    172.18.0.0/16 dev br-9942c98d99d1 proto kernel scope link src 172.18.0.1 linkdown
    172.31.16.0/20 dev ens5 proto kernel scope link src 172.31.23.113
    172.31.16.1 dev ens5 proto dhcp scope link src 172.31.23.113 metric 100

and then it was just:

    sudo route del -net 172.18.0.0/16

With that and then a final Docker stop and start all this madness was done.  The final task was to then launch our test suite via Jenkins and watch it function correctly.

# But What About Verifying the Fix

I can't explain why the first time we turned Docker off, we were able to verify that it worked but yet there was a permanent route left in at the machine level.  My suspicion is some kind of edge case glitch but who knows.  I mean when you use teenager style engineering practices ...

# Thank You

A robust thank you to our Director of Cloud Operations, ST, who was stellar at working this with me.

# References

* [IP Tables How To](https://help.ubuntu.com/community/IptablesHowTo)
* [Deleting Routes](https://www.poftut.com/delete-route-ubuntu-linux/)
* [Viewing Routes](https://vitux.com/how-to-view-the-network-routing-table-in-ubuntu/)
* [Stopping Docker](https://stackoverflow.com/questions/42365336/how-to-stop-docker)
* [Restarting Docker](https://docs.docker.com/engine/reference/commandline/restart/)
* [Work with Network Commands](https://docs.docker.com/v17.09/engine/userguide/networking/work-with-networks/)
* [Finding Files in Linux](https://www.linode.com/docs/tools-reference/tools/find-files-in-linux-using-the-command-line/)
* [Docker Presentation](https://sudo-bmitch.github.io/presentations/dc2019/tips-and-tricks-of-the-captains.html#p21)
* [Daemon](https://docs.docker.com/engine/reference/commandline/dockerd/)
* [Customizing the Default Bridge Network](https://docs.docker.com/v17.09/engine/userguide/networking/default_network/custom-docker0/)