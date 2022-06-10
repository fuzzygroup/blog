---
layout: post
title: Rails 7, Rodauth, BootRails, Nested Resources and Testing Controllers
date: 2022-06-10 04:12 -0400
category: rails
tags: ["rails", "rodauth", "testing"]
---
I'm working on a new project and, as I am front end challenged, I started by purchasing a copy of the BootRails framework as it seemed to have sensible defaults and an appearance that vastly outstrips my personal ability to manipulate Bootstrap.  Previously I've worked with the JumpStart framework from Go Rails and while I love, love, love Chris Oliver, GoRails, HatchBox and everything Chris has done (yes I'm a super fan), I just can't get past JumpStart's use of Tailwind.

BootRails makes a bunch of fairly opinionated decisions including the choice of RodAuth for authentication.  They also use minitest and fixtures instead of rspec and FactoryBot.

This blog post will cover how I figured out how to make testing work in a RodAuth environment for a nested resource.

**Note**: It has literally been years since I've used nested resources but the application I'm developing is one where I particularly don't want security holes and nested resources nicely handle that.  And, yes, I'm tipping my hat towards Sean Kennedy in Arkansas who taught me all about nested resources about a thousand years ago, way, way pre-pandemic.

Unlike devise and everything else I've ever used in Rails, RodAuth has current_account instead of current_user.  So you have an account object instead of a user object (I'm not saying it is wrong but it is different).  For my application I have two resources:

* account
* link

My routes file looks like this:

```ruby
constraints Rodauth::Rails.authenticated do
  resources :accounts do 
    resources :links
  end
end
```

This means that my urls will look something like this: /account/23/link/99 i.e. you have to be logged in as account 23 to access link 99.

**Note**: Writing the line above makes me realize that no other account can ever reference link 99 since the account is the parent object of the resource.  The likely needed change is to nest these under the project object and then have a account_project model.  But, as always, I digress.

My first thing when I generated the links model was to scaffold it all together with:

    rails g scaffold Links

which handles creating the base migration, the html, the model file, the controller file and so on.  Here are a few things I learned:

