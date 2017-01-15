---
layout: post
title: Thinking About a Ruby Driven AWS Lambda Approach Using Code that Writes Code
category: ["aws"]
tags: ["aws", "ruby", "lambda", "software_engineering"]
---
So I have a computing problem to solve where the amount of data to process vastly exceeds even my desire to spin up EC2 instances.  I really do actually enjoy [Ansible](https://fuzzygroup.github.io/blog/tag.html#ansible) but at some point you have to cry to the heavens and shout out "There must be a better way!".  This is literally an "oh crap" moment when I realized exactly the scale of the problem.  

Note: I'm not at liberty here to give specifics so I'm talking in generalities quite a bit in this post.  Apologies.

AWS has a lot of tools that can be applied to big data process but two come to mind:

* [Elastic Map Reduce](https://aws.amazon.com/emr/) or EMR
* [Lambda](https://aws.amazon.com/lambda/)

EMR is older and harder to use so I'm going to avoid it for now in favor of the new hotness -- **Lambda**.  Here's the brag statement about Lambda:

    Run code without thinking about servers.
    Pay for only the compute time you consume.

That's a pretty compelling statement to make and it is actually close to a holy grail of distributed computing.  
I have a big data problem that:

1. Involves about 15,000 unique domains that need to be checked against an index of data
2. Where if the domain is a match a secondary request needs to be made and several data points extracted from an api
3. The results of #2 need to be posted to an API that we control

For valid separation of concerns issues the data fed into 1 is separate from the code in 1 (its driven by a separate git repo).  And all of our code is in Ruby which is not a supported Lambda language.  This raises some actual issues in terms of: 

* How do we make this work
* How do we get our existing ruby code to run in Lambda

There is an interesting approach to packaging up our existing ruby code using Traveling Ruby and then run that [package on Lambda](https://www.krautcomputing.com/blog/2016/02/29/how-to-run-ruby-scripts-on-aws-lambda-using-ansible/).  But before we goto that level of effort perhaps we need to examine the metrics on the codebase in question:

    rake stats
    +----------------------+--------+--------+---------+---------+-----+-------+
    | Name                 |  Lines |    LOC | Classes | Methods | M/C | LOC/M |
    +----------------------+--------+--------+---------+---------+-----+-------+
    | Controllers          |      3 |      3 |       1 |       0 |   0 |     0 |
    | Helpers              |      2 |      2 |       0 |       0 |   0 |     0 |
    | Jobs                 |      2 |      2 |       1 |       0 |   0 |     0 |
    | Models               |      3 |      3 |       1 |       0 |   0 |     0 |
    | Mailers              |      4 |      4 |       1 |       0 |   0 |     0 |
    | Channels             |      8 |      8 |       2 |       0 |   0 |     0 |
    | Javascripts          |     29 |      4 |       0 |       1 |   0 |     2 |
    | Libraries            |    480 |    366 |      12 |      38 |   3 |     7 |
    | Tasks                |      7 |      6 |       0 |       0 |   0 |     0 |
    | Controller tests     |      0 |      0 |       0 |       0 |   0 |     0 |
    | Helper tests         |      0 |      0 |       0 |       0 |   0 |     0 |
    | Model tests          |      0 |      0 |       0 |       0 |   0 |     0 |
    | Mailer tests         |      0 |      0 |       0 |       0 |   0 |     0 |
    | Integration tests    |      0 |      0 |       0 |       0 |   0 |     0 |
    | Lib specs            |    270 |    231 |       0 |       1 |   0 |   229 |
    +----------------------+--------+--------+---------+---------+-----+-------+
    | Total                |    808 |    629 |      18 |      40 |   2 |    13 |
    +----------------------+--------+--------+---------+---------+-----+-------+
      Code LOC: 398     Test LOC: 231     Code to Test Ratio: 1:0.6
      
So we're actually only talking about 12 classes, 38 methods and 366 LOC.  So this isn't large at all.  We know that one approach to running this is running it as packaged ruby.  Another approach would be *code that writes code* but before we talk about this, let's talk about the execution context.

This application needs to run every time period from 2013 to present.  And depending on the results from our initial prototype, that will be either monthly or quarterly.  So if this is quarterly we need to run it 12 times - (4 in 2013, 4 in 2015, 4 in 2016) and if its monthly then we need to run it 36 times.  And we'll need to run it monthly going forward.  And, each time, the input data is different.

# Code that Writes Code

There are lots of different approaches to code that writes code -- generators, real AI and template based approaches.  For this I would use a template based approach as follows:

1.  Port the Ruby code to JavaScript using a single file approach as much as possible.  
2.  Locate the input data we need to send to the initial api near the top as essentially a global array of values.  For test purposes you only need to use 1 or 2; only enough to prove the concept.
3.  Convert the code in #2 to a template just as Rails uses, say, an ERB template (you can actually use ERB in other contexts than views).
4.  Treat the underlying ruby code as a systems automation tool which:

* operates over an array of dates from the past to the present
* keeps track of what has been submitted to AWS Lambda
* Reads the template in #3 and fills in the data based on the internal api.  
* packages everything per the [Lambda spec](http://docs.aws.amazon.com/lambda/latest/dg/nodejs-create-deployment-pkg.html)
* uses the [AWS Lambda Ruby APIs](http://docs.aws.amazon.com/sdkforruby/api/Aws/Lambda/Client.html) to submit the job

With this approach while we're not using Lambda to actually execute our Ruby code, we're getting the same result, using Lambda's native JavaScript / node support but still using our overall Ruby framework to run everything and manage the process.  And this will have the advantage of generating an auditable code base that we can dig into if we find any problems.