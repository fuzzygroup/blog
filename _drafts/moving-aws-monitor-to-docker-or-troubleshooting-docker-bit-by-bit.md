---
layout: post
title: Moving AWS Monitor to Docker or Troubleshooting Docker Bit By Bit
category: aws
tags: ["aws", "rails", "docker"]
---
So now that my monitoring code is actually working, I need to move it to my MacBook Pro.  Unfortunately this machine is, inexplicably, unable to natively install Nokogiri.  I've tried, [Dv](http://dasari.me) has tried and so has [Winston](http://winstonkotzan.com/blog/).  And no matter what we do, it seems that this machine is just hosed for Rails development.  Or is it -- I know what [Nick](http://www.nickjanetakis.com) would say:

  **Use Docker**
  
And he's a Docker Captain so he should know.  And while I've been a fan of Docker so far for treating almost any app as an API, I've never been a fan for my own code base.  But now its time.  Happily I did build this using my derivative of [Nick's Orats Gem](https://github.com/nickjj/orats) so I'm actually ok as a starting point.

# Getting Started with Docker

The first step was to replace my docker-compose.yml with the official Orats one.  A quick trip over to github gave me this:

    version: '2'

    services:
      postgres:
        image: 'postgres:9.5'
        environment:
          POSTGRES_USER: 'orats_base'
          POSTGRES_PASSWORD: 'yourpassword'
        ports:
          - '5432:5432'
        volumes:
          - 'postgres:/var/lib/postgresql/data'

      redis:
        image: 'redis:3.2-alpine'
        command: redis-server --requirepass yourpassword
        ports:
          - '6379:6379'
        volumes:
          - 'redis:/var/lib/redis/data'

      website:
        depends_on:
          - 'postgres'
          - 'redis'
        build: .
        ports:
          - '3000:3000'
        volumes:
          - '.:/orats_base'
        env_file:
          - '.env'

      sidekiq:
        depends_on:
          - 'postgres'
          - 'redis'
        build: .
        command: sidekiq -C config/sidekiq.yml.erb
        volumes:
          - '.:/orats_base'
        env_file:
          - '.env'

      cable:
        depends_on:
          - 'redis'
        build: .
        command: puma -p 28080 cable/config.ru
        ports:
          - '28080:28080'
        volumes:
          - '.:/orats_base'
        env_file:
          - '.env'

    volumes:
      redis:
      postgres:

The reason for replacing it is that I had wanted to make a version of Orats with MySQL support but I never had the chance to finish it.  It is likely faster to use Nick's postgres approach over my own half baked one.  

The next step is to compile everything using docker-compose:

    docker-compose up --build

Now what happened next is a bit puzzling:

    Installing pg 0.19.0 with native extensions

    Gem::Ext::BuildError: ERROR: Failed to build gem native extension.

        current directory: /usr/local/bundle/gems/pg-0.19.0/ext
    /usr/local/bin/ruby -r ./siteconf20161013-6-1sug58s.rb extconf.rb
    checking for pg_config... no
    No pg_config... trying anyway. If building fails, please try again with
     --with-pg-config=/path/to/pg_config
    checking for libpq-fe.h... no
    Can't find the 'libpq-fe.h header
    *** extconf.rb failed ***
    Could not create Makefile due to some reason, probably lack of necessary
    libraries and/or headers.  Check the mkmf.log file for more details.  You may
    need configuration options.

    Provided configuration options:
    	--with-opt-dir
    	--without-opt-dir
    	--with-opt-include
    	--without-opt-include=${opt-dir}/include
    	--with-opt-lib
    	--without-opt-lib=${opt-dir}/lib
    	--with-make-prog
    	--without-make-prog
    	--srcdir=.
    	--curdir
    	--ruby=/usr/local/bin/$(RUBY_BASE_NAME)
    	--with-pg
    	--without-pg
    	--enable-windows-cross
    	--disable-windows-cross
    	--with-pg-config
    	--without-pg-config
    	--with-pg_config
    	--without-pg_config
    	--with-pg-dir
    	--without-pg-dir
    	--with-pg-include
    	--without-pg-include=${pg-dir}/include
    	--with-pg-lib
    	--without-pg-lib=${pg-dir}/lib

    To see why this extension failed to compile, please check the mkmf.log which can be found here:

      /usr/local/bundle/extensions/x86_64-linux/2.3.0-static/pg-0.19.0/mkmf.log

    extconf failed, exit code 1

    Gem files will remain installed in /usr/local/bundle/gems/pg-0.19.0 for inspection.

So now the question becomes how do you debug a Ruby gem failure inside a Docker container.  I honestly don't know so I reached out to Nick for clarification:

Now I have to admit that I rushed thru this but that's still not a reason -- its an excuse.  Nick, in about a minute, pointed out that I was missing libpq so the Postgres gem wouldn't build.  




