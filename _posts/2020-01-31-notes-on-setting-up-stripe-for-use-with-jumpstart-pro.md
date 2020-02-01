---
layout: post
title: Notes on Setting Up Stripe for Use with Jumpstart Pro
category: stripe
tags: ["stripe", "rails", "jumpstart"]
---
{:.center}
![IMG_1562.jpeg](/blog/assets/IMG_1562.jpeg)

I just finished, with a [colleague's assistance](https://eethomp.github.io), the SAAS implementation of a multi license product using [Stripe](https://www.stripe.com/) as the billing engine and [Jumpstart Pro](https://jumpstartrails.com/) as the Rails application template.  Listed below, in a mildly random order, are the steps we had to take:

1.  Create a Stripe account.
2.  Add your bank account credentials.
3. Define your [product](https://dashboard.stripe.com/test/subscriptions/products) within Stripe.
4. Define your subscription plans within the product inside Stripe.  Pricing plans nest within one product which is not intuitive.
5. Add the Stripe credentials to the Rails environment. [Read This Post!](https://fuzzyblog.io/blog/rails/2020/01/24/when-rails-credentials-edit-won-t-save-your-credentials.html).
6. In the /admin/plans urls on your Jumpstart based application, define the plans and prices that you want to offer (remember to enter prices in pennies) and make sure that the plan identifier that Stripe generated is entered into the stripe field inside the plan creation tool.
7. Install the [Stripe listen](https://stripe.com/docs/stripe-cli) tool using Homebrew: brew install stripe/stripe-cli/stripe 
8. Authenticate your Stripe listen with your stripe API key like this: stripe login --api-key pk_BLAH_FOO_BAR_BAZ_DOH_HOMER
9. Start the Stripe Listen tool (it defaults to port 3000; if you are running Rails on another port then you need to figure that bit out yourself).
10. Confirm in a browser that this is the right api return value (and, yes, this supports [Choosy](https://www.choosyosx.com/)).
11. When you see the webhook signing secret show up then use the [rails credentials:edit](https://fuzzyblog.io/blog/rails/2020/01/24/when-rails-credentials-edit-won-t-save-your-credentials.html) to add that to your environment.
12. Create a test transaction using the [Stripe test card numbers](https://stripe.com/docs/testing#cards) and you should see in the logs that the transaction went all the way through with entries something like the ones below.

   
    stripe listen
    > Ready! Your webhook signing secret is whsec_TRyDDDDDDDDDDDwnW3Y3u6TY7hDc (^C to quit)
    2020-01-31 21:07:18   --> setup_intent.succeeded [evt_1G7BOCARA9hqQw13nA4]
    2020-01-31 21:07:24   --> customer.created [evt_1G7BODARA9hqQw13uTOc]
    2020-01-31 21:07:28   --> payment_method.attached [evt_1G7BOEARA33c6vCsbI]
    2020-01-31 21:07:31   --> customer.updated [evt_1G7BOEARA3b1n6m7mC]
    2020-01-31 21:09:25   --> setup_intent.created [evt_1G7BQGARA9hucov62]
    2020-01-31 21:09:30   --> setup_intent.created [evt_1G7BQJARzeSJPFuu]
    2020-01-31 21:09:33   --> setup_intent.succeeded [evt_1G7BQ3uheaVInO]
    2020-01-31 21:09:34   --> customer.updated [evt_1G7BQJARA9hqQNa0]
    2020-01-31 21:09:35   --> invoice.created [evt_1G7BQJARA9hqQw13Rei]
    2020-01-31 21:09:35   --> invoice.finalized [evt_1G7BQJARA9hqQw13LaF]
    2020-01-31 21:09:36   --> customer.subscription.created [evt_1G7BQKARA9tQAPyfk]
    2020-01-31 21:09:43   --> invoice.payment_succeeded [evt_1G7BQKARA9hqPYpc]
    
    
**Note**: Once you do all the above steps then you still need to use the Copy Product to Live mode option to move the products and plans you built for testing to the production mode.  And then you'll need to move the subscription plan ids over as well since these will be changed.