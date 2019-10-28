---
layout: post
title: Calling Python Methods - Subtleties with and without Parens
category: python
tags: ["python"]
---
{:.center}
![sifry_london_bar.jpg](/blog/assets/sifry_london_bar.jpg)

{:.center}
Photo courtesy of my boss and friend, Dave Sifry who is in London right now attending MozFest; lucky guy!


In the continuing saga of "Once upon a time I did ruby exclusively, now I do python and ruby side by side and I keep being stupid", I have discovered something subtle and interesting about how python works internally.  

Let's start with a function definition in python:

```python
expert_name = "Anti Semitic Speech Expert"
expert_version = 0.01

def make_opinion_template():
    template = {}
    template["name"] = "slurs"
    template["raw"] = None    
    template["score"] = None
    template["opinion"] = None
    template["expert_name"] = expert_name
    template["expert_version"] = expert_version
    return template
```

The first two lines are globals and all the next line does is construct a hash (ok dict if I have to talk python).  I then embedded this method in my service and ran it using Firefly so I could call into it across the network and I got this curious error:

      File "/Users/sjohnson/Sync/fuzzygroup/adl/antihate/antihate_experts/venv/lib/python3.7/site-packages/firefly/app.py", line 170, in __call__
        result = self.function(**kwargs)
      File "/Users/sjohnson/Sync/fuzzygroup/adl/antihate/antihate_experts/expert_antisemitic_speech_service.py", line 107, in opinion
        new_opinion["raw"] = json_results
    TypeError: 'function' object does not support item assignment
    
but new_opinion isn't a function -- it is a dict -- so what the heck is going on???

**Note**: If you're an experienced Python wrangler, you already got it -- I know, I know -- I'm slow as hell at times particularly when it comes to syntax changes.

In ruby you can call methods with or without parens and the issue here is I had this syntax:

```python
opinion_template = make_opinion_template
```

instead of:

```python
opinion_template = make_opinion_template()
```

I simply forgot to add the parens when I called make_opinion_template.  Sigh.  The way I ultimately found this was to use a pdb.set_trace() call and evaluate opinion_template in the debugger.  

    > /Users/sjohnson/Sync/fuzzygroup/adl/antihate/antihate_experts/expert_antisemitic_speech_service.py(109)opinion()
    -> new_opinion["raw"] = json_results
    (Pdb) new_opinion
    <function make_opinion_template at 0x13e328ef0>
    (Pdb) quit()

and then, after the fix:

    > /Users/sjohnson/Sync/fuzzygroup/adl/antihate/antihate_experts/expert_antisemitic_speech_service.py(109)opinion()
    -> new_opinion["raw"] = json_results
    (Pdb) new_opinion
    {'name': 'slurs', 'raw': None, 'score': None, 'opinion': None, 'expert_name': 'Anti Semitic Speech Expert', 'expert_version': 0.01}

Personally I would have thought this would have been syntactically invalid but when a compile check didn't find an error:

    python -m py_compile expert_antisemitic_speech_service.py
        

I am forced to admit that this must be lexically correct for some reason that I'm too unskilled at python to understand.

So, a short note to myself: **Don't forget the parens when you call methods**.