---
layout: post
title: When You Can't Run Rails Console Restart Spring
category: rails
tags: ["rails"]
---
{:.center}
![IMG_1621.jpeg](/blog/assets/IMG_1621.jpeg)

So I just hit this little gem of a pissant thing (yep - it is already that type of day):

    RAILS_ENV=development rails c
    /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/railties-6.0.2.1/lib/rails/application/configuration.rb:241:in `database_configuration': Cannot load database configuration:
    Could not load database configuration. No such file - ["config/database.yml"] (RuntimeError)

The issue was that I changed my underlying project directory and then had to re clone at the git level.  The culprit, naturally, was Spring so it took a:

    bin/spring stop
    bin/spring start
    
And this time, I actually put the answer into [Stack Overflow](https://stackoverflow.com/questions/32539062/rails-could-not-load-database-configuration-no-such-file/60024457#60024457); I wonder if it will get accepted.