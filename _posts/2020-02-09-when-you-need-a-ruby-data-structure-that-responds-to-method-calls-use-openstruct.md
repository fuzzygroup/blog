---
layout: post
title: When You Need a Ruby Data Structure that Responds to Method Calls - Use OpenStruct
category: ruby
tags: ["ruby", "open_struct"]
---
{:.center}
![IMG_1838.jpg](/blog/assets/IMG_1838.jpg)

I'm in the position of building a system where there is one source of truth for configuration -- an API from the the user interface component of the system (this is the part that will always be online so it made sense for it to serve the api).  The problem is that I have a server side component that needs to go online today as in **now**.  And that API isn't yet available.  I basically have a section in my code where I get the configuration data.  My normal approach is to create a ruby Mechanize object and do a page fetch against the configuration API.  This returns a response object with a .body method that can be parsed something like this:

```ruby
response = agent.get(dest_url)
JSON.parse(response.body)
```

My means of working around this without an API is to use an OpenStruct as follows:

```ruby
response = OpenStruct.new
response.body = '{
"kafka_servers":["b-2.AAA.ccc.c4.kafka.us-east-2.amazonaws.com:9092","b-1.BBB.ccc.c4.kafka.us-east-2.amazonaws.com:9092"]}'
JSON.parse(response.body)
```

OpenStruct is a hash like data structure that responds to ruby dot messages so my "response" object above in the second code block will respond to ".body".  Overall OpenStructs are a very, very useful tool for this type of pseudo mocking behavior.

**Note**: OpenStruct is built into Rails so you can just a "response = OpenStruct.new" at any point.  If you are building pure Ruby software then you need to first require it with:

    require 'ostruct'
    
and then use it with "response = OpenStruct.new".  There is no Gem component to use OpenStruct -- it is a part of the Ruby standard library but it isn't available until you do a require.