---
layout: post
title: Improving the Discourse Setup Experience
category: discourse
tags: ["discourse"]
---
[Discourse](http://www.discourse.org) is an open source forum software written in Ruby on Rails and deployed with a heavy stack - Ruby on Rails, Postgres, Sidekiq, Redis and Ember all through Docker.  And they have spent quite a bit of time making that actually work 

Hi, 

I'm not looking for a response.  Just looking to give you feedback:

1.  You don't test for enough disc space before you start.  I tried to install docker on an AWS instance with 2.1 gigs of free disc space and it ran out of disc space part way through.

2. After I built a DO droplet, my instance was unable to send me an email at the end so I could do absolutely nothing with it and I deleted it before I saw the note about logs buried in the docs.  I strongly, strongly recommend that you put the notes about checking the logs into the UI where it tells you about this because without that confirmed account, you can do nothing with it.  

3.  A 15 character password requirement is beyond ridiculous.  My bank doesn't require that strong a password.
