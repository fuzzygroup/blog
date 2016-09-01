---
layout: post
title: In the World of Containers HoneyBadger Will Reign Supreme - Bye Bye AirBrake
category: containers
tags: ["aws", "containers", "docker", "logs", "error messages", "honey badger"]

---

I spent all day yesterday immersed in [AwsLand](http://aws.amazon.com) and I have to say that its an intriguing, fascinating place.  I've resisted AWS like the black plague for years and now I find myself more intrigued by back end computing that I have been for a long time -- and I really am only a back end guy.  

## Back to Multithreaded Debugging Hell

Anyway to return the ongoing tale of woe and lack of [idempotency](https://fuzzygroup.github.io/blog/2016/08/21/multi-threaded-debugging-hell.html).  A long, long run cycle coupled with exhaustion induced stupidity made tracking the inputs across categorization jobs tedious (how often do you find errors because you're overflowing an int related to the size of a file; sheesh) but I finally resolved everything and I now know that the inputs across at least 2 jobs are not varying.  This points the issue towards some kind of runtime failure.

About a week ago we finally brought back monitoring on some of the nodes in the cluster.  I know, I know.  It was a money thing.  Yesterday after I started off a categorization run I started getting constant alerts from [Wormly](http://www.wormly.com).  Now since our infrastructure right now is unreliable -- hence the migration to AWS -- I really didn't pay much attention but even I get tired of my phone going off constantly.  What I discovered was that one of our web boxes had a load of 1700 or something.  Utter madness.  I ultimately traced it down to [SphinxSearch](http://www.sphinxsearch.com).  Now do not, under any circumstances, think this is a sphinx issue.  Its not -- I love those guys.  I'm a paid support customer and Adrian in specific, my support rep, **rocks**. 

The issue here is I've got 8 workers running 20 threads each firing queries at Sphinx as fast as possible and I only just today have monitoring in place.  Yep.  That's right.  The problem here is, well, me.  Shocker I know.  We're simply overloading our compute resources and its doing the best damn job it can.  Moving to AWS lets me go from a single sphinx box to a cluster of sphinx boxes and that's likely the solution.

My suspicion is that this failure has been a part of our "architecture" since day 1 and I never knew since begin / rescue blocks cover a multitude of sins including this one.

## HoneyBadger, Containers and AirBrake

How you may ask is this possibly related to HoneyBadger, AirBrake and Containers?  Well one of the things about larger, container based architectures is things like error notification are vastly more important.  AirBrake ties [pricing](https://airbrake.io/pricing) to volume of errors / unit of time.  So your $99 / month plan for 15 engineers covers 75 errors/min.  Well that's great for them (and I understand the issues about huge numbers of inbound messages) but in a situation like this -- a back end job tossing likely a metric crap ton of errors due to circumstances that were very unforeseen -- you could easily hit that number and more.  

HoneyBadger is instead [pricing](https://www.honeybadger.io/plans/) on the number of apps (I suspect this means git repos) and has "Unlimited users, no monthly caps and fast helpful support".

## A Code Snippet Too

Here's how I'm handling this -- I'm calling HoneyBadger directly from my rescue blocks.  Apologies if the code isn't elegant - I had to do some patches a few minutes ago.

    def self.honeybadger_notify(e, context = nil)
      return unless DEBUGGING_LOG_EXCEPTIONS_TO_HONEYBADGER
      error_class = "Custom Error"

      if context
        if context.is_a?(OpenStruct)
          if context.site_id
            error_class += " - site id: #{context.site_id}"
          end
        end
      end

      if e && e.try(:message)
        error_class += " - e.message: #{e.message}"
        error_message = e
      else
        error_class += " #{e}"
        error_message = e
      end

      context = { context: context }
      params = {}

      if SHOW_PUTS
        puts "\n\n"
        puts " ########## Hit Exception ##########"
        puts 
        puts " #### Exception / Error: #{error_message}"
        puts " #### Context: #{context.inspect}"
        puts " #### Params: #{params.inspect}"
        puts " ###################################"
      end

      Honeybadger.delay.notify(
        :error_class   => error_class,
        :error_message => error_message,
        :parameters    => params,
        :context => context
      )
    end
    
There might be an error or two (this hasn't gone live yet) but you get the essence.

## Takeaways

Here are the learnings for today:

1.  Always monitor your infrastructure.
2.  Problems are never where you think they are; I thought this was a code issue; it was a  devops issue.
3.  In this new world of dynamic computing keep an eye on capacity limits when you sign up for services.  Capacity limits can really mess you up -- what does Airbrake do when you exceed its threshold?  Stop collecting?  Shut down?  Notify you?  Charge you more?  I have no idea and while you think "I'll never exceed 200 errors / minute".  Yeah maybe but if it happens would you want the errors lost?
4.  A massive shout out for [developer nerdiness](https://www.honeybadger.io/humans.txt) to the HoneyBadger team.  I have to duplicate this asap.