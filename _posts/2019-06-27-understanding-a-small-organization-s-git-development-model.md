---
layout: post
title: Understanding a Small Organization's Git Development Model
category: git
tags: ["software_engineering", "git", "github"]
---
{% pizzaforukraine  %}

I am actively working on a new codebase for a personal project and I thought it might be instructive to document how I am using Git.  The first thing to understand is that we are using Github at the Organization level which means, yep, paid Github.  Github is pricey but it is absolutely worth it.  Anyway ...

The development style we are using is what I would generally term branch based development.  This means that there are three branches / types of branches: 

* master
* develop
* feature branches which are named for their GitHub issue number and then a short word or phrase i.e. 42-poros

The master branch is ONLY for deployment and should always be kept pristine.  The assumption with any new code base in 2019 is that deployment can happen at any damn time and, ideally, should be automated.

The develop branch is where development kind of happens.  Ideally you shouldn't work directly in develop but, well, shite happens.  And sometimes commits will happen directly on develop.

Ideally all work happens in a feature branch and this brings us to the actual git commands that you will use daily.  

# Git Commands I Actually Use Daily

Git is what I would refer to as the "swiss army chainsaw" of version control.  Git is astonishingly powerful and I intentionally use a limited subset of git commands because these commands are how I understand to use Git.  I deliberately use the atomic git commands i.e. create branch is separate (for me) from change into branch because I like to use Git this way; again this is how I understand it.  

* git clone git@github.com:fuzzygroup/job_seeker_dashboard.git -- pull down the remote repo into your local working directory
* git checkout filepath -- this checks out a single file from the repo and replaces the existing file EVEN IF THERE ARE LOCAL CHANGES
* git branch 42-poros -- this creates the local branch 42-poros
* git co 42-poros -- this changes into the local branch 42-poros
* git status -- this shows you your current status
* git branch -d 42-poros -- this deletes the branch 42-poros
* git add . && git commit -m "rollup commit" -- this adds all local files and saves them with a commit message of "rollup commit"
* git co develop && git pull origin develop -- this changes into the branch and updates develop
* git rebase origin/develop -- this rebases the code in your branch from the code in develop
* git pull origin develop -- this pulls the code in develop from the remote
* git diff db/schema.rb -- show me the differences in schema
* git log -- show me a log of the sequential commits
* git log --oneline --graph -- shows you the git structure
* git reset HEAD~1 -- remove the last 1 commit from git and place them back into the working tree
* git reset HEAD~2 -- remove the last 2 commits from git and place them back into the working tree
* git stash -- temporarily store the work you are currently doing in a local branch so you can change to another branch, do something and easily resume without an add / commit cycle
* git stash pop -- get back the work you stashed
* git push origin 42-poros -- this gives you a url you can use to create a pull request for your code to be reviewed

# General Git Workflow

Here is the general git workflow I use:

1. Go to GitHub issues and grab an issue
2. Do a *git status* to make sure I don't have any work to commit.
3. Change into develop with *git co develop*
4. Pull from remote to make sure I'm up to date with: *git pull origin develop*
5. Create a branch with: *git branch 42-poros*
6. Change into the branch *git co 42-poros*
7. Do my work locally and when I'm ready, add with: *git add .*
8. Write my commit message with: *git commit -m "a message that is hopefully better than this"*
9. Push my code to the server for review with: *git push origin 42-poros*  This creates a url you can used to make a "pull request" that another person on the project can review.
10. Change back into develop and lather / rinse / repeat

 # An Important Note

When you get yourself into a git badness state.  STOP.  Don't flail foolishly; swallow your pride and *ask* an expert.  

Also this article was helped with by the usual reviewer, my buddy [Sean Kennedy](https;//csphere.github.io/).  Any errors are mine not his.  His git-fu is substantially greater than mine -- he's my expert.  Thanks buddy!
