---
layout: post
title: ActionMailer, Vlad and Rake Remote Task Issues
category: actionmailer
tags: ["actionmailer", "ruby", "vlad"]

---

We recently had a situation where adding a UserMailer to a new Rails 4 app (really a tiny one) led to conflicts with "domain" and Rake Remote Task in Production.   The issue turned out to be a problem tied to Vlad.  Seattle RB argued for "Turn off autoload for vlad" and that it was really a bundler issue.  Unfortunately, as is all to common, they did not say how to do that.  Happily there is an easy work around -- run Vlad only on development boxes -- put it in a development group in gem file so you have:

Before:

<pre>
gem 'vlad'
gem 'vlad-git'
gem 'vlad-extras'
</pre>

After

<pre>
group :development do
  gem 'rake-remote_task'#, '2.2.2', :path => "vendor/gems/rake-remote_task-2.2.2"
  gem 'vlad', '2.6.3', :path => "vendor/gems/vlad-2.6.3/"
  gem 'vlad-git'
  gem 'vlad-extras', :path => "vendor/gems/vlad-extras-0.7.3"
end
</pre>

By keeping vlad and rake-remote-task OFF production boxes then you've not fixed this problem (its still there) but vlad doesn't need to be on production boxes.  Its raison de etre so to speak is to run on development and move stuff to production.

Props to Dv for dealing with this and Jared for coming up with the ultimate solution.  Me?  I'm just the writer...