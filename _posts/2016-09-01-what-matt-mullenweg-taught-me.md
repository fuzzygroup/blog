---
layout: post
title: Startup Learnings - What Matt Mullenweg Taught Me
category: ["startup"]
tags: ["startup", "learnings", "entrepreneurship"]
---
WordPress, today, is an unquestioned king of the Internet.  I just checked the stats and WP 4.6 has been downloaded over [7 million times](https://wordpress.org/download/counter/) (and you can watch the number increase).  I remember, however, a time when its dominance wasn't so clear -- I remember being at the launch party for either [.72 or 1.0](https://codex.wordpress.org/WordPress_Versions) when things weren't so clear.  But I suspect that I'm rambling now -- long day.  Anyway, even when WP's ascendancy wasn't so clear, I always thought that [Matt Mullenweg](https://ma.tt/) himself was the real deal. He clearly knew what he was doing and [his history since 2004](https://en.wikipedia.org/wiki/Matt_Mullenweg) certainly bears that out.

In the very early days of WordPress.com I remember talking to Matt about how they were handling the database implementation and he told me that WordPress.com was just architected just like WordPress itself -- a single database per user.  I looked at that decision, to myself, a bit aghast.  After all, I was a *software developer*, so I knew that you had only a single database per application.  Boy was I wrong.  At the time I had a traditional software guy's perspective on the database -- big, expensive, resource intensive -- so you limited the database's use.  However, I suspect, Matt looked at the database from the perspective of shared hosting.  Hosting companies routinely run thousands, if not tens of thousands of databases, on boxes to support customers on cheap hosting.  And, if they could do it, why couldn't he?  And what a damn brilliant decision that was:

* By logically isolating each customer's data from the other, he utterly avoided a whole class of scaling problem -- data gets too big -- move the whole account to a better server.  
* Ever notice that while there are security holes in WordPress itself, they never seem to be a big deal for WordPress.com?  Well this is why.  Breaches are contained.

I'd argue that this single design decision dramatically affected WordPress's success.  People don't often thing about software architecture decisions making the difference between commercial success and failure but I was there and I'm pretty damn certain of this.  Now Matt would have been fine no matter what but this one decision, I've always thought, helped ensure the success of the overall WordPress enterprise.

Now Matt certainly isn't the only one who has done this.  Down the road I'd see the same issue at [Brad Fitzpatrick's](https://en.wikipedia.org/wiki/Brad_Fitzpatrick) LiveJournal.  And it wouldn't surprise me if Brad actually did it first since Brad usually has done everything first.  I'd also consult on a similar architecture when I worked at StreamSend where I saw the harder side of managing such an architecture -- rolling deploys and database migrations.  

Notes:

* Please note that I have no idea if WordPress.com still uses this same structure today.

