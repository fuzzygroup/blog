---
layout: post
title: Job Hound is Back
date: 2022-05-27 06:58 -0400
category: jobhound
tags: ["jobhound"]
---
It is now 2022 and Job Hound has existed for 4 years now having happily served over 1,000 users to help apply for over 5,000 different jobs. 

Job Hound has been one of those bits of code that you write and it just runs happily in the background just plain **working without fail**.  Other than a few restarts to the Docker containers to reclaim storage, I literally haven't touched it since I wrote it back in 2018.  And, facepalm, I'm not happy about that.

A chance set of interactions with a happy Job Hound user convinced me to re-focus on Job Hound:

>> Scott,
>> 
>> I used your Job Hound during my 7 month, 84 applications search and landed a gig at BLANK Health as a Security Engineer.  
>>
>>Now I am using Job Hound again for my wife to track the same thing!
>>
>>What a fantastic site.  Simple but more useful than just some Excel sheet.
>>
>>Just wanted to circle back and say thank you
>>
>>- Marc

Now here's the rub -- he used Job Hound while the SSL was broken.  When someone uses your site even when Chrome is telling you not to -- that's powerful.

I took Marc's advice to heart and dug back into the Job Hound source code:

* New Hosting (it is now on a cluster of machines, load balanced and all)
* Significantly Faster 
* Blog link now gives you only posts about Job Hound
* A start on content updates
* Monitored for uptime issues
* On machines that I monitor every day for [Pizza For Ukraine ](https://www.pizzaforukraine.com/) and [Covid Near Me](https://covidnearme.org/) so I'll always know if something goes down
* New Analytics (useful for me although less so for you)
* Better test coverage (again useful for me)

New features are planned and coming.  I've also modified my personal schedule to allow me to put sustainable hours into Job Hound.  Sustainable hours are key to side projects, particularly ones that aren't profitable (it was never supposed to be).

The only downside right now is that ElasticSearch is being difficult so that's offline. It is, clearly, on the short list of things to bring back.

My sincere thanks go out to Marc.  Appreciated.

So ... The Hound Is Back.  