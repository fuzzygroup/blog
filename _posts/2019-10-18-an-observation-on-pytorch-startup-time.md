---
layout: post
title: An Observation on TensorFlow and PyTorch Startup Time
category: python
tags: ["pytorch", "python", "tensorflow"]
---
I'm in the process of designing a STANDARD IN processing system implemented in Python using some fairly simple data processing and now some PyTorch machine learning.  The shocking thing to me was just how slowly all the required PyTorch libraries load in Python.  

We have:

```python
from pathlib import Path
import torch
import pandas as pd
import numpy as np
from transformers import BertTokenizer, BertForSequenceClassification
```

as dependencies.  And when you evaluate that in in the console I can count up to 6 one thousand (MacBook Pro 2015) as it evaluates.  I suspect the big deal here comes from BertTokenizer, BertForSequenceClassification because that must wrap in TensorFlow.

Yes, yes, yes I know that's not exactly scientific but this is a process that we were treating as a data processing pipeline with each new input launching the process.  That type of lag means that I need to abstract my PyTorch / TensorFlow stuff into a persistently running service to which my pipeline talks.  Sigh.  

Looks like I need to wrap it in [FireFly](https://github.com/rorodata/firefly).  At least I like the name ...
