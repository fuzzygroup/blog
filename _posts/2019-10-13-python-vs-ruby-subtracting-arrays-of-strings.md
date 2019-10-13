---
layout: post
title: Python vs Ruby / Subtracting Arrays of Strings
category: python
tags: ["python", "ruby"]
---
{:.center}
![100_5217.jpg](/blog/assets/100_5217.jpg)

I did a simple but fascinating thing yesterday -- I wrote a routine in python and ruby to subtract the different elements between two lists (python) or arrays (ruby) and then return a random element between the two lists (arrays).

Let's start with the Ruby because it is way, way simpler:

```ruby
all_experts = ['expert_1.py', 'expert_2.py', 'expert_3.py', 'expert_4.py']

experts_so_far = ['expert_1.py']

all_experts - experts_so_far
[
    [0] "expert_2.py",
    [1] "expert_3.py",
    [2] "expert_4.py"
]
```

Now here is the python:

```python
all_experts = ['expert_1.py', 'expert_2.py', 'expert_3.py', 'expert_4.py']

experts_so_far = ['expert_1.py']

remaining_experts = list(set(all_experts) - set(experts_so_far))

print(remaining_experts)
['expert_3.py', 'expert_2.py', 'expert_4.py']
```

The interesting thing here is what's going on with the python.  My initial understanding of the python failure was that subtraction failed because it was lists of strings.  That's actually not the case.  Here's the result of two lists of integers being subtracted:

```python
>>> [1,2,3] - [3]
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unsupported operand type(s) for -: 'list' and 'list'
```

What's going on here with the python is that we are:

* casting the lists to sets and then  
* subtracting the sets 
* and then casting it back to a list

The interesting thing here is that sets have unique memberships so:

```python
>>> all_experts = [1,1,3]
>>> set(all_experts)
{1, 3}
```

From a rubyist's perspective here, the surprising things are

* that array subtraction isn't a built-in python thing; I mean what the f ..
* the amount of casting that is going on
* the fact that set() is what converted an array to a set instead of calling .to_set on the array (admittedly after you did a require 'set')
* needing to print the result in Python instead of Ruby's default return