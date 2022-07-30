---
layout: post
title: Writing Command Line Tools in Python - Enter Fire
category: python
tags: ["python"]
---
{% pizzaforukraine  %}

One of the better ways to understand code is to figure out how exactly something runs.  And this can be done from the outside to the inside. 

So I'm starting with a command line that looks like this:

    python3 pol.py timeline

And I open up the Python script and search for a def timeline and there isn't one.  Sigh.  The module Fire was mentioned to me during conversations with another developer so I do a quick code search for File and, at the very bottom, I find:

```python
if __name__ == '__main__':
    Fire(dict(
        extract = extract_thread,
        timeline = hatebase_timeline,
        count = hatebase_regex,
        proportions = hate_proportions,
        urls = get_urls
    ))
    raise SystemExit
````

So we've got an if statement which is checking __name__ which I guess is some kind of python special thing because double __ are damn ugly so they must be special to make us notice them.  The colon seems to indicate that the next bit of code is attached to the if (I do know that it does; explaining it helps me at least).  And then we get to the Fire statement which is defining a dict, which I assume is a hash, so that the keyword timeline is mapped to 'hatebase_timeline' which is a method inside this.  And if nothing in the dict is matched, I assume that it falls thru to "raise SystemExit" which causes the program to terminate.

The nice thing about Fire is that it seems to automagically handle things like the user giving the wrong input.  Here's an example:

    python3 pol.py foo
    ERROR: Cannot find key: foo
    Usage: pol.py <command>
      available commands:    extract | timeline | count | proportions | urls

    For detailed information on this command, run:
      pol.py --help
      
It also handles generating help quite nicely when you omit an argument:

    python3 pol.py
    
    NAME
        pol.py

    SYNOPSIS
        pol.py COMMAND

    COMMANDS
        COMMAND is one of the following:
    
    ... (I omitted the specific help)
    
To use fire, all you need to do is have an import statement (and a line in requirements.txt):

```python
FILE: requirements.txt
fire==0.2.1


FILE: pol.py
from fire import Fire
```

Python's Fire library comes from Google and is on [github](https://github.com/google/python-fire).  **Recommended**.

## So What Did I Learn?

What I learned from this:

* A __ is something special in python
* A : handles assigning code to a label or structure
* Fire makes command line interfaces
* The execution order of a python script is likely top down and, I suspect, that this wouldn't have worked if the if statement was at the top because the methods wouldn't have yet been in memory (I'm unclear on this final point)
* There is an implicit C like concept of main only it is called __main__ and is simply code not inside a def structure