---
layout: post
title: It Is 2 AM and Postgres Won't Start - What Do You Do?
category: postgres
tags: ["postgres", "brew"]
---
{:.center}
![IMG_8820.jpeg](/blog/assets/IMG_8820.jpeg)
So I find myself awake, once again, in the wee hours and I went to work on my second side project; yeah, I know, I know.  So I started by writing a Rails migration and then when I went to execute it, I got:

    bundle exec rake db:migrate
    rake aborted!
    PG::ConnectionBad: could not connect to server: No such file or directory
    	Is the server running locally and accepting
    	connections on Unix domain socket "/tmp/.s.PGSQL.5432"?
    /Users/sjohnson/.rvm/gems/ruby-2.6.3/gems/pg-1.1.4/lib/pg.rb:56:in `initialize'
    /Users/sjohnson/.rvm/gems/ruby-2.6.3/gems/pg-1.1.4/lib/pg.rb:56:in `new'
    /Users/sjohnson/.rvm/gems/ruby-2.6.3/gems/pg-1.1.4/lib/pg.rb:56:in `connect'
    
Sigh.  This particular side project is built with [Jumpstart Rails](https://jumpstartrails.com/) and Jumpstart Rails uses Postgres.  And while I have no particular object to Postgres, it isn't MySQL which is my "comfort db".  So I guess I have to roll my metaphorical sleeves up (they are metaphorical sleeves because I'm writing this at 2:47 am in bed and, well, naked) and figure this out.  I could just try and go back to sleep but, nah....

The first thing I try is to look at Procfile.dev:

    cat Procfile.dev
    
    web: bundle exec rails server
    webpack: bundle exec bin/webpack-dev-server
    sidekiq: bundle exec sidekiq

There is no reference to Postgres so maybe it just isn't running.  I rebooted two days ago (to the sound of much griping and cursing - but I digress) so I try and start Postgres using brew:

    brew services start postgres
    Service `postgresql` already started, use `brew services restart postgresql` to restart.
    
Fabulous.  So is it actually running or not:

    ps auwwx | grep postg
    sjohnson         44631   0.0  0.0  4295688    856 s029  S+    2:51AM   0:00.00 grep --color=auto --exclude-dir=.bzr --exclude-dir=CVS --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn postg

That seems to argue that it isn't.  Maybe there's a lock file left behind so I should restart it instead:

    brew services restart postgresql
    Stopping `postgresql`... (might take a while)
    ==> Successfully stopped `postgresql` (label: homebrew.mxcl.postgresql)
    ==> Successfully started `postgresql` (label: homebrew.mxcl.postgresql)
    
So I check the process list again:

    ps auwwx | grep postg
    sjohnson         44859   0.0  0.0  4268040    784 s029  S+    2:52AM   0:00.00 grep --color=auto --exclude-dir=.bzr --exclude-dir=CVS --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn postg
    
This type of behavior with a "headless" process generally means that it is starting up, hitting an error condition and aborting -- and failing to clean up its lock file (making brew think that its still running).  Sigh.

Postgres is a background service which means that it is running behind the scenes and it is managed by brew.  So a little digging gave me brew services list:

    brew services list
    Name          Status  User     Plist
    dnsmasq       stopped
    elasticsearch started sjohnson /Users/sjohnson/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist
    mariadb       started sjohnson /Users/sjohnson/Library/LaunchAgents/homebrew.mxcl.mariadb.plist
    mpd           stopped
    postgresql    started sjohnson /Users/sjohnson/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
    rabbitmq      started sjohnson /Users/sjohnson/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist
    redis         stopped
    unbound       stopped
    
A bunch of years ago, Apple decided to replace the venerable cron with its own XML based launcher and the data structure that runs it is called a plist.  So I can just look at that:

    cat /Users/sjohnson/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
    
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>KeepAlive</key>
      <true/>
      <key>Label</key>
      <string>homebrew.mxcl.postgresql</string>
      <key>ProgramArguments</key>
      <array>
        <string>/usr/local/opt/postgresql/bin/postgres</string>
        <string>-D</string>
        <string>/usr/local/var/postgres</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>WorkingDirectory</key>
      <string>/usr/local</string>
      <key>StandardOutPath</key>
      <string>/usr/local/var/log/postgres.log</string>
      <key>StandardErrorPath</key>
      <string>/usr/local/var/log/postgres.log</string>
    </dict>
    </plist>

That log file at the end likely has the answer -- log files always have the answer:

    tail -f /usr/local/var/log/postgres.log
    2019-09-14 02:58:16.850 EDT [45173] FATAL:  database files are incompatible with server
    2019-09-14 02:58:16.850 EDT [45173] DETAIL:  The data directory was initialized by PostgreSQL version 9.6, which is not compatible with this version 11.4.
    2019-09-14 02:58:26.985 EDT [45174] FATAL:  database files are incompatible with server
    2019-09-14 02:58:26.985 EDT [45174] DETAIL:  The data directory was initialized by PostgreSQL version 9.6, which is not compatible with this version 11.4.
    
And that says to me "Google this little f* problem" which takes me to a [great postgres blog post](https://olivierlacan.com/posts/migrating-homebrew-postgres-to-a-new-version/) which recommends that I run:

    brew postgresql-upgrade-database
    
And that doesn't seem to work because I went from 9.6 to 11.something.or.other -- too large a version leap.  But it does make a backup of my Postgres database and maybe that will help me -- only it doesn't. 

And this is the point where I start to get sleepy and I'm going to cut to the chase with the solution:

* Backup my old databases to another location to be safe
* Re-initialize the postgres database with initdb (Thank you great postgres blog post)

Here was all the jiggery pokery I had to endure:

     3029  brew postgresql-upgrade-database
     3030  psql --version
     3031  ls -l /usr/local/var/postgres
     3032  ls -l /usr/local/var/postgres/postgres.old
     3033  brew services restart postgresql
     3034  ps auwwx | grep postg
     3035  tail -f /usr/local/var/log/postgres.log
     3036  cp /usr/local/var/postgres/postgres.old/postgresql.conf /usr/local/var/postgres/
     3037  brew services restart postgresql
     3038  tail -f /usr/local/var/log/postgres.log
     3039  chmod 0700 /usr/local/var/postgres
     3040  brew services restart postgresql
     3041  ps auwwx | grep postg
     3042  tail -f /usr/local/var/log/postgres.log
     3043  mkdir ~/old_postgres
     3044  rmdir ~/old_postgres
     3045  rmdir ~/old_postgres_databases
     3046  mkdir ~/old_postgres_databases
     3047  mv /usr/local/var/postgres/ ~/old_postgres_database
     3048  ls ~/old_postgres_database
     3049  initdb /usr/local/var/postgres/
    ➜  lauck git:(master) ✗ brew services start postgres
    Service `postgresql` already started, use `brew services restart postgresql` to restart.
    ➜  lauck git:(master) ✗ brew services restart postgres
    Stopping `postgresql`... (might take a while)
    ==> Successfully stopped `postgresql` (label: homebrew.mxcl.postgresql)
    ==> Successfully started `postgresql` (label: homebrew.mxcl.postgresql)
    ➜  lauck git:(master) ✗ ps auwwx | grep post
    sjohnson         47737   0.0  0.0  4276124    552 s029  R+    3:14AM   0:00.01 grep --color=auto --exclude-dir=.bzr --exclude-dir=CVS --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn post
    sjohnson         47732   0.0  0.0  4480624   1620   ??  Ss    3:14AM   0:00.00 postgres: logical replication launcher
    sjohnson         47731   0.0  0.0  4335492    856   ??  Ss    3:14AM   0:00.00 postgres: stats collector
    sjohnson         47730   0.0  0.0  4480624   1844   ??  Ss    3:14AM   0:00.00 postgres: autovacuum launcher
    sjohnson         47729   0.0  0.0  4480560    996   ??  Ss    3:14AM   0:00.00 postgres: walwriter
    sjohnson         47728   0.0  0.0  4480560   1104   ??  Ss    3:14AM   0:00.00 postgres: background writer
    sjohnson         47727   0.0  0.0  4480560    976   ??  Ss    3:14AM   0:00.00 postgres: checkpointer
    sjohnson         47717   0.0  0.1  4480840  17796   ??  S     3:14AM   0:00.04 /usr/local/opt/postgresql/bin/postgres -D /usr/local/var/postgres