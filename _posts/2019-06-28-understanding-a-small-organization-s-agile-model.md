---
layout: post
title: Understanding a Small Organization's Agile Model
category: software_engineering
tags: ["software_engineering", "startup", "agile"]
---
Agile is a an approach to software development that replaces traditional top down project management with a working style  that is characterized by the division of tasks into short phases of work and frequent reassessment and adaptation of plans.  This definition was provided courtesy of Google and I'm not certain as to its exact source.  Here is the [Wikipedia description of Agile](https://en.wikipedia.org/wiki/Agile_software_development).

Agile is one of those things that most of us have some version of what it means in our heads but everyone seems to have a different set of working practices.  This is my version of agile for how I approach software development in a fast paced, greenfield context.  I have worked this way for about 20 years now and I have found that it is more than agile enough even though I deliberately ignore a lot of the agile concepts.

# Its All About the Ticket

To me the essence of agile lies in small, fast based units of work.  And that unit of work is generally represented by a ticket whether written in Jira, Github Issues or something else.  The key skill here is decomposing big units of work into small, readily accomplishable chunks that can be done in succession (or in parallel) whether by one individual or several.

# Rapid, Regular Deploys

When you work in an agile context, it is essential that you deploy regularly as this is the only way for your developers to get the real world feedback about their code and whether or not it works.  In 2019 this should ideally be done by a CI server that simply takes submitted code and handles the deploy automatically.

# Regular Refactors

If you're going to do agile then one thing that you are inherently committing to is the idea of regular refactors.  Refactoring is the process of taking code that you have written, often recently having written and restructuring it as you understand the problem more deeply.  In an agile context when your understanding of the problem is constantly changing, one way you address this is by committing to refactoring.  

# Test Coverage

Test coverage on code is pretty much explicitly not an agile requirement but I personally find test coverage to be an essential agile tool.  One of the best ways to keep your speed up and be able to refactor regularly is to have test coverage that presents the speed at which you are trying to operate from becoming an issue.

# Incremental Development of Data Structures

A classic approach to development is that you start with the underlying data structures or database schema -- and you plan it in full.  This is the very essence of "anti-agile" also known as waterfall development but it is still surprisingly comment -- even among "agile" folks.  Now part of the reason for this is that many development environments don't lend themselves to incremental schema development but that isn't an excuse.  One of the best aspects of Ruby on Rails from an agile context is that the underlying Rails migration facilities handle incremental schema development pretty much flawlessly.  

Ideally from an agile schema you should be building the schema ticket by ticket as you develop.  And you should never be doing more schema development than is in the ticket (and I know that this gets violated all the time; including by myself).

# Pair Programming Whenever Possible

Pair Programming, apply two people to the same ticket at the same time, sharing a screen is still a controversial topic.  Some people take the perspective that it improves code quality.  Other people find that one of the people is loafing while only one person codes.  I find pair programming to be a wonderful agile tool in that it tends to improve code quality and keep developers on track 

# What I Don't Believe In About Agile

Here are the things about "agile" that I don't really believe in at all:

* [Scrum / Scrum Master](https://www.cprime.com/resources/what-is-agile-what-is-scrum/) 
* Agile Velocity - I find this to be complete hogwash.  An agile velocity is a metric that is typically calculated by your ticketing system and reflects some sort of "velocity" related to ticket completion.  The reason that I don't find this to be a valid concept is that when you have small teams, a single crappy ticket can entirely pork your "velocity" and since this is a metric, managers tend to take it way too seriously.  
* Sprint - this one I kind of believe in, the idea of organizing your development around short lived goals and then executing on them.  I do get this but I find that when you have continuous deployment, the overall sprint concept is less relevant

