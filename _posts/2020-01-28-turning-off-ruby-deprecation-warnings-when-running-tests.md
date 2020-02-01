---
layout: post
title: Turning Off Ruby Deprecation Warnings When Running Tests
category: rails
tags: ["rails"]
---
{:.center}
![IMG_1384.jpeg](/blog/assets/IMG_1384.jpeg)

The combination of Rails 6 and Ruby 2.7, or perhaps just Rails 6, introduced some new deprecation warnings and, lately, I've been seeing this cruft constantly:

    rails test test/models/
    Running via Spring preloader in process 34024
    /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/activemodel-6.0.2.1/lib/active_model/type/integer.rb:13: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
    /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/activemodel-6.0.2.1/lib/active_model/type/value.rb:8: warning: The called method `initialize' is defined here
    /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/activerecord-6.0.2.1/lib/active_record/connection_adapters/postgresql/oid/specialized_string.rb:12: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
    /Users/sjohnson/.rvm/gems/ruby-2.7.0/gems/activemodel-6.0.2.1/lib/active_model/type/value.rb:8: warning: The called method `initialize' is defined here
    
And, in the immortal words of [Twisted Sister](https://www.youtube.com/watch?v=4xmckWVPRaI), we're not going to take it anymore.

The solution is a bit more byzantine than I have found in the Rails world and a bunch of the options in the [Stack Overflow "top of Google" but no longer accurate post](https://stackoverflow.com/questions/5591509/suppress-ruby-warnings-when-running-specs) no longer work or aren't quite what you expect.

The easy solution is to add:

    $VERBOSE=nil
   
to the top of config/environments/test.rb so it looks like this:

```ruby
$VERBOSE=nil
Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # The test environment is used exclusively to run your application's
  # test suite. You never need to work with it otherwise. Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs. Don't rely on the data there!
  config.cache_classes = false
  
```

Obviously the rest of the file has to be there but that $VERBOSE=nil silences all the cruft.  

One other solution, RUBYOPT="-W0", prepended before you run the test doesn't work with the new use of "rails" to run your tests but does work with "rake" to run your tests so:

    RUBYOPT=W0 rake test test/models/
  
Now, that said, $VERBOSE=nil is a better option because it goes in at the project level and affects all developers on the project.