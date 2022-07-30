---
layout: post
title: Using Chrome Driver with Docker, Rails and Selenium on AWS
category: docker
tags: ["docker", "rails", "ruby", "selenium", "aws"]
description: Although normally thought of as a testing tool, Selenium can also allow you to do crawling in Rails not through low level parsing but also through an embedded browser.  However getting Selenium working on a headless AWS server is tedious and non-obvious.  Here is how I did it.
---
{% pizzaforukraine  %}

I've done a lot of crawling in my professional career and I mean a **lot**.  The recent trend towards JavaScript based sites, however, has wreaked havoc on my traditional approach of low level html parsing.  For a new product I'm launching, I recently had to make the switch to using [Selenium](https://github.com/SeleniumHQ/) for crawling.  Selenium, commonly known as a testing tool, can be used in an embedded fashion where you use code like this:

    browser = Selenium::WebDriver.for :chrome
    browser.get "https://www.google.com"
    html = browser.page_source

Here's a rough equivalent in Mechanize:

    agent = Mechanize.new
    page = agent.get("https://www.google.com")
    html = page.body

Although the lines of code look similar to something like [Mechanize](https://github.com/sparklemotion/mechanize) this is actually an entirely different approach because underneath it all is a full browser including JavaScript which lets something like a page which sends its data down in a JavaScript array and then uses JavaScript to display it actually render and return back to you parseable html.

# Doing this Server Side

If you're going to use Selenium for a server side crawling process then what you actually needs is called ChromeDriver which is the embedded chrome executable that represents a browser.  One approach is to locally install ChromeDriver on each of your compute nodes but the better approach is to Dockerize everything and run ChromeDriver as a container.  Here are the steps to do just that.

## Add ChromeDriver to Your Docker Compose File

You'll likely need to implement both Step 1 and Step 2.

### Step 1

Here's what you'll need for docker-compose.yml or docker-compose.production.yml:


    chromedriver:
      image: 'robcherry/docker-chromedriver'
      ports: 
        - 4444:4444
      restart: on-failure
      shm_size: 1G    
      environment:
        - CHROMEDRIVER_WHITELISTED_IPS=""
        
### Step 2        

A docker container is dramatically lighter than a full computer and you'll find that Chrome will start.  The specific error you are likely to hit is:

> Selenium::WebDriver::Error::UnknownError: unknown error: Chrome failed to start: crashed

When you discover this you need to change your daemon.json file (normally located in /etc/docker/daemon.json) to have a larger shm_size like this:
    
    cat daemon.json
    {
      "default-shm-size":"2g",
      "storage-driver": "overlay2",
      "log-driver": "json-file",
      "log-opts": {
        "max-size": "10m"
      }
    }

Yes I'm aware that I use 1G in the first example and 2g in the second.  This is how I currently have it working and I'm leaving it alone until I play with it more.  I suspect you could sync these but I don't know that definitively.

### Step 3

The next error you are likely to hit is one of these two, possibly both:

> Net::ReadTimeout during browser launch

> UnknownError: session deleted because of page crash from tab crashed

The solution to each of these is how you invoke the core browser object.  Here's what I used:

    browser = Selenium::WebDriver.for :chrome, url: "http://chromedriver:4444", :prefs => {:password_manager_enable => false, :credentials_enable_service => false}, :switches => ["disable-infobars", "no-sandbox"]
                                                    
# Security Issues

Here's an interesting security note: 

  Note: ChromeDriver restricts access to local connections by default. To allow external connections, you can pass in a custom CHROMEDRIVER_WHITELISTED_IPS environment variable. By default, this is set to 127.0.0.1, but this can by any comma separated list of IP addresses. Setting the value as empty will allow all remote connections.
  
AWS security groups really save you on this one.  By setting CHROMEDRIVER_WHITELISTED_IPS="", I am able to use ChromeDriver from any other container but nothing else can execute them.  An embedded browser like Selenium is akin to an open proxy so you do not want that.

# References
* [Docker Chrome Driver](https://hub.docker.com/r/robcherry/docker-chromedriver/)
* [Ruby and Selenium](https://github.com/SeleniumHQ/selenium/wiki/Ruby-Bindings)
* [Installing Chrome Driver Locally on Ubuntu](https://gist.github.com/ziadoz/3e8ab7e944d02fe872c3454d17af31a5)
* [Net::ReadTimeout during browser launch](https://github.com/SeleniumHQ/docker-selenium/issues/198)
* [Running Selenium on Headless Chrome](https://intoli.com/blog/running-selenium-with-headless-chrome/)
* [Setting Docker Shm](https://docs.docker.com/engine/reference/run/#ipc-settings-ipc)
* [Docker and Selenium](https://github.com/elgalu/docker-selenium)
* [Zalenium](https://github.com/zalando/zalenium#run-it)
* [Docker and Selenium and Shm / Chrome](https://github.com/elgalu/docker-selenium/issues/20#issuecomment-133011186)
                          
# Thank You

Kudos and thanks to [Nick my Docker buddy](http://www.nickjanetakis.com/).  He teaches Docker professionally and really knows his stuff.  I probably could have slogged through this but his help turned what would have been a man day into a quick one hour pairing session.  Appreciated.