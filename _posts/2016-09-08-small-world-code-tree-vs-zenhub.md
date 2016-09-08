---
layout: post
title: Small World - Code Tree vs ZenHub for Github
category: software_engineering
tags: ["software engineering"]
---
Note: I started this on the trip down to ElixirCon but failed to finish it then so its about a week out of date but still relevant.

My father, a small businessman his whole life, has always commented to me on how the **small** nature of any industry.  And he has always cautioned me to maintain an outstanding personal reputation for integrity because of that.  As I'm traveling down to ElixirCon and in line to buy a burrito, I see a notification on my phone "[Kareem Mayan published ... ](https://medium.com/@kareem.m/how-to-avoid-building-a-company-that-youll-hate-d1eb76eb9a9d#.46ocftpmy)" in the Medium app.  Wow.  It is a small world.  

At the late, un-lamented eduFire, Kareem was the co-founder and one of two guys who hired me.  Because of him I dove ever more deeply into Ruby and took on Rails back in the pre 1.0 days.  He didn't even balk, when on my second week on the job I came down with Pneumonia in the summer and spent a week incommunicado.  That was also the week that I finished all the Harry Potter books but thanks to the fever, I was still surprised in the last movie (really - he died; dang!).  Quite literally he changed my life for the better.  He also strongly encouraged our move from subversion to git which was hugely important.  Understanding version control is one of those seminal skills for a software developer and git made me better at it than I ever was with subversion.

**Sidebar:** Say what you will about Ruby / Rails but I've been employed more than full time since 2007 due to Ruby / Rails and the $$$ I make from it have been transformative.  It has also leveled up my skills dramatically.  

Anyway I'm back in the market for real development tools with a new hire coming on board at my day job and what is Kareem doing?  Well he's one of the people behind [CodeTree](http://www.codetree.com/) which competes with the other tool I'm looking at, [ZenHub](http://www.zenhub.com).  So it really is a small world - I haven't thought about Kareem in probably 7 years now and all I knew was he went full "Digital Nomad" for quite a while.  And now he's providing an interesting tool and one of the owners of it.

** To the Comparison

Here are some thoughts:

* **marketing materials**.  CodeTree's site looks awful on an iPhone.  That impacts nothing on the tool itself but when you're considering tooling and looking the site on an iPhone, well, appearance counts.
* **browser support**.  ZenHub is tied heavily to Chrome as a browser.  That concerns me a lot because I use a bunch of different machines, iPad and such.  CodeTree doesn't seem to have such limitations.
* **pricing**.  Pricing is similar although CodeTree is more affordable.

Kareem reached out to me via email when he saw that I had signed up for a CodeTree trial.  This to me is a hugely good sign because it means that a real live person is reviewing every single new sales lead and considering them.  When I reached out to him and asked him some questions, here was his response:

There are two key reasons that people choose Codetree vs. Zenhub: 

1. People who are responsible for delivery like Project Managers or technical leads really like the table view that groups issues by Assignee or Milestone.  Tables are information-dense which gives them a good overview of what's going on in the project, though we also have Kanban to visualize issues as they move through your delivery pipeline.
2. We handle milestones and labels across multiple repos better than anybody else.  If you create a milestone or label in a Codetree project that spans N repos, we'll create that milestone or label in all the repos automatically.  Last I checked ZenHub creates it in the main repo but you have to create it in the other repos.  This is most useful for when multiple repos are part of the same product (API repo, front end repo, mobile repo, etc)
3. If your PM doesn't like or want tables and doesn't mind or need to create milestones and labels manually, or wants to stay in the GH UI, then ZenHub is a fine option.

And while there's a bit of snark in that last comment, these are valid points.  The thing that I keep coming back to on ZenHub is the implementation as a Chrome or Firefox plugin.  Perhaps I'm old school but abandoning the native browser on OSX, the iPad and the iPhone seems, well, foolish to me.  And the products do have a different experience level: 

* CodeTree is a separate site you sign into thru Github which acts as a project management overlay
* ZenHub is inside github entirely; its not a separate thing

I ended up purchasing **CodeTree** for the whole team and the core issue really was iPad support.  Both products work well enough and both product have some holes.  And while CodeTree's marketing materials didn't render well on a phone, the product works quite well on an iPad.  I find that an iPad is an increasingly vital "second screen" for a developer.  Not only does having one force you to make sure that your UI experience doesn't render poorly on a mobile device but it allows a developer to fork the all too common research tasks to the kitchen table, park, starbucks, etc.  Given the sheer amount of stuff that any developer has to read, iPads are pretty essential these days.  In fact they are essential enough that I specified one as part of the core gear given to our latest hire.

Sidebar: Knowing Kareem

So was this purely about the feature set or did my knowing one of the founders affect things?  I'd love to say it was purely objective but I'm sure that knowing Kareem was part of CodeTree was a factor.  Its always a pleasure to reconnect with an old friend and this was no different.  Still the overwhelming factor was browser support. I don't always carry a laptop but I do always have an iPad these days.