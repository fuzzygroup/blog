---
layout: post
title: The Complete Idiot's Guide to Refactoring Python Using Multiprocessing Pools
category: python
tags: ["python", :"scalability"]
---
{:.center}
![cloudy_drive.jpg](/blog/assets/cloudy_drive.jpg)

While I would happily proclaim that my **ur language** is Ruby, I spend increasingly large amounts of time these days using Python.  And while there are many things that I don't like about Python (the syntax makes my eyes want to weep and then die; thanks [Tim Curry / Psych](https://www.youtube.com/watch?v=SZGEiz2cpEw); around 20 seconds in), the strength of the Python ecosystem is **outstanding**.

Today I'm going to talk about the [Python Multiprocessing](https://docs.python.org/3/library/multiprocessing.html) library which is a standard part of Python and can be used without even needing to install anything.  And this isn't going to be a theoretical explanation of processes / threads / parallelism.  Instead it is going to be a simple explanation about how my favorite Python guru taught me to love the zen of multiprocessing with a very specific example.  But we do need a few basics:

1.  In Python you want to use processes not threads.  The reason for this is the infamous GIL issue which [Real Python](https://realpython.com/python-gil/) does a great job discussing so I'm just not going to get into it.
2.  Unless your python processes are heavily IO bound (example -- calling networked APIs), you generally want to use a pool of processes tied to your CPU / Core count.  Happily this is astonishingly trivial as the multiprocessing library gives you multiprocessing.cpu_count() as a core primitive.  Please note that I recognize that I have vastly oversimplified this issue and that many people argue for number of cores - 1.  As with all complex computing issues, well, ymmv.
3. Debugging parallel software is always harder than you think it is so I only, ever, do this at the end of project when I **know** that my code works and where the bottlenecks are (i.e. is it IO bound for example).
4. Consistency of coding practices makes a huge difference.  In the code base I just left, I was able to transition all of it to a multiprocessing architecture trivially because I had invested heavily in consistency.
5. Your deployment tooling makes a huge difference.  If you want to experiment with multiprocessing then you need the ability to change your instance type / number of cores and benchmark to know that you are spending your money wisely.

## Before

Before I implemented multiprocessing, I had an architecture across my data pipeline that looked like this:

```python
import foo
import bar 

def main():
    # do the thing
    
    # do more things
```

## After

```python
import multiprocessing
import foo
import bar

def main():
    pool = Pool(multiprocessing.cpu_count())
    res = pool.apply_async(do_main) 
    while True:
        pass

def do_main():
    # do the thing
    
    # do more things
```

As you can see, do_main is just a rewrite of main() under a different name so it can be called by pool.apply_async().  All I did for this rewrite was:

1. Import the multiprocessing library.
2. Create a new def main() as per the above.
3. Rename my former def main() to def do_main().

## Thank You

I would be remiss without thanking my former colleague Grant for his assistance with this refactor.  It is tremendously easy to go wrong with multiprocessing and he set me straight a number of times.  Thanks Grant!

## Caveats

The example above isn't doing anything to capture output from the do_main() method.  The reason for this, is that for my use case, I was implementing a data pipeline where my main() method was simply doing work and advancing stuff across the pipeline from SQS bucket to SQS bucket.  If you want to capture output from a do_main() routine then that can be done by reading the documentation for apply_async.

## References

* [The GIL Issue](https://realpython.com/python-gil/)
* [Python Multiprocessing](https://docs.python.org/3/library/multiprocessing.html)
* [Using a Pool of Workers](https://docs.python.org/3/library/multiprocessing.html#using-a-pool-of-workers)
* [When to Use apply_async versus map](https://stackoverflow.com/questions/8533318/multiprocessing-pool-when-to-use-apply-apply-async-or-map)
* [Checking the State of a Process](https://stackoverflow.com/questions/39773377/python-multiprocessing-check-status-of-each-processes)
* [Pool Process Limits](https://stackoverflow.com/questions/20039659/python-multiprocessings-pool-process-limit)
* [Number of CPUs using Python](https://stackoverflow.com/questions/1006289/how-to-find-out-the-number-of-cpus-using-python)
* [The Shark Approach to Multiprocessing](https://pythonspeed.com/articles/python-multiprocessing/)
