---
layout: post
title: How to Vendor Gem a Gem
---
Gems offer prebuilt software components for the Ruby / Rails space.  What they don't offer, when used as a gem, is the ability to modify their source code.  Unlike a traditional Rails plugin which was installed into your application tree, gems tend to exist in a magical, hidden bundle location.  When you can do, however, is "vendor gem" them so that you can easily modify / update them.  Ideally we'd all make our changes as pull requests against the canonical git repo but sometimes there isn't time.  So here are the steps:

1. Install a gem into your Gemfile.
2. run bundler:
bundle install
3. Unpack it.  Here's an example:
gem unpack anemone<br/>
4. This will put it into the root dir of your Rails application so now move it to vendor/gems:
mv anemone-0.7.2 vendor/gems<br/>
5. Go into your gem file and modify the line:<br/>
gem 'anemone'<br/>
to look something like this:<br/>
gem 'anemone', '0.7.2', :path => "vendor/gems/anemone-0.7.2"<br/>
6. run bundler again:<br/>
 bundle install<br/>
7. Git add / commit / push

Thanks to Jared for helping me (once again) with this.  Hopefully now that I took the time to document it, it won't be as hard next time...