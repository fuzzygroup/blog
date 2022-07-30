---
layout: post
title: Docker Won't Install Libxml
category: docker
tags: ["docker", "rails"]
description: When components fail to install under Docker, it can be perplexing.  The solution is to check the dependencies in Dockerfile and add required libraries.
---
{% pizzaforukraine  %}

One of the most vexing situations in any type of development is when something that you swear you've done literally hundreds of times fails to work -- at all.  It always turns out to be that what you're doing is 99.995% the same as something previous -- and .005% different.  Last night I went to do a docker-compose build on a new application using my standard stack of Ruby, Rails, Mechanize and the like and I got this, well, crap:

    [24/1918]
    Gem::Ext::BuildError: ERROR: Failed to build gem native extension.

       current directory: /usr/local/bundle/gems/libxml-ruby-3.0.0/ext/libxml
    /usr/local/bin/ruby -r ./siteconf20170920-5-mpa6ar.rb extconf.rb
    checking for libxml/xmlversion.h in
    /opt/include/libxml2,/opt/local/include/libxml2,/usr/local/include/libxml2,/usr/include/libxml2...
    no
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
           --with-xml2-config
           --without-xml2-config
           --with-xml2-dir
           --without-xml2-dir
           --with-xml2-include
           --without-xml2-include=${xml2-dir}/include
           --with-xml2-lib
           --without-xml2-lib=${xml2-dir}/lib
    extconf failure: need libxml2.

       Install the library or try one of the following options to extconf.rb:

         --with-xml2-config=/path/to/xml2-config
         --with-xml2-dir=/path/to/libxml2
         --with-xml2-lib=/path/to/libxml2/lib
         --with-xml2-include=/path/to/libxml2/include


    To see why this extension failed to compile, please check the mkmf.log which can
    be found here:

    /usr/local/bundle/extensions/x86_64-linux/2.3.0-static/libxml-ruby-3.0.0/mkmf.log
    I can't get to the mkmf.log file since that's I think done with a container since its clearly linux not osx.
    No clue why this is happening since I use this same damn gem everwhere
    There was also this info

    Gem files will remain installed in /usr/local/bundle/gems/libxml-ruby-3.0.0 for
    inspection.
    Results logged to
    /usr/local/bundle/extensions/x86_64-linux/2.3.0-static/libxml-ruby-3.0.0/gem_make.out

    An error occurred while installing libxml-ruby (3.0.0), and Bundler cannot
    continue.
    Make sure that `gem install libxml-ruby -v '3.0.0'` succeeds before bundling.
    ERROR: Service 'web' failed to build: The command '/bin/sh -c bundle install --binstubs' returned a non-zero code: 5

One of the major reasons I got into Docker in the first place was to get away from this kind of crap!  Gem builds, particularly where libxml is involved, well, suck.  I spent close to two hours last night tweaking things, updating libraries and such and it was a complete and utter failure.  I even installed Docker on a brand new dev machine and got the exact same result.  

# The Solution

This morning I revisited it using the Google query [docker won't install libxml](https://www.google.com/search?q=docker+won%27t+install+libxml&ie=utf-8&oe=utf-8) and found this [Github Issue](https://github.com/docker-library/php/issues/315) where they suggest adding libxml2-dev to your Dockerfile.  Thus this:

> RUN apk update && apk add build-base nodejs mariadb-dev tzdata git

becomes

> RUN apk update && apk add build-base nodejs mariadb-dev tzdata git libxml2-dev

This was hugely surprising to me because according to github, I haven't touched my Dockerfile in **4 months** ever since my [Docker buddy and guru, Nick](https://diveintodocker.com/), helped me set it up.  My docker-compose file, however, was just modified 22 days ago. As docker-compose has become ever more important in the Docker world, the basic Dockerfile is something you touch less and less -- apparently until something bites you in the proverbial arse.

# And Here's Why this Happened

My normal use of libxml, for the past decade or so, is always tied straight to Ruby's [Mechanize gem](https://github.com/sparklemotion/mechanize) which I've had running correctly under Docker for the past six months.  And that's why this was so, so surprising to me.  The mistake that I made was that earlier today I had added [twilio-ruby](https://github.com/twilio/twilio-ruby) to my Gemfile and apparently twilio-ruby has different nokogiri dependencies than Mechanize which caused the Dockerfile to need libxml2-dev.  Digging into the twilio-ruby issues, I found [this issue](https://github.com/twilio/twilio-ruby/issues/315) which seems to address it.

# See Also

My buddy Nick, mentioned above, [talks about this on his blog](https://nickjanetakis.com/blog/docker-tip-9-installing-popular-packages-on-alpine).
