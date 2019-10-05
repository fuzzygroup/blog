---
layout: post
title: Get it Right Spacy, Get it Right
category: python
tags: ["python", "nlp", "spacy"]
---
{:.center}
![IMG_9298.jpeg](/blog/assets/IMG_9298.jpeg)

**Note**: I'm writing this at 4:53 am and I'm tired hence the humor.  No disrespect intended towards any of my pagan friends; I love you all; this is tongue in cheek.

I fully admit to being a damn python noob but I can follow directions. I was attempting to use the [Spacy](https://spacy.io/) library to detect the language of a string of text.  I started from the [example here](https://spacy.io/universe/project/spacy-langdetect) as replicated below:

```python
import spacy
from spacy_langdetect import LanguageDetector
nlp = spacy.load('en')
nlp.add_pipe(LanguageDetector(), name='language_detector', last=True)
text = 'This is an english text.'
doc = nlp(text)
# document level language detection. Think of it like average language of the document!
print(doc._.language)
# sentence level language detection
for sent in doc.sents:
   print(sent, sent._.language)
```

Now before I even tried this, I updated my requirements.txt file with:

    spacy

And that, not surprisingly, did not work.  Sigh.  I started with this error:

    >>> import spacy
    >>> from spacy_langdetect import LanguageDetector
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    ModuleNotFoundError: No module named 'spacy_langdetect'
    
And, not surprisingly, cursing followed.  Sadly my normal approach of:

1.  Go outside.
2.  Start fire.
2.  Take off clothes.
3.  Dance naked in the firelight while chanting and praising the patron saint of Python "The Great Guido".

did not work.  In the absence of this working, I turned, disappointingly, to Google.  I discovered that there appeared to be a spacy-langdetect module so I added that to requirements.txt and did the pip dance:

    pip install -r requirements.txt
    
And, wow!  That too failed but this time I got a different error so progress!

    >>> nlp = spacy.load("en")
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
      File "/Users/sjohnson/fuzzygroup/adl/antihate/antihate_experts/venv/lib/python3.7/site-packages/spacy/__init__.py", line 27, in load
        return util.load_model(name, **overrides)
      File "/Users/sjohnson/fuzzygroup/adl/antihate/antihate_experts/venv/lib/python3.7/site-packages/spacy/util.py", line 171, in load_model
        raise IOError(Errors.E050.format(name=name))
    OSError: [E050] Can't find model 'en'. It doesn't seem to be a shortcut link, a Python package or a valid path to a data directory.
    
So while I considered returning to the fire and, perhaps, sacrificing a goat, I couldn't find an app that delivered live goats on demand and, thus, more googling ensued.  This gave me the command: 

    python -m spacy download en
    
which automagically made the original snippet work.  Here it is again:

```python
>>> import spacy
>>> from spacy_langdetect import LanguageDetector
>>> nlp = spacy.load('en')
>>> nlp.add_pipe(LanguageDetector(), name='language_detector', last=True)
>>> text = 'This is an english text.'
>>> doc = nlp(text)
>>> # document level language detection. Think of it like average language of the document!
... print(doc._.language)
{'language': 'en', 'score': 0.9999978582631465}
>>> # sentence level language detection
... for sent in doc.sents:
...    print(sent, sent._.language)
...
This is an english text. {'language': 'en', 'score': 0.9999968011919729}
```

And that's great but given that I did a **nlp = spacy.load('en')** call initially, do I need to load a library for other languages?  Sigh.  Well the other night I was wandering around an Ikea and I found a book on [Saab](https://www.amazon.com/Kampen-Jonas-Froberg-Hardcover-Swedish/dp/9153435850/ref=sr_1_1?keywords=saab+froberg&qid=1570178612&sr=8-1) that I wanted to buy but when I looked on Amazon to find an english language version, all I found was the Swedish -- but the Amazon description was in Swedish -- so that was my source of a language other than English.  So I copied this text from the Amazon web page:

> Initierat om Saabs dramatiska ödesår // Det var omöjligt. Dödsdömt. Men det gick. Det här är hela historien om Saabs årslånga kamp för överlevnad, en tempofylld reportagebok som bjuder på unika inblickar bakom kulisserna.

and I reran the last few lines of the code:

```python
>>> text = 'Initierat om Saabs dramatiska ödesår // Det var omöjligt. Dödsdömt. Men det gick. Det här är hela historien om Saabs årslånga kamp för överlevnad, en tempofylld reportagebok som bjuder på unika inblickar bakom kulisserna.'
>>> doc = nlp(text)
>>> # document level language detection. Think of it like average language of the document!
... print(doc._.language)
{'language': 'sv', 'score': 0.9999981443798187}
```

So it is pretty clear that Spacy really does work and that nlp = spacy.load('en') does more than just english.  It is unclear to me though if this perhaps is limited to only western language character sets so let's feed some Japanese into it.  

```python
>>> text = '日本語のキーボード'
>>> import spacy
>>> from spacy_langdetect import LanguageDetector
>>> nlp = spacy.load('en')
>>> nlp.add_pipe(LanguageDetector(), name='language_detector', last=True)
>>> doc = nlp(text)
>>> # document level language detection. Think of it like average language of the document!
... print(doc._.language)
{'language': 'ja', 'score': 0.999999998793732}
>>> # sentence level language detection
... for sent in doc.sents:
...    print(sent, sent._.language)
{'language': 'ja', 'score': 0.999999998793732}
```

In closing I have to say that Spacy works impressively well.  I remember writing these types of routines back in the mid 1990s and while we had the same capabilities, we did it all in C and it took a fair bit of work for Dataware's Advanced Search team of John Munson and Trey Jones to do this.  Now it is an open source routine.  Damn!

My one real objection here is this line:

    python -m spacy download en
    
To my way of thinking this is should be encapsulated into the requirements.txt file.  Without that you need a whole different step in your deployment architecture to make sure that this special little bit of python gets executed AFTER your python environment is setup.  And Ansible will do that but it is definitely something that will bite you in the ass at least a few times before you get that right.