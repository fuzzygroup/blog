---
layout: post
title: And Now for Something New
category: slumgullion
tags: ["rails", "slumgullion"]
---
{% pizzaforukraine  %}

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
    
And now its time for real work.  I personally believe that Rails development is always, always, always, always, always, always best done with N terminal windows where the beginning of them is as follows: Server, Database Terminal, Rails Console, General Command Line usage (add / commit / run tests / etc).  Your opinion may differ but that's how I roll -- keep all your tooling available at the same time.  And yes it is a Zorkian experience where you can be lost in a twisty maze of terminal windows all alike.

    # onto Bootstrap configuration for some appearance
    mate Gemfile
    # add bootsnap
    # add bootstrap-saas
    # stop server with command + c / ctrl c
    bundle update
    # port 3000 is default so omit
    bundle exec rails s 
    # start second terminal tab - db window
    # cd development root
    cd slumgullion
    # start third terminal tab - console window
    # cd development root
    cd slumgullion
    bundle exec rails c
    # start fourth terminal window
    cd slumgullion

Realize that after N late nights, even with examples you wrote yourself using Bootstrap, you do not know how to setup Bootstrap from scratch so sacrifice a small goat in the dark of the night whilst chanting around a firepit.  When that fails to produce results, grumble and then resume with Google while chanting [Save Me FreeCodeCamp.  Save Me FreeCodeCamp](https://medium.freecodecamp.org/add-bootstrap-to-your-ruby-on-rails-project-8d76d70d0e3b).  And like magic you channel this set of commands:

    git mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
    # fix application.scss like url above directs
    mate app/assets/stylesheets/application.scss
    # fix application.js like url above directs
    mate app/assets/javascripts/application.js
    mate app/views/application.html.erb
    # add a jumbotron element to see if bootstrap works
    mate app/views/dashboard/index.html.erb
    # restart server as per above

Success !

With thanks to Pete Jenney / Dataware for giving me the basis to make up that lyrical riff.
