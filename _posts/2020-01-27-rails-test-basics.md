---
layout: post
title: Rails Test Basics
category: rails
tags: ["rails", "test"]
---
{:.center}
![IMG_1419.jpeg](/blog/assets/IMG_1419.jpeg)

More than a decade using RSpec has left me flummoxed in terms of "classical" Rails testing.  I'm on a new project built using the Jumpstart application template and all the tests are standard Rails tests so here's a quick recap that I wrote, well, to force myself to step back in time and go "old school".  And if you don't like my version then you should really read [this](https://guides.rubyonrails.org/testing.html).

## Running Tests

The very basic of testing is nothing more than test execution so to run all model tests:

    rails test test/models/

and to run one file

    rails test test/models/user_test.rb    

and to run everything:

    rails test     

and to run with verbose mode:

    rails test -v test/models  

and to run verbosely and fail on the first test failure:

    rails test -v -f test/helpers/application_helper.rb

and to run just one specific test:

    rails test test/controllers/labels_controller_test.rb:9

Note: RSpec is very good at running the next test if the line number shifts a bit (example you put in :8 but you added a line so its actually :9).  With standard rails test, you get this madness:

    ❯ rails test test/controllers/projects_controller_test.rb:17
    Running via Spring preloader in process 95090
    Run options: --seed 52687
    
    # Running:
    
    Finished in 0.010622s, 0.0000 runs/s, 0.0000 assertions/s.
    0 runs, 0 assertions, 0 failures, 0 errors, 0 skips

The 0 runs, 0 assertions, 0 failures, 0 errors, 0 skips can best be interpreted as:

> Yo! Hoser! I don't know what to do here so I'm going to confuse you deliberately. Ha Haw!

## Death to Fixtures; Viva La Factory Bot

Within the RSpec world, we long, long ago tossed out the concept of static fixtures and embraced the world of Factories via [FactoryBot](https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md). I haven't used classical Rails testing with FactoryBot before but here's what to do:

1. Add FactoryBot to Gemfile in a test section.
2. Run bundle install.
3. Create a factories directory mkdir test/factories
4. Generate a sample factory
5. Add include FactoryBot::Syntax::Methods to the top of test/test_helper.rb
6. Stop spring with  bin/spring stop
7. Start spring with  bin/spring start
8. Write a simple test using FactoryBot like my [test foo blog post](https://fuzzyblog.io/blog/rspec/2020/01/03/ruby-testing-technique-the-power-and-stupidity-of-def-foo.html).
9. Run the test.

Here's a sample test using my foo example:

```ruby
require 'test_helper'

class LabelTest < ActiveSupport::TestCase
  
  test 'should return foo' do
    subject = FactoryBot.create(:label)
    assert_equal subject.foo, 'bar'
  end
  
  test 'should return FOO' do
    assert_equal Label.foo, 'BAR'
  end
end
```

## Writing Tests

As shown above, the canonical test operator is assert_something (or just assert).  Above I am using assert_equal but there are lots of assertion statements including:

* assert
* assert_equal
* assert_response
* assert_difference do
* assert_redirected_to
* assert_not_nil
* assert_no_difference do
* assert_match
* assert_select

And I am certain that there are more but this is a decent sampling of most of the assertion statements that I can remember using once upon a time.

## Using assert_redirected_to

Here's a minimal example of assert_redirected_to:

```ruby
test "should get index and redirect to / when logged in and no projects" do 
  get labels_url
  assert_redirected_to new_user_session_path
end
```



