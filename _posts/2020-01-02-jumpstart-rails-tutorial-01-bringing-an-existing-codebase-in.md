---
layout: post
title: Jumpstart Rails Tutorial 01 - Bringing an Existing Codebase In
category: rails
tags: ["rails", "jumpstart"]
---
{:.center}
![IMG_0902.jpeg](/blog/assets/IMG_0902.jpeg)


It is the second day of the New Year -- welcome to 2020 -- and I have still failed to launch my side project that I started midway through 2019.  Sigh.  I find myself fundamentally regretting this but, well, life:

* New Job
* Wife in Hospital
* Son and Schooling Issues
* Etc

So my New Year's Resolution(s) is:

1. Launch by end of Q1, 2020
2. Not have deployment eat my brain
2. Launch with Something that I'm Visually Proud Of
3. Launch with SAAS billing features from day 1 and Get paying Customers

That last item, SAAS billing features, is a sticky point.  I've actually implemented this myself before -- I wrote all the back end code for the AppData SAAS engine which successfully processed over 3.1 million dollars in revenue over a 5 year period (BrainTree api).  And I really, really, really don't want to rewrite that.  Nor do I want to use a third party service and lose another percentage chunk over baseline Stripe fees.  

And all of this means that I need to use the [Jumpstart Rails](https://jumpstartrails.com/) application framework.  I already have a license for it anyway and the issue is that I need to port an existing, almost complete Rails app into it.  All of the blog posts starting with Jumpstart Rails Tutorial nn will cover this process.  While there is [good documentation for Jumpstart Rails](https://jumpstartrails.com/docs/), it is reference material rather than how to material.

**Note**: If anything I write during this series comes off as critical of Chris Oliver, the man behind Jumpstart Rails, it isn't.  I am an unabashed fan of the **damn fine** work that Chris Oliver does.

## Step 1 - Getting Started with Jumpstart Rails - Clone the Repo

The first step is to purchase an actual license for Jumpstart Rails. This will get you added onto the Jumpstart Rails git repo:

    https://gitlab.com/gorails/jumpstart-pro
    
What you need to do is begin by cloning this repo down to your local system:

    git clone git@gitlab.com:gorails/jumpstart-pro.git web_change_me_now2
    
You notice that I changed the name of this to:

    web_change_me_now2
  
I changed it since my previous repo name was web_change_me_now and this is going to be the second version of it.

## Step 2 - Add Your Local Version to Github 

I then went to github (I'm a staunch github user instead of gitlib) and created a new repo named:

    web_change_me_now2
    
I then needed to add this as an origin:

    git remote add web_change_me_now2 git@github.com:fuzzygroup/web_change_me_now2.git
    
My next step is to push.  Now I need to be careful here since I can't push back to the gitlab remote since I don't have permissions for that (and any changes I make are to **my application** not the template).  Here's the push syntax:

    /* make some silly ass change; I messed about with README.md */
    git add .
    git commit -m "readme change"
    git push web_change_me_now2 master
    
I don't use remotes all that much -- and I suspect outside of Heroku, you don't either -- so here's the syntax:

    git push ORIGIN_NAME BRANCH_NAME
    
So if I want to push my changes, I need to do:

    git push web_change_me_now2 master
    
## Step 3 - Getting a develop Branch in Place

I'm a firm believer in a simple, branch based approach to git.  I've talked about this before and, specifically:

1. Always work in a branch tied to an issue number.
2. Issue branches are merged into develop.
3. Develop is merged into master.
4. Master is then deployed.

This is simple, straight forward and clean.  I've now worked on teams up to 10 people in size and in Rails code bases of several hundred thousand lines using this with nary a hitch so it is an excellent model for small startups.

This needs to be done in your terminal and then in Github itself:

1. In your terminal, create a branch named develop with: **git branch develop**
2. In your terminal, change into that branch with: **git co develop**
3. Again update the README.md so you have something to push.
4. Add with: **git add .** 
5. Commit with: **git commit -m "readme change"**
6. Push with: git push web_change_me_now2 develop
7. Go into github and pull up your repository.
8. Go into the settings link.  Mine is here: https://github.com/gochangeme/web_change_me_now2/settings
9. Go into the Branches link.  Mine is here: https://github.com/gochangeme/web_change_me_now3/settings/branches
10.  You will see the default branch is set to master.  Use the drop down to pick develop and then click the update button. 
11. Click the I understand ... button.
12. Submit the pull request (you may need to change things a bit with the drop down due to changing the default).
13. Click the merge button.

At this point you are now set for development using the model above.  The next blog post along these lines will focus on taking an initial model and controller and start to develop a porting process.
