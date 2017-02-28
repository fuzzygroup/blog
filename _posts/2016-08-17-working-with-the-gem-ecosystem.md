---
layout: post
title: Working with the Gem Ecosystem
category: ruby
tags: ["ruby", "gem"]

---
**Note:** There's now a [part two](http://fuzzyblog.io/blog/2017/02/27/working-with-the-gem-ecosystem-part-2.html) of this post!

Gems are one of the more magical parts of the Ruby ecosystem.  By packaging software components as easily installable parts of Ruby / Rails, gems allow you to quickly extend your application.  In this blog post, I'm going to teach you how to make your own copy of a gem and then use it locally on your machine.  This isn't hard but it is the kind of thing that works correctly if you precisely follow the directions.  Enjoy!

# Forking a Gem
The first step in all this is to fork a gem.  Forking essentially means "clone the git repo of the gem you want to your own Github account so you can do with it as you will".  Start by finding a gem on Github and then clicking the fork button.  This is prompt you for where you want to clone it to.  Generally you want this to be your personal Github account unless you want it to happen on behalf of an organization where you work.

If you're looking or a sample repo then I'd recommend Betty which is a very cool thing I've just become aware of: [https://github.com/pickhardt/betty](https://github.com/pickhardt/betty)

# Using Forks to Find a More Recent Version of a Gem
One interesting aspect of forking a gem is there are lots of gems out there that lie fallow and you'd think "Damn.  It would be great if someone fixed this #$*(#*$#(#)) thing."  Well, often enough, that's happened but the fix is in a fork.  Because the fork isn't from an official maintainer, you aren't even aware of it unless you follow the forks.  Here's a great example, [term extract](https://github.com/rrphotosoft/term-extract/).

Here's a screenshot showing [its age](http://imgur.com/0xAGIhE)

This is a very cool implementation of what's called phrase extraction which takes a corpus of text and finds the phrases that matter.  The disappointing thing with it is that its 5 to 6 years old.  Rather than walking away like I normally do, I clicked on the # next to the fork button and that showed me [this](http://imgur.com/AlZm3Wz).

What I see here is that a user named [rrphotosoft](https://github.com/rrphotosoft/) has a newer version of the gem.  Now if I want to use this for my Rails application then I can just add it to Gemfile with the :git syntax:

gem 'term-extract', :git => 'https://github.com/rrphotosoft/term-extract/'

# Making Your Own Version of a Gem
But what if there isn't a newer fork of a gem, what then?  Well thankfully its actually pretty easy to get around:

1.  Fork the gem to your own Github account.
2.  Clone the gem to your computer.
3.  Modify the source code as needed (global search is a huge help here)
4.  Save the changes with the normal:
* git add .
* git commit -m "Some basic description"
* git push origin master
5.  Add the gem to your Gemfile using the :git => "" syntax above.  Please note that the url you need here is the https clone syntax not the ssh clone syntax.

# Installing Your Own Version to Use Locally
I recently forked a gem named [Orats](https://github.com/nickjj/orats) which builds a stubbed application for generating Dockerized rails apps.  I'm still on the fence regarding Docker for production work -- I love it conceptually -- but there are some learning hurdles I'm facing.  Anyway here's my [fork](https://github.com/fuzzygroup/orats) where I've been working on adding additional templates for using MySQL instead of postgres and building Rails 5 api applications.

Now the weird issue here is that Orats is a gem you install onto your computer so you can use it yourself instead of packaging it into a Gemfile.  What you need to do here is the normal:

* fork
* change it as needed
* add / commit / push

Next you'll need a new bit of tooling, a gem named "specific_install":

gem install specific_install

This gem lets you specify what gem you're installing so it skips the "find canonical location" and takes a url instead so you can do this:

gem specific_install https://github.com/fuzzygroup/orats.git

And then you'll get my version of Orats -- bear in mind that mine is still a work in progress and the maintainer is doing really good, important work.  Go support [Nick](http://nickjanetakis.com/blog/dockerize-a-rails-5-postgres-redis-sidekiq-action-cable-app-with-docker-compose) please -- this is just an example.

# Another Approach to Local Usage

I just got an email from [Nick](http://nickjanetakis.com/) who wrote the Orats gem and he was kind enough to give me this tip:

Btw to get around some of your local gem issues. You could just run your fork directly without "installing" it. Meaning if your forked version were sitting in a folder you could just goto that folder and run bin/orats --help. Then you can actively hack away on the gem and run it as you go. This is how I develop the gem.

Then in your case, you could figure the orats on your system path (the one gem installed) is the official one where as the local one in the folder that you must run directly is your fork.

Of course this only works if you're the only person using it, otherwise you would need to do what you're doing if others plan to run it.

Thanks Man!

# Getting Your Changes Back to the Master: The Pull Request

Since I finished this last night, I've since made a change to the Betty gem I referenced above and I think this change is worthwhile enough that I want to get it up to the original author.  This requires making what's called a Pull Request.  So here's how to do that:

1.  Make your changes and do the add / commit / push dance
2.  Goto **your** github account for the for the forked repo and click New Pull Request (the common mistake here is to go to the destination repo and click this; you don't have permissions there; you're creating a pull request **FROM** your repo **TO** their repo)
3.  Describe the changes and then submit the request.

You should understand that getting your pull request approved isn't necessarily easy - it varies by project, complexity of change, whether the code is tested or not and other factors.  Usually you'll see a back and forth discussion process after which if you meet the maintainer's needs, it is accepted.

Here's a solid [tutorial on pull requests](https://yangsu.github.io/pull-request-tutorial/).

# Credits
I couldn't have written this without the assistance of [Dv](http://dasari.me/), a long time pairing partner of mine.  Thanks man.
