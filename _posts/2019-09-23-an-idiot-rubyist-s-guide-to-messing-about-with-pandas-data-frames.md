---
layout: post
title: An Idiot Rubyist's Guide to Messing About with Pandas Data Frames
category: python
tags: ["python", "data_science", "pandas", "data_frame"]
---
{% pizzaforukraine  %}

I am an unabashed rubyist -- I have spent since 2006 doing close to ruby exclusively (well as exclusively as you can in today's modern polyglot world).  And I now find myself in a machine learning, python world.  Today I had to tackle some ad hoc data analysis using a Parquet file created as part of an analysis of some 4chan data and, well, it was interesting.  

Let's start with the requirements:

* Read a parquet file which had a categorical breakdown of some data
* Figure out which of the data categories had more then 5 occurrences of what we were looking for
* Generate a temporal breakdown by year
* Do it in a way that even a Python noob can understand

Let's start with the basics of just reading the Parquet file into a data frame.  For rubyists, think of a dataframe as a spreadsheet that Python can read / write.

```python
import pandas as pd

df = pd.read_parquet("categorical.parquet")
```

That's the start of this.  And this is also where I moved from using a Python script to using Python directly in the console.  I did this by typing:

    python3
    
And that launched me into the interactive Python shell.  Think of this is irb or rails console -- an interactive repl where you can write lines of code experimentally.

The next step was to figure out how to get the temporal ranges.  This was done by leveraging Python datetime objects:

```python
import pandas as pd

df = pd.read_parquet("categorical.parquet")

df2014 = df[df.dt.year == 2014]
df2015 = df[df.dt.year == 2015]
df2016 = df[df.dt.year == 2016]
df2017 = df[df.dt.year == 2017]
df2018 = df[df.dt.year == 2018]
```

This gave me a series of 5 data frames; one for each year.  The next step was to break this down by categories.  The categories we had were aligned to slurs within the data:

* antiblack
* antisemitic
* homophobic
* islamophobic
* misogynistic

Let's take the example of looking into the misogynistic data.  Here's what our script looks like then:

```python
import pandas as pd

df = pd.read_parquet("categorical.parquet")

df2014 = df[df.dt.year == 2014]
df2015 = df[df.dt.year == 2015]
df2016 = df[df.dt.year == 2016]
df2017 = df[df.dt.year == 2017]
df2018 = df[df.dt.year == 2018]

m_results2014 = df2014.query("misogynistic > 5").misogynistic
m_results2015 = df2015.query("misogynistic > 5").misogynistic
m_results2016 = df2016.query("misogynistic > 5").misogynistic
m_results2017 = df2017.query("misogynistic > 5").misogynistic
m_results2018 = df2018.query("misogynistic > 5").misogynistic
```

This gives a series of m_results201x data frames.  What we then want to do is get the data out of the data frame.  This can be done with the .describe() method.

```python
import pandas as pd

df = pd.read_parquet("categorical.parquet")

df2014 = df[df.dt.year == 2014]
df2015 = df[df.dt.year == 2015]
df2016 = df[df.dt.year == 2016]
df2017 = df[df.dt.year == 2017]
df2018 = df[df.dt.year == 2018]

m_results2014 = df2014.query("misogynistic > 5").misogynistic
m_results2015 = df2015.query("misogynistic > 5").misogynistic
m_results2016 = df2016.query("misogynistic > 5").misogynistic
m_results2017 = df2017.query("misogynistic > 5").misogynistic
m_results2018 = df2018.query("misogynistic > 5").misogynistic

m_results2014.describe()
m_results2015.describe()
m_results2016.describe()
m_results2017.describe()
m_results2018.describe()
```

This gave us a series of results that look like this:

    m_results2015.describe()
    count    559.000000
    mean       8.153846
    std        9.398083
    min        6.000000
    25%        6.000000
    50%        7.000000
    75%        8.000000
    max      210.000000
    Name: misogynistic, dtype: float64

What this is telling us is that for 2015 there were 559 occurrences with more than 5.

The interesting things here are:

* having to use () on all method calls, even ones that don't take arguments (very unruby-ish)
* the process of starting with a spreadsheet (data frame) and then generating other data frames as we did the analysis



