---
layout: post
title: Fixing FactoryBot Validation Name Has Already Been Taken Controller Test or Spec Errors
date: 2022-06-10 08:41 -0400
---
So, last night, whilst pulling vampire hours on writing tests -- always, always, always a bad idea -- I encountered multiple variants on this bug:

    ❯ bundle exec rails test test/controllers/links_controller_test.rb:44
    Running 7 tests in a single process (parallelization threshold is 50)
    Run options: --seed 21798
    
    # Running:
    
    E
    
    Error:
    LinksControllerTest#test_should_get_edit:
    ActiveRecord::RecordInvalid: Validation failed: Name has already been taken
        test/controllers/links_controller_test.rb:47:in `block in <class:LinksControllerTest>'        

This was particularly vexing because while the object in question did have a name attribute, it did not have name validations:

```ruby
#########################################################################
#
# validations
#
#########################################################################

validates_presence_of :project_id
validates_presence_of :team_id
validates_presence_of :account_id
validates_presence_of :link_type_id

```

There are a number of people on the internet that have this issue including [this stack overflow post](https://stackoverflow.com/questions/30927459/rspec-validation-failed-name-has-already-been-taken).  What I noticed as I researched this is that I only saw it in controller tests.  Also my model tests continued to function correctly without any validation issues.  I had initially discovered this while working on my RodAuth testing deep dive and back burnered it until I got past that particularly nasty kettle of fix.  

I was working with two objects, link and project and project only through an association.  So my Factory for link looked like this:

```ruby
FactoryBot.define do
  factory :link do
    url { "https://www.example.com/?time=#{Time.now.to_i}" }
    name { "Cartazzi App on development #{Time.now.to_i}" }
    active { true }
    association :account
    association :team
    association :project
    association :link_type
  end
end
```

You will notice the insane use of Time.now.to_i to try and generate more distinct data.  This was an attempt to see if maybe some kind of hidden validation was present (it is ruby and everything is dynamic; who knows where a monkey patch might lie).  But, as the problem persisted, I ruled out a data side issue.

One of the suggestions was to install database_cleaner and initiate it around each test.  And while I did install it and make some efforts, unsuccessful I think, in that direction, I did notice a change in my error message (and, no, I don't know what change made the message vary):

    ❯ bundle exec rails test test/controllers/links_controller_test.rb:45
    Running 7 tests in a single process (parallelization threshold is 50)
    Run options: --seed 17557
    
    # Running:
    
    E
    
    Error:
    LinksControllerTest#test_should_get_edit:
    ActiveRecord::RecordInvalid: Validation failed: Project type must exist
        test/controllers/links_controller_test.rb:48:in `block in <class:LinksControllerTest>'

Now I do have a project_type attribute but it is on the project model and not on the link model.  Still project is coming in from an association -- I wonder if I have project_type as an association on project?

```ruby
FactoryBot.define do
  factory :project do
    name { "Cartazzi" }
    association :account
    association :team
  end  
end
```

So a quick change:

```ruby
FactoryBot.define do
  factory :project do
    name { "Cartazzi" }
    association :account
    association :team
    assocation :project_type
  end  
end
```

And then, like magic, the failure is gone.

## And then, like dark magic, it returns

I wandered away from my pc for an age and when I returned and resumed testing with a different controller, I found that this had returned:

    ❯ bundle exec rails test test/controllers/setup_controller_test.rb:99
    Running 49 tests in a single process (parallelization threshold is 50)
    Run options: --seed 27403

    # Running:

    E

    Error:
    SetupControllerTest#test_should_render_setup_form_for_paste_in_component_file_without_errors:
    ActiveRecord::RecordInvalid: Validation failed: Password can't be blank, Password Must contain 8+ characters
        test/controllers/setup_controller_test.rb:101:in `block in <class:SetupControllerTest>'

This now happened uniformly and is it was generally happening in the test setup block, there wasn't much in the way of clues to figure it out.  My next step was to fire up Rails Console in test mode:

    RAILS_ENV=test bundle exec rails c
    Loading test environment (Rails 7.0.3)
    3.0.0 :001 > @project = FactoryBot::create(:project)
    /Users/sjohnson/.rvm/gems/ruby-3.0.0/gems/activerecord-7.0.3/lib/active_record/validations.rb:80:in `raise_validation_error': Validation failed: Password can't be blank, Password Must contain 8+ characters (ActiveRecord::RecordInvalid)
    3.0.0 :002 > @project
    nil    

