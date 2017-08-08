---
layout: post
title: Utter and Complete Heroku Fail
category: fail
tags: ["heroku", "fail", "rails"]
---
So this morning I wanted to get a self hosted version of the [Errbit](https://github.com/errbit/errbit) project running.  This is an equivalent to BugSnag, Airbrake, HoneyBadger -- a tool for tracking errors in live apps.  The inspiration for this was [Jeff Atwood's Developer on Fire interview](http://developeronfire.com/podcast/episode-258-jeff-atwood-sharing-the-house) where he advised three things: 

    Jeff's top 3 tips for delivering more value:

    1. Measure performance all the time - Know how long every unit of work in your app is taking
    2. Have user friendly error handling for both the end user and the developer built into your application
    2. Have a place where people can go to discuss your software

I'm close to releasing something and #2 has been on my list for sometime so I was pretty damn motivated to finally address this. And I've wanted to try Errbit for literally years and years so I turned to their [deployment](https://github.com/errbit/errbit/blob/master/docs/deployment/heroku.md) page where they, quote clearly, offered Heroku as an option and recommended it as the easiest way to start.  Awesome -- right?  Unfortunately I found nothing but complete and total fail.  Here's what happened:

1.  I created an account.  This is normal and worked well.
2.  I had to verify my password via email.  Again normal and worked well.
3.  I returned to the [automatic app creation](https://heroku.com/deploy?template=https://github.com/errbit/errbit/tree/master) where it now told me I had to enter a credit card.  I did.
4.  Installation failed and wouldn't tell me why "App creation failed.  Please ensure you have valid values in the above form field" -- they were all there.
5.  Installation failed and it told me to that I needed to enter a credit card -- which I did.  But I can do that dance again.
6.  I then get "the account foo@bar.com is not permitted to install the sendgrid add-on at this time.  If you believe this is an error please contact support and reference ID 56fda43c-8abb-4378-a320-079bec73f142" (note I did give heroku my correct email).
7.  I attempted to put in my own SMTP server but I'm told the same thing about sendgrid even though I put in a [sparkpost](http://www.sparkpost.com) domain.
8.  There is no link to support in this context.  Shouldn't this have been automatically linked in place?
9.  I find the support button at the bottom of the page (disclaimer - it wasn't all that far away) which takes me to help.heroku.com.
10.  On help.heroku.com I can find no way to actually create a ticket to enter the ID they gave me.  See Screenshot 1 below.
11. There is a [Ticket history](https://help.heroku.com/tickets) button which also doesn't give me a way to create a ticket.  See Screenshot 2 below.
12. At this point I've given up in disgust and I'll figure out how to do this on Docker and my own AWS instance.  

# Summary

This is a failure on so many damn levels that it is absurd:

1.  Having to enter my credit card twice.
2.  Not allowing an authenticated, validated, paying user to use a baseline feature.
3.  Not allowing a way around the failure (use of another smtp resource).
4.  Not making support easy.
5.  Not even allowing me to create a ticket AS THEY TOLD ME TO.

The utter and complete pity of this is that Heroku allowing me to easily run a github repo would have been beautiful.  Here is the beautiful simplicity of the Errbit deploy to Heroku url:

  https://heroku.com/deploy?template=https://github.com/errbit/errbit/tree/master
  
That is fantastic -- I do not think it could be any simpler than that.  And, if it had worked, I can easily see myself doing this fairly often.  Now?  I suspect I'll be deleting my Heroku account shortly and walking away forever.  And that's a crying shame.

# Screenshot 1

![herokufail1.png](/blog/assets/herokufail1.png)

So where would I even create a ticket?

# Screenshot 2

![herokufail2.png](/blog/assets/herokufail2.png)

So where would I even create a ticket?
