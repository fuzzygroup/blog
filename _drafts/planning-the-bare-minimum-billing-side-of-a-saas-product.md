---
layout: post
title: Planning the Bare Minimum Billing Side of a SAAS Product
category: saas
tags: ["rails", "stripe", "saas", "billing"]
---
I've spent part of this week working through the billing side of my new SAAS product which I'm planning to use with Stripe as my credit card solution.  And what I did was focus solely on the *how* of the code, you know, like:

* How do I use [Stripe Elements](https://stripe.com/docs/elements) with Rails
* How do I support credit card updating

Most of this I learned from the excellent [Stripe course](http://courses.gorails.com) from [Go Rails](http://www.gorails.com/) which I strongly recommend for any Rails / Stripe projects you have.

What I never did was actually outline the functions that a bare minimum SAAS billing engine needs.  So you consider this a "retrospective specification".  I'm not going to talk at all about the code -- go buy the course for that -- but, instead, about the minimum amount of features you need to have a SAAS product in 2017.  The criteria I used to define minimum functionality was pretty simple: I don't ever want to have to get involved in day to day transactional crap.  

Here are the bare minimum SAAS functions you need in 2017:

1. The user has to be able to order the product with the product name and price displayed on the order form and a standard bootstrap approach to form elements. **DONE**.
2. The system needs to be able to support at least Basic and Pro subscriptions from the very beginning. **DONE**.
3. The user has to be able to enter a stripe coupon code on checkout so the user can get a discount. **SKIP**.
4. The user has to be able to get a receipt for their transaction. **Done**.
5. The user has to be able to cancel a subscription by forcing the user through one or two "please don't cancel" screens first where you try and convince them not to cancel.  Now, that said, the user needs to be able to cancel on their own, without a refund, but with the service being available until the end of their payment period.
6. The system has to be able to receive transactions from Stripe events and log them to a charges table.  **Done**.
7.  There needs to be easy access to admin tools with restricted access to only admin users.  **Done**.
8. There needs to be an admin page which shows daily revenue and total revenue.  **Done**.
9. There needs to be an admin page with calculation of lifetime customer value on a per customer basis.  **Done**.
11. A basic has_valid_account? method on an instance of user needs to exist.  **Done**.
10. An api needs to be exposed so other parts of the system can find out if a user's account is still valid.  This isn't a standard feature so I listed it last.  I chose to build my product in a distributed fashion thus requiring a basic authorization api to be implemented.  **Done**.

You'll notice that I don't put anything in on the admin pages about sorting, searching or even pagination.  This is purely an internal tool and since, right now, I have 0 transactions, none of that is needed.  If I get transactions for this side project, then and only then, do I need to worry about that.  

There are a near infinite amount of billing / SAAS features that can be implemented but these are the bare minimum.  Each of these is discussed below.

I have specifically noted which features I was able to easily re-use from the Stripe course.

# User Has to be Able to Order the Product

# System Needs to Support Basic and Pro Subscriptions

# User Has to be Able to Enter a Coupon Code

I made the executive decision to skip this based on complexity. A good reference to implementing it can be found here: https://stripe.com/docs/recipes/coupons-for-charges

# User Has to Be Able to Get a Receipt
# User Has to Be Able to Cancel 
# System Has to Receive Stripe Events
# Admin Page with Daily Revenue and Total Revenue
# Admin Page of Lifetime Customer Value