---
layout: post
title: Ruby to Python Translation Guide
category: python
tags: ["ruby", "python"]
---
## Last Update: 12/12/2019

I wrote this guide to different Ruby idioms and how to do them in Python.  Organization is alphabetical.  This will have to be a continually updated document as I keep finding holes in my Python knowledge and my prior practice of "Learn it / Blog it" simply doesn't put enough things into the same place.  I need a single, easily searchable place to store all this random "how to do X cruft".

This is written as headings which discuss the problem and then how it is done in Ruby and in Python and then, optionally, a Python context.  Hopefully this approach makes it useful to both ruby-ites and python-istas.

**Note 1**: My day to day lingua franca is still Ruby and in a Rails style context where everything is autoloaded.  Python to me is a specialized tool for Data Science / Machine Learning.  I find that Python:

* Lacks the elegant simplicity of Ruby 
* Python syntax makes my eyes want to bleed, can we have an underscore character please, how about a colon or some more parentheses 
* Is developer hostile by default 

**Note 2**: These are opinions!  I am writing them after a craptastic work day so that and lack of sleep may be tilting my opinions more than a bit; I mean I'm right but still ...  And please understand that I fundamentally respect that amazing work that Guido did but I find myself in Matz's camp by preference.  Still nothing else has the ecosystem that Python does.

**Note 3**: If you disagree with the above, my twitter handle is fuzzygroup and my email is easily discoverable.  Let the fun begin ...

**Note 4**: This was initially written in late 2019 so the Python flavor / version is 3.7 using VirtualEnv on a Mac with pip3.

**Note 5**: If there's things you want to see here then actually do let me know.  This isn't a planned out document, it is more of a "what made me feel stooopid in Python today" type of thing.


## Debugging

The ruby is:

```ruby
byebug
```

The python is:

```python
pdb.set_trace()
```

## Getting All Attributes of an Object

Most Ruby objects, at least in a Rails context, are generally ActiveRecord objects and respond to .attributes so:

```ruby
plan = Plan.first
2.6.3 :016 > plan.attributes
{
             "id" => 1,
     "created_at" => Sat, 27 Jul 2019 08:28:17 UTC +00:00,
     "updated_at" => Sat, 27 Jul 2019 08:28:17 UTC +00:00,
           "name" => "Write Daily",
    "public_name" => nil,
    "description" => nil,
        "options" => nil,
        "user_id" => 1,
    "category_id" => nil,
     "has_habits" => nil,
    "habit_count" => 3,
      "shareable" => false,
    "master_plan" => false,
         "active" => true
}
```

The python equivalent of this is is to reference the object's internal dict.  Below we have an object called message which is coming in from a streaming data solution called sse:

```python
message.__dict__
{'data': '{"all_awardings":[],"approved_at_utc":null,"ups":1,"user_reports":[]}', 'event': 'rc', 'id': '33288433929', 'retry': None}

# There are four different top level things that can be called:
message.data
message.event
message.id 
message.retry

# despite the appearance, the attributes of data are NOT json buy just a string so this doesn't work:

message.data.keys()
*** AttributeError: 'str' object has no attribute 'keys'
```

## Getting All Methods for an Object

The ruby is:

```ruby
hash = {'foo': 'bar', 'cat': 'blepp'}
(hash.methods - Object.methods).sort

(hash.methods - Object.methods).sort
[
    [  0] :[],
    [  1] :[]=,
    [  2] :all?,
    [  3] :any?,
    [  4] :assert_valid_keys,
    [  5] :assoc,
    [  6] :chain,
    [  7] :chart_json,
    [  8] :chunk,
    # a crap ton of methods omitted for clarity
]

# Also and BETTER since it just shows methods on the class; not inherited methods:

plan.public_methods(false)
[
    [ 0]                          active_habits()      Plan
    [ 1]                   after_add_for_habits()      Plan
    [ 2]                  after_add_for_habits=(val)   Plan
    [ 3]                  after_add_for_habits?()      Plan
    [ 4]                after_remove_for_habits()      Plan
    [ 5]               after_remove_for_habits=(val)   Plan
    [ 6]               after_remove_for_habits?()      Plan
    [ 7] autosave_associated_records_for_habits(*args) Plan
    [ 8]                  before_add_for_habits()      Plan
    [ 9]                 before_add_for_habits=(val)   Plan
    [10]                 before_add_for_habits?()      Plan
    [11]               before_remove_for_habits()      Plan
    [12]              before_remove_for_habits=(val)   Plan
    [13]              before_remove_for_habits?()      Plan
    [14]                                    foo(bar)   Plan
    [15] validate_associated_records_for_habits(*args) Plan
]
```

