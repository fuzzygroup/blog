---
layout: post
title: When RVM Seems Insane Run bundle install
date: 2022-05-30 11:31 -0400
category: rails
tags: ["rails", "ruby", "rvm"]
---
{% pizzaforukraine  %}

So I just had this disconcerting moment of weirdness:

		❯ rvm use 3.1.0
		Using /Users/sjohnson/.rvm/gems/ruby-3.1.0

		coding/rails/cartazzi via  v18.2.0 via 💎 v3.1.0 on ☁️  (us-west-2)
		❯ ruby -v
		ruby 3.1.0p0 (2021-12-25 revision fb4df44d16) [x86_64-darwin19]

		coding/rails/cartazzi via  v18.2.0 via 💎 v3.1.0 on ☁️  (us-west-2)
		❯ bundle exec rails c
		Your Ruby version is 2.6.3, but your Gemfile specified 3.1.0
		
What's going on here is:

1. I clearly told the system what ruby to us.
2. I verified it.
3. It told me "OH HELL NO"!

This took more than a moment of head scratching and then I hit on it:

    bundle install
		
And, after that completed:

		coding/rails/cartazzi via  v18.2.0 via 💎 v3.1.0 on ☁️  (us-west-2)
		❯ bundle exec rails c
		Loading development environment (Rails 7.0.2.2)
		3.1.0 :001 >