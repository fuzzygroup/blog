---
layout: post
title: Warning in Rails Console Factory Bot Doesn't Seem to reload! Correctly
date: 2022-06-08 08:13 -0400
category: rails
tags: ["rails", "ruby", "FactoryBot"]
---
{% pizzaforukraine  %}

I'm actively engaged in greenfield development once again and I'm learning / relearning things that I likely have known in the past.  I don't know if this is a known issue, a bug or maybe a design choice.  Either way, I found it useful to know this so I thought it was useful to document it.  

I spend a **lot** of time in rails console (thank you Jared for beating this into me a thousand, thousand years ago; hope you are well) and reload! normally works pretty damn well but this one caught me hard.  Take a look at this back trace

```ruby
link = FactoryBot::create(:link)
  TRANSACTION (0.1ms)  BEGIN
  Account Create (0.2ms)  INSERT INTO "accounts" ("email", "status", "role") VALUES ($1, $2, $3) RETURNING "id"  [["email", "howard@watsica.com"], ["status", "verified"], ["role", "customer"]]
  Account::PasswordHash Create (0.2ms)  INSERT INTO "account_password_hashes" ("id", "password_hash") VALUES ($1, $2) RETURNING "id"  [["id", 63], ["password_hash", "[FILTERED]"]]
  TRANSACTION (0.5ms)  COMMIT
/Users/sjohnson/.rvm/gems/ruby-3.0.0/gems/activemodel-7.0.3/lib/active_model/attribute_methods.rb:458:in `method_missing': undefined method `account=' for #<Link id: nil, created_at: nil, updated_at: nil, date_created_at: nil, account_id: nil, team_id: nil, link_type_id: nil, active: true, url: "https://www.example.com/", name: "Cartazzi App on development", project_id: nil, code_environment_id: nil> (NoMethodError)
Did you mean?  account_id=
3.0.0 :014 > reload!
Reloading...
true
3.0.0 :015 > link = FactoryBot::create(:link)
  TRANSACTION (0.1ms)  BEGIN
  Account Create (0.3ms)  INSERT INTO "accounts" ("email", "status", "role") VALUES ($1, $2, $3) RETURNING "id"  [["email", "chu_carter@schaden.name"], ["status", "verified"], ["role", "customer"]]
  Account::PasswordHash Create (0.3ms)  INSERT INTO "account_password_hashes" ("id", "password_hash") VALUES ($1, $2) RETURNING "id"  [["id", 64], ["password_hash", "[FILTERED]"]]
  TRANSACTION (0.5ms)  COMMIT
/Users/sjohnson/.rvm/gems/ruby-3.0.0/gems/activemodel-7.0.3/lib/active_model/attribute_methods.rb:458:in `method_missing': undefined method `account=' for #<Link id: nil, created_at: nil, updated_at: nil, date_created_at: nil, account_id: nil, team_id: nil, link_type_id: nil, active: true, url: "https://www.example.com/", name: "Cartazzi App on development", project_id: nil, code_environment_id: nil> (NoMethodError)
Did you mean?  account_id=
3.0.0 :016 > quit

cartazzi on  main [!🤷‍] via  v18.2.0 via 💎 v3.0.0 on ☁️  (us-west-2) took 9m51s
❯ RAILS_ENV=test bundle exec rails c
Loading test environment (Rails 7.0.3)
3.0.0 :001 > link = FactoryBot::create(:link)
  TRANSACTION (0.2ms)  BEGIN
  Account Create (1.7ms)  INSERT INTO "accounts" ("email", "status", "role") VALUES ($1, $2, $3) RETURNING "id"  [["email", "gabriel@quigley-effertz.org"], ["status", "verified"], ["role", "customer"]]
  Account::PasswordHash Create (0.8ms)  INSERT INTO "account_password_hashes" ("id", "password_hash") VALUES ($1, $2) RETURNING "id"  [["id", 65], ["password_hash", "[FILTERED]"]]
  TRANSACTION (1.8ms)  COMMIT
/Users/sjohnson/.rvm/gems/ruby-3.0.0/gems/activerecord-7.0.3/lib/active_record/validations.rb:80:in `raise_validation_error': Validation failed: Account can't be blank (ActiveRecord::RecordInvalid)
```

**Note**: All of this was done in test mode on rails console or:

    RAILS_ENV=test bundle exec rails c

Here is what's going on:

1. I start by trying to create a FactoryBot object which had an error.
2. I made some changes in the class (not shown; offscreen).
3. I did a reload!
4. I tested again -- failure.
5. Step #2 all over again.
6. I started to think that maybe I needed to exit -- that reload! wasn't working.
7. I exited and MAGIC -- it worked

## Sidebar: FactoryBot method missing errors

The error above was that I was missing the belongs_to block in my model:

```ruby
belongs_to :account
belongs_to :project
belongs_to :team
belongs_to :link_type
```

I suspect this is a pretty common error when starting a new project.
