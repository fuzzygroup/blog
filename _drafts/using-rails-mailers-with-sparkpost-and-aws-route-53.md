---
layout: post
title: Using Rails Mailers with SparkPost and AWS Route 53
category: rails
tags: ["rails", "mailers", "spark_post", "aws", "route_53"]
---
The other day I was working on my current project, a SAAS product, which generates marketplace analytics and I was reviewing the feature set with one of my early users and he said: 

> "You know what -- this should really not just be a dashboard, it should deliver your analytics direct to the user daily via **email**."

Now this isn't a casual user of my product, he's an intensive user of the marketplace I've been building analytics for so I take his input seriously and so, roughly 3 hours later, I had a fully working feature which:

* Worked in Rails 5
* Used Rails mailers to deliver the user's daily analytics
* Delivered the email via SparkPost
* Was properly configured right down to SPF / DKIM on the DNS level, something I had never done before

The rest of this blog post walks you through the whole process from start to finish.

# Why SparkPost / What is SparkPost

One of the nicest thing about the computer industry is getting to meet smart, creative, talented individuals that build fantastic products and one of those people, for me, is **George Schlossnagle**.  I first met George the day I met my wife so even though I interact with him rarely, I'm always aware of him.  George is the founder of [SparkPost](http://www.sparkpost.com) which is an email delivery company that focuses on nothing but "getting the mails through" and he is doing a brilliant job of it.  George has been working with email about as long as I've known him, well over a decade, so when I needed email delivery, it was an absolute no-brainer for me to choose SparkPost for email delivery and so should you.  Here's what I can tell you about SparkPost:

* Free for up to 10,000 emails per month once you do nothing more than confirm your email (prior to that they still work but limit you to 500 emails)
* Requires a credit card to be put in but that is actually good because it keeps out bad actors and spammers
* Works fantastically well
* Has a wonderfully designed dashboard
* Is reasonably priced beyond the first 10,000 emails on a pay as you go basis 

Here's the only negative thing I can tell you about SparkPost -- they had minimal configuration information about Rails and AWS.  But, hey!, I wrote this for you so you now have step by step instructions so you're covered, right?

The bottom line here is that if you're building any kind of product which has to send any kind of email -- and that pretty much means anything these days, because everything has to be able to send a password reset email -- then you should at least consider SparkPost if not simply choose it outright.

Thank you George for writing SparkPost, it is awesome!  Appreciated.

# Overview

Here's what I'm going to walk you through:

* Creating Your SparkPost Account
* Testing Your SparkPost Account
* Adding SPF / DKIM Support to your Domain using AWS Route 53
* Creating a Rails Mailer
* Configuring Rails 
* Testing Your Rails Mailer in the Console
* Integrating Your Rails Mailer in Sidekiq and Clockwork

As you can see, I'm going to walk you through Rails Mailers right down to the nitty gritty.  The reason for this is actually pretty simple, if I don't write it down then I'll just have to figure this out again the next time I need to do this.  

## Creating Your SparkPost Account
## Testing Your SparkPost Account

    curl -X POST \
      https://api.sparkpost.com/api/v1/transmissions \
      -H "Authorization: dddd" \
      -H "Content-Type: application/json" \
      -d '{
        "options": {
          "sandbox": true
        },
        "content": {
          "from": "sandbox@sparkpostbox.com",
          "subject": "Thundercats are GO!!!",
          "text": "Sword of Omens, give me sight BEYOND sight"
        },
        "recipients": [{ "address": "fuzzygroup@gmail.com" }]
    }'

## Adding SPF / DKIM Support to your Domain using AWS Route 53

I first started sending emails on the Internet back in roughly 96 or so and my tool at the time was some sort of kludgey Perl / SendMail monstrosity and then I progressed through a series of solutions which mostly involved hacking into Gmail to use it as a delivery engine along with some small scale use of an excellent UK based email delivery service whose name always escapes me.  One of the things I've never understand beyond the most basic of concepts is SPF / DKIM.  What I do understand is that SPF / DKIM is a way to adding credentials to your core DNS record so when you send an email from "foo@bar.com", the delivery engine can look at your core DNS records and say "Yep -- he actually is "foo@bar.com".  Given the volatile nature of the email business and its ongoing problems with spammers, this is crucially important.

Now I know this is important but I've never done it myself and I am completely aware that SPF / DKIM configuration, as with any type of DNS configuration, is where you can easily go massively, massively wrong.  One of the key things that SparkPost does is generate your SPF / DKIM configuration which you then need to add to your domain.  They didn't cover AWS Route 53, the native DNS provider for AWS, in the SparkPost documentation so here are the steps you need to take.

Here are the SparkPost docs on 

### Step 1: Log Into Your SparkPost Account

### Step 2: Get Your SPF / DKIM Credentials

