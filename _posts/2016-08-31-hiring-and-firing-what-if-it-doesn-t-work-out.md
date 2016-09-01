---
layout: post
title: Hiring and Firing - What If It Doesn't Work Out?
category: management
tags: ["firing", "hiring", "hr"]
---
So, as I've written recently, we're about to add a 4th employee at my day job, "new guy".  We have three current employees - 2 founders and myself.  For a variety of reasons you might consider me a lifer i.e. I'm not going anywhere as I have a huge vested interest in the company's technology stack.

Whenever you hire someone you have to accept that you might need to fire them or that they might leave.  And in tiny companies there rarely is a process for this so it is always, always a damned **fire drill**.  Since this guy was my pick and I lobbied hard for him internally, it should also be my responsibility to document the process by which a valued technical employee has moved on for one reason or another.  So here are the steps in today's technology world that you need to follow:

1.  Disable access to communications - email, slack.  This is always, always first as departing employees are distracting.
2.  Remove from github teams.
3.  Disable ssh access to any internal servers.
4.  Revoke / disable access to any AWS resources including S3 buckets, pem certificates, etc.
5.  Ask them to delete any and all source code, docs, etc from any and all laptops they might have.
6.  Get back any and all hardware that they have.
7.  Delete them from any web based logins including but not limited to:
* jira
* trello
* 1password
* twillio
* zoom.us
8.  Remove the person from calendar notifications, etc.

I'm sure there is something else but, honestly, if you cover 1, 2, 3 and 4 that's 99% of the overall risk.

**Note 1**: I am deliberately not covering HR issues.  This is purely "disable access since we no longer trust the person; they are no longer one of us".

**Note 2**: Yes if I was starting a new job, seeing this post could be terrifying.  But I'm an honest boss and employer and I've been up front with new guy that if he doesn't match up to the technical credentials he presented, he's out.  I don't believe in technical testing for new hires.  I don't do coding exams; I don't do white board tests; etc.  I just talk to people and try and suss out a) their degree of nerdiness and b) the degree of cultural fit.  If you tell me you can do something then I'm going to believe you.  And if you've deceived me, once its verified that it wasn't a misunderstanding on my part, then you're out.  I don't work with *lazy*, *dishonest* or *incompetent*.  Beyond that let your freak flag fly, it is all good ...