* This doesn't handle nested resources so everything it generates has to be fixed.  There is a [nested scaffold](https://github.com/amatsuda/nested_scaffold/) gem but I don't know if it works.
* If you pass in a list of attribute pairs when you generate it then the controller will actually have a working permitted block on the params method (the whole fetch thing that it generates by default is just plain stupid afaik as it doesn't work).

Given that I had nested resources, every single method of my generated test completely failed.  This was a failure on the level of:

* controller
* test
* html

A bit of patch up started to make the test work but I kept finding issues with the generated set_link method.

Here is the initial version from the generator:

```ruby
def set_link
  @link = Link.find(params[:id])
end
```

And here is the modified version to reflect the nested resource:

```ruby
def set_link
  @link = current_account.links.find(params[:id])
end
```

The error I kept getting was that the link couldn't be found;

    E

    Error:
    LinksControllerTest#test_should_get_edit:
    ActiveRecord::RecordNotFound: Couldn't find Link with 'id'=151 [WHERE "links"."account_id" = $1]
        app/controllers/links_controller.rb:57:in `set_link'
        test/controllers/links_controller_test.rb:37:in `block in <class:LinksControllerTest>'

This bothered me due to the simplicity of the **one line** method.  But, as you do, I started at the top of the test with the setup method:

```ruby
setup do
  @link = FactoryBot::create(:link)
  @account = @link.account
  connect_as('customer')
end
```

Please note that there was an earlier version where @account was the result of FactoryBot::create(:account).  As I changed that to reflect that the account needed to *be the same account* as the link, I started to wonder the real question:

> What damn account was connect_as using?

This led me, as it always does, into the search cesspool that is Google in 2022.  For sometime Google has been getting worse and tonight it was no different.  A variety of searches for variants of rodauth, connect_as, current_account had roughly the information content of hydrogen atoms.  

My first thought was to try this:

```ruby
@link.account_id = current_account.id
```

but that threw a very, very nasty stack trace -- apparently you cannot use current_account in a test environment.  Sigh.  Lame.  Symmetry makes things so much easier for developers but ...

This led me to changing setup to:

```ruby
setup do
  @link = FactoryBot::create(:link)
  @account = @link.account
  connect_as('customer')
  debugger
end
```

When I ran the test, I got the following result (I'm giving the whole session here):

    =>  11|     debugger
        12|     @link.account_id = current_account.id
        13|     @link.save
        14|   end
        15|
    =>#0	block in <class:LinksControllerTest> at ~/Sync/coding/rails/cartazzi/test/controllers/links_controller_test.rb:11
      #1	[C] BasicObject#instance_exec at ~/.rvm/gems/ruby-3.0.0/gems/activesupport-7.0.3/lib/active_support/callbacks.rb:445
      # and 39 frames (use `bt' command for all frames)
    (ruby) current_account
    eval error: undefined local variable or method `current_account' for #<LinksControllerTest:0x00007fc46a57abd0>
      /Users/sjohnson/.rvm/gems/ruby-3.0.0/gems/actionpack-7.0.3/lib/action_dispatch/testing/assertions/routing.rb:187:in `method_missing'
      /Users/sjohnson/.rvm/gems/ruby-3.0.0/gems/actionpack-7.0.3/lib/action_dispatch/testing/integration.rb:431:in `method_missing'
      (rdbg)//Users/sjohnson/Sync/coding/rails/cartazzi/test/controllers/links_controller_test.rb:1:in `block in <class:LinksControllerTest>'
    nil
    (ruby) @session
    nil
    (rdbg) account
    eval error: undefined local variable or method `account' for #<LinksControllerTest:0x00007fc46a57abd0>
    Did you mean?  @account
      /Users/sjohnson/.rvm/gems/ruby-3.0.0/gems/actionpack-7.0.3/lib/action_dispatch/testing/assertions/routing.rb:187:in `method_missing'
      /Users/sjohnson/.rvm/gems/ruby-3.0.0/gems/actionpack-7.0.3/lib/action_dispatch/testing/integration.rb:431:in `method_missing'
      (rdbg)//Users/sjohnson/Sync/coding/rails/cartazzi/test/controllers/links_controller_test.rb:1:in `block in <class:LinksControllerTest>'
    nil
    (ruby) @account
    #<Account:0x00007fc40dc42358 id: 171, email: "leopoldo.hilll@lynch.info", status: "verified", role: "customer">
    (rdbg) session
    #<ActionDispatch::Request::Session:0x00007fc3f80bfb08 ...>
    (ruby) ap session.inspect
    "#<ActionDispatch::Request::Session:0x00007fc3f80bfb08 @by=#<ActionDispatch::Session::CookieStore:0x00007fc44fa52998 @app=#<ActionDispatch::ContentSecurityPolicy::Middleware:0x00007fc44fa52a60 @app=#<ActionDispatch::PermissionsPolicy::Middleware:0x00007fc44fa52ad8 @app=#<Rack::Head:0x00007fc44fa52b50 @app=#<Rack::ConditionalGet:0x00007fc44fa52bc8 @app=#<Rack::ETag:0x00007fc44fa52c40 @app=#<Rack::TempfileReaper:0x00007fc44fa52cb8 @app=#<Rodauth::Rails::Middleware:0x00007fc44fa52d30 @app=#<ActionDispatch::Routing::RouteSet:0x00007fc4282459c0>>>, @cache_control=\"max-age=0, private, must-revalidate\", @no_cache_control=\"no-cache\">>>>>, @default_options={:path=>\"/\", :domain=>nil, :expire_after=>nil, :secure=>false, :httponly=>true, :defer=>false, :renew=>false}, @key=\"_cartazzi_session\", @cookie_only=true, @same_site=nil>, @req=#<ActionDispatch::Request POST \"http://www.example.com/login\" for 127.0.0.1>, @delegate={\"session_id\"=>\"9d66ca53cc6cd939be95bcf859757793\", \"account_id\"=>175, \"authenticated_by\"=>[\"password\"], \"flash\"=>{\"discard\"=>[], \"flashes\"=>{\"notice\"=>\"You have been logged in\"}}}, @loaded=true, @exists=nil, @enabled=true>"
    nil
    (ruby) ap (session.methods - Object.methods).sort
    [
        [ 0] :[],
        [ 1] :[]=,
        [ 2] :clear,
        [ 3] :delete,
        [ 4] :destroy,
        [ 5] :dig,
        [ 6] :each,
        [ 7] :empty?,
        [ 8] :enabled?,
        [ 9] :exists?,
        [10] :fetch,
        [11] :has_key?,
        [12] :id,
        [13] :key?,
        [14] :keys,
        [15] :loaded?,
        [16] :merge!,
        [17] :options,
        [18] :to_h,
        [19] :to_hash,
        [20] :update,
        [21] :values
    ]
    nil
    (ruby) ap session
    {
              "session_id" => "9d66ca53cc6cd939be95bcf859757793",
              "account_id" => 175,
        "authenticated_by" => [
            [0] "password"
        ],
                   "flash" => {
            "discard" => [],
            "flashes" => {
                "notice" => "You have been logged in"
            }
        }
    }
    nil
    (ruby) @account.id
    171

Years ago I was lucky enough to have fellow developers (Hi Wolf, Hi Jared) mentor me in the zen like experience of using Rails console and those lessons stuck.  When you have a repl console at your finger tips, you can often find the answer just by poking about.  I started by trying current_account (which I knew would fail but confirmation is a thing).  Then I tried @session and account and finally hit upon session.  And I discovered the session variable is a hash with an account_id key.  And that account_id is 175.  But my @account object has 171.  This order makes sense since connect_as comes after @account is assigned.

This led me to rewrite my setup as:

```ruby
setup do
  connect_as('customer')
  @account = Account.find(session['account_id'])
  @link = FactoryBot::create(:link)#, :account => @account)
  @link.account_id = @account.id
  @link.save
end
```

I profoundly **do not like** this level of jiggery pokery around with the account_id.  This should be cleaner and with a bit of experimentation that I **cannot find** in documentation anywhere, I came up with:

```ruby
setup do
  connect_as('customer')
  @account = Account.find(session['account_id'])
  @link = FactoryBot::create(:link, account: @account)#, :account => @account)
end
```

That that, dear reader, is how you fix a problem with a one line method.  Sigh.