---
layout: post
title: Using Spacy for Part of Speech Tagging
category: python
tags: ["python", "nlp", "spacy"]
---
{:.center}
![IMG_3818.jpeg](/blog/assets/IMG_3818.jpeg)

Part of speech tagging is a classic NLP (natural language parsing) where you give a sentence of sentence fragment to a bit of software and ask it to tell you the parts of speech. If this sounds like a 7th Grade English exercise, well, you aren't wrong ...  I'm experimenting with this for an upcoming user interface where I'm hoping to use NLP techniques to lessen the amount of manual data entry.

I chose to use Spacy, a Python NLP tool, for this.  Here's an example of the output from Spacy:

    Input:
    
    ADL - Make the ansible create all the queues
    
    Output:
    
    ...
    ADL          PROPN      NNP      noun, proper singular
    -            PUNCT      :        punctuation mark, colon or ellipsis
    Make         VERB       VB       verb, base form
    the          DET        DT       determiner
    ansible      ADJ        JJ       adjective
    create       NOUN       NN       noun, singular or mass
    all          DET        PDT      predeterminer
    the          DET        DT       determiner
    queues       NOUN       NNS      noun, plural
    
    
I've done this type of stuff in the past using tools like Princeton's WordNET but Spacy makes this even easier that ever before.  Here's all it took:

1.  pip3 install spacy
2.  python3 -m spacy download en_core_web_sm

Here's the accompanying Python code.  This code does two things.  It starts by defining a Spacy document based on the sentence and then it iterates over the words in the sentence and gives the word tags and explanation.

    >>> import spacy
    >>> sp = spacy.load('en_core_web_sm')
    >>> sen = sp("ADL - Make the ansible create all the queues")
    >>> for word in sen:
    ...     print(f'{word.text:{12}} {word.pos_:{10}} {word.tag_:{8}} {spacy.explain(word.tag_)}')
    ...
    ADL          PROPN      NNP      noun, proper singular
    -            PUNCT      :        punctuation mark, colon or ellipsis
    Make         VERB       VB       verb, base form
    the          DET        DT       determiner
    ansible      ADJ        JJ       adjective
    create       NOUN       NN       noun, singular or mass
    all          DET        PDT      predeterminer
    the          DET        DT       determiner
    queues       NOUN       NNS      noun, plural
    
I'm contemplating this for a system built in Rails and it isn't hard to envision setting up a simple Flask API that front ends a Spacy installation that does just this much and returns the result as a JSON structure.  

Spacy -- very, very much recommended!

## References

* [StackAbuse on Spacy](https://stackabuse.com/python-for-nlp-parts-of-speech-tagging-and-named-entity-recognition/)
* [Github on Installing Spacy Libraries](https://github.com/explosion/spaCy/issues/4577)