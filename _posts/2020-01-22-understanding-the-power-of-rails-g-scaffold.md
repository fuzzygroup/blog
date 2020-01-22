---
layout: post
title: Understanding the Power of rails g scaffold
category: rails
tags: ["rails"]
---
{:.center}
![IMG_1463.jpeg](/blog/assets/IMG_1463.jpeg)

Wow.  I am a damn idiot who has literally made his life harder than it ever needed to be --- for years.  Sigh.  I am referring to the Rails generator and the **scaffold** command.  When you have complex software tools, sometimes you don't discover features -- great damn features -- for a long time.  In this case I'm referring to:

> rails g scaffold pluralized_object_name

In my case, I'm building a project where the ultimate goal is to create a *label* on *something*.  Never mind what a label is or what the something is.  A friend I've been helping with Rails recently asked me what **rails g scaffold** does and I muttered something about "makes the model and controller in one go" but I never thought to try it myself until just now.  HOLY CRAP!  Wow.

> rails g scaffold labels

And here's what this generated for me:

    rails g scaffold Labels
    Running via Spring preloader in process 78104
    [WARNING] The model name 'Labels' was recognized as a plural, using the singular 'Label' 
    instead. Override with --force-plural or setup custom inflection rules for 
    this noun before running the generator.
          invoke  active_record
          create    db/migrate/20200122100533_create_labels.rb
          create    app/models/label.rb
          invoke    test_unit
          create      test/models/label_test.rb
          create      test/fixtures/labels.yml
          invoke  resource_route
           route    resources :labels
          invoke  scaffold_controller
          create    app/controllers/labels_controller.rb
          invoke    erb
          create      app/views/labels
          create      app/views/labels/index.html.erb
          create      app/views/labels/edit.html.erb
          create      app/views/labels/show.html.erb
          create      app/views/labels/new.html.erb
          create      app/views/labels/_form.html.erb
          append      app/views/shared/_left_nav.html.erb
          invoke    test_unit
          create      test/controllers/labels_controller_test.rb
          create      test/system/labels_test.rb
          invoke    helper
          create      app/helpers/labels_helper.rb
          invoke      test_unit
          invoke  assets
          invoke    scss
          create      app/assets/stylesheets/labels.scss
    

And this isn't just creating a raw file structure, the core controller itself and the tests are actually built for you.  

Here's the controller:

```ruby
class LabelsController < ApplicationController
  before_action :set_label, only: [:show, :edit, :update, :destroy]

  # GET /labels
  def index
    @pagy, @labels = pagy(Label.all)
  end

  # GET /labels/1
  def show
  end

  # GET /labels/new
  def new
    @label = Label.new
  end

  # GET /labels/1/edit
  def edit
  end

  # POST /labels
  def create
    @label = Label.new(label_params)

    if @label.save
      redirect_to @label, notice: 'Label was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /labels/1
  def update
    if @label.update(label_params)
      redirect_to @label, notice: 'Label was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /labels/1
  def destroy
    @label.destroy
    redirect_to labels_url, notice: 'Label was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_label
      @label = Label.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def label_params
      params.fetch(:label, {})
    end
end

```

And here's the controller test:

```ruby
require 'test_helper'

class LabelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @label = labels(:one)
  end

  test "should get index" do
    get labels_url
    assert_response :success
  end

  test "should get new" do
    get new_label_url
    assert_response :success
  end

  test "should create label" do
    assert_difference('Label.count') do
      post labels_url, params: { label: {  } }
    end

    assert_redirected_to label_url(Label.last)
  end

  test "should show label" do
    get label_url(@label)
    assert_response :success
  end

  test "should get edit" do
    get edit_label_url(@label)
    assert_response :success
  end

  test "should update label" do
    patch label_url(@label), params: { label: {  } }
    assert_redirected_to label_url(@label)
  end

  test "should destroy label" do
    assert_difference('Label.count', -1) do
      delete label_url(@label)
    end

    assert_redirected_to labels_url
  end
end
```

I've always been using generators:

    rails g model label 

and 

    rails g controller Labels
    
but then, for years, I've been manually writing my controllers, stubbing out my controller tests, adding stuff to the routes file, etc.  Wow.  I am just dumb founded in terms of how this:

* improves the speed of rapid prototyping with Rails
* improves quality by generating a test scaffold
* writes a modern controller (I have certain learned coding practices that are likely pretty crappy from a decade plus of Rails experience when practices have changed)

## Caveats

Here are some things that I don't like:

* I'm personally an rspec junkie but the simple fact that this generates a complete test biases me towards it (note - I checked on a project where rspec was the default and it did generate a similar test but with rspec syntax) so this isn't really a caveat but something I wanted to point out
* No support for generating factories, even on my project with rspec configured, but this is [customizable](https://guides.rubyonrails.org/generators.html).
* No support for authorization (and I get that there can't be since that's an app level thing but security holes and security testing is damn important)

## At Least I'm Not the Only Idiot Out There

I know there are people within the Rails community that are "generator resistant".  Hell -- one of the Rails folk I loved pairing with most in known space used to (gently) chastise me for using "rails g" for anything other than the core migration.  

I know that if I was running a big Rails project, like the one that I used to be on, I'd not only make sure that my team used this but I'd also invest the time in customizing this pretty heavily so:

* a factory file was generated
* access control was added to the controller (I'd do it by an inheritance via a base_controller but an authorization directive was fine)
* a policy file was written (useful if you are using Pundit)
* the controller tests were enhanced with a logged in / logged out set of tests

This is the power of generators -- they are customizable and you can reduce the repetitive code that your team manually generates every single time.