---
layout: post
title: Python Machine Learning Best Practice - Lock Down Your Versions
category: python
tags: ["python", "pipeline", "machine_learning"]
---
{:.center}
![IMG_3881.jpeg](/blog/assets/IMG_3881.jpeg)

I recently took a Python and Ruby (but mostly Python) Machine Learning data pipeline live and, almost immediately, hit a pretty significant problem.  The issue was this line of code:

```python
model_input = tokenizer.encode_plus(text_to_classify, add_special_tokens=True, return_tensors='pt').to(device_to_use) 
```

This, which worked, at least for a while, perfectly on my development box.  And then I deployed the code and that caused my requirements.txt file to be **fulfilled** and that's when the trouble started.  As I hope you know, requirements.txt is a list of any software components that your project uses along with, sometimes, the version numbers of those software components.

Now I mostly work over in the happy go lucky land of Ruby and the Ruby world has a pretty **mature** ecosystem at this point where components change but not terribly frequently.  The Ruby equivalent to Python's requirements.txt is called Gemfile and like requirements.txt, a Gemfile can include the version of a component.  But, because the Ruby world's components tend to be mature, I haven't worried about locking down version numbers for ages.  Yes, yes, I know that this is bad but I'm human and fallible.  

So what happened when my code was deployed is that this command was executed:

    pip install -R requirements.txt
    
as part of the underlying Docker build process.  And this brought in whatever the **latest** version of our underlying Machine Learning libraries happened to be.  And that broke the line of code above which then led to the expected scramble to: 

* figure out what version I had on my development machine
* update requirements.txt
* shut down the cluster of boxes running our pipeline
* redeploy the code 

Here's the sample recommendation: 

> Always, **immediately**, lock down the version of any machine learning libraries that you put into requirements.txt.  These libraries are changing regularly and their changes can very easily break your code.  You need to do this **when** you add one of these libraries to requirements.txt.