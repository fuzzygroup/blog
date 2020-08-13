---
layout: post
title: A Conceptual Architecture for a Filesystem to SQS Loader
category: lambda
tags: ["lambda", "aws", "sqs"]
---
{:.center}
![IMG_3817.jpeg](/blog/assets/IMG_3817.jpeg)

I have an interesting technical situation facing me:

* A docker container which runs persistently and writes JSON files to a directory
* Each JSON file contains short form messages with JSON encoding along a variety of metadata fields
* Each file is idempotent i.e. once it exists in the directory will never be written to again
* Each file is named for a timestamp 

Each file needs to:

* Have ridiculous, non-JSON comments removed from the beginning 
* Be parsed into json
* There is roughly 6000 of these JSON things coming in per second
* Have only a selection of the JSON internally be selected
* Be batched into a collection up to the maximum size the SQS supports and then committed to SQS
* Be processed only once

**Note**: SQS is the AWS "Simple Queue Service".  A queue is a specialized data structure which hands data off for processing by other tasks.

My initial thinking to handle this was to use Rust to write a high performance file processor.  This appealed to me:

* New technical challenge; I don't know Rust
* Manly - writing fast code is a conveniently macho challenge
* Simple architecture - one box, one process watching a directory and ripping through files 

There are, naturally, problems here:

* The Rust program represents a SPOF or "Single Point of Failure"; things break
* This architecture is simple but making it not be a SPOF means the architecture gets complex
* We don't actually even know if a single Rust executable is fast enough to handle all the data
* Rust is complex and even simple things take dramatically more code than a scripting language like Ruby or Python.  There isn't anything wrong with Rust (I really like the language but learning it is non-trivial).

Thinking through all these issues as well as learning, by chance, that the runtime execution period for AWS lambda serverless functions had increased from 5 minutes to 15 minutes made me think in terms of a different architecture focused on using lambdas.  

 **Note**: A lambda is a self contained bit of code that you give over to AWS to manage on your behalf.  Another term for Lambda is "functions as a service".  You don't have to focus at all on servers, DevOps administration or the like.

Here is what I'm thinking:

1. Add a network API to the filesystem of JSON files.  This could literally be as simple as an NGINX server that listed the files.
2. A lambda that requests a JSON file for processing per the description above and relies on a Redis dictionary to track files that have already been processed.  Two dictionaries would be needed -- json_files_processed and  v (and, yes, there would need to be a way to expire things from json_files_processing in case a lambda crashes or is terminated; this would be a separate lambda).
3. A CloudWatch Scheduler rule that triggers the lambda every 5 minutes

Fleshing this out further gives three lambda functions:

* sqs_loader - the main thing which processes files and sends their contents to SQS 
* json_files_processed_archiver - pulls files that have been processed into a different directory so that they don't have to be ever checked again; alternatively this might delete them after some period of time
* json_files_processing_checker - checks to see if files have been in the json_files_processing queue for too long

There would likely need to be 3 CloudWatch Scheduler rules one for each lambda.

The sqs_loader would need the ability to self terminate / exit if all files are currently being processed.
