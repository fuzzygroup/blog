---
layout: post
title: OSX Tip Using mdfind to search your hard disc for files by name
category: OSX
tags: ["find", "mdfind", "command_line", "osx", "locate"]
---
As a long time Unix user, the lack of locate being automatically turned on in OSX has always, alway bothered me.  I have always wondered about this until yesterday when I couldn't find where my.cnf was on the disc and I turned to the Internet.  Somewhere I located this syntax:

> mdfind -name my.cnf

When I run this I get this output:

    /private/etc/my.cnf
    /Users/sjohnson/appdatallc/ansible/my.cnf
    /Users/sjohnson/Dropbox/appdatallc/chef2/cookbooks/mysql/templates/default/5.0/my.cnf.erb
    /Users/sjohnson/Dropbox/appdatallc/chef2/cookbooks/mysql/templates/default/5.1/my.cnf.erb
    /Users/sjohnson/Dropbox/appdatallc/chef2/cookbooks/mysql/templates/default/5.5/my.cnf.erb
    /Users/sjohnson/Dropbox/appdatallc/chef2/cookbooks/mysql/templates/default/5.6/my.cnf.erb
    /Users/sjohnson/Dropbox/appdatallc/chef2/cookbooks/mysql/templates/default/deprecated/my.cnf.erb
    /Users/sjohnson/Dropbox/appdatallc/chef2/berks-cookbooks/mysql/templates/default/deprecated/my.cnf.erb
    /Users/sjohnson/appdatallc/chef2/cookbooks/mysql/templates/default/5.0/my.cnf.erb
    /Users/sjohnson/appdatallc/chef2/cookbooks/mysql/templates/default/5.1/my.cnf.erb
    /Users/sjohnson/appdatallc/chef2/cookbooks/mysql/templates/default/5.5/my.cnf.erb
    /Users/sjohnson/appdatallc/chef2/cookbooks/mysql/templates/default/5.6/my.cnf.erb
    /Users/sjohnson/appdatallc/chef2/cookbooks/mysql/templates/default/deprecated/my.cnf.erb
    /Users/sjohnson/appdatallc/chef2/berks-cookbooks/mysql/templates/default/5.0/my.cnf.erb
    /Users/sjohnson/appdatallc/chef2/berks-cookbooks/mysql/templates/default/5.1/my.cnf.erb
    /Users/sjohnson/appdatallc/chef2/berks-cookbooks/mysql/templates/default/5.5/my.cnf.erb
    /Users/sjohnson/appdatallc/chef2/berks-cookbooks/mysql/templates/default/5.6/my.cnf.erb
    /Users/sjohnson/appdatallc/chef2/berks-cookbooks/mysql/templates/default/deprecated/my.cnf.erb
    /Users/sjohnson/Dropbox/consulting/interana/sso_portal/script/ansible/roles/mariadb/templates/my.cnf
    /Users/sjohnson/Dropbox/appdatallc/chef2/berks-cookbooks/mysql/templates/default/5.0/my.cnf.erb
    /Users/sjohnson/Dropbox/appdatallc/chef2/berks-cookbooks/mysql/templates/default/5.1/my.cnf.erb
    /Users/sjohnson/Dropbox/appdatallc/chef2/berks-cookbooks/mysql/templates/default/5.5/my.cnf.erb
    /Users/sjohnson/Dropbox/appdatallc/chef2/berks-cookbooks/mysql/templates/default/5.6/my.cnf.erb
    /Users/sjohnson/Dropbox/appdatallc/ansible/my.cnf
    /Users/sjohnson/Dropbox/consulting/interana/master_before_move_back_to_detached/sso_portal/script/ansible/roles/mariadb/templates/my.cnf
    /Users/sjohnson/Dropbox/appdatallc/ansible-clean/roles/install-mariadb55/files/etc/mysql/my.cnf.default
    /Users/sjohnson/Dropbox/fuzzygroup/ansible/ansible-for-aws/wordpress/roles/mysql/templates/my.cnf.j2
    /usr/local/etc/my.cnf
    /usr/local/etc/my.cnf.d
    /Library/Ruby/Gems/2.0.0/gems/mysql2-0.4.4/spec/my.cnf.example
    /Users/sjohnson/Dropbox/fuzzygroup/rails/crawl_evaluation/daimon_as_framework/udemy/docker-cache/bundle/ruby/2.4.0/gems/mysql2-0.4.5/spec/my.cnf.example

So it looks to me like this gives me pretty much what I would have gotten from locate without having to worry about the locate db being updated and the like.  Kudos to Apple for this and bad on me for not knowing about this even after using OSX continuously since 2006 or so.  Sigh.
