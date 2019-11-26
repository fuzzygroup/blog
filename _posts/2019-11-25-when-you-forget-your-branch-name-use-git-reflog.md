---
layout: post
title: When You Forget Your Branch Name Use Git Reflog
category: git
tags: ["git", "cmn"]
---
{:.center}
![IMG_9456.jpeg](/blog/assets/IMG_9456.jpeg)

For my current side project, cmn, I'm using a version control model of issue branches as described [here](https://fuzzyblog.io/blog/git/2019/06/27/understanding-a-small-organization-s-git-development-model.html) back in June (about when I started this).  Basically the model is:

* The master branch is always pristine and always deployable.
* The develop branch takes changes from issue branches and is then merged into master by a CI server.
* Anything you work on, no matter how small, gets a github issue and goes thru a pull request approach.

I've never been a real big fan of structured engineering approaches and my last boss, Taylor Williams, did a fantastic job of teaching us this and -- **he was right**.  Even on a small side project, there are definite benefits to solid, well defined workflow processes.  

One disadvantage when you work this way is that you end up with a **lot of branches**.  And since branches tend to be named for the issue, it isn't always apparent the difference between say 444 and 445.  When branches are transitory such as "fix this bug", that isn't a big deal.  But when a branch is longer lived, because it just can't be completed in a short period of time, you are likely to simply *forget* the branch name.  

As an example, last Thursday night, I started work on a pretty complex enhancement and then a new bug came up Friday morning.  My response was to do an add / commit and then change back to develop and create a new issue and fix that bug.  And, somehow, between Friday morning and tonight, Monday night, the issue number has jumped by 30 issues (if you work this way then you make a lot of issues).  So I went to find the branch and I simply couldn't.  I was at 480 and I looked back at the Github Issues page and I thought it might have been 460 but that turned out not to be it.

As I thought about it, I realized that I knew when I last worked on it, the preceding Thursday, and there had to be a way to to look at branches by date created.  A bit of [Internet research](https://stackoverflow.com/questions/2255416/how-to-determine-when-a-git-branch-was-created) led me to the **git reflog** command:

    git reflog --date=local

Here is an example of reflog's output:

    e95bf81 HEAD@{Fri Nov 22 09:14:34 2019}: checkout: moving from 460 to develop
    fdf7336 HEAD@{Fri Nov 22 09:13:09 2019}: commit: rollup commit
    367d9bd HEAD@{Fri Nov 22 09:13:01 2019}: checkout: moving from 458 to 460
    367d9bd HEAD@{Fri Nov 22 08:45:15 2019}: commit: rollup commit on habit buddy changes
    e95bf81 HEAD@{Fri Nov 22 08:28:30 2019}: checkout: moving from develop to 458
    e95bf81 HEAD@{Thu Nov 21 21:13:39 2019}: checkout: moving from 444 to develop
    2a11c54 HEAD@{Thu Nov 21 21:13:17 2019}: commit: Rollup on multiple metrics; resume with derived metric
    e95bf81 HEAD@{Thu Nov 21 10:12:54 2019}: checkout: moving from develop to 444
    e95bf81 HEAD@{Wed Nov 20 14:42:30 2019}: pull origin develop: Fast-forward

The work had been in the area of multiple metrics so this showed me that it was branch 444.  So a quick:

    git co 444
    git merge develop
    
bought my branch up to date so I could resume working on it.