---
layout: post
title: Things I Do To My Every Rails Code Base
date: 2020-09-18 07:20 -0400
category: rails
tags: ["rails", "sysadmin"]
---
{:.center}
![IMG_4005.jpeg](/blog/assets/IMG_4005.jpeg)

**NOTE**: This is written in a Rails context but I've applied these techniques to Python and PHP as well as other languages.  This isn't Rails specific as much as it is a development best practice.

My very first rails codebase was a project called eduFire which was a C2C (consumer to consumer) marketplace for educators who wanted to sell online tutoring in language instruction.  This let an instructor:

* build a profile
* advertise their services to people who wanted to learn
* conduct video tutoring sessions
* make a decent side income

eduFire was a lightly funded startup (seed an then an A round) where all ops tasks were done by the engineers who built the product.  And, yes, there were only two of us with about 90% of the ops tasks falling on my shoulders.  From a technical perspective, we were doing DevOps although we certainly:

* didn't call it that
* didn't use today's generation of automated tooling much save shell scripting

What that project did for me though was force me to figure out an approach to my Rails projects that centered around:

* Documentation
* Making things easy for myself

eduFire was built and deployed from 2007 to 2009.  Now this was a time when Rails applications where harder to deploy and keep running.  And that instability was actually good for me.  I went through a period in Summer of 2008 when I was constantly on call and my kids, now over a decade later, can tell the tale of my work Mac laptop intoning: **"eduFire IS DOWN"** loudly, in the voice of god at 3 am or some such ridiculous hour.  What I learned from this was that you can fix anything from a dead sleep if you have:

* Documentation
* Tools

Each of these is discussed below.

## Documentation

The first thing I do with any rails app, right after the rails new command is this:

    mkdir docs

And in that directory I place markdown files of any documentation that I might need.

