---
layout: post
title: When Postgres Won't Start
date: 2020-09-12 07:05 -0400
category: postgres
tags: ["postgres", "sysadmin"]
---
{:.center}
![IMG_9569.jpeg](/blog/assets/IMG_9569.jpeg)

## TLDR

1. Somehow my postgres installation was upgraded.
2. When postgres is upgraded its data is NOT upgraded.
3. This means postgres won't start BUT it will be a silent failure; you can only confirm this via the logs.

    tail -n 10 /usr/local/var/log/postgres.log

## The Long Version

I went through a situation the other day where I would start and stop postgres and the database would NEVER be available for connection.  

Here is the error that I kept getting:

    ❯ psql
    psql: error: could not connect to server: could not connect to server: No such file or directory
    	Is the server running locally and accepting
    	connections on Unix domain socket "/tmp/.s.PGSQL.5432"?

This blog posts lists all the commands I used for reference and how I fixed it:

    brew services restart postgres
    brew services stop postgres
    brew services start postgres
    rm -f /usr/local/var/postgres/postmaster.pid
    brew uninstall postgresql
    brew install postgresql
    brew reinstall postgresql
    brew upgrade postgres
    ls -l /usr/local/var/postgres/postmaster.pid
    ls -l /usr/local/var/postgres/
    tail -n 10 /usr/local/var/log/postgres.log
    brew postgresql-upgrade-database
    tail -n 10 /usr/local/var/log/postgres.log
    

As is always the case with this type of low level issue, the answer is ALWAYS IN THE DAMN LOGS and it is always the near to last command you use that finds it.  Here's what I found:

    ❯ tail -n 10 /usr/local/var/log/postgres.log
    2020-09-10 16:17:49.566 EDT [85169] FATAL:  database files are incompatible with server
    2020-09-10 16:17:49.566 EDT [85169] DETAIL:  The data directory was initialized by PostgreSQL version 11, which is not compatible with this version 12.4.
    2020-09-10 16:17:59.589 EDT [85170] FATAL:  database files are incompatible with server
    2020-09-10 16:17:59.589 EDT [85170] DETAIL:  The data directory was initialized by PostgreSQL version 11, which is not compatible with this version 12.4.
    2020-09-10 16:18:09.617 EDT [85172] FATAL:  database files are incompatible with server
    2020-09-10 16:18:09.617 EDT [85172] DETAIL:  The data directory was initialized by PostgreSQL version 11, which is not compatible with this version 12.4.
    2020-09-10 16:18:19.643 EDT [85174] FATAL:  database files are incompatible with server
    2020-09-10 16:18:19.643 EDT [85174] DETAIL:  The data directory was initialized by PostgreSQL version 11, which is not compatible with this version 12.4.
    2020-09-10 16:18:29.671 EDT [85175] FATAL:  database files are incompatible with server
    2020-09-10 16:18:29.671 EDT [85175] DETAIL:  The data directory was initialized by PostgreSQL version 11, which is not compatible with this version 12.4.

I think what happened is at some point in the recent past a brew command upgraded postgres -- I have no memory of doing this and nor can I find it in the command history but it must have happened.  The solution was to run:

    brew postgresql-upgrade-database

