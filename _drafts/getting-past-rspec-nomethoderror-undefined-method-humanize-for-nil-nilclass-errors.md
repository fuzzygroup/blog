---
layout: post
title: Getting Past RSpec NoMethodError: undefined method humanize for nil:NilClass Errors
category: ruby
tags: ["rails", "ruby", "rspec", "factory_girl"]
---
I recently picked up an interesting bit of consulting work on large Rails project (62K lines of code):

* fix the broken test coverage
* expand the missing test coverage to cover everything -- validations, callbacks, associations, aliases, etc
* target a goal of roughly 90%+ coverage

This is a medical application written in Ruby / Rails and the mandate is to improve test coverage before it comes to market.  This is actually my third separate engagement with this client having built an MVP for them earlier and written the initial test coverage on this application -- that was not kept up to date and thus became broken over time.

All of this work is using my preferred testing framework of [RSpec](http://rspec.info/) and [FactoryGirl](https://github.com/thoughtbot/factory_girl) along with the [Shoulda](http://matchers.shoulda.io/) set of matchers.

I've actually done quite a bit of work in taking Rails code bases without any test coverage and adding various levels of test coverage and I suspect that a detailed blog post on the topic will be forthcoming soon.

The topic for today is what happens when your factories themselves are the issue and you get crazy errors like this:

    1) GraphTemplate factories has a valid factory
        Failure/Error: expect(build(:graph_template)).to be_valid#, {element_id: element.id})).to be_valid

        NoMethodError:
          undefined method `humanize' for nil:NilClass
        # ./spec/models/graph_template_spec.rb:8
        
This is happening at a line which shouldn't cause any problems:

    RSpec.describe GraphTemplate, type: :model do
      describe "factories" do
        it "has a valid factory" do      

          expect(build(:graph_template)).to be_valid      
      
        end
        
The underlying graph_template model looks like this:

    +----------------+--------------+------+-----+---------+----------------+
    | Field          | Type         | Null | Key | Default | Extra          |
    +----------------+--------------+------+-----+---------+----------------+
    | id             | int(11)      | NO   | PRI | NULL    | auto_increment |
    | data_points    | text         | NO   |     | NULL    |                |
    | name           | varchar(255) | NO   |     | NULL    |                |
    | created_at     | datetime     | YES  |     | NULL    |                |
    | updated_at     | datetime     | YES  |     | NULL    |                |
    +----------------+--------------+------+-----+---------+----------------+

While there are a number of validation  but the data_points column is the problem.

 which is defined as a text column and the object's internal validation methods are looking 
 
 
 [6/23/17, 5:45:03 PM] J. Scott Johnson: I figured out the issue with humanize.  Its happening because a hash is expected and a map / select operation is expected to operate on hash keys.  I fixed it for graph_template by adding some sample data in the data_points data element.
 [6/23/17, 5:45:40 PM] J. Scott Johnson: It was data_points { [] } and that was causing the humanize error and then putting this in:
     data_points { [{"selected_graph"=>"a", "type"=>"0", "label"=>"", "module_value_id"=>"15", "workflow_person_type_mv"=>"subject", "module"=>"dataramp", "workflow_person_type"=>"subject", "trial_timepoint_id"=>"33", "journal_id"=>nil, "workflow_id"=>nil, "tat_form_id"=>"11", "journal_form_id"=>nil, "workflow_step_item_id"=>"1", "element_id"=>"4", "workflow_step_id"=>nil, "journal_day"=>""}] }