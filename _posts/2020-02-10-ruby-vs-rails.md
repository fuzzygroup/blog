---
layout: post
title: Ruby vs Rails
category: ruby
tags: ["ruby", "rails"]
---
{:.center}
![IMG_1812.jpeg](/blog/assets/IMG_1812.jpeg)

I always find it interesting when I hit a Rails-ism when I'm working in a pure Ruby context. I define a Rails-ism as something that is one way in Ruby and another way in Rails. In this case I'm writing a simple background daemon which is going to stream data out of the Twitter sample stream and commit to Kafka for downstream processing.  

Here's the first thing that bit me:

```ruby
TOPIC = ENV['TOPIC']

if TOPIC.blank?
  puts "No topic specified; exiting"
  exit
end
```

And this gave an immediate failure:

    ❯ TOPIC=twitter RAILS_ENV=development ruby kafka_loader.rb
    Traceback (most recent call last):
    kafka_loader.rb:19:in `<main>': undefined method `blank?' for "twitter":String (NoMethodError)

The easiest way to understand something like this is to test it in irb.  The irb tool is the underlying engine in rails console ("rails c") but without your application specific classes loaded in so it is just pure ruby.

Here's how you would test something like this in irb:

    2.7.0 :001 > "".blank?
    Traceback (most recent call last):
           16: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/friendly_errors.rb:123:in `with_friendly_errors'
           15: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/bundler-2.1.2/libexec/bundle:46:in `block in <top (required)>'
           14: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli.rb:24:in `start'
           13: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/vendor/thor/lib/thor/base.rb:476:in `start'
           12: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli.rb:30:in `dispatch'
           11: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/vendor/thor/lib/thor.rb:399:in `dispatch'
           10: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/vendor/thor/lib/thor/invocation.rb:127:in `invoke_command'
            9: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/vendor/thor/lib/thor/command.rb:27:in `run'
            8: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli.rb:476:in `exec'
            7: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli/exec.rb:28:in `run'
            6: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli/exec.rb:63:in `kernel_load'
            5: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli/exec.rb:63:in `load'
            4: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `<top (required)>'
            3: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `load'
            2: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2.1/exe/irb:11:in `<top (required)>'
            1: from (irb):1
    NoMethodError (undefined method `blank?' for "":String)
    2.7.0 :002 > "".empty?
     => true
    2.7.0 :003 >

Off the top of my head, I knew that .empty? was the underlying method that .blank? was aliased to.  And I could test either of these on an empty string as a way to figure this out.  When you have this type of thing, a quick google for "rails whatever" often is all you need to understand it.  The top hit for *rails blank?* was a nicely written piece by [Arkency](https://blog.arkency.com/2017/07/nil-empty-blank-ruby-rails-difference/).