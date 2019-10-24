---
layout: post
title: So You Don't Want Controller Level Helpers, Controller Level Javascripts, Controller Level Stylesheets
category: rails
tags: ["rails"]
---
{:.center}
![IMG_9602.jpeg](/blog/assets/IMG_9602.jpeg)

One of the better Rails tricks that my buddy Sean Kennedy taught me over the past year was just how configurable Rails is.  Yes Rails is opinionated -- but Rails isn't an asshole about it -- Rails is configurable as all heck.  

Let's take the issue of controller level helpers.  A helper script file is automatically generated when you create a controller so when you generate a controller named DataSource, you get:

    ➜  police_crawl git:(master) ✗ rails g controller DataSource
          create  app/controllers/data_source_controller.rb
          invoke  erb
          create    app/views/data_source
          invoke  helper
          create    app/helpers/data_source_helper.rb
          invoke  assets
          invoke    coffee
          create      app/assets/javascripts/data_source.coffee
          invoke    scss
          create      app/assets/stylesheets/data_source.scss

But helpers are actually problematic because helpers have a **global** namespace.  What a global namespace means is that if you have def display_content in one helper and def display_content in a different helper, and you call the display_app/helpers/data_source_helper.rb, you actually get the display_dollars routine that was loaded **last**.  And the fact that you have say:

    app/helpers/data_source_helper.rb
    app/helpers/tweet_helper.rb

creates the idea in the developers mind that you will get the display_content routine from the context where you call it (either the views for data_source or the views for tweet).  I understand exactly why Rails works this way but it is, well, bullshite.  Getting rid of helpers spread across multiple files absolutely helps make this clear to developers -- that there can only, ever be one method named display_content.

Happily Rails isn't an asshole -- even where it has strong opinions -- and you can make Rails work the way that you want.  The way you do it, in this case, is you add an initializer:

    config/initializers/generators.rb

and here's the contents of the initializer:

```ruby
Rails.application.config.generators do |g|
  g.orm             :active_record
  g.template_engine :erb
  g.test_framework  :rspec, fixture: false
  g.stylesheets     false
  g.javascripts     false
  g.helper false
end
```

Now when I do that same generation step, I get:

    ➜  police_crawl git:(master) ✗ rails g controller DataSources
          create  app/controllers/data_sources_controller.rb
          invoke  erb
          create    app/views/data_sources
          invoke  rspec
          create    spec/controllers/data_sources_controller_spec.rb
          invoke  assets
          invoke    coffee

**Note**: I switched it from DataSource controller to DataSources for proper restful style.

There is one caveat here and that's the one thing to watch out for with initializers.  This first bit me, hard, way, way, way back in 2007 and it still bites me in the arse from time to time.  Initializers are one of the first things loaded in your Rails app and any syntax error, no matter how small, stops your Rails app from starting.  And may the Flying Spaghetti Monster save you if you start a deploy with an initializer that is syntactically invalid.  **shudder**. You should see my post on git pre-commit hooks to avoid this ([2014 Post](https://fuzzyblog.io/blog/git/2014/08/29/the-importance-of-git-hooks.html) and my [2019 Post](https://fuzzyblog.io/blog/rails/2019/09/17/tiny-rails-tip-don-t-let-byebug-into-production.html)).