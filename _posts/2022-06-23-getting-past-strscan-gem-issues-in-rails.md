---
layout: post
title: Getting Past strscan Gem Issues in Rails
date: 2022-06-23 03:51 -0400
category: rails
tags: ["rails", "hatchbox", "cartazzi"]
---
Yesterday I deployed a new thing via HatchBox and I was using the very, very latest -- Rails 7.0.3. My deploy was textbook perfect and then I viewed it in Chrome and got that awful, awful message:

> Web application could not be started

**Insert loud cursing here**  I know the drill -- it is a lower level error than HatchBox can handle (although I can think of at least a few ways HatchBox could handle it) -- so do the dance:

1. SSH into the box
2. sudo su
3. tail -f /var/log/nginx/error.log
4. Read the error, google and assess.

Here was the error:

    root@cartazzi3-web1:/home/deploy/Cartazzi/releases/20220608082805# tail -f /var/log/nginx/error.log
    App 14330 output:     /usr/share/passenger/helper-scripts/rack-preloader.rb:189:in `block in <module:App>'
    App 14330 output:     /usr/lib/ruby/vendor_ruby/phusion_passenger/loader_shared_helpers.rb:397:in `run_block_and_record_step_progress'
    App 14330 output:     /usr/share/passenger/helper-scripts/rack-preloader.rb:188:in `<module:App>'
    App 14330 output:     /usr/share/passenger/helper-scripts/rack-preloader.rb:30:in `<module:PhusionPassenger>'
    App 14330 output:     /usr/share/passenger/helper-scripts/rack-preloader.rb:29:in `<main>'
    [ E 2022-06-22 15:04:13.2231 21017/T9t age/Cor/App/Implementation.cpp:221 ]: Could not spawn process for application 
    /home/deploy/cartazzi_marketing/current: The application encountered the following error: 
    You have already activated strscan 3.0.1, but your Gemfile requires strscan 3.0.3. 
    Since strscan is a default gem, you can either remove your dependency on it or try updating 
    to a newer version of bundler that supports strscan as a default gem. (Gem::LoadError)
      Error ID: 9a03b9ce
      Error details saved to: /tmp/passenger-error-pO6ZTu.html  
  
The normal googling suggested things like:

* Update strscan on the host system
* Mess with Gemfile
* Mess with Gemfile.lock
* Add a Passenger level configuration var for bundler

I'd give citations for these but Chrome just crashed and it is closing in on 4 am and the weariness in my bones doesn't allow me to restart Chrome right now...

The first 3 options above didn't work but the Passenger level configuration tickled my "Let's try it even though I'm exhausted" fancy.  This took me into HatchBox's custom NGINX Configuration option where I added:

    passenger_env_var RUBYOPT '-r bundler/setup';    

from this [blog post](https://github.com/phusion/passenger/issues/2409) (yes I restarted Chrome; grumble; grumble).  This was also [helpful](https://www.phusionpassenger.com/library/config/nginx/reference/).  

And, happily, that fixed the problem.  And then I napped.