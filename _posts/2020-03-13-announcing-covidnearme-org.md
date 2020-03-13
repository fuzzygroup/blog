---
layout: post
title: Announcing covidnearme.org
category: covidenearme
tags: ["covidenearme", "covid"]
---
I'd like to say that I'm happy to announce:

> [https://www.covidnearme.org/](https://www.covidnearme.org/)

but I'm not.  Like a lot of us, nay, most of us, I find the current COVID-19 / Corona virus bothersome if not scary.  But the world is what it is and we are better off knowing more about COVID-19 rather than less so I made a tool.

## What is covidnearme.org?

Covnearme.org is a web site which lets you:

* Easily drill down to where you live.
* Bookmark a location or location that you care about
* See a leaderboard of cases

## BUT WHAT HAPPENED IN THE US ON 3/10?

That is apparently the date when Johns Hopkins stopped reporting US level county data and only data at the state level.  Yes that means that the US is officially **LESS OPEN** than China.  Let's compare a screenshot between Seattle and Hubei:

{:.center}
![IMG_2192.jpeg](/blog/assets/china.png)


{:.center}
![IMG_2192.jpeg](/blog/assets/seattle.png)

If you think this is the same bull crap that we do then please use this hashtag when you tweet:

    #hopkinswheresmylocaldata #Covid_19 

## Where's the Damn Map?

We didn't put one in (yet).  I've been using the [Hopkins tracker](https://gisanddata.maps.arcgis.com/apps/opsdashboard/index.html#/bda7594740fd40299423467b48e9ecf6) for several weeks now and it gives me a great feel for the global scene but I don't just want global - I want local.  And I'm too damn fat fingered to make their map work for me easily.

## Why Did You Build This?

We wanted:

* The ability to know what's happening **near** the people we love.
* The ability to bookmark a location - our homes, our parent's homes, our friends workplaces
* The ability to know metrics which people aren't posting yet like the death metrics (why the hell is Italy so much higher?) and the recovery metrics (Seattle has a lot of cases but the recovery percentages are pretty good)

## How Do I Give You Bugs?

We have setup a public github repo for this to capture bugs as github issues.  Just file an issue and please, please, please give us the url to where you have issues. Goto:

> [https://github.com/fuzzygroup/covdidnearme_bugs/issues](https://github.com/fuzzygroup/covdidnearme_bugs/issues)

**Note**: If anyone out there in the bug tracking world wants to give us tooling for bugs, contact fuzzygroup at gmail.com

## Who the Hell Are You?

You keep saying we. Who is we?  There are two of us who built this:

### Scott Johnson

Scott Johnson / fuzzygroup / [fuzzyblog](https://www.fuzzyblog.io/blog/).  I'm a long time tech / startup guy who has been building things forever.  You might know me from:

* The blogging world where I once built Feedster years and years ago. 
* I also built [JobHound.io](https://www.jobhound.io); yes I know it is kinda broken right now; sorry; I've been busy on this.  
* I spent over a decade building the late AppData which was the red headed step child in the App Analytics world (we competed, unsuccessfully with AppAnnie) but that time taught me a ton about data and data science.

I'm also a husband, father, writer and a member of science fiction fandom.  I'm currently leading development for a Machine Learning project for the [ADL](https://www.adl.org/).  And I build side projects; oh lord do I build side projects.  This is another one.

### Elaine E Thompson

My cofounder on this is Elaine E. Thompson, PhD. 

* Dr. Thompson is a bioinformatician who manages a major digital pathology AI project for the Department of Defense. 
* Before that she worked at the FDA, leading research in the CBER HIVE bioinformatics group.  

More on both of us can be found [here](http://covidnearme.org/about).

## Where's the Data Coming From?

We are using the [Hopkins data](https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data).

## But There's an Error !

Yep.  We've seen it to.  There are two types of errors that you'll find here:

* **XYZ Broke** aka We were stooopid.  Software engineers make bugs and we are no exceptions.
* **Data is Wrong**.  We are only as good as the Hopkins data and the Hopkins data does have some issues (there are typos like "Wetchester") but they have done a great job and we appreciate the hell out of what they have done.  Go Hopkins!!!

## How Frequently is this Updated?

We are rebuilding this daily as frequently as Hopkins updates their github source.  Unfortunately that's only once per day and usually we are 24 hours behind their tracker.  Sigh.

## Is This Free?

Yep.  We wanted it and you get it too.

## Am I Tracked?

Nope.  

## What's the Commercial Play Here?

Yep. I wanted this for myself but we aren't 100% charitable here.  We have a side project going around Machine Learning labeling, [NetLabeler](https://www.netlabler.com) and we took time away from that to build this.  
If you have any interest in Machine Learning labeling (and you likely don't and that's ok) then please signup for our mailing list here:

> [https://covidnearme.org/](https://covidnearme.org/)

## How Did You Build This and the Thank Yous

We built this with:

* [Ruby](https://www.ruby-lang.org/en/).  I've never met a language that I love as much; Ruby changed my life for the better.  Thank you Matz and crew.
* [Rails](https://rubyonrails.org/).  Yep.  I'm a Rails guy.  Even though Rails takes a lot of grief these days, it remains the **fastest way to go from nothing to something real in just days** (this started just a few days ago).  Thank you DHH and Rails community.
* [Postgres](https://www.postgresql.org/).  I'm historically a MySQL guy but I do a lot of Postgres these days and I'm coming to like the zen of Postgres.  Thanks!
* [JumpStart Pro](https://jumpstartrails.com/).  I'm basically a backend guy and JumpStart Pro is a Rails application template which makes your Rails app basically look great and handles lots and lots of things for you like SAAS and such.  Thank you Chris Oliver and GoRails (they make JumpStart Pro).
* [HatchBox](https://www.hatchbox.io/).  Rails deployment is the ugly, dark, evil, crap ass side of the Rails world.  Rails deployment is generally like that alcoholic uncle who is an asshole at family gatherings.  We all tolerate Rails deployment because we love Rails but good lord Rails core team - the platform is how many damn years old now?  Someone please make this easy.  But, in the interim, there's Hatchbox which makes Rails deployment the best experience I've ever had. Thank you Chris Oliver and GoRails (they make HatchBox too).
* [HoneyBadger](https://www.honeybadger.io/).  HoneyBadger is the best way I've found to capture runtime errors in your software.  A request to the HoneyBadger team - I'm a legacy paid user on a micro account.  Any chance of getting my fuzzygroup account upgraded so my other developer on this could have access?
* [Jira](https://www.atlassian.com/software/jira).  We are using a free Jira account to manage our development on this.  And while I've historically loathed Jira, I'm slowly being converted to the awesomeness of Jira.  A request to the Jira team - could we get our account upgraded perhaps?  Pretty please?
* [Digital Ocean](https://m.do.co/c/7942f29e0585).  Digital Ocean or DO is the best cheap hosting I've used in years.  I've run JobHound.io on Digital Ocean for years and they've been flawless (yes it is broke now but that's me not them).  This DO link includes my referral and gets me some free credits to pay for the hosting on this so feel free to signup to support covidnearme.org.
