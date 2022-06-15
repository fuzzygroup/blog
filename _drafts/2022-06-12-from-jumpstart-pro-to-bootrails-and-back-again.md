---
layout: post
title: From Jumpstart Pro to BootRails and Back Again
date: 2022-06-12 07:44 -0400
category: rails
tags: ["rails", "jumpstart", "bootrails", "cartazzi"]
---
I am not afraid to admit when I made a mistake.  This is a tale of just such a mistake, one that has now cost me **13** working days and during a point when I took my rails stats on a brand new application from:

    +----------------------+--------+--------+---------+---------+-----+-------+
    | Name                 |  Lines |    LOC | Classes | Methods | M/C | LOC/M |
    +----------------------+--------+--------+---------+---------+-----+-------+
    | Controllers          |    614 |    400 |      24 |      74 |   3 |     3 |
    | Helpers              |     17 |     15 |       0 |       3 |   0 |     3 |
    | Jobs                 |     13 |      9 |       2 |       1 |   0 |     7 |
    | Models               |     99 |     65 |       8 |       3 |   0 |    19 |
    | Mailers              |     52 |     30 |       2 |       5 |   2 |     4 |
    | Views                |   3909 |   3586 |       0 |       0 |   0 |     0 |
    | Stylesheets          |     15 |     15 |       0 |       0 |   0 |     0 |
    | Libraries            |      8 |      7 |       0 |       0 |   0 |     0 |
    | Controller tests     |    643 |    529 |      10 |      84 |   8 |     4 |
    | Helper tests         |      0 |      0 |       0 |       0 |   0 |     0 |
    | Model tests          |      0 |      0 |       0 |       0 |   0 |     0 |
    | Integration tests    |      0 |      0 |       0 |       0 |   0 |     0 |
    +----------------------+--------+--------+---------+---------+-----+-------+
    | Total                |   5370 |   4656 |      46 |     170 |   3 |    25 |
    +----------------------+--------+--------+---------+---------+-----+-------+
      Code LOC: 4127     Test LOC: 529     Code to Test Ratio: 1:0.1

to:

    +----------------------+--------+--------+---------+---------+-----+-------+
    | Name                 |  Lines |    LOC | Classes | Methods | M/C | LOC/M |
    +----------------------+--------+--------+---------+---------+-----+-------+
    | Controllers          |   2040 |   1152 |      36 |     206 |   5 |     3 |
    | Helpers              |    111 |     60 |       0 |       6 |   0 |     8 |
    | Jobs                 |     13 |      9 |       2 |       1 |   0 |     7 |
    | Models               |   2351 |    790 |      23 |      60 |   2 |    11 |
    | Mailers              |     52 |     30 |       2 |       5 |   2 |     4 |
    | Views                |   6538 |   5616 |       0 |       0 |   0 |     0 |
    | Stylesheets          |  14509 |  10293 |       0 |       0 |   0 |     0 |
    | JavaScript           |      1 |      0 |       0 |       0 |   0 |     0 |
    | Libraries            |    390 |    268 |       0 |       0 |   0 |     0 |
    | Controller tests     |   2063 |   1302 |      22 |     211 |   9 |     4 |
    | Helper tests         |      0 |      0 |       0 |       0 |   0 |     0 |
    | Model tests          |    719 |    382 |      15 |      44 |   2 |     6 |
    | Integration tests    |      0 |      0 |       0 |       0 |   0 |     0 |
    +----------------------+--------+--------+---------+---------+-----+-------+
    | Total                |  28787 |  19902 |     100 |     533 |   5 |    35 |
    +----------------------+--------+--------+---------+---------+-----+-------+
      Code LOC: 18218     Test LOC: 1684     Code to Test Ratio: 1:0.1

And here is my tale of making a mistake and then correcting from it.  For the past five years, I've had an idea about a side project (call it Cartazzi) that **I really wanted for myself** as a development tool.  It was heavily front end oriented and I, while skilled, am, shall we say, front end challenged.  Every time I did serious development, this project would hang in my mind and I'd say "Yep; still damn need it".  And every time, I'd make some notes about feature set and then put it back on my mental shelf.  

