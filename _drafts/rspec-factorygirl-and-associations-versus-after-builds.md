---
layout: post
title: RSpec, FactoryGirl and Associations versus After Builds
category: rspec
tags: ["rspec", "ruby", "factory_girl", "testing"]
description: Understanding precisely how stock objects from a tool like FactoryGirl are created is at the heart of software testing.  Specifically there are subtle differences between a FactoryGirl association versus a FactoryGirl after(:build)
---
Understanding how the association statement in FactoryGirl factories works can be moderately obscure -- until you look at the data that it generates and then it is crystal clear.  Let's consider three associated models:

* element
* element_group
* element_group_item

And there are a series of associations here that define the object relationships (these are inter object and for an associated concept called a trial):

    **element**
    belongs_to :trial
    has_and_belongs_to_many :element_groups, join_table: :element_group_items
    
    **element_group**
    belongs_to :trial
    has_and_belongs_to_many :elements, join_table: :element_group_items
    
    **element_group_item**
    belongs_to :element
    belongs_to :element_group    

Here's the factory for element_group_item:

    FactoryGirl.define do

      factory :element_group_item do
        association :element, factory: :element
        association :element_group, factory: :element_group
        position { 1 }
      end
    end

The single easiest way to understand your factories is to run rails console but in test mode so:

> bundle exec rails c test

Once you are in test mode then you can use FactoryGirl interactively:

> egi = FactoryGirl.create(:element_group_item)

Here's the instance of our ElementGroupItem model:

    #<ElementGroupItem:0x007fbddb9855d0> {
                      :id => 2,
        :element_group_id => 2,
              :element_id => 6,
                :position => 1,
              :created_at => Wed, 28 Jun 2017 07:49:49 UTC +00:00,
              :updated_at => Wed, 28 Jun 2017 07:49:49 UTC +00:00
    }
    
Here is the associated ElementGroup model:

    egi.element_group
    #<ElementGroup:0x007fbdd6b28090> {
                 :id => 2,
           :trial_id => 31,
               :name => "Miss Priscilla Cremin",
           :position => 1,
        :cloned_from => nil,
         :deleted_at => nil,
         :created_by => nil,
         :updated_by => nil,
         :created_at => Wed, 28 Jun 2017 07:49:49 UTC +00:00,
         :updated_at => Wed, 28 Jun 2017 07:49:49 UTC +00:00
    }
    
And, finally, here is our associated Element model:

    egi.element
    #<Element:0x007fbddb969830> {
                        :id => 6,
                  :trial_id => 30,
                      :kind => 1,
                      :name => "Art King",
             :value_options => [
            [0] {}
        ],
        :conversion_options => {},
                   :default => nil,
                   :tooltip => nil,
               :description => nil,
                    :slevel => 0,
                    :suffix => nil,
                   :encrypt => false,
              :privacy_mask => false,
                :input_mask => false,
                    :active => false,
                     :flags => nil,
               :cloned_from => nil,
              :editor_types => nil,
             :decimal_scale => nil,
                :created_by => nil,
                :updated_by => nil,
                 :locked_at => nil,
                :deleted_at => nil,
                :created_at => Wed, 28 Jun 2017 07:49:48 UTC +00:00,
                :updated_at => Wed, 28 Jun 2017 07:49:48 UTC +00:00
    }
    
The issue here is the trial_id attribute which is common to element and element_group -- what you'll see is that element and element_group now belong to two different trials.

Now let's rewrite our factory a bit:

    FactoryGirl.define do

      factory :element_group_item do
        after(:build) do |element_group_item|
          element = create(:element, :text_integer)
          element_group = create(:element_group, :trial_id => element.trial_id)
          element_group_item.element_group_id = element_group.id
          element_group_item.element_id = element.id
        end
    
        position { 1 }
    
      end
    end
    
Here is our instance of ElementGroupItem:

    egi = FactoryGirl.create(:element_group_item)
    #<ElementGroupItem:0x007f80cfd19ed8> {
                      :id => 3,
        :element_group_id => 7,
              :element_id => 11,
                :position => 1,
              :created_at => Wed, 28 Jun 2017 08:12:06 UTC +00:00,
              :updated_at => Wed, 28 Jun 2017 08:12:06 UTC +00:00
    }
    
Here is our instance of ElementGroup associated with our starting object:

    egi.element_group
      ElementGroup Load (8.6ms)  SELECT  `element_groups`.* FROM `element_groups` WHERE `element_groups`.`deleted_at` IS NULL AND `element_groups`.`id` = 7 LIMIT 1
    #<ElementGroup:0x007f80c91079e8> {
                 :id => 7,
           :trial_id => 36,
               :name => "Devan Ullrich",
           :position => 1,
        :cloned_from => nil,
         :deleted_at => nil,
         :created_by => nil,
         :updated_by => nil,
         :created_at => Wed, 28 Jun 2017 08:12:06 UTC +00:00,
         :updated_at => Wed, 28 Jun 2017 08:12:06 UTC +00:00
    }    
    
And, finally, here is our instance of Element:

    egi.element
      Element Load (3.2ms)  SELECT  `elements`.* FROM `elements` WHERE `elements`.`deleted_at` IS NULL AND `elements`.`id` = 11 LIMIT 1
    #<Element:0x007f80c8a38f18> {
                        :id => 11,
                  :trial_id => 36,
                      :kind => 5,
                      :name => "Estella Kuhic",
                :created_at => Wed, 28 Jun 2017 08:12:06 UTC +00:00,
                :updated_at => Wed, 28 Jun 2017 08:12:06 UTC +00:00
    }
    
As you can see the difference between the association approach versus the after(:build) approach lies in the nature of the nested objects.  Here rather than two separate trials being created there instead is a trinity of objects shared across one trial.  