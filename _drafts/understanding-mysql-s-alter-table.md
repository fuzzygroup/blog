---
layout: post
title: Understanding MySQL's Alter Table
---
all mysql alter tables are the same: 

-a) lock table against writes
a) copy to tmp table
b) modify
c) copy back
d) unlock

so this means that at a minimum its another almost 24 hours because the copy back is as long as the copy to.


                                                    |    0.000 |
| 2163 | appdata | ip-172-31-47-83.us-west-2.compute.internal:55637  | banks_production                  | Sleep   |    8497 |                   | NULL                                                           |    0.000 |
| 2166 | appdata | ip-172-31-45-225.us-west-2.compute.internal:39423 | banks_production                  | Query   |   75956 | copy to tmp table | ALTER TABLE `link2016_q1s` ADD `data_source` int(11) DEFAULT 1 |   16.747 |
| 2173 | appdata | localhost                                         | banks_production                  | Query   |       0 | NULL              | show full proce

