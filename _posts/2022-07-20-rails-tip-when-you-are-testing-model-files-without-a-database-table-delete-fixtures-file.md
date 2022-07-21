---
layout: post
title: 'Rails Tip : When You Are Testing Model Files without a Database Table Delete Fixtures File'
date: 2022-07-20 10:02 -0400
category: rails
tags: ["rails", "software_testing", "flow_analytics"]
---
I generate a lot of models without ActiveRecord backing.  The reason for this is I try and follow a fairly functional style of Ruby coding where I use class methods.  The reason I use models for this:

* I don't know what to call them other than a model
* The models directly is auto loaded so I can refresh it with reload! in Rails console

My normal process for this:

1. rails g foo
2. Delete the migration
3. Delete the "< ..." at the top i.e. the inherits from ActiveRecord stff; exact syntax varies from Rails version to Rails version

Today I hit this error when running a test and it puzzled me:

    Error:
    VolumeCommonTest#test_it_should_have_the_right_values_for_cubic_feet_of_water:
    ActiveRecord::StatementInvalid: PG::UndefinedTable: ERROR:  relation "volume_commons" does not exist
    LINE 9:  WHERE a.attrelid = '"volume_commons"'::regclass
    
This actually took me a bit to figure out.  Here's the tldr:

1. It was coming from bin/rails test test/models/volume_common.rb
2. It was the result of the test runner trying to load the **fixture file**.

The reason this was surprising was that I normally customize each Rails project with ThoughtBot's FactoryBot gem and this time I forgot.  FactoryBot suppresses fixture file creation but since **I** screwed up, it was there and tried to get loaded into a missing table.

And, yes, the error is mine since I didn't read it well but at times like these I wish for a ***gem called abusive_error messages*** which sees "PG::UndefinedTable" and shouts out something like:

> Yo!  Hoser! Where be da database table ?

Ah if there were only infinite time to craft the software tools we really want ...