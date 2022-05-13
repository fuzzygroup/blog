---
layout: post
title: Rails 6 - Can't Find Application.js
date: 2021-12-18 09:51 -0500
category: rails
tags: ["rails"]
---
So I started fiddling about with a new Rails project and after finding a likely starting point, I immediately ended up with this:

    Webpacker can't find application.js in

I'm old school Rails and I find the whole asset compilation situation, honestly, perplexing.  The solution turned out to be:

    bundle exec rails webpacker:install
    
after the normal:

    git clone foo
    bundle install
    bundle exec rake db:migrate
    
I have no idea why the bundler install doesn't handle executing webpacker:install but cie la vie.  The more things change, the more they stay the same ...

**Update**: I kept at this and kept finding that I didn't have webpacker or some other portion of the rails stack running.  I finally traced this down to things having changed.  Traditionally I've always run rails as:

    bundle exec rails s -pXYZ
		
And the new approach is to run:

    bin/dev

which in turn contains:

	 #!/usr/bin/env bash

	 if ! command -v foreman &> /dev/null
	 then
	   echo "Installing foreman..."
	   gem install foreman
	 fi

	 foreman start -f Procfile.dev "$@"

and the Procfile.dev file contains:

		web: bin/rails server -p 3000
		js: yarn build --watch
		css: yarn build:css --watch
		
I was literally missing the yarn command so part of the overall asset pipeline just wasn't running.

Old habits die **hard**.