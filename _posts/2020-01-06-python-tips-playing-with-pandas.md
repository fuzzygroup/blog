---
layout: post
title: Python Tips - Playing with Pandas
category: python
tags: ["python", "pandas"]
---
{:.center}
![IMG_6444.jpeg](/blog/assets/IMG_6444.jpeg)

As I write this it is 3:45 am and I am playing with Python.  I have a small script that looks like this:

```python
import pandas as pd
DATA_PATH = "data/"
filename = "file.json"
train_sample_size = 45000
dataset = pd.read_json(os.path.join(DATA_PATH, filename), lines=True)
dataset_test = dataset.copy().sample(train_sample_size).reset_index()    
dataset_head = dataset_test.head(train_sample_size)
pdb.set_trace()
```

The pandas library give you a bunch of facilities for looking at data and organizing it into what are called data frames.  If you think of pandas as a spreadsheet that you can use programmatically, well, that's not far off.  Pandas is widely used for Python data processing and can read data from CSV and JSON formats (among others).

If I want to investigate the length of a variable, I can do this:

    (Pdb) len(dataset)
    45648

And if I want to know the type of a variable, I can do this:

    type(dataset)
    <class 'pandas.core.frame.DataFrame'>
    
And if I want to know the columns that Pandas as loaded from the json, I can do this:

     dataset.columns
    Index(['tweet_id', 'timestamp_us_eastern', 'author_handle',
           'author_screenname', 'authority', 'predicted_gender',
           'predicted_language', 'predicted_country',
           'predicted_state_or_province', 'predicted_city', 'given_location',
           'followers', 'following', 'predicted_sentiment', 'context_notes',
           'antisemitic_classification', 'author_bio', 'text', 'is_truncated',
           'is_retweet', 'lang', 'Majority Model', 'label'],
          dtype='object')
          

What this tells me is that I have a dataset variable with a text column that I can access by dataset.text.  And then if I want the first 'row' of data in this column, I can do this:

    (Pdb) dataset.text[0]
    "Jerry Seinfeld spent a lot of time in Israel's apartheid State supporting the Zionists and giving the bastards credibility. Think its fair to shun his crappy unfunny TV Shows. Let him know what people think of him brown nosing the terrorists of Israel.\n"

So [0] gives the first bit of data.  And, correspondingly, [1] gives the next bit:

    (Pdb) dataset.text[1]
    'RT @papicek: @BrncicIvo @fouadhaidar @MehDonaldTrump @AlyseRadenovicA @Sean_x_Larkin @Wandaspangler2 @z123Alpha @Mark_E_Noonan @pouria_63 @KirstyMartin19 @rico_hands @pickle_shmickle @_antizionism @MrBacteriaThief @AltRightJoseph @muld_ulme @kenmckelvey224 @kratze1935 @ExpertZionist @WorldneedsL0VE @amerikagulag @Loo_Siffa @Aristilus @gazaboatconvoy Zionists came up with jut about every form of terrorism you can think of: https://t.co/qvmuMpVWHQ https://t.co/EUg4EviJAe\n'

And now that we know this, if we wanted to loop over all the bits of data in dataset.text, a simple Python for loop would do this:

```python
for text in dataset.text:
    print(text)
```

Let's say that you have a variable wordfreq and you want to look at the string version of a variable, you can do this with the **str** function:

     str(wordfreq)
    '[12, 1, 1, 1, 1, 10, 1, 1, 1, 10, 1, 3, 1, 2, 1, 1, 3, 1, 12, 1]'