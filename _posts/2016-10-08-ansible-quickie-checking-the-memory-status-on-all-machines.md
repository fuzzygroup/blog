---
layout: post
title: Ansible Quickie - Checking the Memory Status on All Machines
category: ansible
tags: ["ansible", "aws"]
---
As I've related in depth, I've been dealing with a problem of reliability and it is looking like its a memory issue.  Now there are lots and lots of ways to monitor memory usage on a cluster of machines.  I don't think I could even enumerate them if I tried.  However I'm a software engineer and I'm specifically **not** the kind of guy who has a dashboard and systems monitoring tools like HP OpenView, etc.  I've also been using Unix since 1986 and I fundamentally believe in the core Unix model of tiny tools so here's how I did it.

# What I Wanted

Getting control of a bad ops situation with servers is often about representing data in a way that **you can understand** and process it.  All I wanted was a command in a terminal that I could run periodically which would show me free memory on all machines.  Here's an example of what I put together:

ficrawlerbig | SUCCESS | rc=0 >>
5103412

fiweb1 | SUCCESS | rc=0 >>
55826760

ficrawler3 | SUCCESS | rc=0 >>
9196424

ficrawler4 | SUCCESS | rc=0 >>
7576948

ficrawler5 | SUCCESS | rc=0 >>
8054688

ficrawler6 | SUCCESS | rc=0 >>
10718960

ficrawler7 | SUCCESS | rc=0 >>
8730928

ficrawler8 | SUCCESS | rc=0 >>
13203552

ficrawler9 | SUCCESS | rc=0 >>
7196620

ficrawler10 | SUCCESS | rc=0 >>
5102220

That's all I want and I wasn't going to setup some kind of elaborate tool to get that.  I was going to use Ansible to execute a command on a batch of machines.  All I needed was that command.

# The Command

There are all kinds of ways to get memory stats on unix and I wasn't about to make this hard.  And you have to remember that at my core I'm a Ruby guy.  And while I mastered awk in 1990 or so, I haven't written a line of awk since about 1996 when my own implementation of awk, HyperAwk (see below), disappeared from this world.  I'm also not a shell guy; I struggle with bash / zsh.  So I wanted a ruby solution.  And I came up with this:

    #!/usr/local/rvm/rubies/ruby-2.3.1/bin/ruby
    output = %x(free)
    puts  output.split(" ")[9]

Which I'm pretty sure I shamelessly stole from a Stack Overflow post somewhere.  I think I closed the tab in a browser crash.  Sorry.

# The Ansible Side of things - An Ad Hoc Routine:

    ansible all -i inventories/production2 -u ubuntu -a "/var/www/apps/banks/current/script/free_memory.rb"
    
# Sidebar: HyperAwk

Ever wonder would would happen if you took an Awk implementation