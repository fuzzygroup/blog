---
layout: post
title: Customizing Jekyll's Index View
date: 2022-07-16 03:56 -0400
category: jekyll
tags: ["jekyll", "blogging"]
---
I swear that I have previously written this all down but I just can't find it so here it goes (again?).  The layout of my blog's home page, for the past N years, has been nothing but a long, long list of posts.  That worked when I had a few posts but now:

    ❯ ls -l _posts | wc -l
        1088

I no longer think this works.  

What I want to do is better organize my posts temporally.  What I want to do is keep all my posts on the home page because then I can use local search to find what I need.  Given that I don't, embarrassingly, have a search engine on my personal blog, this is the best tool I have. 

Here is my design goal:

    Year
      Month
        * article 1 in category x
        * article 2 in category y
        

## Understanding Your Jekyll Directory Structure

Let's start by looking at the layout of my Jekyll site:

    ❯ tree -d -L 1
    .
    ├── _attachments
    ├── _drafts
    ├── _includes
    ├── _layouts
    ├── _pages
    ├── _plugins
    ├── _posts
    ├── _sass
    ├── _site
    ├── assets
    ├── css
    ├── galleries
    ├── photos
    └── tmp
    
It is important to understand that there are also important Jekyll files in the **root directory** of the directory tree.  This is the thing that I always forget about Jekyll -- it builds from the root downward.  Here's an example of taking the Jekyll tree one layer deeper:
  
    ❯ tree -d -L 2
    .
    ├── _attachments
    ├── _drafts
    │   └── _site
    ├── _includes
    ├── _layouts
    ├── _pages
    ├── _plugins
    ├── _posts
    │   └── _site
    ├── _sass
    ├── _site
    │   ├── 2002
    │   ├── 2016
    │   ├── 2019
    │   ├── 2020
    │   ├── 2022
    │   ├── about
    │   ├── actionmailer
    │   ├── aggregator
    │   ├── alcohol
    │   ├── alexa
    │   ├── amazon
    │   ├── amazon_echo
    │   ├── ansible
    │   ├── anti_patterns
    │   ├── apache
    │   ├── assets
    │   ├── aws
    │   ├── barfleet
    │   ├── bash
    │   ├── betty
    │   ├── bias
    │   ├── blogging
    │   ├── book_review
    │   ├── bootstrap
    │   ├── brew
    │   ├── browser
    │   ├── camera
    │   ├── caprover
    │   ├── change
    │   ├── chef
    │   ├── chrome
    │   ├── chrome_cast
    │   ├── cicd
    │   ├── cocktails
    │   ├── computing_tips
    │   ├── cons
    │   ├── consulting
    │   ├── cooking
    │   ├── covid
    │   ├── covidnearme.org
    │   ├── css
    │   ├── curl
    │   ├── current_events
    │   ├── dad_why_do_you
    │   ├── data_pipeline
    │   ├── data_science
    │   ├── debugging
    │   ├── design
    │   ├── devops
    │   ├── disney
    │   ├── dns
    │   ├── docker
    │   ├── dropbox
    │   ├── ebook
    │   ├── electron
    │   ├── elixir
    │   ├── elm
    │   ├── email
    │   ├── facebook
    │   ├── fail
    │   ├── fatherhood
    │   ├── feedster
    │   ├── firefox
    │   ├── food
    │   ├── freelance
    │   ├── gaim
    │   ├── galleries
    │   ├── gaming
    │   ├── gender
    │   ├── git
    │   ├── github
    │   ├── gluten_free
    │   ├── gmail
    │   ├── google
    │   ├── google_calendar
    │   ├── hardware
    │   ├── hatchbox
    │   ├── health
    │   ├── heroku
    │   ├── hiring
    │   ├── home_ownership
    │   ├── home_security
    │   ├── hosting
    │   ├── house
    │   ├── how_to_be_a_developer
    │   ├── html
    │   ├── https
    │   ├── humor
    │   ├── hyperterm
    │   ├── ibooks
    │   ├── inbox_buddy
    │   ├── inventing
    │   ├── ipad
    │   ├── iphone
    │   ├── itunes
    │   ├── jekyll
    │   ├── jenkins
    │   ├── jobhound
    │   ├── kubernetes
    │   ├── lambda
    │   ├── laravel
    │   ├── learning
    │   ├── linux
    │   ├── login
    │   ├── mac
    │   ├── macbook
    │   ├── machine_learning
    │   ├── management
    │   ├── mariadb
    │   ├── markdown
    │   ├── marketing
    │   ├── medium
    │   ├── misc
    │   ├── mobile
    │   ├── mtu
    │   ├── music
    │   ├── mvp
    │   ├── mysql
    │   ├── netlabeler
    │   ├── news
    │   ├── nginx
    │   ├── node
    │   ├── ntergaid
    │   ├── nushell
    │   ├── offsite
    │   ├── okr
    │   ├── optimization
    │   ├── osx
    │   ├── osx_to_linux
    │   ├── pair_programming
    │   ├── parenting
    │   ├── personal
    │   ├── philosophy
    │   ├── phone
    │   ├── photos
    │   ├── php
    │   ├── pipeline
    │   ├── podcasting
    │   ├── politics
    │   ├── pop_culture
    │   ├── post_mac
    │   ├── postgres
    │   ├── postmac
    │   ├── python
    │   ├── rails
    │   ├── rails2elixir
    │   ├── rant
    │   ├── react
    │   ├── reading
    │   ├── redis
    │   ├── regex
    │   ├── relationships
    │   ├── remote_work
    │   ├── road\ warrior
    │   ├── rspec
    │   ├── rss
    │   ├── ruby
    │   ├── rust
    │   ├── saas
    │   ├── saml
    │   ├── sbi
    │   ├── search
    │   ├── security
    │   ├── shell
    │   ├── side_project
    │   ├── slumgullion
    │   ├── software_engineering
    │   ├── software_worth_purchasing
    │   ├── sphinx
    │   ├── sql
    │   ├── ssl
    │   ├── startup
    │   ├── story.radio.weblogs.com
    │   ├── stripe
    │   ├── student
    │   ├── sync
    │   ├── sysadmin
    │   ├── tdd
    │   ├── tech
    │   ├── terminal
    │   ├── test\ coverage
    │   ├── text
    │   ├── textmate
    │   ├── tmux
    │   ├── tools
    │   ├── trix
    │   ├── twitter
    │   ├── ubuntu
    │   ├── unix
    │   ├── usability
    │   ├── video
    │   ├── video\ conferencing
    │   ├── vim
    │   ├── vpn
    │   ├── webdev
    │   ├── weight_loss
    │   ├── wifi
    │   ├── windows
    │   ├── wordpress
    │   ├── writing
    │   ├── wunderlist
    │   ├── xbox
    │   ├── youtube
    │   └── zed
    ├── assets
    │   ├── aws
    │   ├── elixircon
    │   ├── pfu
    │   ├── surviving-disney-world
    │   └── tech_war_stories
    ├── css
    ├── galleries
    │   └── 2016-09-13-disney-wild-trek-africa
    ├── photos
    │   └── disneywildtrekafrica
    └── tmp

    227 directories
  
