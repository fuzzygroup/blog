---
layout: post
title: Keeping Your Sanity as a Solo Entrepreneur 01 - Make Everything as Easy as Possible
date: 2022-06-01 19:13 -0400
category: startup
tags: ["startup"]
---
{% pizzaforukraine  %}

I've now been a solo entrepreneur longer than I've been anything.  Being a solo entrepreneur is a very different experience and it isn't one that is taught -- you generally learn only by doing.  I've started this series of essays to talk about practical things I've learned over the years.  The reason that I referred to it as *keeping your sanity* is that is what, all too often, solo entrepreneurship feels like.

The first lesson I learned is **make everything as easy as possible**.  I know this is obvious but there are all kinds of things that we do by *rote* without ever thinking about how you can make it easier.

## Example 1: Typing Your Link

Let me ask you a simple thing -- if you are running any kind of online business, how many times this year will you text someone a link to your business? Or your social media pages?

I build a lot of web applications and one thing I noticed is that when I'm using a phone and texting people, it was way too easy to mistype a link.  And it makes me just stupidly angry.  I tried putting them in a note on the phone but selecting text on an iPhone still sucks.  But then I discovered Text Replacement and it made me very, very happy.

Every iPhone (and I suspect Android Phone although I'm not an Android user) has a feature called **Text Replacement**.  This feature lets you specify some text and then its replacement.  Every single time I build a new web application, I create one of these replacements.  Here are some examples:

* I type **jh** and it inserts https://www.jobhound.io for me
* I type **pfu** and it inserts https://pizzaforukraine.com 
* I type **cnm** and it inserts https://www.covidnearme.org 

If, for example, you were a solo entrepreneur running company Metal Honey Foods (this is an unabashed plug; she's a friend with a great hot honey product) then she could define mhf and it could insert https://www.metalhoney.com/ for her.  Similarly she could have other key sequences that inserted her social media links.

This is, without question, a very simple example but almost anything you do can be made easier.  And, what I've found, is that each thing I make easier diminishes the cognitive burden of running my small business.

## Example 2: User Welcome Emails

I'm currently in the process of reviving a mildly moribund project -- JobHound.  This is a site which I built 4 years ago and it has just ran steadily in the background servicing users and helping them find jobs.  It didn't cost me really anything to host it and I didn't have a business model for it so I just left it alone.  I recently got an email from an enthusiastic user who convinced me that:

* It was still better than anything else on the market
* I should really fix some key issues

One thing I wanted to do is talk to the actual users of the site and see if they are getting value from it.  The current thinking in web development is I should set up an auto responder and a MailChimp campaign and such.  And, if this site had a large number of new users, well, that would be great.  But, I said this site is moribund, so you need to think of say 10 users every few days.

I thought about this and I realized that what I needed was:

* An admin tool that simply listed users by currency (most recent at the top)
* Gmail -- I could simply send an email **manually** to each user

So I built the admin tool and started copying the email addresses, switching to a Gmail tab, clicking Compose and then pasting in the email address.  And, then, it hit me -- maybe this too could be automated.  A quick Stack Overflow search gave me the syntax to build a clickable link which:

* Opens Gmail
* Fills in the to field with the email address
* Fills in the Subject
* Fills in the Body

This makes my writing a welcome email to 10 users literally the work of about 2 minutes.  And I guarantee that by the time I build a welcome campaign in MailChimp, figured out the data feed integration, tested it, etc, well, I'd have spent at least a few hours on it.

{% highlight ruby %}
 def link_for_welcome_email(user)
    body = "Hi #{user.first_name},%0A%0AI'm Scott and I created JobHound. I wanted to welcome you to the product and wish you the best of luck with your job search.  %0A%0AI recently made a bunch of improvements to JobHound so if you have had any issues, you might want to try again.  %0A%0AIf you have any questions, you can always just email me for tech support.%0A%0ABest%0A%0AScott"
    link_to(user.email, "https://mail.google.com/mail/?view=cm&fs=1&to=#{user.email}&su=Welcome%20to%20JobHound&body=#{body}", target: 'new')
  end
{% endhighlight %}

## Conclusion

If you are reading this then I suspect there is a good chance that you aren't a hard core software engineer as I am.  The take away here is not the code snippet above but the recognition that you help keep your sanity by making things easier for yourself.  You may not be able to code but there are absolutely things you can do to make your life easier.

## See Also

Here's how to make that [email](https://stackoverflow.com/questions/6548570/url-to-compose-a-message-in-gmail-with-full-gmail-interface-and-specified-to-b) trick work.
