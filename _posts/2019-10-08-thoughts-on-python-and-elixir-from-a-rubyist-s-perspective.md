---
layout: post
title: Thoughts on Python and Elixir from a Rubyist's Perspective
category: ruby
tags: ["ruby", "python", "elixir"]
---
{:.center}
![IMG_9415.jpeg](/blog/assets/IMG_9415.jpeg)

**Note**: I'm about 4 weeks into the learning python stage and I could be fairly wrong about some of this.  I apologize for any stupidity but learning languages is a subtle process and I have found that writing things like this helps the process.

Leaving a good job where you like the product, like the team and like your co-workers is a hard thing to navigate.  I recently did this and got this message today from my former boss:

> How ru liking python? I’ve been thinking about spending some free time on it or elixir. Got your shirt ordered btw.

My response to him was that I liked Python and I'd send him some thoughts on Python / Elixir (since I did a solid dive into Elixir a few years ago).  And that's how this article came into being.

## Python

In many ways Python and Ruby feel more than a bit like kissing cousins.  Both:

* are scripting languages
* are object oriented
* are useful in web contexts and in automation contexts
* have frameworks although Ruby has the more successful (Rails)
* use def to define methods

A fundamental difference between Ruby and Python is Python's approach of "invisible semantics".  I am referring here to the use of indentation as a structural mechanism for formatting code -- get your indentation wrong and your code doesn't work.  This is particularly a problem with copy and paste from online code sites / blogs.  I find that this as well as the use of the : to indicate the start of a control structure are the two constant mistakes I make.

```python
def print_log(message):
    print(message)
```

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

Variables in a python method lack the block locality that they have in Ruby.  Coming from a ruby context, this is massively strange.  Apparently you can sort of achieve this by [defining functions within functions](https://stackoverflow.com/questions/6167923/block-scope-in-python) but, well, **no**.

## Elixir

I started looking at Elixir back in 2016 when I went to ElixirConf and I, well, fell in love.  Here was: 

* a functional language
* built on top of a real VM 
* compiled
* responded in microseconds not milliseconds
* had a kick butt performing framework 
* built by one of the former Rails core members

Overall I left my exploration with Elixir just plain fundamentally impressed.  Now, that said, I never chose to do much with Elixir:

* I came in at the 1.3 about to be released version of Phoenix which took longer to finish than that expected and that cost me momentum
* Pattern matching is at the heart of Elixir and it is hard to master
* Most of what I build is web apps and when I looked into it there wasn't an equivalent to Devise or AuthLogic and I never wanted to write this so ...

What I took away from Elixir was a number of changes to my coding style in Ruby including a focus on class methods and an increased use of multiple return values.

## Choosing a Next Language

One of the guidelines I use for choosing a next language is that it is always best to learn your next language by picking one with a fundamentally **different orientation** than your last language.  So going from Ruby to Elixir is a big change because it means going from object-oriented to functional.  I find that going from Ruby to Python isn't a big change because the languages are just so similar.  In fact I have actually found that Python's many similarities to Ruby make it harder to grok the learning process.  Elixir is so clearly different from Ruby that the differences are easier to learn.

So even though I would argue strongly that if you are a Rubyist, Elixir is the logical next step, there are two caveats:

* If you are doing data science work then you want to use Python.  I've been immersing myself in data science stuff and the Python ecosystem for data science is truly splendid.
* If you are doing machine learning work then you want to use Python.  Again the Python ecosystem for machine learning is truly splendid.

