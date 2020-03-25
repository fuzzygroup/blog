---
layout: post
title: A Drop Dead Stupid Rails Testing Trick
category: rails
tags: ["rails", "testing"]
---
This is an old school trick that you use when you don't have a robust test suite and / or a CI environment.  When you run Rails in development mode it is VERY, VERY forgiving of little details like syntax errors -- the type of thing that grind your web server to a hard stop.  

The trick is to use **RAILS_ENV=production** in development mode and that causes syntax errors to get caught:

    RAILS_ENV=production bundle exec rails s -p3169

Here's an example stack trace:

    	20: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/tsort.rb:228:in `block in tsort_each'
    	19: from /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/railties-6.0.2.1/lib/rails/initializable.rb:61:in `block in run_initializers'
    	18: from /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/railties-6.0.2.1/lib/rails/initializable.rb:32:in `run'
    	17: from /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/railties-6.0.2.1/lib/rails/initializable.rb:32:in `instance_exec'
    	16: from /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/railties-6.0.2.1/lib/rails/application/finisher.rb:122:in `block in <module:Finisher>'
    	15: from /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/zeitwerk-2.2.2/lib/zeitwerk/loader.rb:449:in `eager_load_all'
    	14: from /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/zeitwerk-2.2.2/lib/zeitwerk/loader.rb:449:in `each'
    	13: from /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/zeitwerk-2.2.2/lib/zeitwerk/loader.rb:338:in `eager_load'
    	12: from /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/zeitwerk-2.2.2/lib/zeitwerk/loader.rb:338:in `synchronize'
    	11: from /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/zeitwerk-2.2.2/lib/zeitwerk/loader.rb:346:in `block in eager_load'
    	10: from /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/zeitwerk-2.2.2/lib/zeitwerk/loader.rb:682:in `ls'
    	 9: from /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/zeitwerk-2.2.2/lib/zeitwerk/loader.rb:682:in `foreach'
    	 8: from /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/zeitwerk-2.2.2/lib/zeitwerk/loader.rb:685:in `block in ls'
    	 7: from /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/zeitwerk-2.2.2/lib/zeitwerk/loader.rb:351:in `block (2 levels) in eager_load'
    	 6: from /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/zeitwerk-2.2.2/lib/zeitwerk/loader.rb:351:in `const_get'
    	 5: from /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/zeitwerk-2.2.2/lib/zeitwerk/kernel.rb:16:in `require'
    	 4: from /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/bootsnap-1.4.6/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:31:in `require'
    	 3: from /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/bootsnap-1.4.6/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:22:in `require_with_bootsnap_lfi'
    	 2: from /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/bootsnap-1.4.6/lib/bootsnap/load_path_cache/loaded_features_index.rb:92:in `register'
    	 1: from /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/bootsnap-1.4.6/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:23:in `block in require_with_bootsnap_lfi'
    /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/bootsnap-1.4.6/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:23:in `require': /Users/sjohnson/Sync/coding/rails/covid_morbidity/app/controllers/symptoms_controller.rb:53: syntax error, unexpected local variable or method, expecting '}' (SyntaxError)
          ip_address: request.remote_ip,
          ^~~~~~~~~~
    /Users/sjohnson/Sync/coding/rails/covid_morbidity/app/controllers/symptoms_controller.rb:54: syntax error, unexpected tLABEL, expecting '='
          user_agent: request.user_agent
          ^~~~~~~~~~~
    /Users/sjohnson/Sync/coding/rails/covid_morbidity/app/controllers/symptoms_controller.rb:55: syntax error, unexpected '}', expecting `end'
        }
        ^
        
Ideally you would never have to do this but it really can be a useful trick when you don't have a full CI environment setup.