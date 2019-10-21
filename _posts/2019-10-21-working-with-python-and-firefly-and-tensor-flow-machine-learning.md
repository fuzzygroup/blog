---
layout: post
title: Working with Python and Firefly and Tensor Flow Machine Learning
category: python
tags: ["python", "firefly", "machine_learning", "tensor_flow"]
---
{:.center}
![firefly.jpg](/blog/assets/firefly.jpg)

I am currently working on a project using Python that process data via standard in and then renders an opinion on it to standard out.  This is called an **expert** and there are many of them that pass their opinion on down a pipeline (the original input is actually json and each expert adds its opinion into the json).

The problem that I've discovered is that [Tensor Flow](https://www.tensorflow.org/) is extremely slow to startup.  This means that that my quickly running command line model hit an execution wall just due to the startup time of the Tensor Flow libraries.  The solution was to break my command line program into two parts.  I started with:

    expert_white_supremacy_speech.py

and that needs to become:

    expert_white_supremacy_speech.py
    expert_white_supremacy_speech_service.py

The "_service.py" version of this will be run via a Python library called [Firefly](https://rorodata.github.io/firefly/) which provides "functions as a service" that are exposed via a restful API.

**Note 1**: In computer science speech, a program that runs in the background is called a daemon or a service.

**Note* 2*: Because I'm going to have a number of these experts, I already have conventions around naming and since I will likely end up moving the "opinion" portion of all of the experts into this "function as a service" paradigm.  That way my web interface, written in Rails, can also call into it thru a simple curl command.

Firefly provides a persistently running daemon which should have all the libraries loaded one time.  This daemon is run with the following syntax:

    firefly base_script_name.method_name

So in my case I will be running it as:

    firefly expert_white_supremacy_speech_service.opinion
    
The default for Firefly is to run on port 8000.  And this is where it gets interesting.  Because I'm going to have different experts that are all going to need to render opinions that are all coming from different routines, I went into firefly thinking "Ok; run one instance on port 8000 for method x; run another instance on part 8001 for method y and so on".  The actually approach is to use a config file which maps multiple methods from as many python files as you have. 

Let's illustrate this with two python scripts, fibs.py and squares.py and a config file, config.yml.  Here's the contents of each:

```python
# this is squares.py

def square(n):
    return n * n
```

```python
# this is fibs.py

def fib(n):
    if n == 0 or n == 1:
        return 1
    else:
        return fib(n-1) + fib(n-2)
```

```yml
version: 0.001
token: plotti1234
functions:
  fib:
    path: "/fib"
    function: "fibs.fib"
  square:
    path: "/square"
    function: "squares.square"
```

The syntax on the yaml file for the function line is "base_python_script_name.method".

This means that my approach is going to be to run firefly with the config file:

    firefly -c config.yml

I can then run call the functions as follows:

    (venv) ➜  scratch git:(master) ✗ python3
    Python 3.7.4 (v3.7.4:e09359112e, Jul  8 2019, 14:54:52)
    [Clang 6.0 (clang-600.0.57)] on darwin
    Type "help", "copyright", "credits" or "license" for more information.
    >>> import firefly
    >>> client = firefly.Client("http://127.0.0.1:8000/",auth_token="plotti1234")
    >>> client.square(n=2)
    4
    
    >>> client.fib(5)
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
      File "/Users/sjohnson/fuzzygroup/adl/antihate/antihate_experts/venv/lib/python3.7/site-packages/firefly/client.py", line 115, in wrapped
        raise FireflyError('Firefly functions only accept named arguments')
    firefly.client.FireflyError: Firefly functions only accept named arguments
    
    >>> client.fib(n=5)
    8

I left the error (client.find(5)) in place because it illustrates that firefly only works with named arguments which wasn't obvious (at least to me).

If you watch the logs on the firefly execution, you see something like this:

    (venv) ➜  scratch git:(master) ✗ firefly -c config.yml
    2019-10-21 13:23:18 firefly [INFO] Starting Firefly...
    http://127.0.0.1:8000/
    2019-10-21 13:23:28 firefly [INFO] calling function square
    127.0.0.1 - - [21/Oct/2019 13:23:28] "POST /square HTTP/1.1" 200 2
    2019-10-21 13:23:32 firefly [INFO] calling function fib
    127.0.0.1 - - [21/Oct/2019 13:23:32] "POST /fib HTTP/1.1" 200 1

# Performance 

In my initial implementation on my white_supremacy_speech expert, I'm getting a performance characteristic compatible with Tensor Flow execution assuming the libraries were already resident.  This means that my assumptions on how Firefly works were correct and this performance bottleneck has been addressed.  And that means that my plan on moving the guts of the other opinion tools into Firefly is solid. 

# Conclusion

Additional firefly features include the ability to run with gunicorn in place of the internal web server for better scalability via a higher number of workers.  Overall Firefly is a **pretty damn impressive** piece of software.  While I still love my Ruby and my Rails, I am finding that the overall Python ecosystem has a lot of good tools.

# References
* [Thomas Eberman - gunicorn reference](https://www.liip.ch/en/blog/machine-learning-as-a-service-with-firefly)
* [Read the Docs](https://firefly-python.readthedocs.io/en/latest/)
* [Github](https://github.com/rorodata/firefly)
* [Medium Article](https://towardsdatascience.com/creating-and-deploying-a-python-machine-learning-service-a06c341f020f)
