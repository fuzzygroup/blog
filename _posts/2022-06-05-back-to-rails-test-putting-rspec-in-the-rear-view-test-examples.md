---
layout: post
title: Back to Rails Test - Putting Rspec in the Rear View - Test Examples
date: 2022-06-05 08:54 -0400
category: rails
tags: ["rails", "test", "rspec"]
---
{% pizzaforukraine  %}

I find myself building a new application, Cartazzi, and since the "template app" I'm building from uses Rails Test not rspec, I'm back to the past using the native rails testing framework -- something I probably last touched by in 2009.  

This blog post summarizes different Rails testing examples and is a work in progress as I come up with new examples.

## Thinks I Like About Rails Test

* It is fast
* Have I mentioned it is fast
* It is so, so fast
* It tells you when you write duplicate tests if the test "" block is the same

## Things I Dislike About Rails Test

* Lack of output formatting like rspec's nested documentation
* The inability to nest tests; yes thoughtbot's matchers may provide this but they are 2+ years out of date and unclear if they are still maintained

## Examples

### Running a Single Test

    rails test test/models/my_model.rb:22

### Running All Tests

    rails test test/models/my_model.rb

### Examining the body of a page at runtime

    debugger
    response.body[0..250]


    debugger
    response.body.scan(/FOO/)

### Asserting a form exists with different elements

### Asserting a row exists within a table

    assert_select 'table' do
      assert_select 'tr td', 'user1@example.com'
    end

### Asserting a select tag exists within a form

    # this would find a select with an id of project_type
    assert_select 'select#project_type'

#### Asserting a text area exists within a form

This assumes that the form do block illustrated above is used.

    # this would find a textarea with an id of component_body-input
    assert_select 'textarea#component_body-input'
    
### Asserting text exists on an H1 element

    assert_selector "h1", text: "Foobar"

### Checking a list has 4 elements

    assert_select "ol" do |elements|
      elements.each do |element|
        assert_select element, "li", 4
      end
    end

### Asserting a difference on a database creation operation

    assert_difference('LinkType.count') do
      result = LinkType.find_or_create(OpenStruct.new(context: "execution_url", name: "development"))
      assert_equal result.class, LinkType
    end

### Asserting there should be no difference in database results

    test "ProjectType.find_or_create should return a project_type when it already exists" do
      result_create = ProjectType.find_or_create(@name, @file_extension, @component_file)
      assert_no_difference("ProjectType.count") do
        result_find = ProjectType.find_or_create(@name, @file_extension, @component_file)
        assert_equal result_create.id, result_find.id
      end
    end
    
## When you get TypeError: no implicit conversion of Integer into String on an assert_difference or assert_no_difference test

It means you are missing the quotes below:

    assert_no_difference("ProjectType.count")

## Good Links
* [https://guides.rubyonrails.org/testing.html](https://guides.rubyonrails.org/testing.html)
* [https://apidock.com/rails/ActionDispatch/Assertions/SelectorAssertions/assert_select](https://apidock.com/rails/ActionDispatch/Assertions/SelectorAssertions/assert_select)
* [https://stackoverflow.com/questions/1506780/how-to-run-a-single-test-from-a-rails-test-suite](https://stackoverflow.com/questions/1506780/how-to-run-a-single-test-from-a-rails-test-suite)
* [https://chriskottom.com/articles/full-stack-testing-with-rails-system-tests/](https://chriskottom.com/articles/full-stack-testing-with-rails-system-tests/)

* [https://stackoverflow.com/questions/56106832/rails-testing-assert-select-vs-assert-selector](https://stackoverflow.com/questions/56106832/rails-testing-assert-select-vs-assert-selector)

* [https://stackoverflow.com/questions/38338393/using-assert-select-to-find-a-select-box-value](https://stackoverflow.com/questions/38338393/using-assert-select-to-find-a-select-box-value)