If we look at this one bit further then we can see that what Jekyll does is take things in a given category and publish them under _site/category_name.  Here's an example of the tree command showing things right down to the post level:

    tree _site/rust 
    _site/rust
    ├── 2020
    │   ├── 02
    │   │   ├── 21
    │   │   │   └── great-rust-libraries-tools.html
    │   │   ├── 23
    │   │   │   └── generating-your-first-rust-app-with-cargo.html
    │   │   └── 29
    │   │       └── getting-access-to-rust-docs-when-you-are-offline.html
    │   ├── 03
    │   │   └── 02
    │   │       └── using-rust-playground-for-hello-world-and-variable-interpolation.html
    │   ├── 05
    │   │   └── 08
    │   │       └── your-basic-rust-workflow.html
    │   └── 06
    │       └── 03
    │           └── simple-rust-programs-01-checking-the-existence-of-a-directory.html
    └── 2022
        ├── 06
        │   └── 30
        │       └── web-based-rust-development-tools.html
        └── 07
            └── 08
                └── rust-alternatives-to-textmate-2-the-agony-of-despair.html
    
    16 directories, 8 files

## Now to Customize Our Layout

The default filename for any website is index.html or index.htm and Jekyll does not disappoint -- there is an index.html file in the root of our site.  That's the file we need to customize.  Here's what mine used to look like (remember I've already customized it):

{:.center}
![Pizza](/blog/assets/jekyll01.png)

The important bit is the for loop:

{:.center}
![Pizza](/blog/assets/jekyll02.png)

This is in the [liquid template](https://shopify.github.io/liquid/) syntax and what it is doing is looping over the array structure site.posts and then outputting a link to an article.

**Note**: The template listing above is actually an image.  Why?  Because when I tried to write about it, Jekyll executed the template and stuff into the middle of this article a list of all my blog posts.  **Chuckle**.

Here's what I ended up changing this to:

{:.center}
![Pizza](/blog/assets/jekyll03.png)

As you can see, we are still looping over site.posts -- that is still the correct data structure -- but we have some if logic which outputs a heading for every month and then a link to each article as well as a link to the main category.

In the process of writing this article, I changed it yet again to add after the in category to add "tags as ..." where the ... was replaced by a list of tags.  Here's how that looked:

{:.center}
![Pizza](/blog/assets/jekyll04.png)

The cool bit was the if forloop.last else construct which made sure there was no trailing comma character after the last tag name.  

## Conclusion

Modifying Jekyll's home page, something I put off forever, was actually really easy.  I need to remember that when I'm scared off by something, it is generally better to charge ahead and try.  A note to myself.

## See Also

* [Vsoch](https://vsoch.github.io/2019/jekyll-lists/)
* [talk.jekyll](https://talk.jekyllrb.com/t/separate-items-in-array-with-commas-except-last/4041)