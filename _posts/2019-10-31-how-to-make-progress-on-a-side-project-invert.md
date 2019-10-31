---
layout: post
title: How to Make Progress on a Side Project - Invert
category: side_project
tags: ["side_project"]
---
{:.center}
![IMG_9755.jpeg](/blog/assets/IMG_9755.jpeg)

{:.center}
**Because side projects are as ridiculous as someone doing push ups on top of a set of dueling pianos; Picture taken at Pete's Dueling Piano Bar, Austin, TX; Recommended**

Great Googly Moogly!  My current side project is almost 10K lines of code in total or at least 5k lines (and yes there are tests, rspec, I don't know why it says 0 lines of tests):

    rake stats
    +----------------------+--------+--------+---------+---------+-----+-------+
    | Name                 |  Lines |    LOC | Classes | Methods | M/C | LOC/M |
    +----------------------+--------+--------+---------+---------+-----+-------+
    | Controllers          |   1161 |    767 |      23 |      95 |   4 |     6 |
    | Helpers              |    267 |    207 |       0 |      36 |   0 |     3 |
    | Jobs                 |      2 |      2 |       1 |       0 |   0 |     0 |
    | Models               |   2151 |   1316 |      23 |     137 |   5 |     7 |
    | Mailers              |      4 |      4 |       1 |       0 |   0 |     0 |
    | Channels             |      8 |      8 |       2 |       0 |   0 |     0 |
    | JavaScripts          |   4351 |   3599 |       0 |     183 |   0 |    17 |
    | Libraries            |   1304 |    811 |       0 |       7 |   0 |   113 |
    +----------------------+--------+--------+---------+---------+-----+-------+
    | Total                |   9248 |   6714 |      50 |     458 |   9 |    12 |
    +----------------------+--------+--------+---------+---------+-----+-------+

That's big for a side project and it is particularly big for something that hasn't actually launched yet.  When I was building this, I made a deliberate decision about how I approached this side project which dramatically **increased** my productivity.

My decision, right from day 1, was to **Invert**.  Normally we think of a side project as something you do **after** work so what I did was to do my side project as my **first thing** every day I worked on it.

Here's my thinking on this:

1.  A side project is something that a developer does for his or her or their self (pronoun, pronoun, pick a pronoun).
2. Self comes before work. For serious developers, those that build side projects, a side project is literally self care.
3. Thus do it first thing.

What I have found is that if you wait until after the day is done, you are just plain tired.  Often you have all the best intentions of working on something but you simply don't get to it because, well, **life**.

Now when you do it first thing, I don't mean that I'm putting in 8 hours on my side project and then a day of work.  Sometimes I might put in 15 minutes.  Sometimes an hour.  Rarely has it been more than that.

Let's look at the metrics real quick:

* 50 work weeks in a year
* Let's say you are 60% successful in working on your side project 3 days out of the week
* Let's say that you manage to put in 0.5 hours per day on it 
* That's 1.5 hours per week or 75 hours per year
* In a modern development context, using a framework, 75 hours actually **can** build something. Add in some weekend time and you might really have something.