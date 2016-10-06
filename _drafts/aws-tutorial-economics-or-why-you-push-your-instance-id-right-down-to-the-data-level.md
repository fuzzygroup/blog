---
layout: post
title: AWS Tutorial - Economics or Why You Push Your Instance ID Right Down to the Data Level
---


|   19 | i-009b5cab8308935e0 |     5969 |
|   19 | i-0182eab2fb962c562 |     5814 |
|   19 | i-02a8d461c0b066361 |     7123 | < crawlerbig - 4x the ram
|   19 | i-045b17850658399aa |       84 | our own code still running after days on mariadb
|   19 | i-05311f1bcb0bc6b8a |     5530 |
|   19 | i-06714ff682da1d010 |     2768 | our own code 
|   19 | i-067f1a6e937f79359 |     6118 |
|   19 | i-07b80eb0141d41d18 |     6013 |
|   19 | i-0ab087463a1fa4971 |     5615 |
|   19 | i-0cc1daf20f114d6ad |     5499 |

page_counts = [5969,5814,5530,6118,6013,5615, 5499]
page_counts.sum.to_f/page_counts.size
5794.0 pages per box using sidekiq
0.166 for an r3.large

so that means that 24 hours gives us 139056 pages for a cost of 3.984 or a total crawl cost of (2137448 / 139056) * 3.984 or $61 using entirely r3.large instances provided of course that they stay running