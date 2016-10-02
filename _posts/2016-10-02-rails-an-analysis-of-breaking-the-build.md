---
layout: post
title: Rails Post Mortem - An Analysis of Breaking the Build
category: software_engineering
tags: ["rails", "software_engineering"]
---
I often tell my kids that when something goes wrong I care less about what went wrong and more about responsibility, specifically, whether or not you accept responsibility for it.  When something goes wrong accepting the responsibility for it, if it was actually your fault, to **me**, is a big deal.  If you don't accept responsibility for your mistakes then you cannot learn from them.

I recently had the situation where a new hire broke the build.  And he broke it after 5 pm on a friday when mission critical work had to be done over the weekend. Sigh.  And, of course, he was offline when I found out so it fell on me to untangle it.

# Mistake 01: Mine - Accepting the Change on a Friday

It was the end of the week and I'd been busy and heads down all week on devops stuff.  I wanted to get his changes merged so I did take the change without my normal level of "it's a friday; deny, deny, deny and then deny some more" commentary.  I should never, **never** have taken changes from anyone other than myself on a Friday afternoon.  Why?  Because, ultimately I'm in charge.  And when a crawl blows up partway through it is on me to fix it.  No one here carries pagers or is expected, other than myself, to be up in the middle of the night dealing with crap.  

# Mistake 02: His - Over Scoping the Work

The individual in question had a ticket in his queue that read "Figure out what gems in gemfile we should throw out".  This is a classic learning exercise that I often give to new hires.  Gemfile is often a bit like Mos Eisley in a Rails project - a wretched hive of scum and villany.  Gems accrete there -- you need a tool for a one off hack and a gem gets added.  And then its not used and the one off hack goes away.  But the gem never goes away.  

He did the analysis but then he decided to re-organize the Gemfile and alphabetize it.  And this was at the core of the problem.  I asked for analysis.  I didn't ask for change specifically because I wanted to make that change gently, carefully and on my own.  Now I could absolutely have pushed back and said "Nope!  Don't want it; didn't ask for it; redo."  But that would kind of be a jerk move. He clearly put thought and effort into this so as a person who manages people its better for their growth and development to follow the process end to end even when you think it might be a damn disaster waiting to happen.

Now, as old engineers are wont do, we tell tales and we bitch about parts of software that we find odious.  Personally I'm not a fan of Gemfile and the whole gem stack in general in Rails.  Of all the things that give me issues in Rails, I find the overall fragility of the Gem stack and bundler to be the absolute worst part.  I know for a fact that he's heard this rant.  However, whether or not he listened is unclear...

# Mistake 03: His - Moving Things From Main to Development, Test Groups

The first mistake that was made was his decision to move things from the main context in Gemfile to solely development and test.  The gem in question was pry and, for some reason, it not being present broke the running system.  His defense was "I’ve never seen an installation where pry needed to be in production".  That's fine but the reality with big complex software systems is that understanding side effects of changes is hard.  And when your boss has specifically called out the area in which you **chose** to make complex changes, you need to approach it with caution.

# Mistake 04: His - Introducing Things Not Present Prior in Gemfile

When I saw pry in the Gemfile, I initially thought that he had introduced it and I pushed back on it.  Nope.  He was right -- pry was part of the system.  It was an innocuous "gem 'pry'" on or about line #65 and I was the one who had to add it once upon a time.  I've never been a pry fan despite its relative hotness within the community.  Now when he saw pry and moved it into the development and test groups, he also added pry

The person making the change introduced two additional, pry-rails and pry-byebug.  I don't know what these do and the system is now breaking so I commented them out immediately.  And was that conservative of me?  Yes.  And was that reactionary of me?  Sure.  Maybe these are great gems that will rock my world but when a) the system is breaking and b) the goal was find out what's not used, adding new gems shouldn't happen.  

# Mistake 05: His - Mysqlplus

One of the best bits of work that this person has done for us so far is he got the mysqlplus gem working again.  Why we need this crufty old bit of code is irrelevant (or the subject of another blog post) but we absolutely do need it.  And where I couldn't make it work in Ruby 2.3.1 and Dv couldn't make it work, he pulled it off and that was absolutely, **stellar**, **amazing**, **wonderful** work.  I simply cannot say enough good things about this.  Unfortunately when he refactored Gemfile it was *commented out* and it not being there promptly broke all of our crawlers.  This was essentially a copy and paste refactor issue.  When he started the Gemfile project he hadn't yet done the mysqlplus work so the gem, which at that point in time was broken, was commented out.  And, unfortunately, despite the good work he had done, stayed commented out.

The reason that it broke our crawlers is is that our crawlers are based on Rails but have their own dependency load structure so how they interact with Gemfile is complex.  And they also rely on this bit of trickery:

    class Mysql; alias :query :async_query; end

That takes the async_query method in mysqlplus and dynamically replaces query with it.  This eliminates blocking at the query level and improves our threaded performance by roughly 50%.  And because this is dynamically injected, when something isn't present in Gemfile, there's no way to know except for actually executing the code.  

Now this is the point about complex software systems -- when you don't fully understand them -- you need to approach **dangerous changes with care**.  He may not have perceived Gemfile as dangerous but I made damn sure that the rant was given because I do know the danger of messing with Gemfile.  The bottom line here is that you don't change global things without a hell of a lot of care.  And you certainly don't change it on a Friday afternoon.  And, remember, I accepted the changes and that was my error.

# Mistake 06: Mine No Monitoring on Parts of our Infrastructure

Another mistake that I made was when our new AWS bits were setup, I didn't immediately set up monitoring on a few production urls.  Since this is mainly an internal system which produces data that is ingested by Tableau, monitoring has never been a priority.  Again that's on me.  If I had had monitoring setup I would have found at 3 on a Friday instead of at 5.  And since he would still have been online all of this would have been easier.

# Mistakes Other

There was at least one other issue related to the Curses gem but I don't think its particularly relevant here.  I had been in the middle of doing ansible work on devops and I saw our Ansible work failing and went sideways debugging it thinking the issue was me when it was really the lack of the curses gem.

# Some Things are Debatable; Other Things Are Not

When this topic came up on a slack chat between this individual and myself, he gave me a lot of push back like the "I've never seen pry in production".  And I'll definitely admit that some technical topics are debatable.  Perhaps there is something critically wrong with our code that pry is needed in production.  Or maybe it was something else and adding pry causes another dependency to come in which fixed it.  I'm not 100% certain because I had production systems that needed to get running again and simply reversing a few of his changes was the most expedient way to do that.  So while we can debate aspects of his changes, what isn't debatable, is this:

* He chose to make changes above and beyond the requested scope of work -- which was analysis
* The production, running system entirely broke -- website, backend, etc

To me this is fairly incontrovertible -- you broke the build.  Now this isn't a huge deal to me:

* New hires break things and no data was lost.  
* We lost about an hour and a half of crawling time
* I resolved the issues in less than 30 minutes and had us up and running again before dinner 
* It took longer to write this post mortem than it did to fix the issues