Here are the [SparkPost docs on DKIM](https://www.sparkpost.com/docs/getting-started/getting-started-sparkpost/#step-2-verifying-domain-ownership).

### Step 3: Log into Your AWS Console

### Step 4: Goto Your AWS Route 53 Admin Tool 

https://console.aws.amazon.com/route53/home?

### Step 5: Create a new Record Set

## Creating a Rails Mailer

Rails 

bundle exec rails g mailer Daily

mate app/mailers/daily_mailer.rb

http://guides.rubyonrails.org/action_mailer_basics.html

## Configuring Rails to Send through SparkPost

Rails Mailer configuration has always felt to me to be a bit of a black art -- you know what I mean -- the type of software configuration that generally involves cursing, arcana and, perhaps, the sacrifice of a goat in a deep forest under a fully lit moon while chanting is involved.  Happily Rails Mailer configuration, at least in Rails 5, is much, much simpler.

There are two different ways to send through SparkPost, [SMTP and HTTP Rest API](https://www.sparkpost.com/docs/getting-started/getting-started-sparkpost/#sending-email).  I'm going to talk about each but only give examples of SMTP Configuration.

### SparkPost and Rails SMTP Configuration

https://gist.github.com/thehungrycoder/b219f2b47b2bf70b27e8
https://thehungrycoder.com/ruby-on-rails/integrate-sparkpost-in-your-rails-app.html

### SparkPost and Rails HTTP Rest Configuration

If you're looking to use SparkPost via their API configuration then you likely want to consider the [sparkpost_rails gem](https://github.com/the-refinery/sparkpost_rails) which offers a *SparkPost delivery method for ActionMailer* according to the docs.  I haven't actually tried it myself but it seems to be what you'd need.  Honestly the SMTP configuration above worked so perfectly for me that I just didn't need it.

## Testing Your Rails Mailer in the Console

Once you've built your Rails Mailer then you need to debug it and, as with most things Rails, the easiest way is always Rails console.  The basic command you're going to use is:

> result = Mailer.method(param).some_variant_on_deliver

Here are the different variants on deliver and what they actually do:

* .deliver -- generate the mailer output in the console so you can preview the output; useful for debugging
* .deliver! -- generate the mailer output and actually sent it
* .deliver_later -- generate the mailer output and send it thru ActiveJob so it is done asynchronously and the function returns instantly

For most of my development cycle, I want to use .deliver so I can just inspect the output and fine tune it.  Here's how:

1.  Go into Rails Console with the normal *bundle exec rails c* or just *rails c*.
2.  result = DailyMailer.update_email(User.first).deliver

Here is what this looks like in Rails console:

![sparkpost_debugging_rails_mailers.png](/blog/assets/sparkpost_debugging_rails_mailers.png)

If you'll notice, I'm capturing the return value of the .deliver call which is useful for checking for errors and such.  

When I actually want to see what this looks like in my inbox then I'll change from .deliver to .deliver! and wait for the message to be delivered.

## Integrating Your Rails Mailer in Sidekiq and Clockwork

The final step of pulling this all together is to use to configure your email for production use with Sidekiq and Clockwork.  Here's what each of these do:

* Sidekiq is a background job processor for Ruby / Rails that can be tightly coupled with ActiveJob.  Remember that .deliver_later method we talked about earlier?  Sidekiq is the thing that makes it work and do the actual delivery in an asynchronous fashion.  I'm a huge fan of Sidekiq as I've written about many times before.
* Clockwork is an application level CRON engine for your Rails application. It allows scheduling to be integrated into your Rails application to handle things like "Send emails every day at 9 PM".  I've written about Clockwork before, notably here.

Here's how you would write a clockwork routine to schedule the daily sending of messages:

    if Rails.env.production?
      every(1.day, 'Send Daily Updates', :at => '21:00') do |job|
        User.active.each do |user|
          if user.details[:email_alerts]
            result = DailyMailer.update_email(user).deliver_later 
          end
        end
      end
    end

This is actually pretty simple:

* It is only going to work in production
* Every day, at 9 pm (21:00), it will
* Use a scope to get only the active users and loop over them
* Check the details field on users to make sure that email_alerts are turned on for the user
* Send the email using .deliver_later

This approach sends the email in an asynchronous fashion so we can have a number of sidekiq processes running to handle the actual email delivery.

## But Wait, There's More

Ad hoc delivery of a single email using something like SparkPost is actually pretty damn simple: 

* Configure SparkPost
* Generate a Rails Mailer
* Call it and away the message goes!

If there's a problem with the email process in this kind of ad hoc situation then the user will generally just try again and again until they actually get the email.  But when you have what I'm trying to do -- deliver a user's daily results to them -- then there are complications.  Your user is expecting 

class CreateEmailDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :email_deliveries do |t|
      t.timestamps
      t.date :date_created_at
      t.string :email_to
      t.string :email_type
    end
    add_index :email_deliveries, [:date_created_at, :email_to, :email_type], :unique => true, :name => "dca_to_type"
  end
end

# Verify Your Configuration 

# Add the SparkPost SPF / DKIM Configuration to Your Route 53 DNS Settings 



result = DailyMailer.update_email(User.first).deliver!

Password Reset Mailer 
