---
layout: post
title: AWS Tutorial 2 - Importing a Large MySQL Instance from S3
---
NOTE: Please Read [Tutorial 4](https://fuzzygroup.github.io/blog/2016/08/28/aws-tutorial-4-rds-data-loading-into-aurora-run-in-circles-scream-and-shout-the-oh-shite-moment.html) Before Continuing with This One.


[Yesterday](https://fuzzygroup.github.io/blog/2016/08/23/aws-exporting-a-large-mysql-instance-to-aws.html) I illustrated how to take your existing MySQL instance and move it, table by table, to an S3 bucket where you can, theoretically, load that back into MySQL.  However I left the particulars of that vague (picture handwaving and such).  Today I have that terabyte plus of SQL dumps and I need to get them back into MySQL.  I also now have:

* A configured MySQL (well MariaDB) server
* Our Rails code base running on said server

So here's what has to happen:

* Get the files out of the bucket
* Get a list of the files
* Loop over the files and either download them or pipe them in
* Deal with the files that are gz'd versus the straight sql dumps

Oh frabulous joy.  Well let's begin.

Getting files out of a bucket is one of those things that you could do a multitude of ways.  You could write code for it.  You could use command lines tools, etc.  I opted to use the aws command line tool as follows:

* Install it: sudo apt-get install aws
* Configure it: aws --configure (and then give it your access id and secret).  You can also give it your region which I'll come back to...

Once you have the aws tool configured you can use to move the data off your bucket onto the local machine where you can load it.  I presume that you might be able to pipe in from the bucket but I'm not going to be too sophisticated.  The first issue we are going to hit is that while you can easily get a list of your files like this:

    aws s3 ls s3://banks_production_db
    
You can't actually copy them without specifying the region id.  I do not understand.  If ls knows that they are there then why, in Ghu's name, can I not copy them.  No matter - you can't.  This then invokes a spasm of IT thrashing, url looking, admin page rifling until i finally come up with the magic incantation of: --region="us-east-1".

I then realize that copying each file one by one will, well, suck.  So I dig into the docs and I'm pleasantly surprised to find a [sync] (http://docs.aws.amazon.com/cli/latest/reference/s3/sync.html) command.

So my process for getting the files FROM the bucket TO the machine is now reduced to an elegant single command:

    aws s3 sync s3://banks_production_db ~/from_s3 --region="us-east-1"
    
## Sidebar 1: The Biggest of the Files Never Came Over Yesterday

One of the things I omitted yesterday was that the biggest of the files never came over.  They failed to transfer via piping over the network and I didn't have enough local disc space so I noted their names and just blipped past them figuring that I'd come back to them today.  And then today arrived and it was time.  While picking my son up from the bus during today's [Tornado emergency](http://www.cnn.com/videos/weather/2016/08/25/montgomery-county-indiana-tornado-damage-vo.wrtv) - I swear you cannot make this crap up -- I did some digging into core Unix tools I dredged from memory of building large CD-ROM ISO images and rediscovered [split](https://en.wikipedia.org/wiki/Split_(Unix)).  So now my process becomes this:

* clear up disc space
* mysqldump the tables one by one into a directory
* split the files into parts
* use sync on the source box (not the target ec2 instance) to send the files to S3 - aws s3 sync . s3://banks_production_db --region="us-east-1"
* on the target ec2 instance then you do the reverse - aws s3 sync s3://banks_production_db ~/from_s3 --region="us-east-1"
* move the files to a temporary directory
* reconstitute them - cat x? > filename.sql
* load them 

## Sidebar 2: A Critical Error Yesterday

As I thought this thru I realized a critical error - region mismatch.  Our core S3 bucket was created in us-east-1 while our instances are all in the cheaper Oregon data center.  If I had thought to create the bucket in Oregon then the data would have been closer and loaded faster.  Alas.

## The Ruby

As always there's some ruby.  I love ruby.  For the 4 giant files (each about 100 gigs in size) I can just flow them in one by one since they are coming down dribs and drabs.  But for the 200 odd other sql dumps a simple rake task will make it all good:

    task :from_s3 => :environment do
      password = "some_password"
      username = "some_user"
      db = "some_db"
      source = "/home/ubuntu/from_s3/*"
      execute_command = true
    
      files = Dir.glob(source)
      total = files.size
      files.each_with_index do |file, ctr|
        puts "#{ctr} -- #{(ctr.to_f/total*100).round(4)}% -- #{file}"
        if file =~ /\.gz/
          command = nil
        else
          command = "mysql -u#{username} -p#{password} #{db} < #{file}"
          puts command.red
        end
        `#{command}` if command && execute_command
      end
    end

## Sidebar 3: Its Always Something

So as I blearily wandered down to my office to check on all this I realize that something has gone awry as only about 1/3 of the split files have transferred down.  I do a quick ping test and get this crap:

    PING app1.foo.com (66.195.159.207): 56 data bytes
    Request timeout for icmp_seq 0
    Request timeout for icmp_seq 1
    Request timeout for icmp_seq 2

Sigh.  Its always something.  So I shut it down and actually go back to bed.  Tomorrow will arrive soon enough.