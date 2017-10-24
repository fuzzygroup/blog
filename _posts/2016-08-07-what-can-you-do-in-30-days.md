---
layout: post
title: Case Study What Can You Do In 30 Days Using Ruby and Rails 5
category: mvp
tags: ["ruby", "mvp", "startup"]

---

So I recently had an interesting opportunity to write a bunch of code in a fast paced environment.  I was putting in about 40 hours of week albeit around the edges of my full time gig.  I was the sole contributor during this period save for a few view files that essentially amounted to a rounding error in the size of the project.  All code was new and written in a Rails 5 stack.  There also was a separate NLP engine implemented using Rack / Grape but that was relatively small so its omitted.  

Here's what I knocked out in that time frame:

<pre>
+----------------------+--------+--------+---------+---------+-----+-------+
| Name                 |  Lines |    LOC | Classes | Methods | M/C | LOC/M |
+----------------------+--------+--------+---------+---------+-----+-------+
| Controllers          |   1509 |   1122 |      24 |     125 |   5 |     6 |
| Helpers              |    369 |    309 |       0 |      37 |   0 |     6 |
| Jobs                 |      2 |      2 |       1 |       0 |   0 |     0 |
| Models               |   3813 |   1839 |      28 |     165 |   5 |     9 |
| Mailers              |      4 |      4 |       1 |       0 |   0 |     0 |
| Channels             |     15 |     13 |       3 |       1 |   0 |    11 |
| Javascripts          |    119 |     23 |       0 |       5 |   0 |     2 |
| Libraries            |    251 |    175 |       0 |       1 |   0 |   173 |
| Tasks                |    251 |    175 |       0 |       1 |   0 |   173 |
| Controller specs     |    890 |    632 |       0 |       7 |   0 |    88 |
| Helper specs         |    420 |    133 |       0 |       5 |   0 |    24 |
| Model specs          |    452 |    346 |       0 |       0 |   0 |     0 |
+----------------------+--------+--------+---------+---------+-----+-------+
| Total                |   8095 |   4773 |      57 |     347 |   6 |    11 |
+----------------------+--------+--------+---------+---------+-----+-------+
</pre>

Note: Output is from the rake stats command.

I was pretty happy with this. The first 3 weeks were pure greenfield development and it was the most glorious coding fun I've had in years.  No specs just an MVP product concept and go.  Not bad for nights and weekends, eh?
