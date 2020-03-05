---
layout: post
title: Emulating Ruby's Benchmark.real_time in Python Using a Context Manager
category: python
tags: ["python", "ruby"]
---
One of the most confusing aspects of multi language programming is when you know how to do it in your preferred language and when you are trying to figure it out in your new language.  And, as any reader of this blog knows, Ruby is always, always, always my preferred language.  I suspect you could say that:

* Ruby is my wife but
* I have a serious relationship with Python
* And I'm now flirting with Rust and seeing if I want to bring her to the dance ...

Today's topic is code benchmarking.  Here's what I would do in Ruby:

```ruby
benchmarks = {}
results = nil
elapsed_time = Benchmark.realtime do 
  results = some_long_running_method(foo, bar, baz)
end
benchmarks['some_long_running_method'] = elapsed_time
```

By defining results outside the block of code (the bits between do and end), it basically gets a transitive scope that allows what is computed inside the block to exist outside the block.  And then I set the associative array (also known as a hash) to have a key for the method, some_long_running_method, and also the elapsed time.  This way I can build up a hash of all my methods and how long they take.

My pairing partner on this project, Grant, tells me "You could use a context manager for this".  And this led me to these Python docs:

* [ContextLib](https://docs.python.org/3/library/contextlib.html)
* [Geeks for Geeks](https://www.geeksforgeeks.org/context-manager-in-python/)

I found both of these very pythonic -- which, for me, means I didn't understand them at all.  Happily I was able to cobble together a basic example:

```python
from contextlib import contextmanager
import time

def some_long_running_method1(amount):
    print(amount)
    
def some_long_running_method2(amount):
    print(amount)

@contextmanager
def timer(benchmarks, benchmark_key):
    t_0 = time.time()
    yield 
    run_time = time.time() - t_0
    benchmarks[benchmark_key] = run_time
    
benchmarks = {}

with timer(benchmarks, 'test_sleep'):
    some_long_running_method1(5)

with timer(benchmarks, 'test_foo'):
    some_long_running_method1(5)
```

The end result of this is a Python dictionary like this:

```python
{'some_long_running_method1': 4.696846008300781e-05, 'some_long_running_method2': 4.696846008300781e-05}
```

And here's how this looks like in a production code refactor:

## Before

```python
times = {}

time_start = time.time()
json_str = common_kafka.pop_from_topic(kafka_conn, kafka_topic_name)
time_end = time.time()
times = common_debugging.benchmark(times, time_start, time_end, 'common_kafka.pop_from_topic')
```

## After

You should note that my timer routine now is located in a common file named common_debugger.py.

```python
import common_debugger

times = {}
with common_debugging.timer(times, 'common_kafka.pop_from_topic'):
    json_str = common_kafka.pop_from_topic(kafka_conn, kafka_topic_name)

```

## Conclusion

This is pretty clearly an improvement in terms of reducing complexity and code cruft.  Context managers are an interesting improvement to Python even if I personally found the documentation confusing.  Recommended.