---
layout: post
title: Debugging Docker Problems - Omit the -d Flag
---
I find that I don't use Docker in an entirely standard way -- I use Docker purely for **deployment** and not at all for **development**.  This means that I often discover container problems only at runtime -- not as I work.  And the consequence of this is that debugging things can, at times, be *interesting*.

Debugging Docker

don't run with -d 

Let it run in the foreground

docker-compose -f docker-compose.production.yml up

    rake_1     | /app/config/initializers/seira_servers.rb:1: warning: already initialized constant HYDE_API_KEY
    rake_1     | /app/config/initializers/constants_system.rb:7: warning: previous definition of HYDE_API_KEY was here
    rake_1     | bundler: failed to load command: clockwork (/usr/local/bundle/bin/clockwork)
    rake_1     | LoadError: No such file to load -- FileUtils
    rake_1     |   /usr/local/bundle/gems/activesupport-5.0.2/lib/active_support/dependencies.rb:293:in `require'
    rake_1     |   /usr/local/bundle/gems/activesupport-5.0.2/lib/active_support/dependencies.rb:293:in `block in require'
    rake_1     |   /usr/local/bundle/gems/activesupport-5.0.2/lib/active_support/dependencies.rb:259:in `load_dependency'
    rake_1     |   /usr/local/bundle/gems/activesupport-5.0.2/lib/active_support/dependencies.rb:293:in `require'
    rake_1     |   /app/app/models/page_archive.rb:4:in `<class:PageArchive>'
    rake_1     |   /app/app/models/page_archive.rb:2:in `<top (required)>'
    rake_1     |   /usr/local/bundle/gems/activesupport-5.0.2/lib/active_support/dependencies.rb:293:in `require'
    rake_1     |   /usr/local/bundle/gems/activesupport-5.0.2/lib/active_support/dependencies.rb:293:in `block in require'
    rake_1     |   /usr/local/bundle/gems/activesupport-5.0.2/lib/active_support/dependencies.rb:259:in `load_dependency'
    rake_1     |   /usr/local/bundle/gems/activesupport-5.0.2/lib/active_support/dependencies.rb:293:in `require'
    rake_1     |   /usr/local/bundle/gems/activesupport-5.0.2/lib/active_support/dependencies.rb:380:in `block in require_or_load'
    rake_1     |   /usr/local/bundle/gems/activesupport-5.0.2/lib/active_support/dependencies.rb:37:in `block in load_interlock'
    
And here was the fix:

before:
> require "FileUtils"
after:
> require "FileUtils" if Rails.env.development?