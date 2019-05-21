---
layout: post
title: And Now for Something New
category: slumgullion
tags: ["rails", "slumgullion"]

---
Io, Io, its off to code I go.  From bit to byte I build my stack. Io, Io its off to code I go....  

    cd development_project_path
    rails new slumgullion --database=mysql   --skip-spring --skip-listen --skip-test

And then a shift to [RSpec](https://fuzzyblog.io/blog/rails/2017/02/26/setting-up-rails-with-rspec-from-the-start.html).  And then a:

    cd slumgullion
    # mate is my source code editor
    # edit Gemfile (core package file for external components aka gems)
    mate Gemfile
    # Change gemfile version number to 5.2.3
    # Follow directions in blog post above
    bundle update
    mate config/database.yml
    #update database configuration file with development credentials
    bundle exec rails db:create
    bundle exec rails g controller Dashboard
    # set the default route
    mate config/routes.rb
    # write a trivial def index i.e. def index end
    mate app/controllers/dashboard_controller.rb
    # start the server
    bundle exec rails s -p3000
    # open in chrome this url 
    http://localhost:3000/
    # get errors; remember to create a blank index template to force html rendering
    touch app/views/dashboard/index.html.erb
    # mate app/views/dashboard/index.html.erb
    # get a blank page without any errors
    # get it into version control
    git add . 
    git commit -m "Canonical initial commit message"
    # goto git and create a private repo
    # add the origin
    # initial push
    # create first branch paralleling first ticket id
    git branch feature/1
    git co feature/1
    # onto Bootstrap configuration for some appearance

With thanks to Pete Jenney / Dataware for giving me the basis to make up that lyrical riff.
