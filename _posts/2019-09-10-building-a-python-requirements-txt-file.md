---
layout: post
title: Building a Python requirements.txt File
category: python
tags: ["python", "requirements", "pip"]
---
So one of my first tasks in my new job is getting a code base into readiness from its state as "works on the original developer's laptop".  And, naturally, this process is hindered by the fact that it is a Python codebase and I'm a Ruby guy.  Still this is software development 101 -- release management -- and I do know how to do that.  

A python requirements.txt file is the equivalent of a Ruby Gemfile -- an ASCII text file that identifies the libraries to load into an application.  

Here's an example of a Gemfile:

    gem 'rails', '~> 6'
    gem 'puma', '~> 3.11'
    gem 'mysql2', '>= 0.4.4', '< 0.6.0'
    gem 'bootsnap', '>= 1.1.0', require: false    
    
And here's a Python requirements.txt file:

    Pygments==1.4
    SQLAlchemy==0.7.1
    South==0.7.3
    amqplib==0.6.1
    anyjson==0.3
    
  The syntax is different but they are clearly the same type of thing -- a package name and a version number.  The reason that the version number is important is that this locks a package down to a specific version number.  I'll write later why this is so damn important these days but for now please accept that it is (its a security thing).
  
  So the questions become:
  
  * How do you know what package names to put there?
  * How do you know what version number to use?
  
  The first one is easy -- you look for lines at the start of your Python program that begin like this:
  
      import iso8601
      import ujson as json
      import zstandard as zstd
      import numpy as np
      
      -or-
      
      from fire import Fire
      
  Do I understand the difference between it beginning with "from" and "import"?  Nope.  Nor do I need to at this point.
  
  So my first entry in this requirements.txt file might be:
  
    zstandard==9999
    
  My guess was that Python would either give me an error message that helped me or let me know what was going on when I gave a crazy version number.  This is done with a command line like this:
  
    pip install -r requirements.txt
  
  Here's what happened:
  
    Collecting zstandard==9999 (from -r requirements.txt (line 17))
      ERROR: Could not find a version that satisfies the requirement zstandard==9999 
      (from -r requirements.txt (line 17)) (from versions: 0.0.1, 0.1, 0.2, 0.2.1, 0.2.2,
         0.3.0, 0.3.1, 0.3.2, 0.3.3, 0.4.0, 0.5.0, 0.5.1, 0.5.2, 0.6.0, 0.7.0, 0.8.0, 
         0.8.1, 0.8.2, 0.9.0, 0.9.1, 0.10.0, 0.10.1, 0.10.2, 0.11.0, 0.11.1)
    ERROR: No matching distribution found for zstandard==9999 (from -r requirements.txt 
      (line 17))
      
  And that tells us that 0.11.1 is a valid version number so our requirements line becomes:
  
    zstandard==0.11.1
    
The final trick is to build this up one dependency at a time.  That way you resolve everything as you go instead of N conflicts all at once.

In closing there are also some standard libraries that follow the same from / import calls but don't actually need to be in requirements.txt.  Here are some seeming examples:

    import re 
    from sys import stdin
    
My best advice here is play around with the 9999 trick and see if a version number appears.  If it does then put it in requirements.txt and if not, well, kill it since then it is likely a Python built in.

And while I suspect there are more subtleties buried deep within Python's requirements.txt facility, this is a pretty good stopping place.