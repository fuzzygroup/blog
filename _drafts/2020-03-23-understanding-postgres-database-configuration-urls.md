---
layout: post
title: Understanding Postgres Database Configuration Urls
category: postgres
tags: ["postgres", "ruby"]
---


pg_dump -dcovidnearme_org -h10.138.188.253 --username=thrtq5uyyrnrmmn --data-only > ~/covidnearme_gcp.sql

irb(main):001:0> ENV['DATABASE_URL']
=> "postgresql://thrtq5uyyrnrmmn:srj16xrv9T8W-2L2d7P_RzTh4yf2CyaZ@10.138.188.253/covidnearme_org"
irb(main):002:0> URI.parse(ENV['DATABASE_URL'])
=> #<URI::Generic postgresql://thrtq5uyyrnrmmn:srj16xrv9T8W-2L2d7P_RzTh4yf2CyaZ@10.138.188.253/covidnearme_org>
irb(main):003:0> parsed = URI.parse(ENV['DATABASE_URL'])
irb(main):004:0> ap parsed
#
<URI::Generic postgresql://thrtq5uyyrnrnnn:tqy16xrv9T8W-2L2d7P_RzTh4yf2CyaZ@10.138.188.253/covidnearme_org>
=> nil
irb(main):005:0> parsed = URI.parse(ENV['DATABASE_URL'])^C
irb(main):005:0> parts = URI.parse(ENV['DATABASE_URL'])
irb(main):006:0> parts.methods
=> [:port, :default_port, :set_path, :==, :parser, :path, :scheme=, :userinfo=, :component, :port=, :path=, :hostname=, :query=, :opaque=, :set_scheme, :set_userinfo, :set_host, :password, :password=, :set_port, :set_user, :set_password, :set_registry, :registry=, :hierarchical?, :absolute, :set_opaque, :fragment=, :-, :route_from, :opaque, :registry, :query, :fragment, :component_ary, :route_to, :normalize!, :+, :inspect, :find_proxy, :as_json, :to_s, :eql?, :host, :hostname, :user, :host=, :userinfo, :user=, :coerce, :absolute?, :relative?, :select, :normalize, :merge!, :merge, :hash, :scheme, :untaint, :require_dependency, :to_json, :in?, :presence_in, :methods, :singleton_methods, :protected_methods, :private_methods, :public_methods, :with_options, :deep_dup, :acts_like?, :present?, :presence, :to_yaml, :duplicable?, :to_param, :to_query, :blank?, :instance_values, :instance_variable_names, :html_safe?, :pretty_print, :pretty_print_inspect, :pretty_print_cycle, :pretty_print_instance_variables, :try!, :try, :unloadable, :require_or_load, :load_dependency, :dup, :itself, :yield_self, :then, :taint, :tainted?, :untrust, :untrusted?, :trust, :frozen?, :instance_variables, :instance_variable_get, :instance_variable_set, :instance_variable_defined?, :remove_instance_variable, :instance_of?, :kind_of?, :is_a?, :tap, :class, :singleton_class, :clone, :public_send, :method, :public_method, :singleton_method, :class_eval, :define_singleton_method, :extend, :gem, :awesome_print, :awesome_inspect, :to_enum, :enum_for, :<=>, :===, :=~, :!~, :nil?, :respond_to?, :freeze, :object_id, :send, :ai, :pretty_inspect, :display, :__send__, :!, :!=, :equal?, :__id__, :instance_eval, :instance_exec]
irb(main):007:0> parts.hostname
=> "10.138.188.253"
irb(main):008:0> parts.port
=> nil
irb(main):009:0> parts.password
=> "srj16xrv9T8W-2L2d7P_RzTh4yf2CyaZ"
irb(main):010:0> parts.user
=> "thrtq5uyyrnrmmn"
irb(main):011:0>

========

psql -U sjohnson -d covid_morbidity1_development -1 -f lib/tasks/data/covidnearme.sql

psql -U postgres -d postgres -1 -f lib/tasks/data/covidnearme.sql

psql -U postgres -d postgres --host=10.199.144.4 -1 -f lib/tasks/data/covidnearme.sql

"DATABASE_URL" => "postgresql://postgres:lDFIczI9guysavLv@10.199.144.4/postgres",


=======


❯ irb
2.7.0 :001 > parts = URI.parse("postgresql://postgres:lDFIczI9guysavLv@10.199.144.4/postgres")
2.7.0 :002 > parts.password
"lDFIczI9guysavLv"
2.7.0 :003 > parts.user
"postgres"
2.7.0 :004 > parts.database
Traceback (most recent call last):
       16: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/friendly_errors.rb:123:in `with_friendly_errors'
       15: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/bundler-2.1.2/libexec/bundle:46:in `block in <top (required)>'
       14: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli.rb:24:in `start'
       13: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/vendor/thor/lib/thor/base.rb:476:in `start'
       12: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli.rb:30:in `dispatch'
       11: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/vendor/thor/lib/thor.rb:399:in `dispatch'
       10: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/vendor/thor/lib/thor/invocation.rb:127:in `invoke_command'
        9: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/vendor/thor/lib/thor/command.rb:27:in `run'
        8: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli.rb:476:in `exec'
        7: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli/exec.rb:28:in `run'
        6: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli/exec.rb:63:in `kernel_load'
        5: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/2.7.0/bundler/cli/exec.rb:63:in `load'
        4: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `<top (required)>'
        3: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `load'
        2: from /Users/sjohnson/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2.1/exe/irb:11:in `<top (required)>'
        1: from (irb):4
NoMethodError (undefined method `database' for #<URI::Generic:0x00007feb668fb098>)
2.7.0 :005 > parts.path
"/postgres"



==========


Password for user postgres:
SET
SET
SET
SET
SET
 set_config
------------

(1 row)

SET
SET
SET
SET
CREATE EXTENSION
COMMENT
SET
psql:test.sql:45: ERROR:  relation "action_text_embeds" already exists
psql:test.sql:48: ERROR:  current transaction is aborted, commands ignored until end of transaction block
psql:test.sql:59: ERROR:  current transaction is aborted, commands ignored until end of transaction block
psql:test.sql:62: ERROR:  current transaction is aborted, commands ignored until end of transaction block
psql:test.sql:68: ERROR:  current transaction is aborted, commands ignored until end of transaction block
psql:test.sql:83: ERROR:  current transaction is aborted, commands ignored until end of transaction block
psql:test.sql:86: ERROR:  current transaction is aborted, commands ignored until end of transaction block
psql:test.sql:97: ERROR:  current transaction is aborted, commands ignored until end of transaction block
psql:test.sql:100: ERROR:  current transaction is aborted, commands ignored until end of transaction block
psql:test.sql:106: ERROR:  current transaction is aborted, commands ignored until end of transaction block
psql:test.sql:120: ERROR:  current transaction is aborted, commands ignored until end of transaction block
psql:test.sql:123



SAFETY_ASSURED=1 DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rake db:drop