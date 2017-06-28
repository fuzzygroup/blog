---
layout: post
title: RSpec and Shoulda When You Have Database Level Validations
---

  1) TrialTimepoint validations should require case sensitive unique value for name scoped to trial_id, trial_arm_id, deleted_at
     Failure/Error: it { should validate_uniqueness_of(:name).scoped_to([:trial_id, :trial_arm_id, :deleted_at]).with_message("already exists") }

     ActiveRecord::StatementInvalid:
       Mysql2::Error: Field 'identifier' doesn't have a default value: INSERT INTO `trial_timepoints` (`name`, `created_at`, `updated_at`) VALUES ('a', '2017-06-27 19:25:49', '2017-06-27 19:25:49')
     # ./spec/models/trial_timepoint_spec.rb:47:in `block (3 levels) in <top (required)>'
     # ------------------
     # --- Caused by: ---
     # Mysql2::Error:
     #   Field 'identifier' doesn't have a default value
     #   ./spec/models/trial_timepoint_spec.rb:47:in `block (3 levels) in <top (required)>'

Finished in 0.05219 seconds (files took 10.82 seconds to load)
1 example, 1 failure

    # http://www.rubydoc.info/github/thoughtbot/shoulda-matchers/Shoulda%2FMatchers%2FActiveRecord%3Avalidate_uniqueness_of
    describe "should validate uniqueness of name scoped to trial_id, :trial_arm_id, :deleted_at" do
      subject { build(:trial_timepoint, :active) }
      it { should validate_uniqueness_of(:name).scoped_to([:trial_id, :trial_arm_id, :deleted_at]).with_message("already exists") }      
    end

Pass 2

.....F

Failures:

  1) ElementGroupItem validations validate_uniqueness_of element_id scoped to element_group_id should require case sensitive unique value for element_id scoped to element_group_id
     Failure/Error: it { should validate_uniqueness_of(:element_id).scoped_to(:element_group_id)}

     ActiveRecord::InvalidForeignKey:
       Mysql2::Error: Cannot add or update a child row: a foreign key constraint fails (`tap-test`.`element_group_items`, CONSTRAINT `fk_element_group_items_element_id` FOREIGN KEY (`element_id`) REFERENCES `elements` (`id`) ON DELETE CASCADE): INSERT INTO `element_group_items` (`position`, `element_group_id`, `element_id`, `created_at`, `updated_at`) VALUES (1, 79, 0, '2017-06-28 08:41:56', '2017-06-28 08:41:56')
     # ./spec/models/element_group_item_spec.rb:36:in `block (4 levels) in <top (required)>'
     # ------------------
     # --- Caused by: ---
     # Mysql2::Error:
     #   Cannot add or update a child row: a foreign key constraint fails (`tap-test`.`element_group_items`, CONSTRAINT `fk_element_group_items_element_id` FOREIGN KEY (`element_id`) REFERENCES `elements` (`id`) ON DELETE CASCADE)
     #   ./spec/models/element_group_item_spec.rb:36:in `block (4 levels) in <top (required)>'

Finished in 2.15 seconds (files took 13.41 seconds to load)
6 examples, 1 failure

Failed examples:

rspec ./spec/models/element_group_item_spec.rb:36 # ElementGroupItem validations validate_uniqueness_of element_id scoped to element_group_id should require case sensitive unique value for element_id scoped to element_group_id

Coverage report generated for RSpec to /Users/sjohnson/mddx/tap/coverage. 1499 / 22804 LOC (6.57%) covered.
✘-1 ~/mddx/tap [t760-automated-testing ↓·4|✚ 18…8⚑ 1]
04:42 $ rspec spec/models/element_group_item_spec.rb
TAP Info: Loading spec_helper.rb
TAP Info: Loading rails_helper.rb
......

Finished in 1.69 seconds (files took 11.02 seconds to load)
6 examples, 0 failures

Coverage report generated for RSpec to /Users/sjohnson/mddx/tap/coverage. 1499 / 22804 LOC (6.57%) covered.
✔ ~/mddx/tap [t760-automated-testing ↓·4|✚ 18…8⚑ 1]
04:42 $

Pass 3 - switch from build to create 

    describe "validate_uniqueness_of element_id scoped to element_group_id" do
      subject { create(:element_group_item) }
      it { should validate_uniqueness_of(:element_id).scoped_to(:element_group_id)}
    end
    
