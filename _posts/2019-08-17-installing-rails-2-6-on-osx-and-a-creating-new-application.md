---
layout: post
title: Installing Rails 2.6 on OSX and a Creating New Application
category: rails
tags: ["rails"]
---
So Rails 2.6 has been released and I just went thru the normal update dance.  Here's how I handled upgrading my system.  Let's start with the basics:

* rvm
* OSX Mojave
* Ruby 2.5.1
* MySQL (yeah, yeah I know; not apologizing)

Here is what I did (you should know that I hit issues with older versions of Yarn and Node so I've included updating them as part of this):

1.  Started a terminal session.
2.  Verified my ruby version:

    ruby --version

3. Verified my rails version:

    rails --version
    
4.  Upgrade Yarn:

    curl -o- -L https://yarnpkg.com/install.sh | bash
    
5.  You can either start a new terminal to get your path exports correct (it is set on Terminal start) or simply do this:

    export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

6.  Upgrade node:

    brew upgrade node
    
7.  Upgrade Ruby to 2.6.2 (not required but I figured why not):

    rvm install 2.6.2
    
8. Change to the new ruby:

    rvm use ruby-2.6.2
    
9.  Generate a new application:

    rails new lauck --database=mysql
    
10. If you got anxious and generated a new application prior to installing a new ruby then, you would need to update the Gemfile to reflect the Ruby version and bundle install.

**Note**: I've named this new test application after one of my favorite librarians.  

# References:

* [Rails 6 Announcement](https://weblog.rubyonrails.org/2019/8/15/Rails-6-0-final-release/)
* [Rails 6 Release Notes](https://edgeguides.rubyonrails.org/6_0_release_notes.html)
* [Rails 6 on Hacker News](https://news.ycombinator.com/item?id=20717886)




