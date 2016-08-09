---
layout: post
title: Archiving HTML Pages to the Database with Compression Using Rails
---
I've done this now like 15 times and every single time there is one or more serious gotchas that hold up my implementation so I thought I'd write it all out once and for all.  The problem at hand is:

* storing variable length HTML chunks
* in an ActiveRecord based table 
* with compression
* with seamless access to the content
* without absolutely nuking the space usage of your database
* without MySQL Dump's errors causing you to swear like a sailor


## 1.  Model

Create your model as follows:

<pre>
bundle exec rails g model PageBody
</pre>

Here's your table definition in SQL:

<pre>
CREATE TABLE `page_bodies` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
`created_at` datetime DEFAULT NULL,
`updated_at` datetime DEFAULT NULL,
 `html` mediumblob,
 PRIMARY KEY (`id`),
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8
</pre>

Here's a Rails migration to create that:

<pre>
class CreatePageBodies < ActiveRecord::Migration
   def change
     create_table :page_bodies do |t|
     t.timestamps
     t.text :html
   end
   q = "ALTER TABLE page_bodies CHANGE html html mediumblob"
   ActiveRecord::Base.connection.execute(q)
   ActiveRecord::Base.connection.execute("ALTER TABLE page_bodies CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;")
 end
end
</pre>

<pre> 
bundle exec rake db:migrate
</pre>

I'm sure there's a better way to do the mediumblob / utf8 change but that's what I'm comfortable with.  I still regard SQL as the assembly language of the web and if you don't know it then you're going to be hosed at some point.  Keeping your hands dirty with SQL is a way to always stay aware of it.  And, yes, I'm old.

What this gives us is a model which can store HTML as a binary blob.  The next step is compression.

##2.  Compression

To your gemfile, add the bzip2 gem:

<pre>
gem 'bzip2-ruby'
</pre>

Now bundle install and I'd argue for deploying to a server immediately.  Why?  I've found that bzip2 can be a real bear to get installed and better to get past that now.  And I'm not an expert when Gems don't install.  I curse like a sailor and then ask Jared for help.  We generally solve it often by hook or by crook.

##3.  Generate a ZlibColumn model

We need an abstract model to represent a compressed column with two methods -- dump and load.  

<pre>
bundle exec rails g model ZlibColumn
</pre>

Delete the factory and the migration.  Here's the whole class:

<pre>
class ZlibColumn
 # This does the decompression
 # Called to deserialize data to ruby object.
 def load(data)
   begin
     Bzip2.uncompress(data)
   rescue Exception => e
     puts "#{data.try(:size).inspect}"
     puts "Unable to decompress data from the db: #{e.inspect}"
     return "<html><body></body></html>"
   end
 end
  # This does the compression
  # Called to convert from ruby object to serialized data.
  def dump(data)
   data = '' if data.nil?
   data = TextCommon.convert_to_utf8(data)
   Bzip2.compress(data)
  end
end
</pre>

Here's a simple class with a convert to UTF-8 method that's been pretty battle tested (i.e. we've run it on over probably half a million pages at least)

<pre>
class TextCommon
  def self.convert_to_utf8(body)
   return nil if body.nil?
   file_contents = body
   require 'iconv' unless String.method_defined?(:encode)
   if String.method_defined?(:encode)
     file_contents.encode!('UTF-16', 'UTF-8', :invalid => :replace, :replace => '')
     file_contents.encode!('UTF-8', 'UTF-16')
   else
     ic = Iconv.new('UTF-8', 'UTF-8//IGNORE')
     file_contents = ic.iconv(file_contents)
   end
   return file_contents
  end
end
</pre>

As with the migration, I'm sure there are better ways to do this but this works for us at least.

Now to your model you need to add the utf-8 encoding at the top:

<pre>
#encoding: utf-8
</pre>

Now you need to add this directive:

<pre>
serialize :html, ZlibColumn.new
</pre>

at the start of your model.  This invokes the compression transparently.  Just assign the html content to the html attribute and when the model is saved or loaded it will be magically compressed / decompressed.  And, honestly, its like magic; its seamless.

Space Usage at the DB Level

If you're going to use this technique and you haven't turned on per file innodb table spaces then you absolutely should.  Here's the directive to use in your my.cnf:

<pre>
[mysqld]
innodb_file_per_table
</pre>

As with everything in a mysql config file, understand the issues very, very well first.  I talk about this a little over here.

##MySQL Dump

Every single time I store html pages as ASCII content to the db, when I have to move the table using mysqldump and then reload it, what I find happens is that mysqldump generates incorrectly encoded files so they cannot be reloaded.  I don't know if this is a mysqldump problem or an activerecord issue but its very, very real.  I recently had to recrawl 89,413 pages due to this and it is a bear.  By storing the pages as compressed binary blobs, you completely skirt over this.

##Warning

Like a Rails, this is a "magical" solution.  I've done this a number of times and its always been "extract this bit from here, extract that bit from there; add salt; curse; repeat" and then it sometimes works.  This is the first time I've tried to get it all documented in one place.  I think its actually right but I won't 100% know until I try it again on a project.  Right now I need to go back to vacation.