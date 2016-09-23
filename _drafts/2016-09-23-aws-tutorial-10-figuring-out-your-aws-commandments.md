---
layout: post
title: AWS Tutorial - Figuring Out Your AWS Commandments and their corollaries
---

1.  No long term data will ever be stored on a node other than our RDBMS.  Corollaries: 
  * We need a network based logging approach
  * For persistent data that supports our application it either exists in the code base via git or in S3
2.  Every EC2 box should be able to support every function.  There shall be no separation that prevents converting a web server to be a crawler or something else.  Corollaries:
  * Every node needs to have all supporting software
  * One configuration routine for all boxes
  * Software updates may take longer since ALL bits of infrastructure software need to be updated
3. Deploy is going to be a manual action; all deploys will be done by a software engineer who understands the implications of the changes that have been made.
4. We're not going to do auto scaling  