Here's an example of what's in the docs directory for the [Covid Near Me](https://www.covidnearme.org) app:

    ❯ ls -l docs
    total 80
    -rw-r--r--@ 1 sjohnson  staff  1192 Mar 24 07:29 api_josh.md
    -rw-r--r--@ 1 sjohnson  staff   579 Mar 16  2020 generic_class.txt
    -rw-r--r--  1 sjohnson  staff  1201 Mar 20 15:42 javascript.txt
    -rw-r--r--@ 1 sjohnson  staff  1736 Sep 18 07:14 lets_encrypt_renewal_and_free_disc_space.md
    -rw-r--r--  1 sjohnson  staff   131 Mar 17  2020 local_data_capture.md
    -rw-r--r--@ 1 sjohnson  staff   811 Apr  5 13:17 location_api.md
    -rw-r--r--@ 1 sjohnson  staff  4109 Mar 26 15:34 question_api.md
    -rw-r--r--@ 1 sjohnson  staff  5408 Mar 31 15:23 symptom_report_api.md

Whenever I have something that I have to do that isn't absolutely rote -or- when I need to draft documentation to share with a co-worker, I drop a document in docs.  I recognize the power of tools like wikis and slack messages for documentation, the simple fact is that for almost all engineers, the further you have to go from your coding editor to write documentation, the **less likely** it is that documentation actually gets written.

## Tools aka You Can Put Your Own Stuff in the bin Directory

The next lesson I learned from eduFire was the importance of automating as many common things as possible related to all the rote tasks that accompany software development.  Every Rails application has a bin directory which normally has just a few scripts in it like these:

    ❯  ls -l bin
    total 216
    -rwxr-xr-x  1 sjohnson  staff  125 Mar 11  2020 bundle
    -rwxr-xr-x  1 sjohnson  staff  264 Mar 11  2020 rails
    -rwxr-xr-x  1 sjohnson  staff  213 Mar 11  2020 rake
    -rwxr-xr-x  1 sjohnson  staff  988 Mar 11  2020 setup
    -rwxr-xr-x  1 sjohnson  staff  507 Mar 11  2020 spring
    -rwxr-xr-x  1 sjohnson  staff  819 Mar 11  2020 update
    -rwxr-xr-x  1 sjohnson  staff  433 Mar 11  2020 webpack
    -rwxr-xr-x  1 sjohnson  staff  438 Mar 11  2020 webpack-dev-server
    -rwxr-xr-x  1 sjohnson  staff  303 Mar 11  2020 yarn

What I do is add into this directory shell scripts for all the common tasks like deploy, ssh'ing into a particular box, pushing code, etc.  Here's what my the bin directory for the Covid Near Me project looks like:

    ❯  ls -l bin
    total 216
    -rwxr-xr-x  1 sjohnson  staff  125 Mar 11  2020 bundle
    -rwxr-xr-x@ 1 sjohnson  staff  358 Mar 19  2020 deploy
    -rwxr-xr-x  1 sjohnson  staff   77 Mar 23 06:02 gaddd
    -rwxr-xr-x@ 1 sjohnson  staff   42 Mar 16  2020 gcod
    -rwxr-xr-x@ 1 sjohnson  staff   25 Mar 16  2020 gcom
    -rwxr-xr-x@ 1 sjohnson  staff   29 Mar 16  2020 gmerged
    -rwxr-xr-x@ 1 sjohnson  staff   44 Mar 16  2020 gpulld
    -rwxr-xr-x@ 1 sjohnson  staff   40 Apr 10 07:48 gpushb
    -rwxr-xr-x@ 1 sjohnson  staff   44 Mar 16  2020 gpushd
    -rwxr-xr-x@ 1 sjohnson  staff   45 Apr 10 07:48 gpushm
    -rwxr-xr-x  1 sjohnson  staff  391 Apr 13 11:04 migrate
    -rwxr-xr-x  1 sjohnson  staff   45 Apr  1 09:31 qt
    -rwxr-xr-x  1 sjohnson  staff  264 Mar 11  2020 rails
    -rwxr-xr-x  1 sjohnson  staff  213 Mar 11  2020 rake
    -rwxr-xr-x@ 1 sjohnson  staff   27 Mar 25 13:21 server
    -rwxr-xr-x  1 sjohnson  staff  988 Mar 11  2020 setup
    -rwxr-xr-x  1 sjohnson  staff  507 Mar 11  2020 spring
    -rwxr-xr-x  1 sjohnson  staff   38 Mar 21 14:29 ssh2gcp
    -rwxr-xr-x  1 sjohnson  staff   38 Apr  9 11:27 ssh2gcp1
    -rwxr-xr-x  1 sjohnson  staff   38 Apr  9 11:27 ssh2gcp2
    -rwxr-xr-x  1 sjohnson  staff   38 Mar 21 20:37 sshdoweb1
    -rwxr-xr-x  1 sjohnson  staff   39 Mar 21 20:37 sshdoweb2
    -rwxr-xr-x  1 sjohnson  staff   36 Mar 21 20:37 sshdoworker1
    -rwxr-xr-x  1 sjohnson  staff  819 Mar 11  2020 update
    -rwxr-xr-x  1 sjohnson  staff  433 Mar 11  2020 webpack
    -rwxr-xr-x  1 sjohnson  staff  438 Mar 11  2020 webpack-dev-server
    -rwxr-xr-x  1 sjohnson  staff  303 Mar 11  2020 yarn

The names of these are a little bit cryptic.  For example "gpulld" means "github pull development" and it looks like this:

    #!/bin/bash
    git push covid_morbidity develop
    

Similarly ssh2gcp means "ssh into the main gcp" box.  

If you solve ops problems on a regular basis, what you come to learn is that your memory can be very fallible, particularly under pressure.  The value of writing these tiny shell scripts is that when you need to do something in a hurry, you don't have to assemble a command on the fly and have problems when a single thing (like the host name of a machine) isn't apparent.  