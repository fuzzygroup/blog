---
layout: post
title: Sorting the Keys of a Python JSON Object
category: python
tags: ["python"]
---
{:.center}
![IMG_3735.jpeg](/blog/assets/IMG_3735.jpeg)

I recently had to look at a complex JSON structure in Python.  The way that I wanted to do this was to look at a sorted list of the keys.  Here's the core of what I came up with:

```python
keys = my_json.keys()
keys = list(keys)
keys.sort()
```

I keep a common_json.py library and this is what I came up that I can call from:

```python
common_json.print_sorted_keys(json_dict)
```

**Note**: If you are debugging inside the common_json.py library then you need to call this just by the method signature and omit the common_json. prefix.

Here is the full code:

```python
def print_sorted_keys(json_dict):
    keys = json_dict.keys()
    list_of_keys = list(keys)
    list_of_keys.sort()
    print(list_of_keys)
```

**Note**: Coming from a Ruby background, it is interesting to note that the .sort() call is an inline sort i.e. it affects the list_of_keys object as opposed to returning a new object that is itself sorted.  From a ruby perspective this would be a ! method since it modifies the current object.

**Note**: Ruby isn't fully consistent with ! methods so keep that in mind.