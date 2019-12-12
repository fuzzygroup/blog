---
layout: post
title: Ruby to Python Translation Guide
category: python
tags: ["ruby", "python"]
---
I wrote this guide to different Ruby idioms and how to do them in Python.  Organization is alphabetical.

# 
# Try / & - Safe Navigation

A ruby hash returns nil if the key specified is missing:

```ruby
ENV['foo']
nil
2.3.1 :003 > ENV['RUBY_VERSION']
"ruby-2.3.1"
```

A python dict raises an exception:

```python
import os

>>> os.environ['RAILS_ENV']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/Users/sjohnson/Sync/fuzzygroup/adl/antihate/antihate_experts/venv/bin/../lib/python3.7/os.py", line 678, in __getitem__
    raise KeyError(key) from None
KeyError: 'RAILS_ENV'
>>> os.environ.get('RAILS_ENV')
>>> os.environ.get('RUBY_VERSION')
'ruby-2.3.1'
```

The ruby way around this would be to use try or the safe navigation operator:

https://stackoverflow.com/questions/46390057/from-ruby-to-python-is-there-an-equivalent-of-try
