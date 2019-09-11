---
layout: post
title: Rails Tip - When in Doubt Bundle Exec
category: rails
tags: ["rails"]
---
I recently brought a newbie up into Rails the other day and their experience was that using:

    bundle exec command

automagically fixed everything.  They weren't wrong.  I've been doing this for years and years and my personal dev box is supposed to automagically pre-pend bundle exec where necessary and, even so, it is still sometimes necessary.  

Here's an example of the weirdness that bundle exec can fix:

    ➜  lauck git:(master) ✗ rails g model Project
    Ignoring bcrypt-3.1.13 because its extensions are not built.  Try: gem pristine bcrypt --version 3.1.13
    Ignoring bcrypt-3.1.12 because its extensions are not built.  Try: gem pristine bcrypt --version 3.1.12
    Ignoring bindex-0.8.1 because its extensions are not built.  Try: gem pristine bindex --version 0.8.1
    Ignoring bindex-0.7.0 because its extensions are not built.  Try: gem pristine bindex --version 0.7.0
    Ignoring binding_of_caller-0.8.0 because its extensions are not built.  Try: gem pristine binding_of_caller --version 0.8.0
    Ignoring bootsnap-1.4.5 because its extensions are not built.  Try: gem pristine bootsnap --version 1.4.5
    Ignoring bootsnap-1.4.4 because its extensions are not built.  Try: gem pristine bootsnap --version 1.4.4
    Ignoring byebug-11.0.1 because its extensions are not built.  Try: gem pristine byebug --version 11.0.1
    Ignoring childprocess-1.0.1 because its extensions are not built.  Try: gem pristine childprocess --version 1.0.1
    Ignoring debug_inspector-0.0.3 because its extensions are not built.  Try: gem pristine debug_inspector --version 0.0.3
    Ignoring nokogiri-1.10.3 because its extensions are not built.  Try: gem pristine nokogiri --version 1.10.3
    Ignoring nokogiri-1.10.4 because its extensions are not built.  Try: gem pristine nokogiri --version 1.10.4
    Ignoring nokogiri-1.10.3 because its extensions are not built.  Try: gem pristine nokogiri --version 1.10.3
    Ignoring nokogiri-1.10.4 because its extensions are not built.  Try: gem pristine nokogiri --version 1.10.4
    /Users/sjohnson/.rvm/gems/ruby-2.6.3/gems/railties-6.0.0/lib/rails/app_loader.rb:52:in `block in exec_app': undefined method `match?' for /(APP|ENGINE)_PATH/:Regexp (NoMethodError)
    Did you mean?  match
    	from /Users/sjohnson/.rvm/gems/ruby-2.6.3/gems/railties-6.0.0/lib/rails/app_loader.rb:48:in `loop'
    	from /Users/sjohnson/.rvm/gems/ruby-2.6.3/gems/railties-6.0.0/lib/rails/app_loader.rb:48:in `exec_app'
    	from /Users/sjohnson/.rvm/gems/ruby-2.6.3/gems/railties-6.0.0/lib/rails/cli.rb:7:in `<top (required)>'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.3/usr/lib/ruby/2.3.0/rubygems/core_ext/kernel_require.rb:68:in `require'
    	from /System/Library/Frameworks/Ruby.framework/Versions/2.3/usr/lib/ruby/2.3.0/rubygems/core_ext/kernel_require.rb:68:in `require'
    	from /Users/sjohnson/.rvm/gems/ruby-2.6.3/gems/railties-6.0.0/exe/rails:10:in `<top (required)>'
    	from /usr/bin/rails:22:in `load'
    	from /usr/bin/rails:22:in `<main>'

    ➜  lauck git:(master) ✗ which ruby
    /Users/sjohnson/.rvm/rubies/ruby-2.6.3/bin/ruby

And then when bundle exec is used, we get the normal frothy Rails goodness:

    ➜  lauck git:(master) ✗ bundle exec rails g model Project
    Running via Spring preloader in process 81386
          invoke  active_record
          create    db/migrate/20190911073916_create_projects.rb
          create    app/models/project.rb
          invoke    test_unit
          create      test/models/project_test.rb
          create      test/fixtures/projects.yml
          
There are times when being a software developer feels a striking amount like being Charlie Brown when Lucy keeps taking the ball away.  Oy.

{:.center}
![charlie_brown_lucy.png](/blog/assets/charlie_brown_lucy.png)
