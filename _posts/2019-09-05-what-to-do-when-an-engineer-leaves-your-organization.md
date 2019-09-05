---
layout: post
title: What to Do When an Engineer Leaves Your Organization
category: management
tags: ["management", "hr", "startup"]
---
No one likes it when an employee leaves the company, let alone an engineer, let alone a senior engineer.  However, the reality is that employees leave companies all the time and the role of the company in this situation is really, really simple: **protect itself**.  Once an employee leaves, the only rational choice of the company is to assume that the interests of the company and the employee are no longer aligned and to treat the departed employee as a security risk.

**Note**: This is mildly AWS specific but there should be enough goodness in here for any organization.

This is particularly acute when the engineer in question is a senior engineer as senior engineers tend to have "the keys to the kingdom".  At the role I just left, I was responsible for deployment of our application which means I had access to:

* Passwords
* SSH Keys
* API Keys
* Close to every system we had accounts on  

Here is the advice I gave my former company about how to handle this:

1. Start by eliminating access to all github or bitbucket repos.  This preserves source code integrity and ensures that post leaving commit isn't snuck into a repo with some nefarious means.  This should be done before the engineer leaves the building.
2. Eliminate VPN Access.  This should be done before the engineer leaves the building.
3. Eliminate Gmail / Google Docs access.
4. Eliminate Slack Access (but bear in mind that this is a loss of institutional memory; [see here](https://fuzzyblog.io/blog/startup/2019/07/20/employee-transitions-don-t-kill-your-organizational-memory.html)).
5. If all your AWS boxes are fronted thru a VPN then you can lessen the priority on this one.  Eliminate SSH access to all public boxes.  If you don't have a VPN then lock down SSH access almost immediately.  This requires going into the /home/username/.ssh/authorized_keys file for EVERY account and eliminating all ssh keys.  Do not simply check only the user's ~/.ssh/ directory because if the departing employee had admin access, he might have attached his public ssh key onto another account.  You should note that this is sometimes done by people as a deliberate, good faith, backdoor in the event of problems.  I've done this myself on problematic boxes. 
6. Rotate your AWS credentials.  This should be done almost immediately after the engineer leaves.  Once you rotate them, they need to be refreshed on all boxes in the ~/.aws/credentials file.
7. Eliminate access to third party development tools such as [Data Dog](https://www.datadoghq.com/), [New Relic](https://newrelic.com/), [Timber.io](https://www.timber.io) or [HoneyBadger](https://www.honeybadger.com/)
8. Eliminate FTP Access.
9. Update every application level secret that is configured on your machine(s).  This means email api keys, twitter api keys, facebook keys and, well, * -- any api key that your application uses really needs to be updated.

In closing, I will admit that this is an absolute pain in the arse.  In the application I worked on, we very diligently worked hard to make sure that all application level secrets where never stored under version control, conformed to the [12 Factor](https://12factor.net/) mandate but there are still 81 plus application secrets that really should be updated -- and that is the work of probably 1 to 2 days at least. 