---
layout: post
title: Covid and Your Personal Bus Factor
category: covid
tags: ["covid", "startup"]
---
In the world of software engineering, the term **Bus Factor** refers to the number of people on your team that have to get hit by a bus for your project to collapse:

> The bus factor is a measurement of the risk resulting from information and capabilities not being shared among team members, derived from the phrase "in case they get hit by a bus." It is also known as the bread truck scenario, lottery factor, truck factor, bus/truck number, or lorry factor.  [Wikipedia](https://en.wikipedia.org/wiki/Bus_factor)

I am currently a part of a number of projects with a bus factor of 1.  This means that if I get hit by a bus things simply **fall** apart.  Normally I don't worry about things like this because I'm in excellent health and I'm a careful person (and that is not to say that I'm invulnerable but at least professionally my clients accept that we have a bus factor of 1 because they must understand this issue).  But the world has changed around me and like everyone else I am struggling to catch up hence this bit of writing.

Someone close to me, last night, had both a fever and an upset stomach (both of these are diagnostic factors of COVID-19) and I woke up in a panic thinking about bus factors in three contexts:

* Personal
* Professional
* Side Projects

If you're not a tech nerd then you can only read the personal section; if you are a tech nerd then I advise that you read all sections.

## Your Personal Bus Factors

Your personal bus factors tend to be centered around matters of identity:

* Passwords
* Pin Codes
* Process
* Medication Documentation

Here's an example - I don't know the password / pin code to my wife's phone or laptop.  If she gets sick then I have to still pay bills and deal with accounts.  And without access to that information, well, **I'm fscked** (and thus so is the family hence my view of this as a bus factor).  

Now, given the sensitivity of the information on our phones and devices, having access to someone's phone password can be terrifying so I don't normally have an issue with not having access -- but these aren't normal times.  Years ago when my wife brought this up to me about my work computers, I gave her all my passwords in written form in a sealed envelope and I suspect I now need to ask her for the same.  I only need this information if she gets sick so hopefully the envelope never needs to be opened.

Along with passwords and pin codes in terms of a personal bus factor goes the **process** by which things are done.  Due to personal choices regarding separation of responsibilities, I have literally no knowledge of how to pay our bills.  My wife is a wonderfully responsible human being who, years ago, got us entirely out of debt and so she took on the bill paying responsibilities.

A final, unique aspect of the bus factor in today's world is documentation related to any medications that either you or people in your family take.  What's happening right now is people are getting sick and going into the hospital without anyone accompanying them -- which is unprecedented.  And here's where the bus factor aspect comes into play -- I have no understanding of what medications my wife takes (nor she of mine).  So the advice that you need is to, **right now**, to write down, on paper, all the medical information and medications that you take.  Anything that you would want to tell a medical professional before they performed medicine on you.  Now this may sound silly but it actually isn't -- my wife is deathly allergic to Penicillin -- it almost killed her as a child.  If she fell ill then how does that get communicated to a doctor if I can't accompany her?  And, yes, that is something that I know but what are the odds that if this wasn't written down, today, that I remember that amidst the stress of a possible COVID-19 case.

**Note 1**: If you have elderly parents, you likely need this information for them as well.  Ideally a power of attorney and / or knowing their desires should things go poorly would be good as well.  I hate, truly hate the last sentence I just wrote but the approximately 15% mortality rate among the elderly means that you need to deal with these difficult issues in advance.

**Note 2**: If you haven't walked thought the [Covid Near Me's Risk Wizard](https://covidnearme.org/risk/welcome) then I'd recommend that you give that a shot as it is truly frightening and cites the appropriate medical sources.

## Your Professional Life

I am currently, as I have almost always been in my career, a technical lead on a poorly staffed project.  There are several aspects to bus factor on software projects:

* Knowledge 
* DNS entries
* AWS PEM files
* SSH Public Keys
* Shared Secrets / Passwords like account information, API keys

**Note 1**: There are lots of aspects to bus factors in terms of a project; I've deliberately simplified this.

**Note 2**: My first foray into professional computing was a sales funded company and, thus, **poorly** staffed.  I got good, early on at doing much with very little and I've ended up following a path that always hewed towards interesting work albeit with resource constraints.


### Knowledge

If you are an organization and you have a single engineer on a project, well, I simply don't have much sympathy because you made an inherent organizational level decision that you are immune to bus factors.  Sigh.  But things to consider:

* Build Processes
* Deployment
* How to Tackle Daily Tasks
* What Happens at Year End (often times there are dependencies / manual tasks that need to happen tied to calendar year events)
* System Architecture

### DNS Entries

Ideally DNS entries are regarded as corporate assets and someone other than a lead engineer owns them.

### AWS PEM Files

Note: Depending on how you structure security on AWS the following may or may not be true.  My current project is at the small scale, proof of concept stage so crucial steps like real IAM setup has not been done; doing that for real would obviate this section.

When you create an instance on AWS, AWS issues you a ".pem" file which is a one time download that allows you to SSH into an instance.  The easiest way to avoid a bus factor issue here is to, **securely**, provide it to at least one other team member.  

Note: Email is not secure.  If you deliver it via email then zip it and put a password on it.  

### SSH Public Keys

AWS .pem files provide SSH access into an AWS instance.  But the world is larger than just AWS and classical systems administration techniques always work so another approach is to simply add another person's SSH public key into the authorized_keys file on each server.   

### Shared Secrets / Passwords / Resources

Given the prevalence of using third party services for almost any aspect of software development these days, you need to be really careful how accounts / api keys / resources are managed.  Here's an example on my current project:

1. We use the magnificent tool that is Uptime Robot for uptime monitoring (i.e. "is the site currently running").
2. All those notifications, however, exist on my personal uptime robot account and all notifications go only to my phone.
3. If I leave the project all that disappears.

The answer as to why I used Uptime Robot and my personal account is simple -- it was easy.  I don't have a credit card for organizational use so use of a paid tool wasn't simple (yes I could have begged for card credentials on someone else's card but that complicates everything and we don't really need uptime monitoring yet).  It was just easier to add this to my personal account.  And, yes, I do know better; ease of use tends to trump just about everything when people are busy.

## Your Side Projects

Side projects fall into a weird spectrum between personal and professional.  I can assure you that all of the above aspects of professional projects are currently being addressed for my side projects.

## I'm Available for Consulting

As a senior IT professional with:

* Proven expertise in COVID-19 (see note below)
* A strong understanding of bus factors
* Experience implementing code around the [Twelve-Factor](http://12factor.net/) app methodology 
* Proven expertise around organizational IT risk 
* And the ability to **talk** with your technical folks

I am available for project level audits in this area.  Email me for information - fuzzygroup at gmail.com.

**Note**: I'm the creator of [Covid Near Me](https://www.covidnearme.org/) and I've been thinking about how COVID affects everything since before March 10 when the site went live.  To date, Covid Near Me has racked up millions of page views.
