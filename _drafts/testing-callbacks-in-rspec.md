---
layout: post
title: Testing Callbacks in RSpec
category: rspec
tags: ["rspec", "ruby", "rails"]
---
Callbacks, methods that fire automatically in reaction to other events, can be incredibly powerful but seem to always introduce consequences that are often hard to understand.  The canonical example of this is an after_save callback which causes a change to the object in question which then causes another save and so on -- ultimately leading to an infinite loop and a recursive failure.   One of the best ways to understand your callbacks is to write tests for them so you have an understanding of how they are called.

Here is a simple example of how to test callbacks on a Ruby model:

Model:

    class Post < ActiveRecord::Base
    
      def cannot_change_if_locked
        # some code would go here that checks if the object is locked and returns accordingly
      end
    
    end

Test:

    describe "callbacks" do
      # implementation tested elsewhere; this just verifies that the callback is called
      describe "before_destroy" do
        it "should receive cannot_change_if_locked on a destroy message" do
          # create a post object with the locked trait
          post = FactoryGirl.create(:post, :locked)
          
          # or you could stub it in this way
          allow(post).to receive(:locked).and_return(true)
                  
          post.should_receive(:cannot_change_if_locked)
          post.destroy        
        end
      end
    end