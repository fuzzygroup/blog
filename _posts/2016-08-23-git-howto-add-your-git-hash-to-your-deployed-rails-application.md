---
layout: post
title: Git Howto - Add Your Git Hash to Your Deployed Rails Application
category: rails
tags: ["git", "rails", "ruby"]

---
This is one of those things that I know there are a zillion ways to accomplish this but this one is **mine**. And it will likely be how my boxes tackle this issue.  

Lately I've been struggling with issues of idempotency in large jobs.  Idempotent is one of those terms that just means a process, given the same inputs, should generate the same outputs.  This is a full text categorization problem where the queue that the thread pool works down is about 3 million items in size.  And it is generating different results when run on a Monday or a Friday or whatever.  Its unclear as to why and one of the issues is there are a lot of different variables - the size of the queue, the items in the queue etc.  So my first thought was that I needed to generate a db object which tracked the variables.  However one of the variables is the **code base itself**.  We're constantly making changes, fixes, etc and if that's causing the issues, then it is vital to be able track changes back to the actual git state of the code base.  This means that as part of our db object which tracks everything we need to record the git hash of the code base when the queue was generated and the categorization was executed.

Now I'm virtually certain that this already exists on the production deploy environment somewhere but I just can't find it.  And Google was just no help on this one.  It took me to this [gem](https://github.com/darrinholst/git-version) which was, alas, just plain useless.  It managed to generate the same git hash across multiple different deploys of the code base (yes I made commits across each). So that was not what I was looking for.  I then explored using a .git/hooks file specifically a post_commit hook but since I wanted to write a file containing the git hash before we deploy each time the commit executed it would call itself and that's obviously not right.  

I finally settled on generating at the deployment level via rake remote_task.  Since we're using Vlad its already there anyway.  Here's all the code necessary:

    remote_task :set_git_hash_environment_variable do 
      tmp = `git log -1 HEAD`
      parts = tmp.split(" ")
      git_hash = parts[1]
      path = "/home/banks/srv/current/config/git_hash.txt"
      run "echo #{git_hash} > #{path}"
    end
  
The git log  command does all the heavy lifting.  I then split out the hash and finally drop it into a file just by running an echo statement piped to the canonical location.
  
And then in our vlad deploy block there is a call to this:

    task "vlad:deploy" => %w[
      vlad:update
      vlad:bundle:install
      vlad:migrate
      vlad:assets:precompile
      vlad:sidekiq:restart
      vlad:start_app
      vlad:cleanup
      vlad:set_git_hash_environment_variable
    ]
    
And that's about it.  I know its not elegant but it wasn't needed to be elegant -- just working for now.