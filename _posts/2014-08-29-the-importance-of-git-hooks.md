---
layout: post
title: The Importance of Git Hooks
category: git
tags: ["ruby", "git", "hooks"]
date: 2014-08-29 01:48 -0400

---
So I was working this morning and got one of those bloody awful Rails stack traces -- every error was at the system layer and I could not make any progress debugging it.  So I looked at git status and there were like 25 + files all tied to an overall CSV import process (2 data models, 1 controller, system level UI changes, etc) and then it hit me -- I need my .git hooks setup on this project!  Every bit of source code under management by git has a .git directory at the top level and under it a hooks directory.  Hooks are executable files that are run when you do an atomic level git action.  For example there is one called pre-commit and this is code that is executed BEFORE a commit actually happens.  What you can do with a pre-commit hook is tie in a code evaluation process (think lint if you're a C guy) to find any errors before they are committed.  Now I've set these up in almost every project but not here so a quick copy of a file from another project to .git/hooks gave me this:

<pre>
app/controllers/csv_imports_controller.rb:
8: syntax error, unexpected ')', expecting ']'
 @csv_import = current_user.csv_imports.find(params[:id))
 ^
24: syntax error, unexpected $end, expecting keyword_end
</pre>

And here's the offending line in question:

<pre>
@csv_import = current_user.csv_imports.find(params[:id))
</pre>


Yep.  params[:id]) was needed (second to last char was a ) instead of a ].  I looked at that line like 4 times and didn't see it.

Having used these now for several years, its hard for me to imagine working in a dynamic language without them.  Kudos to Dv for setting these up once upon a time.

##.git/hooks for the win!

And here's the code for .git/hooks/pre-commit  Adjust the shebang line accordingly and make sure its an executable file.

<pre>
#!/usr/bin/env ruby
#
# A hook script to verify that only syntactically valid ruby code is commited.
# Called by git-commit with no arguments. The hook should
# exit with non-zero status after issuing an appropriate message if
# it wants to stop the commit.
#
# Put this code into a file called "pre-commit" inside your .git/hooks
# directory, and make sure it is executable ("chmod +x .git/hooks/pre-commit")
puts "in .git/hooks/pre-commit"
require 'open3'
include Open3
# Set this to true if you want warnings to stop your commit
stop_on_warnings = false
stop_on_errors = true
# compiler_ruby = `which rbx`.strip
# compiler_ruby = `which ruby`.strip if compiler_ruby.length == 0
# setting compiler to ruby-1.9.3 since `which ruby` was setting it to 1.8.7
compiler_ruby = "$HOME/.rvm/rubies/ruby-1.9.3-p484/bin/ruby"
changed_ruby_files = `git diff-index --name-only --cached HEAD`.split("\n").inject([]) do |files, line|
 files << line.chomp if line =~ /(.+\.(e?rb|task|rake|thor)|[Rr]akefile|[Tt]horfile)/
 files
end
problematic_files = changed_ruby_files.inject([]) do |problematic_files, file|
 if File.readable? file
 cmd = if file =~ /\.erb\z/
 # Set trim mode to "-", just as Rails does
 # Replacing all <%= tags with <% for the syntax check
 "sed 's/<%=/<%/g' #{file} | erb -xT - | #{compiler_ruby} -wc"
 else
 "#{compiler_ruby} -wc #{file}"
 end
errors = nil
 popen3(cmd) do |stdin, stdout, stderr|
 errors = stderr.read.split("\n")
 end
errors.reject!{ |line| line =~ /[0-9]+:\s+warning:/ } unless stop_on_warnings
 errors.reject!{ |line| line =~ /[0-9]+:\s+syntax error/ } unless stop_on_errors
unless errors.empty?
 errors.map!{ |line| line.sub(/#{file}:/, '') }
 problematic_files << "#{file}:\n#{errors.join("\n")}"
 end
 end
problematic_files
end
if problematic_files.size > 0
 $stderr.puts problematic_files.join("\n\n")
 exit 1
else
 puts "no syntax errors"
 # All is well
 exit 0
end
</pre>
