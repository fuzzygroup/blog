---
layout: post
title: AWS Tutorial 21 - Protecting Your Rails App In an Unfriendly Environment Using Rack Attack
category: aws
tags: ["aws", "rails", "security"]
---
The more I do in a cloud environment, the more I learn that cloud hosting, despite being essentially the same linux stack that I'm used to is just plain **different**.  Ever since 2008 I've done AWS stuff on and off but my focus for core hosting has generally been a stack of Linux boxes in a traditional data center.

# Understanding The Attack Surface

One of the differences between hosting in a traditional data center and on the "cloud" is that the cloud offers a larger *attack surface*.  From the perspective of a security research the idea of an attack surface is as follows:

    The attack surface of a software environment is the sum of the different points (the "attack vectors") where an unauthorized user (the "attacker") can try to enter data to or extract data from an environment.
    [Wikipedia](https://en.wikipedia.org/wiki/Attack_surface)
    
One way to think of attack surface is in terms of your own system -- you run software on these ports for example.  Each port is a place where we can be attacked.  However there is a meta way to look at the idea of an attack surface -- think about the whole expanse of machines where you host your nodes.  Given the size of AWS in terms of the number of customers it has and the vast number of instances that they host, if you're looking to do something malicious online, would you rather target a tiny regional data center or a vast sprawling expanse of targets like AWS?  I'm not a malicious guy and even I can tell that the right answer here is **AWS**.

What sparked this blog post is the other day I tossed up an EC2 instance for a project and I discovered, within minutes, of that instance coming online was this crap in my production.log file:

    ::RoutingError: No route matches [GET] "/phpMyAdmin/scripts/setup.php"
    2016-11-01 22:56:58.373977 D [4520:7264940] [3ac9ff5b-0c86-410c-aab4-d78c09a6ec29] Rails -- Started -- {:method=>"GET", :path=>"/phpmyadmin/scripts/setup.php", :ip=>"119.97.146.76"}
    2016-11-01 22:56:58.374377 F [4520:7264940 debug_exceptions.rb:7] [3ac9ff5b-0c86-410c-aab4-d78c09a6ec29] Rails -- Exception: ActionController::RoutingError: No route matches [GET] "/phpmyadmin/scripts/setup.php"
    2016-11-01 22:57:00.091348 D [4520:7264940] [1bec8c74-fdbb-4e6f-9347-570b228e37ec] Rails -- Started -- {:method=>"GET", :path=>"/pma/scripts/setup.php", :ip=>"119.97.146.76"}
    2016-11-01 22:57:00.091622 F [4520:7264940 debug_exceptions.rb:7] [1bec8c74-fdbb-4e6f-9347-570b228e37ec] Rails -- Exception: ActionController::RoutingError: No route matches [GET] "/pma/scripts/setup.php"
    2016-11-01 22:57:03.753760 D [4520:7264940] [747bb428-70ab-4385-a879-972ba9e81448] Rails -- Started -- {:method=>"GET", :path=>"/MyAdmin/scripts/setup.php", :ip=>"119.97.146.76"}
    2016-11-01 22:57:03.754170 F [4520:7264940 debug_exceptions.rb:7] [747bb428-70ab-4385-a879-972ba9e81448] Rails -- Exception: ActionController::RoutingError: No route matches [GET] "/MyAdmin/scripts/setup.php"
    2016-11-02 08:26:12.789703 D [2820:10343780] [f462f464-591a-4171-9aca-67241b22c29d] Rails -- Started -- {:method=>"GET", :path=>"/testproxy.php", :ip=>"91.196.50.33"}
    
What's happening here is that a botnet somewhere in the world is probing for software with known security vulnerabilities; phpMyAdmin is a well known source of problems.  According to this [report](http://sparkcognition.com/2016/06/sparkblog-navigating-perils-phpmyadmin-security/), phpMyAdmin is actually the #2 target by volume of security probes.

So you're probably thinking something like:

    This is a rails app; I don't have any php apps on my system and so this isn't a problem since there's nothing to find.

And that's technically true but each of these probes is:

* polluting our log files making it harder to find real problems
* raising an exception which is computationally expensive i.e. we're actually paying something for someone to probe our system

# Filtering Inbound Requests in Rails 

There are lots and lots of ways to deal with this kind of problem but let's talk about what's desirable:

* stop the request as early as possible; the sooner you stop this type of request the less of your system resources are consumed
* let's not write this from scratch; someone else must have already solved this
* the rules for this need to be checked into git so we have a history of what we changed

A little bit of googling turns up the gem [rack-attack](https://github.com/kickstarter/rack-attack) which plugs into the Rack middle ware layer that sits between the inbound http layer and our Rails application.  

Here's how to configure Rack Attack for your Rails application.  All of this is actually quite easy and was tested on production Rails 4 and Rails 5 applications running on AWS.

## Step 1: Add rack-attack to Gemfile

The first step is to add rack-attack to your Gemfile as follows:

    gem 'rack-attack'

## Step 2: Bundle Install

After adding to your Gemfile, you obviously need to bundle install:

    bundle install

## Step 3: Add rack-attack to application.rb

The next step is to modify application.rb or config.ru so that rack-attack is called.  Here's an example for both:

    For application.rb:
    
    config.middleware.use Rack::Attack
    
    For config.ru
    
    use Rack::Attack

## Step 4: Write Your Rules

At this stage you have rack-attack properly setup and stuck into the middle for your data flow but it won't **do** anything.  Like a lot of security products it needs a set of rules to execute.  Since this is essentially Rails system software, its controlled at startup by a chunk of Ruby code located in config/initializers.  Any Ruby code in this directory is executed once at startup.  Here are some of the caveats of initializers:

* If there is a syntax error in an initializer the entire Rails system won't start.  Honestly problems with initializers having code problems and my not noticing it was why I developed my fascination with [.git/hooks](https://fuzzygroup.github.io/blog/git/2014/08/29/the-importance-of-git-hooks.html) and why I've **required** them for any engineer who works on a Ruby project with me.  If you don't have your engineers using .git/hooks then you're doing yourself a disservice.
* The name for the initializer doesn't matter at all; theoretically you should name this rack-attack.rb but you could name it magic-bananna.rb and it would be just as happy.
* Initializers are executed once and only once per execution of the core Rails stack; if you need to make a change stop your development server and restart it.

The basic look and feel for a rack-attack.rb file is as follows:

    # In config/initializers/rack-attack.rb
    class Rack::Attack
      # your custom configuration...
    end
    
The rack-attack wiki has a great example of a configuration [here](https://github.com/kickstarter/rack-attack/wiki/Example-Configuration) which illustrates the power of rack-attack and what it can do for you.  Here's the custom rule I wrote for any .php request:

    Rack::Attack.blocklist('any php request') do |req|
      req.path =~ /\.php/ && req.get? #&& req.user_agent == 'BadUA'
    end

All this is doing is looking for any request containing .php that is also a get request.  Four things:

1. I didn't make the regex be .php$ because there might be parameters its trying to pass along like ?foo=bar 
2. The commented out bit lets you optionally test the name of the user agent also.  I didn't do this because the user-agent is so regularly spoofed that its not funny.
3. If you are going to use the example from the rack-attack wiki linked above then don't forget to modify the examples for your specific urls on login.  I missed that the first time around.
4. This will only do get requests.  

If you want to do posts then you could easily do this:

    Rack::Attack.blocklist('any php request') do |req|
      req.path =~ /\.php/ && (req.get? || req.post?) 
    end

## Step 5: Verifying This

The easiest way to verify this is a browser or curl.  I like curl -I because then I get to see the http headers:

    curl -I http://localhost:3025/auth/login.php
    
    HTTP/1.1 406 Not Acceptable
    Content-Type: text/plain; charset=utf-8
    X-Request-Id: 5cc96bb1-a369-4b9a-bbd7-5bf44c4a2620
    X-Runtime: 0.083266
    Connection: close
    Server: thin
    
## Step 6: Tail Your Logfiles Looking for Abusers

The way your system is being abused -- and it likely is being abused -- is probably different from mine.  You should really do a tail -f log/production.rb on a production instance and just leave it running and watch.  These things do tend to stand out.

## Step 7: Learning More and Other Approaches

You absolutely should read the [rack-attack home page](https://github.com/kickstarter/rack-attack) -- it has almost everything you need to know and more.  As with all things security there are lots and lots of different ways to approach this.  Here are two:

* [iptables](https://wincent.com/wiki/Using_iptables_on_EC2_instances)
* [ufw](https://fuzzygroup.github.io/blog/sysadmin/2014/09/05/blocking-site-abusers.html)
