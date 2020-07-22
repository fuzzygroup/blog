---
layout: post
title: Building Data Pipelines Learning Number 01- Die Monolith Die
category: data_pipeline
tags: ["data_pipeline"]
---
{:.center}
![IMG_3897.jpeg](/blog/assets/IMG_3897.jpeg)

I am in the process of wrapping up a year long engagement where I:

* Built a high performance data pipeline
* Capable of processing all of Twitter in real time / near real time
* Applied multiple tools to the data at different stages of the pipeline
* Applied one or more Machine Learning models at different stages of the pipeline
* Operated on AWS using SQS as the queueing structure

This blog post talks about one of the key things I learned in terms of the data pipeline, specifically:

**Do Not Build Data Pipelines Around a Monolithic Queue Processor **

**Note**: By queue processor I mean the bit of software which pulls the data of the queue, operates on it and then puts it back.

This lesson may be obvious to some but we took a *meandering* approach to this problem where we started with the idea of distributed pipeline components, moved to a monolithic approach and then ended up back at a distributed approach.  As with a lot of research endeavors, the obvious conclusion wasn't quite so obvious in the throes of the research. 

## Lesson 01: Monolithic Queue Processing Raises Your Costs

At the heart of our queue processing were a number of Machine Learning components (python / tensorflow) that really needed a **GPU** for efficient data processing.  The problem here is that when you have a monolithic queue processor, all your processing happens on a box with the GPU whether or not all that processing needs the GPU.  When you are using cloud computing, you pay for the GPU whether not not it is being used for a given operation.  And since GPU boxes generally cost at least 5x to 6x more than CPU only boxes, well, our monolithic queue processor proved to be an **economic disaster**.

## Lesson 02: Monolithic Queue Processing Is Harder to Debug

After realizing Lesson 01, I took our monolithic queue processor apart and broke it down into 8 (ultimately 9) individual queue processors.  One thing that I quickly found is that debugging the 8 individual queue processors was dramatically easier than debugging the single monolithic queue processor.  Essentially the lack of state in the individual queue processors simplified the debugging process.

## Lesson 03: Performance Varies Across Routines - A Monolith Means You Scale Globally Not Locally

The final lesson here was that given given each part of the monolithic queue processor had different performance characteristics (example - JSON normalization versus Machine Learning versus calling a remote API over the network versus transferring data to S3), when we had a monolith, we could only scale globally (the entire monolith).  By breaking it down to individual queue processors, we could ensure that each queue processor could be appropriately scaled (i.e. locally scaled) right down to the number of instances / type of instances.