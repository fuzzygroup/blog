---
layout: post
title: The Python Equivalent of byebug is pdb.set_trace()
category: python
tags: ["python", "debugging"]
---
In ruby the debugger is invoked by adding the statement

```ruby
byebug
```

wherever you want to debug your code.  This is preceded, of course, by a reference in Gemfile that brings in the byebug gem.

The python equivalent of this is two fold:

* import the pdb (python debugger) gem
* add the line pdb.set_trace() call where you want it 

Here's the color coded example:

```python
import pdb

# lines of python code here

pdb.set_trace()
 
```

That will launch the python debugger right before the line where the pdb.set_trace() call is inserted.  Here are some useful commands:

* The **s** key steps thru the code.
* The **n** key goes to the next line.
* The **q** key quits.

More on [Python Debugging](https://docs.python.org/3/library/pdb.html).
