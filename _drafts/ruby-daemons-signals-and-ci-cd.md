---
layout: post
title: Ruby, Daemons, Signals and CI / CD - The Power of Unix
category: ruby
tags: ["ruby", "unix"]
---
I never, ever fail to be be amazed by the power of the Unix architecture.  I have rarely found a computing problem that doesn't cleanly map onto the underlying structure of Unix -- even when I didn't plan things this way.  My current day job is a large distributed system that: 

* takes in data ("The ingest layer" as a senior engineer I interviewed yesterday termed it)
* stores it in Kafka
* processes said data ("the classification layer") and moves it between states
* loads data into Postgres
* visualizes it using Rails

The ingest layer is prototyped, at present, as a series of tiny Ruby programs that provide the level of scalability that we need at present.  Yes its not good enough for our ultimate goals but better is the **enemy** of good enough.  My boss, who is a prescient and skilled former engineer himself, has recently been pushing me on the front of CI / CD.  He wants that magical experience where a single git push updates the entire system and I've been reluctant because this is a continuously running system and that felt, well, dangerous to me (if we go down then there's data loss and that's kinda suck ass).  

In an article that has as part of the title "... The Power of Unix", you are probably thinking that the answer is going to be *unixy* and that would be correct.  The answer is (drumroll) ... **Signals**.  This is one of those core Unix things that I've used for a thousand years (my first Unix experience was on a Sun 3 way back in the days of pre-history also known as 1989) but I've never actually programmed.  In essence a signal provides a way from process 1 to send a message to process 2 and then, if process 2 is listening for it, it can respond.  I just got this running and I was astonished at the cleanliness of the solution.

Here's part 1, ingest.rb

```ruby



```

and here's an example program that sends a kill signal