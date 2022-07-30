---
layout: post
title: Reading Files to Strings using Python and then Loading them to JSON
category: python
tags: ["python"]
---
{% pizzaforukraine  %}

I know this is dirt simple but I'm writing it down because it is one of those simple things that I just forget constantly.  

In each of these cases, the output is to the str variable.

## Using a With Block to Auto Close the File

As a rubyist, I keep reading this as str is local to the with "block". Of course python doesn't have blocks ...

```python
with open('data.txt', 'r') as myfile:
  str = myfile.read()
```

## Python 3.5 Path Statement One Liner 

I really like this approach but pathlib always has to be imported.

```python
from pathlib import Path
str = Path('data.txt').read_text()
```

## Non Auto Closing Not Recommended

This is simple but leaves an open file hanging around.  Sigh.

```python
str = open('jsons/gab_02.json', 'r').read()
```

## Auto Closing Single Line

This is elegant but it buries the assignment variable in the middle of the line which feels wrong.

```python
_ = open('jsons/gab_02.json', 'r'); str = _.read(); _.close()
```

## Loading it to JSON

The json.loads statement takes a string in and converts it to a Python dict / hash so all you need to do is inline the string reading call from above and get an easy one liner (if you disregard the import lines).

```python
from pathlib import Path
import json

gab = json.loads(Path('jsons/gab_02.json').read_text())
```

## References

* [Stack Overflow](https://stackoverflow.com/questions/8369219/how-to-read-a-text-file-into-a-string-variable-and-strip-newlines)
* [Real Python](https://realpython.com/python-json/)
