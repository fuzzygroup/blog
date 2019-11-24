---
layout: post
title: Using Github Hub to Create an Issue and Streamline Your Branch Workflow
category: git
tags: ["git", "software_engineering"]
---
{:.center}
![IMG_9487.jpeg](/blog/assets/IMG_9487.jpeg)


My git workflow is pretty simple.  Here are the tasks and (where I do them):

* Create an issue that logs what I'm working on  (github website)
* Use the issue's id number to make a branch (command line)
* Work on the branch (editor)
* Add / Commit / Push to the Branch (command line)
* Create a Pull Request (github website)

Github has a tool called [Github Hub](https://hub.github.com/) - [Hacker News Discussion Thread](https://news.ycombinator.com/item?id=20372770) -  which allows you to do more operations on the command line than the normal, canonical git actions (add / commit / push).  Henceforth I will be referring to this tool as **hub**.

## Installing Github Hub on OSX

To install hub on OSX, you can use brew:

    brew install hub

## If You Can't Login

My first usage of github hub was actually fairly crappy:

    ❯ hub issue create -m "Update Faq for Why Do Things Appear on the Dashboard"
    Error creating issue: Unauthorized (HTTP 401)
    Bad credentials

If you hit this error then the first result is a [very long Github Issues](https://github.com/github/hub/issues/1067) page.  The long and the short of it is that you need to delete hub's config file:

    rm ~/.config/hub
    
After this delete, any operation should cause hub to ask you to log in.  And, yes, hub does support Github's two factor authentication so there is that to contend with also.

**Note**: If you still can't use hub after deleting this file then you may have credentials defined in a shell config file like .zshrc or .bashrc.  Read the above linked issue for more.  You also might have better understanding by using the verbose option:

    HUB_VERBOSE=1 hub issue create "Update Faq for Why Do Things Appear on the Dashboard"
    
## And Creating an Issue

Use the -m flag to create the issue with a title.  This avoids hub opening an editor (which is fine but slows down the process and using hub is to avoid the slowdown):

    ❯ hub issue create -m "Automate Checking RSS Feeds"
    https://github.com/gochangeme/web_change_me_now/issues/465
    
And there you have an issue number so now you can can just:

    git branch 465
    git co 465
    
And, yes, I suspect there is a compound command which creates a branch and changes into it in one operation.  I personally prefer to use github via "atomic" commands so if I make a mistake, I can more easily correct recover from it.

## Here's What You Can Do With Hub

Here's what you can do with hub (from hub --help):

    api            Low-level GitHub API request interface
    browse         Open a GitHub page in the default browser
    ci-status      Show the status of GitHub checks for a commit
    compare        Open a compare page on GitHub
    create         Create this repository on GitHub and add GitHub as origin
    delete         Delete a repository on GitHub
    fork           Make a fork of a remote repository on GitHub and add as remote
    issue          List or create GitHub issues
    pr             List or checkout GitHub pull requests
    pull-request   Open a pull request on GitHub
    release        List or create GitHub releases
    sync           Fetch git objects from upstream and update branches
    
I can easily see myself using pull-request once I get comfortable with issue as I'm already seeing the workflow benefits to hub.  Thank you Gitub!