---
layout: post
title: Getting AWS Costs Under Control
category: aws
tags: ["aws"]
---
{% pizzaforukraine  %}

*Note:* AWS is an abbreviation for Amazon Web Services, the Amazon cloud computing platform.

I am presently responsible for a monthly AWS budget that is running about $20,000 per month.  And that is up from about $11,000 per month only eight months ago.  I was recently tasked with bringing that down through *reserved instances* and I thought that writing up the learnings from doing a deep dive into reserved instances and AWS Cost Control was worth writing up.  Even though I’ve worked with AWS now since 2008, I found the results of my research pretty damn surprising.

I should note that when I say “responsible”, I mean that I have technical / implementation responsibility in my role as a Senior Software Engineer. I’m not actually a cost control / accounting person in any way.

## What are Reserved Instances

The first thing to understand is that Reserved Instances are poorly named, very poorly named.  Reserved instances are nothing more than *coupons* for the use of an instance of the type of the coupon.  You actually aren’t reserving a specific instance but instead saying to Amazon “Ok I’ll buy this much of instance type X”.  And it is important to understand that reserved instances aren’t a simple volume discount.  They are:

 * Massively complex and confusing
 * Expensive, requiring an up front payment to get the maximum discount
 * Available in multiple flavors such as convertible and non convertible 
 * Complex enough that after researching them in depth you will want to drink and drink heavily 
 * Such a big deal that there actually is a secondary market where you can resell and purchase reserved instances 

When I looked into how much reserved instances could save us, I generally found between a 15% to 20% savings with our current approach to things.  Given our current spending rate, that could easily amount to nearly $40,000 per year.   And while that’s nothing to sneer at, my research into reserved instances told me to keep digging.

The most interesting thing about reserved instances with respect  to AWS cost control is that universally the recommendation I found was this: *Don’t start with reserved instances*.  Even though reserved instances directly reduce your costs, you should never start with reserved instances.  And that brings us to the next section, AWS Cost Control Strategy.
￼
## AWS Cost Control Strategy

After a considerable amount of research, I came up with the following approach for reducing AWS costs. Please note that where I say “we”, you should substitute your own organization.

1. We need to designate someone as the person responsible for managing / monitoring AWS costs.  Right now, for example, we have a quarter of a million dollar budgetary line item that *no one* is responsible for.  This isn’t a technical problem; this is an accounting problem.
2. We need to correctly tag all instances by name, by product family, by application and more so that there is the metadata to properly examine and drill into costs using the AWS or third party accounting tools.
3. We need to implement a lights on / lights off strategy where you turn off resources when they aren’t in use.  As an example, our staging and training environments clusters of machines only need to be available some of the time (staging needs to be available Mon - Friday, 9 to 6 EST; training needs to be available only when specifically scheduled).  Right now all those environments are powered up and available 24x7x365.  Admittedly these aren’t as many boxes as our production environment but if you don’t have something turned on, you’re not paying for it.
4. We need to implement a Right Sizing strategy where we dig into machine utilization and figure out if we’re actually using the correctly sized instances or if we are over spending by using machines that are too large.
5. We should only implement reserved instances when *all* of the above steps are implemented.  Otherwise you are over buying capacity that you likely don’t need.  Also it is not widely understood that you can buy reserved instances not only for your EC2 boxes but also for your RDS boxes; keep that firmly in mind when you plan your reserved instance purchases.
6. Finally we need to realize that AWS Cost Management is a task you need to do regularly whether that is monthly, quarterly or annually.  It needs to be not only someone’s actual job (or portion of their job) but as an activity, it needs to be done consistently.

## Tools and Recommended Reading

Here are some tools to investigate:

* [AWS Instance Scheduler](https://aws.amazon.com/solutions/instance-scheduler/) - This is a code based tool to configure turn on / turn off of your cloud instances
* [Park My Cloud](http://www.parkmycloud.com) - This is a tool which can turn on / off your cloud instances automatically with an easy user interface
* [CloudHealth](https://www.cloudhealthtech.com) - this is an AWS management and analytics tool with specific features for reserved instance analysis
* [CloudAbility](https://www.cloudability.com) - this is an AWS management and analytics tool with specific features for reserved instance analysis

The CloudAbility and CloudHealth tools are seriously pricey, they are generally priced as a percentage of your AWS bill, but they have outstanding analytics features and the ability  to analyze your reserved instance needs more powerfully than the built in AWS tools for this.

Here are some of the better research materials to investigate:

 * [AWS Cost Optimization Levers, Tools and Strategies](https://www.youtube.com/watch?v=3jhKM1rgpEw).  This is an excellent video from the AWS Australia branch.
 * [Saving at Scale with Reserved Instances by Cloudability](https://www.youtube.com/watch?v=L5rlqaC6uNs).  This is also excellent and it illustrates two key points - a) that reserved instances can actually increase your bill and b) that you really need to have someone responsible for AWS cost control on an ongoing basis 
 * [Reserved Instance Ebook](http://get.cloudability.com/rs/064-CAC-529/images/the-complete-guide-to-saving-with-aws-reserved-instances-ebook.pdf).  A great read.
