---
layout: post
title: Improving Your Bash Scripting with shellcheck
category: bash
tags: ["bash"]
---
I know to the outside world it often appears that a "developer" or "software engineer" knows everything when it comes to "coding" but the reality is that most of us are fairly specialized and we have both strengths and weaknesses.  My personal weaknesses include Bash scripting and current front end technologies (JavaScript, CSS).  Now, even when you have weaknesses, you can still improve them and I'm currently working hard on my Bash skills.  The project at hand is that I'm writing a custom deployer for a stack of software related to a new SAAS app I'm building.

Bash is one of those technologies that most of us know a little but that small amount of knowledge often prevents you from really learning -- you, instead, google about a bit and put 

ip-10-19-48-2% shellcheck deploy.sh

In deploy.sh line 40:
for host in "${hosts[@]}"; do
^-- SC1009: The mentioned parser error was in this for loop.


In deploy.sh line 42:
  for file in "${files[@]}"; do
  ^-- SC1073: Couldn't parse this for loop.
                             ^-- SC1061: Couldn't find 'done' for this 'do'.


In deploy.sh line 65:
#ssh -i ~/.ssh/fuzzygroup2.pem ubuntu@ec2-52-14-213-243.us-east-2.compute.amazonaws.com
                                                                                       ^-- SC1062: Expected 'done' matching previously mentioned 'do'.
                                                                                       ^-- SC1072: Expected 'done'. Fix any mentioned problems and try again.

ip-10-19-48-2% mate .
ip-10-19-48-2% shellcheck deploy.sh

In deploy.sh line 6:
  cmd_output=$(eval $1)
                    ^-- SC2086: Double quote to prevent globbing and word splitting.


In deploy.sh line 31:
files=(".env", ".env.production", "dockerstats", "docker-compose.production.yml")
      ^-- SC2054: Use spaces, not commas, to separate array elements.

ip-10-19-48-2%

https://github.com/koalaman/shellcheck

https://news.ycombinator.com/item?id=14634964

http://mywiki.wooledge.org/BashGuide

http://mywiki.wooledge.org/BashFAQ


In deploy_all line 37:
urls = ("http://www.seirawatch.com/health" "http://admin.seirawatch.com/health" "http://nickjj.seirawatch.com/health" "http://pagearchiverapi.seirawatch.com/health" "http://webappapi.seirawatch.com/health")
     ^-- SC1068: Don't put spaces around the = in assignments.

