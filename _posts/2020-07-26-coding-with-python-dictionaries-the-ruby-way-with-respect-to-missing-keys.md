---
layout: post
title: Coding with Python Dictionaries the Ruby Way With Respect to Missing Keys
category: python
tags: ["python", "ruby"]
---
{:.center}
![IMG_3776.jpeg](/blog/assets/IMG_3776.jpeg)


I recently had an interesting experience with Python dictionaries that made question one of Python's foundational principles i.e. TOOWTDI:

> There should be one-- and preferably only one --obvious way to do it.  Although that way may not be obvious at first unless you're Dutch.  [More...](https://wiki.python.org/moin/TOOWTDI)

The application was a large scale JSON processor and, in Python, JSONs are mapped to Python dictionaries which correspond to Ruby hashes.  The issue is how you handle keys that don't exist.  Here's the Ruby way:

```ruby
irb(main):001:0> hash = {}
{}
irb(main):002:0> hash["foo"] = "bar"
"bar"
irb(main):003:0> hash["blah"]
nil
```

And here's the Python way:

```python
>>> dict = {}
>>> dict["foo"] = "bar"
>>> dict["blah"]
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'blah'
>>>
```

At the heart of things is whether or not a non-existent key causes an exception to be thrown.  I look at this from the cultural perspective of the language's creators.  

Ruby says:

> "Oh hell no; good heavens why would a non existent key cause an error.  We're Japanese at our heart and tossing an exception for this feels, well, ahem, rude." 

While Python says:

> "Absolutely a missing key must translate to an exception; we are Dutch after all!"

The interesting thing here is that despite the foundational principle of TOOWTDI, Python offers a way to emulate Ruby's default behavior -- the .get() syntax.  Here's an example:

```python
>>> dict = {}
>>> dict["foo"] = "bar"
>>> dict.get("foo")
'bar'
>>> dict.get("blah")
>>> result = dict.get("blah")
>>> print(result)
None
```

My vastly more Pythonic co-worker, Grant, gave me this explanation when I raised this issue in our team Slack:

@sjohnson You can make Python dicts return None if the key doesn't exist by using the .get class function instead of the square-brackets key notation. So if d is your dictionary, you can use d.get(key) instead of d[key]. The latter will throw a KeyError if the key doesn't exist, whereas the former will just return a null value.

Thanks Grant!  