And then I got an email from Mike, someone who had found my [JobHound site](https://www.jobhound.io).  I didn't know Mike at all but he raved about JobHound, something I built back in 2018.  He pointed out that it was: 

* still better than anything on the market
* had helped him land a job
* but had broken SSL 
* and I should really at least fix that

So I rolled up my sleeves and did exactly what he said.  I also took the time to add new front end features like when you add a job, it should fetch the metadata via Ajax, show error messages correctly, etc.  And, along the way, I once again hit the problems that Cartazzi would solve.  And, finally, I decided I was ready to build it.

Huzzah!!!

## Application Template versus Technology Framework

I'm a Ruby on Rails developer.  One of the interesting developments in the Rails world over the past few years has been the advent of 


Rails, for me, was one of those transition events.  I look at my

## Developer Know Thyself

I am, at my core, an application developer. I like solving problems through software,  And, if I have to, I'll go deep on infrastructure to do so but I really, really don't want to.  Just for example, I know what I'm building will have a SAAS component.  

## And So I Bought BootRails



## Signs of Problem 1: Deploy Failed Due to Vite

I'm an advocate of what I call Deploy First Development (DFD) for all web applications.  I strongly believe that all web applications should be:

* Initially stood up as almost nothing
* Deployed onto a production url
* Used throughout the development process with actual data by the development team
* Continuously deployed throughout the development process

Generally speaking, web applications have large numbers of dependencies and as they grow, the dependencies grow.  What is initially simple grows in complexity and while you can almost always deploy easily on Day 0, by Day 100, well, you might not be able to deploy it at all.  

## Signs of Problem 2: Complete Test Failures

And then came June 10 (2 days ago).  

## And Then My Machine Crashed

* can't log in
* disable the new project link 
* can't find the login route in rails routes
* now login form auto refreshes every 30 seconds or so so I can't login

## Signs of Problem 3: 

## Mistake 01: Not Recognizing How Important Deploy

## Was it Really 13 Days?

## BootRails Issues Summarized

Vite crashes 

Suggestions for BootRails

1. Ship with a file of constants so you can change things like "MyApp" in one place not N places.
2. Don't use source code level SVG's for the home page images
3. Don't ship a commercial, paid product with spelling errors.  Particularly don't do it on the home page.  Just don't.  (Give rythm to the design by repeating sections)
4. tests don't work out of the box:
5. bin/rails db:migrate RAILS_ENV=test
6. you used fixtures not factorybot
7. you fuckers - you didn't include test support for rodauth
8. /Users/sjohnson/.rvm/gems/ruby-3.0.0/gems/cypress-rails-0.5.4/lib/cypress-rails/rake.rb:2: warning: already initialized constant CLI
9. /Users/sjohnson/.rvm/gems/ruby-3.0.0/gems/cypress-rails-0.5.4/lib/cypress-rails/rake.rb:2: warning: previous definition of CLI was here
10. rails aborted!
11. no configuration for active storage
12. TypeError: no implicit conversion of Symbol into Array
13. /Users/sjohnson/Sync/coding/rails/cartazzi/config/initializers/cypress_rails.rb:9:in `<top (required)>'
14. /Users/sjohnson/Sync/coding/rails/cartazzi/config/environment.rb:5:in `<top (required)>'
15. Tasks: TOP => db:migrate => db:load_config => environment
16. (See full trace by running task with --trace)
17. Move to a generator NOT a git repo
18. Import map utility isn't there 
19. Add font awesome free to your base
20. Factories over fixtures
21. 
22. I find some of your choices on gems confusing
23. Debug gem does not work
24. Having to rename it is stupid: https://www.bootrails.com/blog/how-to-rename-a-rails-app/
25. vite doesn't work on deployment via HatchBox 
26. 	12: from /usr/local/Cellar/foreman/0.87.2/libexec/bin/foreman:23:in `<main>'
27. 	11: from /usr/local/Cellar/foreman/0.87.2/libexec/bin/foreman:23:in `load'
28. 	10: from /usr/local/Cellar/foreman/0.87.2/libexec/gems/foreman-0.87.2/bin/foreman:7:in `<top (required)>'
29. 	 9: from /usr/local/Cellar/foreman/0.87.2/libexec/gems/foreman-0.87.2/lib/foreman/vendor/thor/lib/thor/base.rb:443:in `start'
30. 	 8: from /usr/local/Cellar/foreman/0.87.2/libexec/gems/foreman-0.87.2/lib/foreman/vendor/thor/lib/thor/shell.rb:17:in `shell'
31. 	 7: from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
32. 	 6: from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
33. 	 5: from /usr/local/Cellar/foreman/0.87.2/libexec/gems/foreman-0.87.2/lib/foreman/vendor/thor/lib/thor/shell/color.rb:1:in `<top (required)>'
34. 	 4: from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
35. 	 3: from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
36. 	 2: from /usr/local/Cellar/foreman/0.87.2/libexec/gems/foreman-0.87.2/lib/foreman/vendor/thor/lib/thor/shell/basic.rb:2:in `<top (required)>'
37. 	 1: from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
38. /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require': incompatible library version - /Users/sjohnson/.rvm/gems/ruby-3.1.0/gems/io-console-0.5.11/lib/io/console.bundle (LoadError)


For any enquiries, don't hesitate to drop us an e-mail, we take time to answer emails one by one :)

Can't open a discussion thread for rodauth:

https://github.com/jeremyevans/rodauth/discussions/240

>>  In general, it's best to test applications using Rodauth with a tool such as capybara. See Rodauth's test suite for examples.

https://stackoverflow.com/questions/54910651/factorybot-activerecordrecordinvalid-validation-failed-year-is-required
  There's nothing wrong with the year value in the factory you've displayed, so my guess would be that one of the associated models you have in this factory also requires a year and the default factory for that other model doesn't provide it.

  With factories always be thinking what other things are happening.


https://github.com/jeremyevans/rodauth/discussions/new