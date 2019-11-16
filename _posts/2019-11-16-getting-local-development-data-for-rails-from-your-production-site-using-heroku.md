---
layout: post
title: Getting Local Development Data for Rails from Your Production Site using Heroku
category: rails
tags: ["rails", "heroku"]
---
{:.center}
![IMG_9986.jpeg](/blog/assets/IMG_9986.jpeg)

One of the worst aspects of doing Rails development, although this is not limited to Rails in any way, is getting data to use for development work once your site starts getting users.  Yes I know that you should always have full test coverage and that local data shouldn't be necessary -- **but it absolutely is**.  There is always a class of errors that you simply can't diagnose with a set of data with which to work.

The happy truth though is that you actually can pretty easily move data from production to development at will (at least as long as the database isn't too massive; when your site gets large it is a different matter).  

## The Approach

The approach here is actually pretty simple.  My examples all center around using MySQL as a data store but any database that has solid import / export will work.

1.  To start you should backup your local data just in case you need it back afterwards.
2.  You then connect to your remote datastore and use mysqldump to export your data to a local data dump.
3.  You then import this local data dump.
4.  You debug your site using a much richer set of data.

## Making this Easy with a Rake Task

Here's a rake task that I wrote that gives you a lot of tasks for dealing with your local / remote databases.  Drop this into lib/tasks and you can see the tasks it offers with:

    bundle exec rake -T | grep database

```ruby

namespace :database do
  namespace :development do
    
    # Generates a mysql load command
    # bundle exec rake database:development:mysql_load_data_command --trace
    task :mysql_load_data_command => :environment do
      #username, password, database 
      db_params = get_local_database_params
      command = make_mysql_command('mysql', db_params, ' < lib/tasks/data/db_dumps/')
      puts "Add the load file into the below command "
      puts "  once you copy and paste it back into the terminal"
      puts command
    end

    # generates a mysql command to get into the database
    # bundle exec rake database:development_mysql_command --trace
    task :mysql_command => :environment do
      db_params = get_local_database_params
      command = "mysql -u#{username} -p#{password} #{database} "
      puts command
    end

    # generates a dump data command that puts the data into lib/tasks/data/db_dumps/
    # bundle exec rake database:development:mysql_dump_data --trace
    task :mysql_dump_data => :environment do
      db_params = get_local_database_params
      dump_dest = " > lib/tasks/data/db_dumps/#{db_params['database']}_#{Date.today.to_s(:db)}.sql"
      command = make_mysql_command('mysqldump', db_params, dump_dest)
      `#{command}`
    end

  end
  
  namespace :production do
    # bundle exec rake database:production:mysql_dump_data --trace
    task :mysql_dump_data => :environment do
      puts "About to dump data in 10 seconds (or press CTRL+C) ...."
      sleep(5)
      db_params = get_heroku_database_params
      dump_dest = " > lib/tasks/data/db_dumps/#{db_params['database']}_#{Date.today.to_s(:db)}.sql"
      command = make_mysql_command('mysqldump', db_params, dump_dest)
      `#{command}`
      
    end

    # bundle exec rake database:production:mysql_load_data_command --trace
    task :mysql_load_data_command => :environment do
      db_params = get_heroku_database_params
      command = make_mysql_command('mysql', db_params, '< ')
      puts command
    end
    
    # bundle exec rake database:production:mysql_command --trace
    task :mysql_command => :environment do
      db_params = get_heroku_database_params
      command = make_mysql_command('mysql', db_params)
      puts command
    end
  end
  
  def make_mysql_command(base_command, params, post_command=nil)
    username = params['username']
    password = params['password']
    database = params['database']
    host = params['host']
    if host
      cmd = "#{base_command} -u#{username} -p#{password} -h #{host} #{database} #{post_command}"
    else
      cmd = "#{base_command} -u#{username} -p#{password} #{database} #{post_command}"
    end
    return cmd
  end

  # this is how heroku used to work a few months ago, now, not so much...
  def get_heroku_database_params_classic
    require 'open3'
    stdout, stderr, status = Open3.capture3("heroku config")
    stdout_lines = stdout.split("\n")

    db_params = {}
    stdout_lines.each do |stdout_line|
      if stdout_line =~ /^DB_/
        key, value = parse_stdout_line(stdout_line)
        db_params[key] = value
      end
    end
    db_params
  end
  
  def get_heroku_database_params
    require 'open3'
    stdout, stderr, status = Open3.capture3("heroku config")
    stdout_lines = stdout.split("\n")

    db_params = {}
    database_url = nil
    stdout_lines.each do |stdout_line|
      if stdout_line =~ /^DATABASE_URL:/
        key, database_url = parse_stdout_line(stdout_line)
      end
    end
    
    parts = URI.parse(database_url)

    # build up a hash of db_params
    db_params['username'] = parts.user
    # the database itself is stored as the path in the url but the / needs to be stripped
    db_params['database'] = parts.path[1..255]
    db_params['password'] = parts.password
    db_params['host'] = parts.host
    
    db_params
  end

  def get_local_database_params
    db_config = Rails.configuration.database_configuration
    db_params = {}
    db_params['username'] = db_config["development"]["username"]
    db_params['host'] = db_config["development"]["host"]
    db_params['password'] = db_config["development"]["password"]
    db_params['database'] = db_config["development"]["database"]
    db_params
  end
  
  def parse_stdout_line(line)
    line = line.strip
    key, value = line.split(/:\s+/)
    return key, value
  end
  
end
```

## Dumping from Production and Loading to Development

Here's how to dump the data:

    bundle exec rake database:production:mysql_dump_data --trace
    
And here's how to load this in:

    bundle exec rake database:development:mysql_load_data_command --trace
    ** Invoke database:development:mysql_load_data_command (first_time)
    ** Invoke environment (first_time)
    ** Execute environment
    ** Execute database:development:mysql_load_data_command
    Add the load file into the below command
      once you copy and paste it back into the terminal
    mysql -uroot -pADFD!@# change_me_now_development  < lib/tasks/data/db_dumps/
    
(note - I changed the password above).  And then you need to actually run this command with the correct database file that came from the dump:

    mysql -uroot -pADFD!@# change_me_now_development  < lib/tasks/data/db_dumps/d3rbmdakuvgkjfkv_2019-11-16.sql
    
**Note**: The database name you get from Heroku is very much a randomized string so don't expect it to be the normal Rails like "_production" style database name.