Previously I had been looking at the structure of the account object via a \d accounts sql command in the Postgres terminal.  However this made me wonder -- what if account is somehow (attr accessor I guess) validating email and password.  A quick look at account.rb showed me this:

```ruby
validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

# The validation of password here is only for the following scenario :
# An admin creates a new Account in the /admin dashboard.
# 
# Security of password of customers, in the "Sign up" screen, is a lot more secure.
# See :password_complexity in class RodauthMain. Documented here :
# http://rodauth.jeremyevans.net/rdoc/files/doc/password_complexity_rdoc.html
validates :password, presence: true, on: :create, format: { with: /\A(?=.{8,})/x, message: "Must contain 8+ characters" }

```

Curiously there are no attr accessor's but there is a:

    include Rodauth::Rails.model    

which I guess must be somehow dynamically adding the equivalent of attr accessor's.

At this point, I've simply thrown up my hands and posted a question on the RodAuth discussion forum:

(and at this point when I tried to post it, the Green start discussion button on the Github discussion board for RodAuth refused to let me submit it.  Yes it had a title, body and the [ ] was selected).  Here's what I wrote up:

Title:
Testing applications built with rodauth using standard rails 7 tests and factorybot

Body:

Perhaps I'm stupid and perhaps it is just me but I keep having an absolutely horrible time trying to get tests working at all using FactoryBot and rodauth.

My problem is that no matter what I do I can't get past FactoryBot issues where validations deeper in rodauth get triggered.  This happens whether it is a model test, controller test or whatever.  And given how much data is tied to the underlying concept of a user, it makes it virtually impossible to test anything.

Here's an example:

CONTROLLER TEST:


❯ bundle exec rails test test/controllers/code_environments_controller_test.rb:16
Running 7 tests in a single process (parallelization threshold is 50)
Run options: --seed 20521

# Running:

E

Error:
CodeEnvironmentsControllerTest#test_should_get_index:
ActiveRecord::RecordInvalid: Validation failed: Name has already been taken
    test/controllers/code_environments_controller_test.rb:10:in `block in <class:CodeEnvironmentsControllerTest>'

MODEL TEST:


❯ bundle exec rails test test/models/project_test.rb:29
Running 2 tests in a single process (parallelization threshold is 50)
Run options: --seed 53205

# Running:

E

Error:
ProjectTest#test_Project.find_or_create_should_return_a_project_when_it_already_exists:
ActiveRecord::RecordInvalid: Validation failed: Name has already been taken
    test/models/project_test.rb:7:in `setup'


rails test test/models/project_test.rb:29 

Same error whether I'm testing controller or model (this isn't an issue of using capybara or not; I'm just trying to test very basic things like if I have a database object created (nothing to do with auth).  Here's the test on project_test.rb line 29:

  test "Project.find_or_create should return a project when it already exists" do
    result_create = Project.find_or_create(@struct)
    assert_no_difference('Project.count') do
      result_find = Project.find_or_create(@struct)
      assert_equal result_create.id, result_find.id
    end
  end

Here's the factory:

FactoryBot.define do
  factory :account do
    email    { Faker::Internet.email }
    password { 'password' }
    status   { 'verified' }
  end

My underlying suspicion is that magic mixin via:

include Rodauth::Rails.model

is at fault.  

Even when I explicitly build factories for all of the account_* tables as based on looking at \dt+ in postgres such as:

FactoryBot.define do
  factory :account do
    email    { Faker::Internet.email }
    password { 'password' }
    status   { 'verified' }
    association :account_login_change_key
    association :account_password_hash   
    association :account_password_reset_key
    association :account_remember_key
    association :account_verification_key

  end
end


I get that this problem may be related to FactoryBot but the simple fact is that to build anything in ruby, you __have__ to have tests -- Ruby's dynamic nature means that tests are absolutely essential.

And I don't mean to deprecate the clearly excellent work you've done with rodauth but the amount of underlying magic you have here and the lack of clear instructions for something as vital as tests makes using rodauth very, very hard.

Blog post I wrote talking about these issues is linked below.  Yes the blog post says I got past it -- and I did -- but then a few hours later it came back with a bloody vengeance.

[https://fuzzyblog.io/blog/2022/06/10/fixing-factorybot-validation-name-has-already-been-taken-controller-test-or-spec-errors.html](https://fuzzyblog.io/blog/2022/06/10/fixing-factorybot-validation-name-has-already-been-taken-controller-test-or-spec-errors.html)