The python is:

```python
dir(message)
['__class__', '__delattr__', '__dict__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__le__', '__lt__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', 'data', 'dump', 'event', 'id', 'parse', 'retry', 'sse_line_pattern']
(Pdb) message.sse_line_pattern
re.compile('(?P<name>[^:]*):?( ?(?P<value>.*))?')
# object.__dict__ gets you an object's data while dir(object) gets you an object's methods
```

See: [Me](https://fuzzyblog.io/blog/python/2019/10/24/using-python-to-get-an-object-s-methods-attributes-dynamically.html), [Lerner](https://lerner.co.il/2014/10/14/python-attributes/), [Swlh](https://medium.com/swlh/class-and-object-attributes-python-8191dcd1f4cf), [Stack Overflow](https://stackoverflow.com/questions/6886493/get-all-object-attributes-in-python)

## Getting All Keys in a Hash

The ruby is:

```ruby
hash = {'foo': 'bar', 'cat': 'blepp'}
2.6.3 :018 > hash.keys
[
    [0] :foo,
    [1] :cat
]
```

The python is:

```python
hash = {'foo': 'bar', 'cat': 'blepp'}
hash.keys()
dict_keys(['foo', 'cat'])
```

## JSON Parsing

The ruby is:

```ruby
json_str = '{"id": 12345, "message": "hello", "array": [1,2,3,4]}'
json = JSON.parse(json_str)
{
         "id" => 12345,
    "message" => "hello",
      "array" => [
        [0] 1,
        [1] 2,
        [2] 3,
        [3] 4
    ]
}
```

The python is:

```python
import ujson as JSON

json_str = '{"id": 12345, "message": "hello", "array": [1,2,3,4]}'
json = JSON.loads(json_str)
{'id': 12345, 'message': 'hello', 'array': [1, 2, 3, 4]}
json.keys()
dict_keys(['id', 'message', 'array'])
```

I will confess to dipping into a bit of a Ruby idiom here by importing ujson as JSON (all caps).  I find myself constantly making errors in python by calling my json variable json when that's actually an imported class / module.  This one change makes things a lot easier (at least for me).

## Length / Size of an Object

The ruby is:

```ruby
plan.name.size
11
```

The python is:

```python
len(message.data)
1826
```

## Quitting the console

The ruby is:

```ruby
quit
```

The python is:

```python
quit()
```

## Redis

The ruby is:

```ruby
require 'redis'

2.6.3 :005 > redis = Redis.new
#<Redis client v4.1.3 for redis://127.0.0.1:6379/0>
2.6.3 :006 > redis.set("mykey", "hello world")
"OK"
2.6.3 :007 > redis.get("mykey")
"hello world"
```

The python is:

```python
>>> import redis
>>> r = redis.Redis(host='localhost', port=6379, db=0)
>>> r.set('mykey', 'hello world')
True
>>> r.get('mykey')
'hello world'
```

## String Interpolation

The ruby is:

```ruby
skill = "beginner"
puts "Scott is a #{skill}"
```

The python is:

```python
skill = "beginner"
print(f"Scott is a {skill}")
```

## Try / & - Safe Navigation and Python Hashes

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

## The Blank for Writing the Next Entry

The ruby is:

```ruby
```

The python is:

```python
```
