---
layout: post
title: How To Be A Developer 001 - Commit
category: how_to_be_a_developer
tags: ["how_to_be_a_developer", "software_development"]
description: If you want to be a developer you have to commit to problem solving, no matter how arcane the problem.
---
{% pizzaforukraine  %}

# Background

I've taken on a new project recently.  I'm helping teach some local (Indianapolis) homeless youth basic software engineering using the web developer curriculum from [Free Code Camp](http://www.freecodecamp.com).  Initially I'm teaching two students and we're working out of the [Outreach Indiana](https://outreachindiana.org/) facility in downtown Indianapolis.  Outreach Indiana is a fantastic charity that truly does good work.

I thought I'd write a series of essays on How to Be a Developer that reflect some of the things I've learned over a career working in high tech.  While I am a fan of what Free Code Camp does, I thought some practical, hands on advice might add some value for my students.  I've structured these as a series of single topic narratives arranged numerically.

# Lesson 001 - Commit

The topic for my first lesson is that to be a developer you need to **commit**.  Now I don't mean a *git commit* (more on that in #19), what I mean is that the nature of being a developer is **committing to solving problems**.  I'm going to give you an example of a problem I solved just three days ago:

Broken:

> docker-compose -f docker-compose.production.yml exec web bundle exec rake db:migrate

Working:

> docker-compose -f docker-compose.production.yml exec -T web bundle exec rake db:migrate

What these commands do doesn't really matter but the only difference between these two commands is a small **-T** flag that only discovered after troubleshooting an obscure Ansible to Docker error:

    Traceback (most recent call last):\n  File \"/usr/bin/docker-compose\", line 9, in 
    <module>\n    load_entry_point('docker-compose==1.8.0', 
    'console_scripts', 'docker-compose')()
    File \"/usr/lib/python2.7/dist-packages/compose/cli/main.py\", 
    line 61, in main
    command()
    File \"/usr/lib/python2.7/dist-packages/compose/cli/main.py\", line 113, 
    in perform_command handler(command, command_options)
    File \"/usr/lib/python2.7/dist-packages/compose/cli/main.py\", line 441, in exec_command
    pty.start()
    File \"/usr/lib/python2.7/dist-packages/dockerpty/pty.py\", line 338, in start
    io.set_blocking(pump, flag)
    File \"/usr/lib/python2.7/dist-packages/dockerpty/io.py\", line 32, 
    in set_blocking
    old_flag = fcntl.fcntl(fd, fcntl.F_GETFL)\nValueError: file descriptor cannot be a negative integer (-1)
    
It took considerable sleuthing to figure this out and the error was identified in [a single Github issue](https://github.com/docker/compose/issues/3352) on the underlying Docker project.  And when I say that this problem was obscure, even Docker experts I know had no idea about the -T flag.  Here's part of the problem description:

    So basically, you need -i for docker exec when you are piping in data to the command.

    And you should not use -t for docker exec when you are piping data out from the command.

    And docker-compose exec only have -T, which means neither -i or -t. But you cannot represent -i without -t in docker-compose.

And that's what I mean by obscure...  As a developer you run into this kind of stuff all the time -- there's a reason why when you start with Free Code Camp, it emphasizes using Google before you ever get into a programming language.  A huge part of being a developer is now your skill at using Google and that's something that I'll cover in #11.    

To me the very essence of being a developer is being willing to commit to **problem solving** at this level.  It means: 

* accepting that you will continually be encountering new things that you don't know in depth
* trying hard to understand whatever the problem you encounter
* researching things in depth, sometimes over and over as the problems shift
* sometimes solving things by experimenting until you come up with a solution that works

As a developer, sometimes the problem you solve:

* is one of languages where you can't figure out how to do something using your language of choice
* is one of your tooling where the tool you're using either doesn't work or doesn't work as expected
* is one of an algorithm where the underlying approach to solving the problem is unclear
* is an obscure bug which only happens from in certain circumstances; in this case you need to figure out what those circumstances are and how to repeat them

And there are perhaps an infinite number of variants on these but the underlying nature of being a developer is really problem solving and in order to do that a developer has to commit himself or herself fully.  I'm going to close this with a song lyric that really reminds me of being a developer:

    I get knocked down, but I get up again
    You are never gonna keep me down
    I get knocked down, but I get up again
    You are never gonna keep me down
    I get knocked down, but I get up again
    You are never gonna keep me down
    I get knocked down, but I get up again
    You are never gonna keep me down
    
    [TubThumping by Chumbawamba](https://www.google.com/search?q=i+get+knocked+down+lyrics&ie=utf-8&oe=utf-8) | [Youtube](https://www.youtube.com/watch?v=2H5uWRjFsGc)
    
The problems you solve will continually knock you down and you **have** to get back up again.  Some of the best developers I have ever worked with actually weren't the smartest but they knew how to commit and how to just stick with problems like a terrier until it was solved.
