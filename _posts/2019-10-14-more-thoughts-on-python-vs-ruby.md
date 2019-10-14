---
layout: post
title: More Thoughts on Python vs Ruby
category: python
tags: ["python", "ruby"]
---
{:.center}
![IMG_9476.jpeg](/blog/assets/IMG_9476.jpeg)

So I've been grinding away at Python on a regular basis and I have a few  small observations on the continuing differences.

## Python Methods Require ()

When you code in Ruby you are never quite sure if something is a method or a variable (or in an ActiveRecord context, an attribute).  In Python everything that is a method requires () -- even if there are no arguments.  So this means that you type:

```python
quit()
```

and not 

```python
quit
```

unless, of course, you are using [iPython](https://ipython.org/) (the equivalent of IRB + awesome print) in which case it automagically adds the damn parentheses.

The bottom line here is that Python makes it simpler than Ruby to know when something is a method instead of a variable.  Is that a good thing?  I'm really, really not sure; I can certainly see complexities in a meta programming context.

## String Interpolation

Ruby's #{} string interpolation is damn magical -- it just works in every context where you use a string.  Apparently this is a very, very new concept to Python, having only arrived in Python 3.6:

```ruby
skill = "beginner"
puts "Scott is a #{skill}"
```


```python
skill = "beginner"
print(f"Scott is a {skill}")
```

This is called a Python f string and only started working this way in 3.6 at least according to [Stack Overflow](https://stackoverflow.com/questions/4450592/is-there-a-python-equivalent-to-rubys-string-interpolation).

Pulling exactly from the Stack Overflow article, I learned this.  

"Prior to 3.6, the closest you can get to this is:"

```python
name = "Spongebob Squarepants"
print("Who lives in a Pineapple under the sea? %(name)s." % locals())
```

"The % operator can be used for string interpolation in Python. The first operand is the string to be interpolated, the second can have different types including a "mapping", mapping field names to the values to be interpolated. Here I used the dictionary of local variables locals() to map the field name name to its value as a local variable."

## TOOWTDI or There's Only One Way to Do It

I've always known about [TOOWTDI being sort of the python philosophy](https://wiki.python.org/moin/TOOWTDI) and as I dive into Python, I'm finding that really not to be the case anymore (if it ever was).  I find this to be particularly true with respect to packaging and the third party ecosystem related to Python.

## A Pythonic Aside

{:.center}
![aquaman.jpg](/blog/assets/aquaman.jpg)

The Python community is very big on the term [Pythonic](https://stackoverflow.com/questions/25011078/what-does-pythonic-mean) as a way to indicate that you are doing it the right, the **pythonic** way.  My 18 year old son has been watching me learn Python (and picking up a few tips along the way) and he made the observation that the Python community saying Pythonic is like Aquaman in Batman the Brave and the Bold saying [Outrageous]()! (very end of the linked clip).

[![Outrageous](https://img.youtube.com/vi/tc_C1JRclDY/0.jpg)](https://www.youtube.com/watch?v=tc_C1JRclDY "Outrageous!")
