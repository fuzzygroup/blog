---
layout: post
title: Working Up to Bert - Installing TensorFlow for Python
category: python
tags: ["python", "tensorflow", "pip", "virtualenv"]
---
{% pizzaforukraine  %}

I'm gearing myself up mentally for a bunch of upcoming machine learning worth using Bert / Roberta and that means getting my head around just working with Python as a tool.  So today's exercise is installing TensorFlow for Python since Bert / Roberta have TensorFlow as a dependency.

I worked from the [official TensorFlow instructions using pip](https://www.tensorflow.org/install/pip).

## Step 1 - Validating Requirements

Whenever you are on the cutting edge (and TensorFlow is cutting edge) then you generally need the latest tools so:

    python3 --version
    Python 3.7.4
    
    pip3 --version
    pip 19.2.3 from /Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/pip (python 3.7)
    
    virtualenv --version
    15.1.0

All of those are actually recent.  To translate these for myself and the one or two other rubyists out there:

* python3 is the Python language executable; think ruby
* pip3 is the equivalent of bundler (and your Gemfile is named requirements.txt); but pip is also partial equivalent of the gem executable (as opposed to the gem itself)
* virtualenv is the equivalent of rvm or rbenv

If you don't have current versions of those then you might want to check out the [Anaconda distribution of Python](https://www.anaconda.com/distribution/) although some of my [python friends](https://eethomp.github.io) would curse mightily to hear me say that; I don't savvy the differences enough yet to know.

## Create a Virtual Environment

The next step is to create a virtual environment where you're planning to work.

**Note**: Given the quantity of terminal windows I survive in, the first thing I actually did was to load the nu shell in my terminal so I had a distinct environment to separate Python from my Ruby ("You got python in my Ruby; No you got Ruby in my python"; anyone out there get that old joke).  I also created and changed into a new directory where this will all be installed into since I wasn't sure exactly where / how the python virtual environment was going to work.

    mkdir ~/fuzzygroup/adl/tensorflow
    cd ~/fuzzygroup/adl/tensorflow
    virtualenv --system-site-packages -p python3 ./venv

What this shows me is that virtualenv creates a single directory called "venv" in your current directory (presumably holding dependencies):

    ls
    ------+-----------+----------+-------+-------------+-------------+-------------
     name | type      | readonly | size  | created     | accessed    | modified
    ------+-----------+----------+-------+-------------+-------------+-------------
     venv | Directory |          | 224 B | an hour ago | an hour ago | an hour ago
    ------+-----------+----------+-------+-------------+-------------+-------------

and here's a look into venv itself:

    ls venv/
    ---+-------------------------+-----------+----------+-------+-------------+-------------+-------------
     # | name                    | type      | readonly | size  | created     | accessed    | modified
    ---+-------------------------+-----------+----------+-------+-------------+-------------+-------------
     0 | venv/.Python            | Symlink   |          | 56 B  | an hour ago | an hour ago | an hour ago
     1 | venv/bin                | Directory |          | 512 B | an hour ago | an hour ago | an hour ago
     2 | venv/include            | Directory |          | 96 B  | an hour ago | an hour ago | an hour ago
     3 | venv/lib                | Directory |          | 96 B  | an hour ago | an hour ago | an hour ago
     4 | venv/pip-selfcheck.json | File      |          | 61 B  | an hour ago | an hour ago | an hour ago
    ---+-------------------------+-----------+----------+-------+-------------+-------------+-------------

**Sidebar**: And isn't the [nu shell](https://www.jonathanturner.org/2019/08/introducing-nushell.html) cool as hell?

Once you have venv setup then you need to activate it:

    source ./venv/bin/activate

 In Ruby this would be done just by changing into the directory thru .ruby-version and .ruby-gemfile.

The next step is to make sure that pip is upgraded:

    pip install --upgrade pip
    
In the Ruby world, this is equivalent to upgrading bundler.

Run a:

    pip list

to see what's installed.  

In the Ruby world this would be 'gem list'.

Now in the Ruby world where you automagically have your environment setup for you (and taken down) when you change in and out of directories, virtualenv requires you to manually deactivate:

    deactivate
 
 Given my personal problems with [Shell Extension Madness](https://fuzzyblog.io/blog/ruby/2019/07/10/when-rbenv-well-won-t-rbenv-fixing-shell-extension-madness.html), I'm not certain that being explicit about virtualenv activation / deactivation is all that bad.
 
 **Note**: I'm a consultant and a serious ruby hobbyist so I have WAY more environments than is normal; I'm not saying that rbenv / rvm don't work in general, more specifically, that they don't always work for **me**.
 
 ## Actually Installing TensorFlow
 
 And now, finally, we can actually install TensorFlow:
 
     pip install --upgrade tensorflow
     
This would be the equivalent of a gem install command without a Gemfile.

To verify the installation we can pass a Python script into Python with the -c argument:

    python3 -c "import tensorflow as tf;print(tf.reduce_sum(tf.random.normal([1000, 1000])))"
    
Interestingly the TensorFlow docs had the above as just "python -c" despite referencing python3 earlier.  I thought perhaps that virtualenv aliased python3 to python but that seems not to be the case; bad on Google Documents; sigh.  

Here's what I got as a result:

    python3 -c "import tensorflow as tf;print(tf.reduce_sum(tf.random.normal([1000, 1000])))"
    /Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/tensorflow/python/framework/dtypes.py:516: FutureWarning: Passing (type, 1) or '1type' as a synonym of type is deprecated; in a future version of numpy, it will be understood as (type, (1,)) / '(1,)type'.
      _np_qint8 = np.dtype([("qint8", np.int8, 1)])
    /Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/tensorflow/python/framework/dtypes.py:517: FutureWarning: Passing (type, 1) or '1type' as a synonym of type is deprecated; in a future version of numpy, it will be understood as (type, (1,)) / '(1,)type'.
      _np_quint8 = np.dtype([("quint8", np.uint8, 1)])
    /Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/tensorflow/python/framework/dtypes.py:518: FutureWarning: Passing (type, 1) or '1type' as a synonym of type is deprecated; in a future version of numpy, it will be understood as (type, (1,)) / '(1,)type'.
      _np_qint16 = np.dtype([("qint16", np.int16, 1)])
    /Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/tensorflow/python/framework/dtypes.py:519: FutureWarning: Passing (type, 1) or '1type' as a synonym of type is deprecated; in a future version of numpy, it will be understood as (type, (1,)) / '(1,)type'.
      _np_quint16 = np.dtype([("quint16", np.uint16, 1)])
    /Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/tensorflow/python/framework/dtypes.py:520: FutureWarning: Passing (type, 1) or '1type' as a synonym of type is deprecated; in a future version of numpy, it will be understood as (type, (1,)) / '(1,)type'.
      _np_qint32 = np.dtype([("qint32", np.int32, 1)])
    /Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/tensorflow/python/framework/dtypes.py:525: FutureWarning: Passing (type, 1) or '1type' as a synonym of type is deprecated; in a future version of numpy, it will be understood as (type, (1,)) / '(1,)type'.
      np_resource = np.dtype([("resource", np.ubyte, 1)])
    /Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/tensorboard/compat/tensorflow_stub/dtypes.py:541: FutureWarning: Passing (type, 1) or '1type' as a synonym of type is deprecated; in a future version of numpy, it will be understood as (type, (1,)) / '(1,)type'.
      _np_qint8 = np.dtype([("qint8", np.int8, 1)])
    /Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/tensorboard/compat/tensorflow_stub/dtypes.py:542: FutureWarning: Passing (type, 1) or '1type' as a synonym of type is deprecated; in a future version of numpy, it will be understood as (type, (1,)) / '(1,)type'.
      _np_quint8 = np.dtype([("quint8", np.uint8, 1)])
    /Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/tensorboard/compat/tensorflow_stub/dtypes.py:543: FutureWarning: Passing (type, 1) or '1type' as a synonym of type is deprecated; in a future version of numpy, it will be understood as (type, (1,)) / '(1,)type'.
      _np_qint16 = np.dtype([("qint16", np.int16, 1)])
    /Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/tensorboard/compat/tensorflow_stub/dtypes.py:544: FutureWarning: Passing (type, 1) or '1type' as a synonym of type is deprecated; in a future version of numpy, it will be understood as (type, (1,)) / '(1,)type'.
      _np_quint16 = np.dtype([("quint16", np.uint16, 1)])
    /Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/tensorboard/compat/tensorflow_stub/dtypes.py:545: FutureWarning: Passing (type, 1) or '1type' as a synonym of type is deprecated; in a future version of numpy, it will be understood as (type, (1,)) / '(1,)type'.
      _np_qint32 = np.dtype([("qint32", np.int32, 1)])
    /Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/tensorboard/compat/tensorflow_stub/dtypes.py:550: FutureWarning: Passing (type, 1) or '1type' as a synonym of type is deprecated; in a future version of numpy, it will be understood as (type, (1,)) / '(1,)type'.
      np_resource = np.dtype([("resource", np.ubyte, 1)])
    Tensor("Sum:0", shape=(), dtype=float32)
    
This seems to be a bunch of deprecation warnings but the final output seems to be:

    Tensor("Sum:0", shape=(), dtype=float32)
    
And I guess that's right... I mean it did some kind of math; I just don't understand it yet.  And they don't actually show what should happen.  Again bad on the Google documenters.  

So the next step here is to move onto the [tutorials](https://www.tensorflow.org/tutorials)...