And that gave this output:

    ❯ brew postgresql-upgrade-database
    ==> brew install postgresql@11
    ==> Downloading https://homebrew.bintray.com/bottles/postgresql%4011-11.9.catalina.bottle.tar.gz
    ==> Downloading from https://d29vzk4ow07wi7.cloudfront.net/6ae4d48f4eb3af904ff8bb4a4cd6194500272847636261a049559059a312ac10?response-content-disposition=attachment%3Bfilename%3D%22postgresql%4011-11.9.catalina.bottle.
    ==> Pouring postgresql@11-11.9.catalina.bottle.tar.gz
    ==> /usr/local/Cellar/postgresql@11/11.9/bin/initdb --locale=C -E UTF-8 /usr/local/var/postgresql@11
    ==> Caveats
    To migrate existing data from a previous major version of PostgreSQL run:
      brew postgresql-upgrade-database

    This formula has created a default database cluster with:
      initdb --locale=C -E UTF-8 /usr/local/var/postgres
    For more details, read:
      https://www.postgresql.org/docs/11/app-initdb.html

    postgresql@11 is keg-only, which means it was not symlinked into /usr/local,
    because this is an alternate version of another formula.

    If you need to have postgresql@11 first in your PATH run:
      echo 'export PATH="/usr/local/opt/postgresql@11/bin:$PATH"' >> ~/.zshrc

    For compilers to find postgresql@11 you may need to set:
      export LDFLAGS="-L/usr/local/opt/postgresql@11/lib"
      export CPPFLAGS="-I/usr/local/opt/postgresql@11/include"

    For pkg-config to find postgresql@11 you may need to set:
      export PKG_CONFIG_PATH="/usr/local/opt/postgresql@11/lib/pkgconfig"


    To have launchd start postgresql@11 now and restart at login:
      brew services start postgresql@11
    Or, if you don't want/need a background service you can just run:
      pg_ctl -D /usr/local/var/postgresql@11 start
    ==> Summary
    🍺  /usr/local/Cellar/postgresql@11/11.9: 3,197 files, 36.6MB
    ==> Upgrading postgresql data from 11 to 12...
    waiting for server to start....2020-09-10 16:20:44.104 EDT [85963] LOG:  listening on IPv6 address "::1", port 5432
    2020-09-10 16:20:44.104 EDT [85963] LOG:  listening on IPv4 address "127.0.0.1", port 5432
    2020-09-10 16:20:44.105 EDT [85963] LOG:  listening on Unix socket "/tmp/.s.PGSQL.5432"
    2020-09-10 16:20:44.202 EDT [85964] LOG:  database system was interrupted; last known up at 2020-07-13 13:22:20 EDT
    .2020-09-10 16:20:45.519 EDT [85964] LOG:  database system was not properly shut down; automatic recovery in progress
    2020-09-10 16:20:45.537 EDT [85964] LOG:  redo starts at 0/AA216798
    2020-09-10 16:20:45.537 EDT [85964] LOG:  invalid record length at 0/AA2167D0: wanted 24, got 0
    2020-09-10 16:20:45.537 EDT [85964] LOG:  redo done at 0/AA216798
    2020-09-10 16:20:45.572 EDT [85963] LOG:  database system is ready to accept connections
     done
    server started
    waiting for server to shut down....2020-09-10 16:20:45.839 EDT [85963] LOG:  received fast shutdown request
    2020-09-10 16:20:45.839 EDT [85963] LOG:  aborting any active transactions
    2020-09-10 16:20:45.840 EDT [85963] LOG:  background worker "logical replication launcher" (PID 85970) exited with exit code 1
    2020-09-10 16:20:45.840 EDT [85965] LOG:  shutting down
    2020-09-10 16:20:45.845 EDT [85963] LOG:  database system is shut down
     done
    server stopped
    ==> Moving postgresql data from /usr/local/var/postgres to /usr/local/var/postgres.old...
    ==> Creating database...
    The files belonging to this database system will be owned by user "sjohnson".
    This user must also own the server process.

    The database cluster will be initialized with locale "en_US.UTF-8".
    The default text search configuration will be set to "english".

    Data page checksums are disabled.

    fixing permissions on existing directory /usr/local/var/postgres ... ok
    creating subdirectories ... ok
    selecting dynamic shared memory implementation ... posix
    selecting default max_connections ... 100
    selecting default shared_buffers ... 128MB
    selecting default time zone ... America/Indiana/Indianapolis
    creating configuration files ... ok
    running bootstrap script ... ok
    performing post-bootstrap initialization ... ok
    syncing data to disk ... ok

    initdb: warning: enabling "trust" authentication for local connections
    You can change this by editing pg_hba.conf or using the option -A, or
    --auth-local and --auth-host, the next time you run initdb.

    Success. You can now start the database server using:

        /usr/local/opt/postgresql/bin/pg_ctl -D /usr/local/var/postgres -l logfile start

    ==> Migrating and upgrading data...
    Performing Consistency Checks
    -----------------------------
    Checking cluster versions                                   ok
    Checking database user is the install user                  ok
    Checking database connection settings                       ok
    Checking for prepared transactions                          ok
    Checking for reg* data types in user tables                 ok
    Checking for contrib/isn with bigint-passing mismatch       ok
    Checking for tables WITH OIDS                               ok
    Checking for invalid "sql_identifier" user columns          ok
    Creating dump of global objects                             ok
    Creating dump of database schemas
                                                                ok
    Checking for presence of required libraries                 ok
    Checking database user is the install user                  ok
    Checking for prepared transactions                          ok

    If pg_upgrade fails after this point, you must re-initdb the
    new cluster before continuing.

    Performing Upgrade
    ------------------
    Analyzing all rows in the new cluster                       ok
    Freezing all rows in the new cluster                        ok
    Deleting files from new pg_xact                             ok
    Copying old pg_xact to new server                           ok
    Setting next transaction ID and epoch for new cluster       ok
    Deleting files from new pg_multixact/offsets                ok
    Copying old pg_multixact/offsets to new server              ok
    Deleting files from new pg_multixact/members                ok
    Copying old pg_multixact/members to new server              ok
    Setting next multixact ID and offset for new cluster        ok
    Resetting WAL archives                                      ok
    Setting frozenxid and minmxid counters in new cluster       ok
    Restoring global objects in the new cluster                 ok
    Restoring database schemas in the new cluster
                                                                ok
    Copying user relation files
                                                                ok
    Setting next OID for new cluster                            ok
    Sync data directory to disk                                 ok
    Creating script to analyze new cluster                      ok
    Creating script to delete old cluster                       ok

    Upgrade Complete
    ----------------
    Optimizer statistics are not transferred by pg_upgrade so,
    once you start the new server, consider running:
        ./analyze_new_cluster.sh

    Running this script will delete the old cluster's data files:
        ./delete_old_cluster.sh
    ==> Upgraded postgresql data from 11 to 12!
    ==> Your postgresql 11 data remains at /usr/local/var/postgres.old

And now, finally, Here is how the logs should actually look:

    ❯ tail -n 10 /usr/local/var/log/postgres.log
    2020-09-10 16:22:52.819 EDT [86729] LOG:  received smart shutdown request
    2020-09-10 16:22:52.820 EDT [86729] LOG:  background worker "logical replication launcher" (PID 86736) exited with exit code 1
    2020-09-10 16:22:52.820 EDT [86731] LOG:  shutting down
    2020-09-10 16:22:52.888 EDT [86729] LOG:  database system is shut down
    2020-09-10 16:23:27.451 EDT [87278] LOG:  starting PostgreSQL 12.4 on x86_64-apple-darwin19.5.0, compiled by Apple clang version 11.0.3 (clang-1103.0.32.62), 64-bit
    2020-09-10 16:23:27.452 EDT [87278] LOG:  listening on IPv6 address "::1", port 5432
    2020-09-10 16:23:27.452 EDT [87278] LOG:  listening on IPv4 address "127.0.0.1", port 5432
    2020-09-10 16:23:27.453 EDT [87278] LOG:  listening on Unix socket "/tmp/.s.PGSQL.5432"
    2020-09-10 16:23:27.477 EDT [87307] LOG:  database system was shut down at 2020-09-10 16:22:52 EDT
    2020-09-10 16:23:27.481 EDT [87278] LOG:  database system is ready to accept connections