---
layout: post
title: Software Engineering Management - Rules for Successful Employee Transitions
category: software_engineering
tags: ["software_engineering", "startup"]
---
No matter how much you don't want them to, the simple fact is that employees leave your organization.  Here are some rules that I have found tend to make employee transitions more successful:

1. Don't try and get them to stay
2. Get them to be a consultant
3. Get them to write stuff down 
4. Get them to make screencasts of their development / debugging process 
5. Have them pair program with someone they don't normally do 
6. Get their contact info
7. Stay in touch

# Don't Try and Save Them

As a manager, when someone tells you they are about to leave, if they have been a good employee then your natural reaction is to try and save it, to convince them to stay.  Don't, Just **don't**.  What 30 plus years of hiring technical people has shown me is that the decision to leave an organization is **terribly hard** for technical professionals.  A big part of the reason for this is that if the technical person is any good, they tend to bond to their code base -- even if it is a bad code base.  We don't make this decision lightly and once it is made, well, it tends to be done.  Of all the people I've tried to save, I think I succeeded once -- and they left within the next six months anyway.

Here is a good [Harvard Business Review article on Considering Your Boss's Counteroffer](https://hbr.org/2019/01/if-youre-about-to-take-a-new-job-should-you-consider-your-bosss-counteroffer) that talks about whether or not to try and convince people to stay.  Thanks to reader [Lisa Meece of Starbase Indy](https://www.starbaseindy.org/) fame for the contribution.

# Consulting

Whenever I have a decent technical person leave my team, I always try to negotiate a consulting arrangement with them, right down to:

* Are you willing to consult for us?
* How much time do you have for consulting?
* What hourly rate will you charge me?

Employee transitions are a natural consequence of a free market economy and there should never be **bad feelings** -- these things simply happen.  If the person who is leaving is truly talented then why wouldn't you want them to consult for you?  This person is already:

* Trained
* Trusted
* Knowledgeable

The peculiar nature of software engineering is that certain individuals end up being domain experts and it can be hard to get a new person up to speed in their areas of expertise.  Having a consulting arrangement defined before someone leaves is a great way around this.

# Write Stuff Down

We all know that engineers are generally horrible at adding comments / writing documentation.  Despite that, you want to allocate time for any departing engineer to write documentation / comment code.  My personal suggestion would be to run that engineer's code thru a complexity analyzer like Flay (this is a Ruby tool; look for anything that measures cyclomatic complexity for your particular language) and have them document the most complex bits.

# Screencasts

Writing documentation is a lengthy, time consuming process and most people leave on a two week notice period.  An alternative to documentation is to get them to record screen casts.  This can be done by simply starting a screen recorder software tool while they narrate whatever they are doing.  I personally have done this for a multiple day period and while the screencasts weren't great quality, they were adequate for internal use.

Screencasts of their debugging / development processes, in particular, are very useful.  

# Pairing

As anyone who reads my stuff knows, I am a huge believer in pair programming.  A very useful training tool for people who are departing is to require them to pair program with someone who isn't their normal pairing partner.  This generally forces learning to occur.

# Contact Info

Even tho you might think that you have someone's current contact info, you always want to verify this.  

# Stay in Touch

People in high tech often have long careers.  I've had people that worked for me at one job, left, worked two or three places and then happened to work for me again -- when I was actually at a new job.  Staying in touch with talented individuals is a very, very positive thing and highly recommended.