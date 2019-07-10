---
layout: post
title: RSpec - Uninitialized Constant Errors on Model Tests
category: rails
tags: ["rails", "rspec"]
---
This one is an easy one but still tripped me up.  I'm working on a project where generators on RSpec stub files are turned off (don't ask; disagreement about the utility of generators between two senior engineers and I lost) and I just got this error:

    bundle exec rspec spec/models/metric_type_spec.rb

    An error occurred while loading ./spec/models/metric_type_spec.rb.
    Failure/Error:
      RSpec.describe MetricType, type: :model do
        describe "#val_col" do
          it "should return int_val for word_count" do
            h = FactoryBot.create(:metric_type_word_count)
            expect(h.val_col).to eq :int_val
          end

          it "should return float_val for weight" do
            h = FactoryBot.create(:metric_type_weight)
            expect(h.val_col).to eq :float_val

    NameError:
      uninitialized constant MetricType
    # ./spec/models/metric_type_spec.rb:1:in `<top (required)>'
    No examples found.

And the error turned out to be that this line was missing:

    require 'rails_helper'

That line is normally inserted by the generator but I built this spec file from scratch and just missed it.  I've stared at that line a thousand, thousand times over the years but I suspect I never realized that what it did was tell RSpec something like this:

"Read the Rails directory structure and autoload all classes in the directories below /app".  Doh!