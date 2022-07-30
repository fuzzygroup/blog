---
layout: post
title: Bad Clients, Gordian Knots and Transparency
date: 2022-03-28 13:01 -0400
category: consulting
tags: ["consulting"]
---
{% pizzaforukraine  %}

I have now been doing consulting professionally since 1988 (first client was the EPA) and despite that, bad clients, are always problematic. That's longer than my adult child has been alive, longer than I've ever been married, etc.  I'd like to think I'm excellent at consulting but no one, no matter how experienced, can fail to make mistakes.  This is a tale of when a consulting project goes wrong and how to extricate one's self.

Today I finished up a project with a bad client and I wanted to write up my solution as a help for other developers in similar situations. I'm not writing this up as a humble brag or an "I'm so smart" but rather as a way to point out that:

* Anyone, no matter how smart, can get caught up by bad clients
* Sometimes you have to do the utterly unexpected to resolve things
* And, sometimes, you have to double down in order to resolve things

# The TLDR On the Situation

Here is the situation:

1. In May of 2021, a friend contacted me for a backend project using Shopify, Laravel, PHP and JavaScript. I'm a rails and Ruby guy by choice but Laravel is so clearly Rails derived that I took it on.  And I did know PHP albeit from 2006. 
2. There wasn't a ton of money with this job but I like my friend and they viewed this job as a way to secure their existing web site development arrangement with this customer. 
3. I didn't know Laravel at all but I figured that even if I didn't make much from the job at least I would learn Laravel.
4. Shopify is the only publicly traded Ruby company I know of and I have intense admiration for them so getting any experience with Shopify I felt was positive (disclaimer -- I was so impressed with Shopify that I recently became a stock holder).
5. We were going to be a consulting company to Company B which, in turn, was a vendor of primary company A's product.
6. Our original contact at Company B was a man called D who, during the course of all this, sold the company to a man called M.
6. The code we were contracted to write was an ecommerce "configurator" for making a complex, personalized clothing solution easier to purchase.
7. All ecommerce was to be done via shopify even though our solution was to exist separately from Shopify.
8. There was a strong desire, from the beginning, for social sharing and team purchases.
9. It is now March of 2022 and we have not been paid anything since September 11, 2021.
10. My friend has lost her existing web site arrangement with the customer.  They are identified below by H.
11. There was **never** a development contract with company B.  We asked for one and D assured us that it wasn't necessary largely due to the existing relationship and ongoing website work.
12. Every single meeting to review the solution had a different set of people (sometimes more than 10) with the same points being brought up despite having been resolved in prior meetings.
13. Despite not being paid since September 11, we continued to work on the project and attempt to resolve the issues.  This included work on vacation.
14. We were the second IT company to take on this project and the only one to ever finish it.

# Problem the First: "Make it A Shopify App"

When we started on this, we knew little about Shopify and treated integration as a back end (i.e. php level) problem using the existing php Shopify client libraries.  Company A had provided a snippet of code they said would be used to add the products to their Shopify cart, but snippet didn’t work at all.This led to the situation where a customer's underlying Shopify login not being used.  We were told by Company A to recast the entire application as a Shopify app.  This led to considerable retooling and new coding on our part only to find that it did nothing to fix the problem.  

# Problem the Second: Sharing 

Due to the specific requirement for social sharing but a complete lack of specifications for how that was to work, we implemented our own solution of a sharable shopping cart that was FAR above and beyond the original specification.  When this was demonstrated to the client, they wanted difficult and tedious HTML changes without being willing to compensate us for them.  This led us to simply reduce the underlying application so that the shopping cart could only have a single item in it.  However the additional functionality is still present and cleanly commented for restoration.

# Remaining Work

The only remaining work to be done is nothing more than changing out the development credentials for Shopify to be the production credentials.  And since this literally cannot be done until the very end, we have been required to hang in on this project, week after week, month after month.  Along with answering emails, attending meetings, addressing questions multiple times and all of the other “stuff” that goes with a live project.  This truly was the project that would never die.


# The Breaking Point

The actual application has been working and ready to go since at least July 2021 and has never been formally used by the customer.  It was always the "yet another new requirement", all of them because Company B was unable to execute on their business relationship with Company A due to ecommerce product fulfillment issues on their part.  Our code has been rock solid and working forever but we were never able to close the books on this project due to this.  This made my consulting partner on this project absolutely nuts because they just wanted the job to be done.

The breaking point came when Company B wanted us to provide an SLA ("service level agreement"; basically an agreement of a guaranteed response time on fixes before they would take it live).  They were looking for a guaranteed response time on the order of 24 hours.  That means, for example, that no one involved can travel without a laptop always available.In certain situations an SLA is a valid request but for a project that amounted to less than $8,000 in billings and for which they were only willing to pay about $50 per month, well, that's ridiculous.  In a consulting shop with N employees that might be fine but in a consulting relationship with two individuals, of which only one is technical, it just isn't viable.

We explained to Company B that we simply couldn't give them an SLA.  We clarified that we would always be responsive but we weren't in a position to accept a defined response time given our resources and the amounts involved.

