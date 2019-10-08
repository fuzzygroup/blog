---
layout: post
title: Thoughts on Python and Elixir from a Rubyist's Perspective
category: ruby
tags: ["ruby", "python", "elixir"]
---
**Note**: I'm about 4 weeks into the learning python stage and I could be fairly wrong about some of this.  I apologize for any stupidity but learning languages is a subtle process and I have found that writing things like this helps the process.

Leaving a good job where you like the product, like the team and like your co-workers is a hard thing to navigate.  I recently did this and got this message today from my former boss:

> How ru liking python? I’ve been thinking about spending some free time on it or elixir. Got your shirt ordered btw.

My response to him was that I liked Python and I'd send him some thoughts on Python / Elixir (since I did a solid dive into Elixir a few years ago).  And that's how this article came into being.

## Python

One of the things that I have found most irritating about python is that imported modules referenced in a main script are not available to "sub scripts" (i.e. other imported modules).  Here's an example:

    cat jsons/4chan_pol_has_slur.json | python3 expert_slurs.py --source=4chan
    Template Expert
    Traceback (most recent call last):
      File "expert_slurs.py", line 87, in <module>
        main()
      File "expert_slurs.py", line 65, in main
        json_str = common_expert.read_std_in_to_string()
      File "/Users/sjohnson/fuzzygroup/adl/antihate/antihate_experts/common_expert.py", line 3, in read_std_in_to_string
        for line in sys.stdin:
    NameError: name 'sys' is not defined
    
Even though I have 

    from sys import stdin
    
At the top of my expert_slurs.py file, it isn't available in common_expert.py (which comes **after** the inclusion) and has to be imported again at the top of common_expert.py.

## Elixir

## Choosing a Next Language

One of the guidelines I use for choosing a next language is that it is always best to learn your next language by picking one with a fundamentally different orientation than your last language.  So going from Ruby to Elixir is a big change because it means going from object-oriented to functional.  I find that going from Ruby to Python isn't a big change because the languages are just so similar -- but subtly different all over the place.  

There are 

Even though Ruby has a poor performance reputation, I don't think I would 