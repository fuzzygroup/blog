---
layout: post
title: So You Want to Build a SAAS App - The User Account Page
category: startup
tags: ["startup", "saas", "hyde"]
---
So once again I find myself designing a SAAS (software as a service) Account page.  This is the page that represents the user's account.  Conceptually this should be a pretty simple page -- it might have options for updating their billing credentials or changing aspects of their user profile.  

This isn't my first time at this particular rodeo -- a SAAS app.  I've done this at least twice before.  The last subscription billing system I implemented processed over 13,000 payments and collected over 3.5 million dollars using BrainTree's API.  And if I was going to follow how I designed this in the past, it would be a piece of cake -- I'd implement a simple page that let's you update your billing credentials and be done with it.   

But we're now in 2017.  The billing system I referenced above I first built in 2010 and **times have changed**.  In specific we now have a much, much better understanding of  the importance of preventing user cancellations.  Users that cancel their accounts wreak havoc on your overall SAAS profitability because you never, ever want to lose a customer.  So if a customer is going to cancel then you at least want to try and address it up front by illustrating the value of your SAAS product to them.

So my initial thinking on this is that you want your Account page to have highlighted at the top an indicator of the value that you are delivering to the user.  And I suspect that if you can actually measure the economic value of what you do then you actually might want to do that: 

> You have used XYZ N times and it has prevented 15 serious errors, 4 minor errors and generated 12 blah for you.  Each of these errors generally takes 3 minutes to resolve so we have saved you over **1 hour** of your very, valuable time.

You might also display some metrics about how much data the user has used / stored with your SAAS product.

Given that pretty much all of us use some type of SAAS product these days I thought it might be illustrative to look at the account page for two products: [PinBoard](https://pinboard.in/) and [Go Rails](https://gorails.com/).  

I am an absolutely unabashed **fan** of both of these products.  PinBoard is a bookmarking service that is actually worth paying for -- it rose to prominence when Yahoo decided to shut down Delicious and I've been a paying subscriber for the past year.  The founder, Maciej, has an absolutely delightful [blog](https://blog.pinboard.in/) and he is ridiculously open about [everything](https://blog.pinboard.in/2014/11/new_pricing_policy/).  GoRails is the philosophical success to Ryan Bates' RailsCasts and Chris Oliver does a really, really stellar job.  I don't use it every day but when I need to learn something I hit the [episodes](https://gorails.com/episodes) link and it always teaches me something.  Honestly I learned how to work with the Stripe API for this project from Chris.

Here is a picture of the PinBoard account page:

![pinboard account page](/blog/assets/saas_product_account_page_pinboard.png)

I think Maciej did a great, great job on this page.  Every time I look at it I'm reminded of how valuable pinboard can be.  I'm sure there are subtle improvements that could be made but this is greate.

Here are pictures of the GoRails account page.  I had to break it into top and bottom sections since it was higher than the actual screen size.

![gorails account page top](/blog/assets/saas_product_account_page_gorails_top.png)

![gorails account page bottom](/blog/assets/saas_product_account_page_gorails_bottom.png)

Even tho this page doesn't emphasize how valuable GoRails can be, I think that Chris did a great job here.  I specifically like how this page was clearly intentionally designed to minimize support requests for receipts.  I'm going to steal that idea.  When you are running a solo SAAS business, everything needs to be designed to minimize customer support and being able to just say "Click the account link and download any receipt you want" is a nice bit of text to easily send in an email. 



