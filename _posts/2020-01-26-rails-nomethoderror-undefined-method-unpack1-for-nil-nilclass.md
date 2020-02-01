---
layout: post
title: Rails -- NoMethodError: undefined method unpack1 for nil:NilClass
category: rails
tags: ["rails"]
---
{:.center}
![IMG_1464.jpeg](/blog/assets/IMG_1464.jpeg)

I recently started a new application and tried running the generated tests and got this:

    rails test test/models/user_test.rb
    Running via Spring preloader in process 27379
    Run options: --seed 14413

    # Running:

    E

    Error:
    UserTest#test_can_delete_user_with_teams:
    NoMethodError: undefined method `unpack1' for nil:NilClass
        app/models/user/connected_account.rb:37:in `<class:ConnectedAccount>'
        app/models/user/connected_account.rb:31:in `<main>'


    rails test test/models/user_test.rb:57

    E

    Error:
    UserTest#test_user_has_a_personal_team:
    NoMethodError: undefined method `unpack1' for nil:NilClass
        app/models/user/connected_account.rb:37:in `<class:ConnectedAccount>'
        app/models/user/connected_account.rb:31:in `<main>'


    rails test test/models/user_test.rb:52

    E

    Error:
    UserTest#test_user_has_many_teams:
    NoMethodError: undefined method `unpack1' for nil:NilClass
        app/models/user/connected_account.rb:37:in `<class:ConnectedAccount>'
        app/models/user/connected_account.rb:31:in `<main>'


    rails test test/models/user_test.rb:46



    Finished in 0.060465s, 49.6155 runs/s, 0.0000 assertions/s.
    3 runs, 0 assertions, 0 failures, 3 errors, 0 skips

Now this is the the first time I've used test (as opposed to RSpec) in more than a decade and I was more than a bit taken aback.  A quick [Stack Overflow](https://stackoverflow.com/questions/57197682/in-decode64-undefined-method-unpack1-for-nilnilclass-nomethoderror) led me to:

> The error happens if you call Base64.decode64(nil). The method however is strictly expecting a String object here.

Now the line of code in question is:

```ruby
attr_encrypted :access_token, key: Base64.decode64(Rails.application.credentials.access_token_encryption_key)
```

So the implication is that:

```ruby
Rails.application.credentials.access_token_encryption_key
```

is returning **nil**.  

The solution is actually pretty simple -- create the credentials file using:

    EDITOR=vi rails credentials:edit --environment test

See this [blog post](https://fuzzyblog.io/blog/rails/2020/01/24/when-rails-credentials-edit-won-t-save-your-credentials.html) for why you have to use EDITOR=vi.