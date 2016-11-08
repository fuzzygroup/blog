---
layout: post
title: Git Tip - Resetting Master to A Previous Commit
category: git
tags: ["git", "version_control"]
---
I would argue that most of our git usage is pretty straight forward:

* git add
* git commit
* git push
* git branch
* git co
* git merge
* git log
* git diff

That covers literally 99% of what I have to do with git on a daily basis.  So when you need to do something more complex it can be a bit disconcerting.  Today I had to revert to a previous git hash and make that commit, from 2 days ago, master.  Here's the process:

1.  Use github to find the commit you want to revert to.  This will be referred to as COMMIT_HASH
2.  Commit everything currently in progress so you don't get any error messages about it.  Or delete everything (I have a git trash alias which does checkout -f).
3.  Use this command: **git reset --hard COMMIT_HASH**
4.  This makes COMMIT_HASH your local master.  However you will NOT be able to push because you have "time traveled" to the past.  The secret here is to do a -f push so your changes are forced to the serve.  Use this command: **git push -f origin master**

Note 1: In this case I didn't even try to preserve the changes made within that 2 day period.  That's possible but definitely harder.

Note 2: The -f overwrites what's on the server since COMMIT_HASH so it will never be available.  **Please understand this well before doing this.**

Note 3: My pairing buddy, [Dv](http://www.dasari.me), helped out with this.  Thanks man!

Note 4: [Stack Overflow on git push -f](http://stackoverflow.com/questions/10298291/cannot-push-to-github-keeps-saying-need-merge)