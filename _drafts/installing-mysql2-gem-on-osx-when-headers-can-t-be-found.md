---
layout: post
title: Installing mysql2 Gem on OSX when Headers Can't Be Found
category: ["rails"]
tags: ["rails", "ruby", "mysql"]
---
**Note**: If you're not a Rails user, on OSX, then just nope the heck out of reading this post.  This is some serious nerdery here.

One of the single most frustrating things about the Rails ecosystem is when you can't get a bundle install operation to finish.  The bundle install, of course, is the process of getting the software tools, "gems", identified in Gemfile to install.  When you can't get bundle install to finish, you are effectively entirely blocked from continuing with a project.  A friend hit a serious problem recently with bundle install and the mysql2 gem.  I gave some online help via chat and while they solved it without me, I volunteered to write it down so there's a decent explanation / write up.

Here's the error:

    ld: library not found for -lssl
    clang: error: linker command failed with exit code 1 (use -v to see invocation)
    make: *** [mysql2.bundle] Error 1

My first suggestion was to try a "brew install mariadb" (mariadb is a fully compatible, **better** version of MySQL, written by the creator of MySQL).  It turned out that mariadb was already installed.

So this led me to this *blink* and then I asked for "paste me the whole disgustingly long error message on bundle install".

    Installing mysql2 0.5.2 with native extensions
    Gem::Ext::BuildError: ERROR: Failed to build gem native extension.

    current directory:
    /Users/foo/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/mysql2-0.5.2/ext/mysql2
    /Users/foo/.rbenv/versions/2.6.3/bin/ruby -I
    /Users/foo/.rbenv/versions/2.6.3/lib/ruby/2.6.0 -r
    ./siteconf20191120-7300-1a2t7xt.rb extconf.rb
    checking for rb_absint_size()... yes
    checking for rb_absint_singlebit_p()... yes
    checking for rb_wait_for_single_fd()... yes
    -----
    Using mysql_config at /usr/local/bin/mysql_config
    -----
    checking for mysql.h... yes
    checking for errmsg.h... yes
    checking for SSL_MODE_DISABLED in mysql.h... no
    checking for MYSQL_OPT_SSL_ENFORCE in mysql.h... yes
    checking for MYSQL.net.vio in mysql.h... no
    checking for MYSQL.net.pvio in mysql.h... yes
    checking for MYSQL_ENABLE_CLEARTEXT_PLUGIN in mysql.h... yes
    checking for SERVER_QUERY_NO_GOOD_INDEX_USED in mysql.h... yes
    checking for SERVER_QUERY_NO_INDEX_USED in mysql.h... yes
    checking for SERVER_QUERY_WAS_SLOW in mysql.h... yes
    checking for MYSQL_OPTION_MULTI_STATEMENTS_ON in mysql.h... yes
    checking for MYSQL_OPTION_MULTI_STATEMENTS_OFF in mysql.h... yes
    checking for my_bool in mysql.h... yes
    -----
    Don't know how to set rpath on your system, if MySQL libraries are not in path
    mysql2 may not load
    -----
    -----
    Setting libpath to /usr/local/Cellar/mariadb/10.4.10_1/lib
    -----
    creating Makefile

    current directory:
    /Users/foo/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/mysql2-0.5.2/ext/mysql2
    make "DESTDIR=" clean

    current directory:
    /Users/foo/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/mysql2-0.5.2/ext/mysql2
    make "DESTDIR="
    compiling client.c
    client.c:140:1: warning: control may reach end of non-void function
    [-Wreturn-type]
    }
    ^
    1 warning generated.
    compiling infile.c
    compiling mysql2_ext.c
    compiling result.c
    compiling statement.c
    linking shared-object mysql2/mysql2.bundle
    ld: library not found for -lssl
    clang: error: linker command failed with exit code 1 (use -v to see invocation)
    make: *** [mysql2.bundle] Error 1

    make failed, exit code 2

    Gem files will remain installed in
    /Users/foo/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/gems/mysql2-0.5.2 for
    inspection.
    Results logged to
    /Users/foo/.rbenv/versions/2.6.3/lib/ruby/gems/2.6.0/extensions/x86_64-darwin-18/2.6.0/mysql2-0.5.2/gem_make.out

    An error occurred while installing mysql2 (0.5.2), and Bundler cannot
    continue.
    Make sure that gem install mysql2 -v '0.5.2' --source 'https://rubygems.org/'
    succeeds before bundling.

My comment was pretty that it simply can't find the libraries, almost certainly the header files for openssl.  This is actually a common install problem for gems.  Happily my friend found the [answer](https://github.com/brianmario/mysql2/issues/795) (and without me which is awesome).  Here is what turned out to be needed:

    export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

This the kind of thing that differs across people's systems / environments so I get why it is an issue despite the mysql2 gem being what -- a decade plus old?  But I wish that the build ecosystem for Rails better allowed for things like this because, well, when you can't bundle install, you effectively can't rails.

**Note**: And I get the open source ethos that if I want this, I should fix it myself.  I'm also aware of how deep a rabbit hole that would be and I don't have the mental energy to even contemplate solving this. So, yeah, I'm going to whine but I'm also massively thankful for the mysql2 gem so thank you brianmario.  Appreciated.  At least I hopefully gave back a bit by explaining this well.