With this request made and our absolute distaste for this customer, we came to the internal conclusion that we simply needed to be done.  Given that we hadn't been paid in more than six months, we rounded up the numbers and came to the conclusion that another $5,500 was due to us.  In all truth the actual number was substantially higher but we wanted to be done and we felt that going for a smaller number was more likely to get us out of this faster.


# The Second Breaking Point

With our request to simply be paid the money that we were due, person M at company B responded to us with a contract that he required us to sign before we could be paid.  Among the issues in this contract:

* A non disparagement clause
* A requirement for us to never talk to Company A
* A training session for the new vendors and 20 more business days of support with an expected response time of 24 hours, keeping us on tie to this project for an additional month with no additional compensation
* A gag order – basically we would be barred from talking to anyone about said contract or our role in anything related to the project
* A non-compete clause barring participation or work for any ‘competitive business’. Since they are engaged in eCommerce this vague statement could possibly prohibit a very wide range of internet-related work.

I am an independent consultant and I don't have a personal attorney to review stupid contracts.  My general approach is to simply NOT sign stupid contracts (yes you can get away with this when you are good and I'm excellent).  My partner on this project gave it to her attorney who told her "It would be $1,500 for me to even read this let alone go thru a review process".  It was very clear to both of us that any dollars we got from the remaining $5,500 could easily be consumed by legal paperwork.  Remember, after brushing off our offer of a contract in May, company B had been perfectly content to let us work without a contract for 9 months it was only when we asked to be compensated for said work that they required a contract before we could be paid for work we’d already done.

# Resolving Things 1: The Gordian Solution

My first attempt at resolving this was simple:

**If there is no money then there is no need for a contract.**

I refer to this as a [Gordian Solution](https://en.wikipedia.org/wiki/Gordian_Knot).  Walking away from $$$ in consulting work is normally absolutely **not** something that is acceptable or even considered.  I mean who doesn't want to get paid but we just wanted this **done**.  Here is the email that I composed and my partner sent:

> Hi M, 
> We are simply at an impasse and I suggest the following as a way to resolve the issue.
> 1. Scott and I want to be done with this project.
> 2. You want a contract and Scott and I can't afford an attorney to review it -- there is no point in our signing a contract for $5,500 if all of it goes to legal fees.
> 3. We propose that we simply give you the code and the existing server accounts and logins where everything exists.
> 4. This would be accomplished as follows:
> a. You pay us nothing.  Repeat nothing.
> b. We transfer the git repo to a git username of your choosing.
> c. You give us credit card details so we can take our's business card off the digital ocean account and the forge deployer account.
> d. We add your email and password onto these accounts and delete our own.
> e. I will have Scott write a readme in the repo for how to check the code out, deploy it, and as much information as he can remember on how to update the credentials for the application to production.
> 5. We just want this to be done.  Let's agree on this and transfer the whole code base over to you by Monday end of day.
> H

Honestly I expected this to completely solve things.  I mean who doesn't want to get out of a $5,500 bill.  That's a pretty large amount of money.

# Resolving Things 2: Transparency

Sadly the client (company B) pushed back with a bunch of stupidity including:

* Just give us a zip of the code
* Get it deployed differently
* Let's move the code to Windows azure git hosting

Any developer in modern times knows that devops and deployment is a key part of things and everything works perfectly on the existing platform of Digital Ocean for hosting and Laravel Forge for deployment.  On this platform it has now been running for > 9 months with not one bit of down time and countless deploys thru development, testing, schema changes and more.

It is a well know truism in the open source world that "with enough eyes, all bugs are simple" ([Linus' Law](https://en.wikipedia.org/wiki/Linus%27s_law)).  Similarly I believe that when you have a situation with bad actors (and I'm absolutely certain that this company was portraying the situation to Company A that the issues were on our side; I don't appreciate being lied about) that bringing greater transparency to bear is the solution.  I discussed it with my consulting partner and here was the email that I wrote in response to their requests for stupid changes.

**Note**: T is the name of the new developer on the project.

> Hi,
> No.  A flat no.  We have been exceedingly generous with respect to this project all along and our solution was clear, concise and to the point while also giving you a fully working solution.
> We have kept working on this despite NOT BEING PAID since September 11.
> We simply want to be done.  
> We set out a very clear set set of instructions for us to conclude this and be done.
> And, unfortunately, no one at your company seems to be able to follow them.
> A github account is free.  And anyone who is a developer in the 21st century has one.
> My suggestion here is that we reach out to Company A to break this log jam and move forward.  I am happy to forward them all correspondence and talk with them personally.  
> I am certain that any developer at Company A has a github account that we can transfer this code to and then they can handle it with you.  When would you like me to communicate with Company A about all of this?
> Thank you
> Scott
> PS  - T -- my personal phone number is 317 531 4853 if you want to understand the backstory on this project.

Not surprisingly my offer to be transparent with Company A was not accepted.  What did happen though was a call from T within 15 minutes of my sending the email with a github account to transfer the code to and credit card info to use.

It is always amazing how bad actors scurry away from the light. 


