---
layout: post
title: AWS Tutorial 1 - Exporting a Large MySQL Instance to S3
---
NOTE: Please Read [Tutorial 4](https://fuzzygroup.github.io/blog/2016/08/28/aws-tutorial-4-rds-data-loading-into-aurora-run-in-circles-scream-and-shout-the-oh-shite-moment.html) Before Continuing with This One.

I'm in the process of migrating a rather large Rails installation to [AWS](http://aws.amazon.com/).  The initial plan had been to refactor it slowly into a series of microservices and do it properly.  Some engineering issues that have just (read yesterday morning) cropped up seem to be driving a need for more boxes than our current host can support.  So it is looking like the refactor will be done incrementally and our next large scale data processing run will be done on AWS. 

This means that of all the items in the mythical gant chart of dependencies that need to get addressed is the mysql export.  We're talking about what is likely a 2 plus terabyte mysql instance.  And, no, there's not enough free disc space to compress the tables so this means:

* ignore the 3 huge but irrelevant tables in the db
* dump the data over the network
* get the data to an S3 bucket
* load it on the other site whether to our own MySQL box or an RDS box

A bit of research points me to [s3cmd](http://serverfault.com/questions/605796/how-to-pipe-a-mysql-dump-to-s3cmd) as a way to take data from a pipe and drop it into an s3 bucket.  A quick apt-get install s3cmd yields, alas, a non working solution.  Pipe support came in 1.5 or later and and the default apt-get gives a near obsolete 1.1.  More talented apt-getters than myself will know the work around but for me it was:

* Write the backup routine from the stack overflow article above
* Figure out how to get AWS credentials for S3
* Install the AWS client (sudo apt-get install aws)
* Configure the AWS client (aws --configure)
* Use the aws client to create a bucket: aws s3api create-bucket --bucket db
* Deal with the s3cmd issues
* sudo apt-get install s3cmd
* #$(*#$(#$*())) it doesn't work with a quick pipe test.  Do the [google grovel](https://github.com/s3tools/s3cmd/issues/270) to find out about 1.5.
* sudo apt-get remove s3cmd
* sudo pip install s3cmd from the [Github](https://github.com/s3tools/s3cmd/blob/master/INSTALL)
* Realize that this doesn't put it in the path (at which point you give up and encode the path in your export routine)
* Create a [Tmux](https://tmux.github.io/) session so that a 2 day export process doesn't die when the SSH session invariably fails
* Download and install the only AWS client worth using - [Transmit Panic](http://panic.com/transmit/) to monitor the export
* Deploy the code, login to the box, change the execute_dump variable from true to false, switch into the tmux session and start the process

This is a fairly classical automation problem so a quick Rake task should do it nicely.  Here you go:

    namespace :mysqldump do
      # bundle exec rake mysqldump:to_s3 --trace
      task :to_s3 => :environment do
        Kernel.silence_warnings do 
          execute_dump = false

          s3_executable = "/usr/local/bin/s3cmd"
          mysqldump_executable = "mysqldump"
          host = "10.0.41.33"
          password = "SOME_PASSWORD"
          username = "appdata"
          db = "banks_production"
          bucket = "banks_production_db"
    
          excluded_tables = %w{links pages page_bodies}
    
          all_tables = ActiveRecord::Base.connection.select_values("SHOW TABLES")
          total = all_tables.size

          all_tables.each_with_index do |table, ctr|
            next if excluded_tables.include?(table)
            puts "Exporting: #{table} :: #{ctr} :: #{(ctr.to_f/total*100).round(4)}%"
            dump_statement = "#{mysqldump_executable} -u#{username} -p#{password} -h#{host} #{db} #{table} | #{s3_executable} put - s3://#{bucket}/#{table}.sql"      
            puts "#{dump_statement}"
            `#{dump_statement}` if execute_dump
          end
        end
      end
    end

In closing there are dozens of ways to solve this particular problem but the number of different steps that I had to go thru just to get a mysql db moved to aws I thought warranted documentation.  I will forget this otherwise and there are many more databases before I sleep...


