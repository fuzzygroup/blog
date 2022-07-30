---
layout: post
title: 'Rails 7 Madness: No such middleware to insert before: ActionDispatch::Static'
date: 2022-06-02 00:22 -0400
category: rails
tags: ["rails"]
---
{% pizzaforukraine  %}

In tonight's category of "Crazy Rails Errors that Even I haven't hit", I was deploying a new app via HatchBox and I hit this one:

    No such middleware to insert before: ActionDispatch::Static
    /home/deploy/Cartazzi/shared/bundle/ruby/3.1.0/gems/actionpack-7.0.2.2/lib/action_dispatch/middleware/stack.rb:174:in `assert_index'

When I dug into the underlying failure there was this bit of code:

{% highlight ruby%}
      def assert_index(index, where)
        i = index.is_a?(Integer) ? index : index_of(index)
        raise "No such middleware to insert #{where}: #{index.inspect}" unless i
        i
      end
{% endhighlight %}

I did the obligatory googling only to find nothing in the past year and absolutely nothing related to Rails 7.  

I was able to replicate this by logging in with either:

    bundle exec rake middleware

or 

    RAILS_ENV=production bundle exec rake assets:precompile

After stumbling around a bit -- this was post midnight late night code fu -- I thoguht to myself:

> What if the issue is that it is looking for middleware and it can't find any?

One of the previous googles from 2015 or so said that if you have this issue then remove the font_assets gem (I didn't have it but omitted that part of the research above).  What I did was look for asset pipeline middleware and I found the smart_assets gem which I dropped into Gemfile:

    gem 'smart_assets'    

A quick bundle install and I ended up with a failing deploy ... but a different failure:

    Building with Vite 
    rake aborted!
    ViteRuby::MissingExecutableError:  The vite binary is not available. Have you installed the npm packages?

    Visit the Troubleshooting guide for more information:
      https://vite-ruby.netlify.app/guide/troubleshooting.html#troubleshooting
      
And that, in modern computing, alas, is **progress**.