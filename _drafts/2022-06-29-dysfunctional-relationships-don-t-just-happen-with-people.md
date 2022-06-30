---
layout: post
title: Dysfunctional Relationships Don't Just Happen with People
date: 2022-06-29 01:32 -0400
category: rails
tags: ["rails", "deploy"]
---
I would posit that dysfunctional relationships don't just happen with people -- they happen with technologies, products and service providers.  Let's start by identifying a dysfunctional relationship:

> Dysfunctional Relationships are relationships that do not perform their appropriate function; that is, they do not emotionally support the participants, foster communication among them, appropriately challenge them, or prepare or fortify them for life in the larger world. [Tina Tessina](https://www.tinatessina.com/dysfunctional_relationship.html#:~:text=Dysfunctional%20Relationships%20are%20relationships%20that,life%20in%20the%20larger%20world.)

I would add these following attributes:

* A power imbalance either taken or given and not by choice.
* A feeling of helplessness / no options available
* A feeling of being trapped
* An acceptance of things being as good as they are ever going to get
* An allergy to accountability
* Having to justify your problem is exactly like a partner making you “prove” your feelings

Anyone who is old enough to have been in a relationship or N relationships understands these feelings.  They can be something like this in the technology world:

* A service provider who has taken all the power in the relationship.
* A technology (say Java widget toolkits).
* A language provider that controls what platforms you are writing code for -- I'm very specifically thinking about Borland's late, lamented Turbo Pascal and the insanity that was its Windows release over time. Or we could talk about Microsoft's VB.NET that fscked over VB6 apps.

And this brings us to the travesty that, today, is Ruby on Rails deployment.

## Ruby on Rails and Deployment

I have a long and complicated relationship with deploying Ruby on Rails apps.   Although I'm not well known in the community, I started doing Ruby and Rails in 2007 and Ruby in 2006.  And do you know has been consistent since 2007:

> DEPLOYING RAILS APPS SUCKS SLIMY GREEN TOADS; and not the ones that make you hallucinate.

I have used:

* Capistrano
* Vlad
* Ansible
* Anistrano
* Dockerano (I wrote that myself; a shell based approach to using Docker for containers)
* HatchBox
* Heroku
* Custom Ruby code that created AWS instances programmatically

The closest thing the Rails world has to a good deployment model is Heroku but we all know that Heroku is in its Sunset years -- its best time is behind it, not in front of it.  Lackluster management, ineffective strategy and being a pimple on a giant's ass means that Heroku despite its amazing abilities isn't the solution.  And, I'm cheap, and Heroku is ridiculously expensive.

And here's the truth of Rails deployment:

> The first time you deploy a Rails app is damn near always a BOGU situation (Bend Over Grease Up; this is the term that Microsoft used to use when they met with IBM during the OS/2 development process).

And then, once everything is perfect, you have a pretty flawless experience.  And, up to now, I have simply accepted that my initial Rails deployment is going to suck.

Yep.  I'm trapped in a **dysfunctional relationship with deploying Rails apps**.  I accept a process that, at times, brings me to a rage and I pay money for that experience.  What the hell is wrong with me?

## Why Do I Care So Much About Deployment?

I suspect the majority of Rails developers simply work on one monolithic application and deployment for them is something that they solved in the beginning.

Me?  I'm a consultant and an avid creator of side projects.  Right now I'm concurrently developing:

* [Pizza for Ukraine](https://www.pizzaforukraine.com)
* [JobHound](https://jobhound.io)
* [Scott's Feed Finder](https://scottsfeedfinder.com/)
* [CovidNearMe](https://www.covidnearme.org)

and a number of other things.  Yes, I'll admit I have a problem.  And, no, I cannot stop.  

What I have noticed about Rails deployment is that the earlier in the development cycle you address it, the **easier** it both is and should be.  And, of course, the problem lies in complexity.  A Rails app is initially, actually, pretty simple.  However, as it grows, it becomes increasingly complex.

This has led me to take an approach - for everything - that I call DFD - deploy first development.  You build nothing more than the output of Rails new and then you push that puppy live.  And when you can't even get the output of Rails new to deploy?  Man that's a fscking punch to the gut.  It is absolutely soul destroying -- I've been doing Rails for 

```ruby
3.1.2 :002 > 2022 - 2007
 => 15
```

15 years and I still can't build something new and get it live without issues.  And, no matter what you might think of my opinions, I'm not stupid (yes that's a Hamilton quote from the bursar interaction with Burr).

So I'm going to SHOUT it out:

> IF YOU CAN'T DEPLOY THEN IT DOESN'T MATTER

## About Ruby on Rails

I firmly believe that for rapid development of web applications and / or api applications, there is nothing better on the planet than Ruby on Rails.  You can disagree but this is my platform so just shut it.  You won't convince me otherwise.  We can just agree to disagree.

The problem with deploying Rails apps is that deployment is a matter of DevOps along with a very complex directory structure and problems with a language that is, at times, ahem, delicate.

## But There's a Bigger Problem and Let's Learn from Laravel

I recently knocked out a consulting project with Laravel and I, while finding PHP as a language just as **censored** as it ever was (I can say this; once upon a time I wrote about 500K lines of PHP; again my damn soapbox).  And one thing that Laravel gets right:

* Authentication is baked in (this will be tackled in a future blog post)
* Deployment comes from the AUTHOR OF THE PLATFORM (Go Taylor Otwell)

I would posit that making deployment actually work well has never been a priority for Rails because our leader, DHH, doesn't need it -- DHH solved deployment back in the earliest days of BaseCamp and he hasn't needed to worry about it ever since.

And please bear in mind that I am NOT ragging on DHH here.  DHH, imho, is like Linus -- a damn genius possessed of singular good taste.  For me moving to Ruby and Rails was a profoundly transformative experience.  Before Rails I was a programmer (or hacker) and Ruby introduced me to testing, pair programming and oh so much more.  Rails made me a software engineer.

## And Here's a Suggestion for Solving This

Here's what I want:

* Git push based deploys
* Actual zero downtime deploys
* Web based UI for managing things 
* Access to FSCKING log files 
* A hardware environment that isn't too expensive
* I want deploy to work 100% of the time on the first try
* I don't want to have to justify my problems to a vendor; I want support that is world damn class

One of the ways you solve any complex problem is by reducing it to its elements.  Here's what I would suggest:

1. A canonical configuration for hosting a Rails app in 2022
2. Bare metal deploys
3. Standardizing on Rails 7
4. Standardizing on Ruby 3 and Rbenv
5. Standardizing on one cloud vendor, One distro
6. Standardizing on one automation technology 
7. Standardizing on one front end web server and one Database and one caching server (redis) and search engine (meili search)
8. Modern server side experience 
9. Database backups
10. Cron jobs

Each of these points is talked about below.

### Canonical Hosting Configuration

I would suggest that the hosting for any small to medium Rails web application could be reduced to:

* web1
* web2
* staging1
* database
* load balancer
* worker1

If you had that configuration then you could do zero downtime deploys and you could have a staging server which all too few of us actually use.  

### Bare Metal Deploys

You can talk to me about containers and / or serverless until you are blue in the face.  Me?  I want actual boxes that run my code where, WHEN I NEED TO, I can SSH in and figure things out.  Yes I know that's old school; but I've been doing Rails since the old days.  And I have no issue troubleshooting by logging in and dealing with whatever.  I had to do it tonight to prove that I wasn't at fault.

Along with bare metal deploys comes the ability to deploy multiple applications onto the same box and have NGINX or Puma sort it out.

### One Rails Version

Trying to support every flavor of Rails -- hell no.  Leave the old stuff where it is.  Let's focus on the dreamy goodness that is Rails 7 and Hotwire.

### One Ruby Version and Environment Manager

Ruby 3 is actually damn good and Rbenv is good enough.  And Tender Love is making Ruby 3 even better as is, of course, Matz and crew.  But, again, don't try and support everything initially -- just support Ruby 3.

### One Cloud Vendor, One Distro

The other reduction of complexity is to support only a single cloud platform.  Digital Ocean, for me, has been a fantastic vendor.  And they have the APIs needed to automate instance creation.

I don't have a particular opinion on distro.  I'd assume Ubuntu but there may be better options; it has been an age since I've even asked the question.  As long as there is apt-get then I really don't care.

### One Automation Technology

Ansible.  Yep I said it.

### One Web Server, One Database Server

Let's just call it for Puma and Postgres.

### Modern Server Side Tooling

If you take it as an a priori assumption that sometimes you are going to need to SSH into a box then why not provide a decent experience i.e. NuShell and Starship.

## Conclusion

I've now written my own deployer at least twice if not three or four times.  Trying to support arbitrary combinations of technologies makes deploying Rails apps infinitely complex.  Reducing configurations, technologies and defining a standard hardware configuration feels to me like a way to manage deployment moving forward.  Then, over time, abstractions could be used to integrate other technologies, cloud providers and so on.

Thoughts?  