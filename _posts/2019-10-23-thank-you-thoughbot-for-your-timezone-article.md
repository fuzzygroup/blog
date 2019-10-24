---
layout: post
title: Thank You Thoughbot for Your Timezone Article
category: rails
tags: ["rails", "timezone"]
---
{:.center}
![IMG_8144.jpeg](/blog/assets/IMG_8144.jpeg)

I've been doing Rails now since 2007 and Ruby since 2006.  And, despite having implemented timezone support, literally I don't know how many times, I have never felt good about my knowledge of timezones.

I just implemented timezones again - for my latest side project - and this time I actually feel pretty good about.  The credit goes to [Elle Meredith](https://thoughtbot.com/blog/authors/elle-meredith) of [ThoughtBot](https://thoughtbot.com) for her [outstandingly good, utterly excellent, truly splendid blog post on the topic](https://thoughtbot.com/blog/its-about-time-zones).  Not only did she write a fantastic post, she also included this critical information: "July 23, 2015 UPDATED ON March 28, 2019".  That's awesome because it tells me that it likely applies to my current version of Rails.  

Finally she wrote these Don'ts and Do's:

**DON’T USE**

* Time.now
* Date.today
* Date.today.to_time
* Time.parse("2015-07-04 17:05:37")
* Time.strptime(string, "%Y-%m-%dT%H:%M:%S%z")

**DO USE**

* Time.current
* 2.hours.ago
* Time.zone.today
* Date.current
* 1.day.from_now
* Time.zone.parse("2015-07-04 17:05:37")
* Time.strptime(string, "%Y-%m-%dT%H:%M:%S%z").in_time_zone

As someone who could probably grep his Rails code bases and find many hundreds if not thousands of Date.today calls, yikes!

One of the reasons that I'm so damn happy about this is 10 minutes ago I had a dashboard board that showed 0 data items for today.  I then moved from Date.today to Date.current and re-deployed and my dashboard now shows me the correct information.  Given that it is 9:05 EST and, thus, roughly 3 am UTC (i.e. the next day), this pretty conclusively provides that:

* the article was good
* when the directions in the article are followed, they work
* that I was an idiot to use Date.today for so many years

Thank you Elle!

**Note**: One of the reasons that I have so frequently used Date.today is that I do an inordinate amount of data processing using Rake tasks where there isn't the context of a currently logged in user.  I'm still not sure what to do in these cases but I now have the knowledge to noodle on it at least.