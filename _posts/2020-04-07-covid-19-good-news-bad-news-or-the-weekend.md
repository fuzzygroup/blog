---
layout: post
title: Covid-19 - Good News, Bad News or the Weekend?
category: covidnearme.org
tags: ["covidnearme.org", "covid"]
---
{% pizzaforukraine  %}

I noticed an interesting thing yesterday -- the number of COVID-19 cases fell in New York and I was curious (the number on the right is the number of new cases).  Here's what I saw:

{:.center}
![covid_monday.png](/blog/assets/covid_monday.png)

What I was curious about was whether this was a reporting issue due to, perhaps, less testing on Sundays or an actual improvement in things.  What I realized was that the lack of a day indicator i.e. "Monday" versus 2020/04/06 made this hard.  A quick tweak to my DateCommon library and we get this display:

{:.center}
![covid_monday_large.png](/blog/assets/covid_monday_large.png)

While there isn't a ton of data to draw a conclusion from, I can see that we have now seen, for two weeks running, fewer cases on Monday and then an increase on Tuesday.  So, unfortunately, I **don't think** we're seeing an improvement.  And this is backed up by [Roy Britt's article on Medium](https://link.medium.com/Is1vWsvAu5) (published just 3 days ago).