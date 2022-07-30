---
layout: post
title: Rails, Apartment, Tenancy and Sidekiq
category: rails
tags: ["rails", "apartment", "tenancy", "multi_tenant", "sidekiq"]
description: Implementing a multitenant database architecture when you use an asynchronous job process like Sidekiq can be really challenging.  Here I walk through multitenancy in Rails 5 with Sidekiq.
---
{% pizzaforukraine  %}


# TLDR

This is a long one.  If you need the quick answer on how to solve Apartment-Sidekiq errors then scroll down to the section titled **Correctly Implementing Sidekiq with Apartment**.

# Thanks

This blog post is dedicated to three people / things: 

* My good friend [Nick Janetakis](https://www.nickjanetakis.com) who helped me debug these issues
* [Mike Perham](http://www.mikeperham.com), the author of [Sidekiq](https://www.contribsys.com), whose candor about Apartment-Sidekiq helped point the way
* The [Influitive](https://influitive.com/) team at the Apartment gem; great work guys, thank you

# Overview

Tenancy in database application development refers to using a separate storage system (think a partition within a database) or a whole separate database per "user" (note that user might mean a group of people).  The idea behind tenancy is to: 

* Isolate one user from another; this tends to provide a much more secure approach
* Isolate storage so that the capacity needs of one user don't affect other users

Tenancy is something that we don't often think about but examples of it abound on the Internet.  The best known example is Wordpress.com where every user's data is stored in a separate database.

I've been developing a new product for sometime now and I went into it knowing that if I was successful, storage was going to be a huge issue.  When I first developed [AppData](https://web.archive.org/web/20100610030143/http://www.appdata.com:80/) I had no idea that I was beginning a near [decade long]*https://web.archive.org/web/20160905051931/http://www.appdata.com/ cycle of struggling with storage.  As with all engineers, I was determined to at least not hit the same errors (better to make different ones) so I knew that I needed a tenancy solution for my development platform, Rails, and that led me to the [Apartment gem](https://github.com/influitive/apartment).  Apartment views tenancy as a problem of managing the underlying database connection so that when you goto foo.app.com, foo generally represents the underlying database or "tenant".

# Enter Sidekiq; Enter Tenancy Problems

When you develop a web application you are quickly going to discover the need for asynchronous processing.  This is a fancy term that could be defined as "don't make the user wait while a long running operation completes".  Let's consider the very simple case of sending an email with account details once a user signs up.  Sending that email might be instantaneous or the email server might have problems and might take a few seconds.  By handling this operation asynchronously, the email is send by a separate process and control to the user returns instantly.  In the Rails world the leading technology for this is an open source tool called Sidekiq and Sidekiq is a fantastic bit of code.  It runs as a background daemon coupled to your application through Redis and its multi threading scalably handles all kinds of asynchronous needs.  In the past I've used it to handle email deliveries, data imports, whole site crawling and more.

The problem I've been struggling with for sometime now is handling back data imports.  My new product has a cool feature -- you sign up and the back history for your account is imported from a central data archive.  I wanted to avoid the problems with a data tool where data builds over time.  My goal was for people to sign up and then be instantly product, not productive after a week of data acquisition, at which point they might have stopped caring due to the waiting.  This was clearly a job for Sidekiq but how could that work since the underlying database connection changed for every single user?

My tenancy solution was a Ruby gem called Apartment and there is actually an extension gem called [Apartment-Sidekiq](https://github.com/influitive/apartment-sidekiq).  What apartment sidekiq purports to do is push into the redis stream a reference to the tenant and then patch sidekiq so that every time it processes the redis data it will connect to the right tenant.  The problem here is that this seems to only sort of work.  For the past two weeks or so my asynchronous code has worked -- but with errors.  Sometime I would see 1 error related to tenancy when a back data import was processed and sometimes I would see 26 errors per import.

## The Solution - Don't Use Apartment Sidekiq

This problem was on my radar for quite a while and then I finally said "Ok I can't ship until this is addressed" and I've been working it for the past two days.  Understanding the solution came from this [Github Issue](https://github.com/mperham/sidekiq/issues/3005).  The key bit of wisdom is here:

> Just as a side note, passing the tenant as a job argument is a hack. The correct way to implement a cross-cutting concern (like tenant) is with client and server middleware. You just need to copy and configure the two bits of code [here](https://github.com/influitive/apartment-sidekiq/tree/master/lib/apartment/sidekiq/middleware).

When you work with an open source project like Sidekiq, understanding who the people involved are is key because it tells you who to trust.  I've now used Sidekiq for years and years and I trust Mike implicitly when it comes to these matters.  When Mike Perham, the author of Sidekiq, describes something as a **hack**, well, that tells me there might be real issues.

I looked at the related [Stack Overflow](https://stackoverflow.com/questions/41229392/why-is-apartment-sidekiq-not-finding-the-tenant/41471241#41471241) but no where did I have a problem with my environment and that also didn't mesh which Mikes comment about passing the tenant as a job argument.  Sorting through all kinds of tenancy issues took me different places:

* [Possible Version Conflicts](https://github.com/influitive/apartment-sidekiq/issues/10)
* [Maybe It is Rails 5](https://github.com/influitive/apartment-sidekiq/issues/12#ref-pullrequest-190952852)
* [More Perham Commentary](https://github.com/influitive/apartment-sidekiq/issues/11)

In the More Perham Commentary, I found this bit of wisdom:

> @andrba the intention cannot be done safely. You need to explicitly switch and cleanup any connections. I hate that callback and wish I'd never implemented it.

When something like the *underlying callback* on which Apartment-Sidekiq is described in this way it made me realize, "Hm... this isn't going to work, is it".  

## Correctly Implementing Sidekiq with Apartment

Once I accepted that I couldn't use the Apartment-Sidekiq gem, the solution was pretty obvious:

### Step 1: Remove Apartment-Sidekiq from Gemfile

This was pretty easy - just delete one line and then run bundle install.

### Step 2: Pass the Current Tenant in my Calls to the Sidekiq Worker

Most of my import routines are after_create calls that look like this:

    after_create :import_back_history_sidekiq

This method looks like this:

    def import_back_history_sidekiq
      InstructorImportBackHistoryWorker.perform_async(self.id, Apartment::Tenant.current)
    end
    
There are two parameters here:

* self.id - Sidekiq is oriented around passing low level primitives not full blown ActiveRecord objects so you pass an id reference to the object you want to do an asynchronous call on and then you reload it in the Sidekiq context.
* Apartment::Tenant.current - This is a string that represents the name of the current tenant.  We need to know this because the real solution to this entire problem is to switch to the right tenant in our Sidekiq worker code.

### Step 3: Switching to the Right Tenant

Here's what the underlying Sidekiq worker class looks like:

    class InstructorImportBackHistoryWorker
      include Sidekiq::Worker

      def perform(id, tenant)
        Apartment::Tenant.switch!(tenant)
        instructor = Instructor.where(id: id).first
        if instructor
          instructor.import_back_history
        else
          # Some error handling code goes here
        end
      end
    end

All this does is invoke Apartment::Tenant.switch!(tenant) at the start of the asynchronous processing and that ensures that the correct tenant is used.  After that the import proceeds as normal.  The reason that I have a wrapper approach (import_back_history versus import_back_history_sidekiq) is that I have cases where I use these calls in batch process routines where I don't invoke Sidekiq.

Using this approach to managing tenancy and Sidekiq, I went from multiple tenancy connection errors tracked thru [Errbit](http://fuzzyblog.io/blog/aws/2017/08/11/using-errbit-to-host-your-own-error-tracker-on-aws-for-rails-apps.html) to zero errors.

# References

* [Apartment-Sidekiq Stack Overflow](https://stackoverflow.com/questions/41229392/why-is-apartment-sidekiq-not-finding-the-tenant)
* [Long Error Thread](https://github.com/influitive/apartment-sidekiq/issues/11)