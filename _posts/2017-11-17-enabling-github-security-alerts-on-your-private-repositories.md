---
layout: post
title: Enabling Github Security Alerts on Your Private Repositories
category: github
tags: ["github", "git", "security", "rails"]
---
Github recently announced that they would be providing [security alerts for github repositories](https://github.com/blog/2470-introducing-security-alerts-on-github).  These alerts let you know when a dependency that you're relying on has a critical vulnerability.  Given the importance of security, this is an excellent idea.  Thank you Github!  These alerts are turned on automatically for public repositories but they require you to opt in for your private repositories.  And while this isn't hard, Github doesn't make it clear exactly how to set this option for your private repositories.  I just spent an hour or so turning this on for all my private repositories and here's the step by step approach:

1.  Go to [github](https://www.github.com).
2.  Login if you're not logged in.
3.  Navigate to your dashboard.
4.  Go to your repositories list by clicking on the repositories link in the header.
5.  Select a private repository by clicking on it.
6.  Select the Settings link.
7.  Scroll down to **Data services**.
8.  Turn on "Allow Github to perform read-only analysis of this repository".
9.  Turn on Dependency graph.  
10. Turn on Vulnerability alerts.  You should note that Github saves the status of each of these via ajax as you check them off so there's no Save button you need to click.

Now you need to navigate back to repositories and turn this on for any other private repositories that you have. Given the number of private Rails apps I have repositories for, I'm really, really glad I turned this on.

Note: Its unclear exactly how long it takes to build the Dependency graph and for the Vulnerability alert scan to be completed.  I don't think it is immediate so you might want to keep an eye on the home page for your repos over the next few days.
