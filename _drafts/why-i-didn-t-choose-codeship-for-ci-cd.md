---
layout: post
title: Why I Didn't Choose Codeship for CI / CD
---


Understood; just trying to wrap my head around it.
getting this live means deploys of: site, web app, page archiver, page_archive api and store front so I'm debating CI server of my own
that's enough containers that I'm not sure I can justify paying for it since I'll blow thru container build limits quickly over the course of a month with constant changes.
Nick Janetakis (nick.janetakis@gmail.com)
what happened to circleci or codeship?
I don't think the billing model works.  The limits we saw weren't practical over this many repos.  Not for greenfield dev.  
The First Container Is Free + Each Additional Container Is $50/Month <== circle ci
CodeShip
You will always start with the free $0 plan which grants these resources
100 BUILDS/MONTH
 
1 CONCURRENT BUILD
 
1 PARALLEL TEST PIPELINE
 
Nick Janetakis (nick.janetakis@gmail.com)
that is exactly what you want
you are not going to be building a bunch of things in parallel, or having 5 devs constantly pushing changes
would be really surprised if you hit 100 builds a month too, because you're only going to be building those things once you have a fairly stable version (something you deem is production worthy)
Codeship is a confusing mess -- its still tied to appdatallc and I can't remove it.  They suggest my using an organization and let me create one but then I can't do anything with it since organizations are a paid feature.
if i disconnect github and reconnect github then the old projects go away and then come right back.  
Using the X on their UI doesn't delete the project.  I don't care if anyone / everyone can use this.  Its crap.
Nick Janetakis (nick.janetakis@gmail.com)
why not just sign in with an email not associated with app data?
i've tried that before.  Trying it again.
Nick Janetakis (nick.janetakis@gmail.com)
and github, i'm not sure. usually apps let you pick what account to link it with if there's > 1
maybe you're still logged into app data on github somewhere, and it's picking that for whatever reason
its because you generally only have 1 github identity and it spans personal and professional.
Sigh.  They want you to duplicate your docker config just for them.  Sigh.
Nick Janetakis (nick.janetakis@gmail.com)
yeah, but most apps i use that integrate with github will let you pick the organization
Nick Janetakis (nick.janetakis@gmail.com)
Not dry at all.
Example they give: https://github.com/codeship/discourse-demo/blob/master/codeship-services.yml
Nope.  I'm out.

https://github.com/codeship/discourse-demo/blob/master/codeship-steps.yml


their docs say their format is compatible with docker-compose.yml
its not that -- its the duplication
Nick Janetakis (nick.janetakis@gmail.com)
and if doesn't find a codeship-services.yml file, it falls back to using docker-compose.yml
Well that's fine.  But their shitty docs already convinced me to quit.
Now
