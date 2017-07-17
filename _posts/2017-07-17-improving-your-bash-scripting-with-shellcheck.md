---
layout: post
title: Improving Your Bash Scripting with shellcheck
category: bash
tags: ["bash"]
description: ShellCheck is a lint tool for bash scripts which catches common errors and makes writing shell scripts dramatically easier.
---
I know to the outside world it often appears that a "developer" or "software engineer" knows everything when it comes to "coding" but the reality is that most of us are fairly specialized and we have both strengths and weaknesses.  My personal weaknesses include Bash scripting and current front end technologies (JavaScript, CSS).  Now, even when you have weaknesses, you can still improve them and I'm currently working hard on my Bash skills.  The project at hand is that I'm writing a custom deployer for a stack of software related to a new SAAS app I'm building.

Bash is one of those technologies that most of us know a little but that small amount of knowledge often prevents you from really learning -- you, instead, google about a bit and put some crap into a file with a .sh extension (or that you add an executable bit to and a shebang line) and you think "I know bash".

I recently found a tool that dramatically improved my shell scripting and, well, is really what enabled me to write a deployer for Rails apps under Docker using bash.  The tool is called [shellcheck](https://github.com/koalaman/shellcheck) and it is a linting tool for bash scripts.

# Installation

Here's how to install it on OSX:

> brew install shellcheck 

# Tutorial and Examples

ShellCheck is ridiculously easy to use: 

> shellcheck filename <ENTER>
  
Obviously press ENTER not type it and this will analyze your bash script and give you feedback.  Here are some examples and the errors it found for me:

    ip-10-19-48-2% shellcheck deploy.sh

    In deploy.sh line 40:
    for host in "${hosts[@]}"; do
    ^-- SC1009: The mentioned parser error was in this for loop.

This was a problem in overall parsing of the shell script; [more details](https://github.com/koalaman/shellcheck/wiki/SC1009).

    In deploy.sh line 42:
      for file in "${files[@]}"; do
      ^-- SC1073: Couldn't parse this for loop.
                                 ^-- SC1061: Couldn't find 'done' for this 'do'.

Here I was missing the done terminator for the loop.

    In deploy.sh line 6:
      cmd_output=$(eval $1)
                        ^-- SC2086: Double quote to prevent globbing and word splitting.

Technically I should have been using double quotes around the variable to prevent any issues with globbing / splitting.

    In deploy.sh line 31:
    files=(".env", ".env.production", "dockerstats", "docker-compose.production.yml")
          ^-- SC2054: Use spaces, not commas, to separate array elements.

I'm a Ruby guy so my natural array syntax has commas between elements.  Here ShellCheck is pointing out that I just need to have spaces between them.

# More Details / Some Good Bash Stuff

* ShellCheck home page: [https://github.com/koalaman/shellcheck](https://github.com/koalaman/shellcheck)
* Hacker News on getting better at bash: [https://news.ycombinator.com/item?id=14634964](https://news.ycombinator.com/item?id=14634964)
* [Bash Guide](http://mywiki.wooledge.org/BashGuide)
* [Bash FAQ](http://mywiki.wooledge.org/BashFAQ)
