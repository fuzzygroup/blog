---
layout: post
title: AWS Tutorial - Getting Your Instance ID and Why It Matters
category: aws
tag: ["aws", "instance-id"]
---
In the world of AWS, your server is referred to as an EC2 instance and it is uniquely identified by a "instance-id", a unique alpha numeric identifier that you can use to reference your server.  Your instance id can be used in all kinds of ways including: 

* log files
* database records
* security analysis

In my case I'm using AWS to crawl different websites and one of the things I'm encountering is that it is very, very hard to know what AWS instance ty;e is the best value.  Specifically do I optimize for more memory, more CPU, more disk and so on.  One thing you can do is push your instance id right down to the unit of work.  In my case that's a database transaction so I can do things like this:

    select instance_id, count(*) from page2016_q3s where instance_id is not null group by instance_id;
    +---------------------+----------+
    | instance_id         | count(*) |
    +---------------------+----------+
    | i-03ce34f1b92a3c72b |     1514 |
    | i-045b17850658399ae |     1698 |
    | i-0715d32f41c06b98f |     1731 |
    +---------------------+----------+
    
So if these 3 different instance types, and they were all started at the same time, I can see that, well, they're all doing roughly the same amount of work so maybe the instance type doesn't matter all that much and I should just buy the cheapest.

Here's how you fetch the instance id -- and its brilliantly simple -- you can just use wget or curl.  Here's an example:

    curl http://169.254.169.254/latest/meta-data/instance-id
    
And that will return back a chunk of information which is just the instance id.  Want your region instead then just use:

    curl http://169.254.169.254/latest/meta-data/placement/availability-zone
    
And if you're looking to understand what's available then just call:

    curl http://169.254.169.254/latest/meta-data/
    
And  you can walk down each of the options one by one looking at what's available.  

Here's a ruby implementation of how to get this info and cache it for faster retrieval.  This is in our common module which is a generic set of class methods we use all over the place.

    def self.instance_id
      #
      # abend unless we're in production mode
      #
      return "" unless Rails.env.production?

      #
      # pull from cache
      #
      cache_key = "#{Common.ip_address}|instance_id"
      cache = Common.get_mem_cache
      instance_id = cache.read(cache_key)
      return instance_id unless instance_id.nil?
  
      #
      # fetch from metadata service, cache and return
      #
      begin
        agent = Mechanize.new
        url = "http://169.254.169.254/latest/meta-data/instance-id"
        page = agent.get(url)
        instance_id = page.body

        #
        # Now cache it
        #
        cache.write(cache_key, instance_id)

        return instance_id
      rescue StandardError => e
        puts "Hit error: #{e}"
      end
    end

The Common.ip_address technique can be found on [stack overflow](https://stackoverflow.com/questions/14112955/how-to-get-my-machines-ip-address-from-ruby-without-leveraging-from-other-ip-ad/39367219#39367219).