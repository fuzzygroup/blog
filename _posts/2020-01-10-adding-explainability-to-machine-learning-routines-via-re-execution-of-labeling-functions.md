---
layout: post
title: Adding Explainability to Machine Learning Routines via Runtime Execution of Labeling Functions
category: machine_learning
tags: ["machine_learning", "python", "snorkel"]
---
{:.center}
![IMG_0928.jpeg](/blog/assets/IMG_0928.jpeg)

I am spending much of my time these days in the world of machine learning and I'm finding that it is **profoundly interesting**.  One of the most interesting aspects of machine learning, for me, is the black box nature of machine learning's output.  What we typically learn whether from a tensor flow model that did image segmentation or a bert / roberta / albert model that did text processing is what the model thinks but not how it arrived at that result.

**Note**:  bert / roberta / alberta are machine learning tools that generate linguistically savvy models that understand English language content.

As a side note, given how hard it is for most people to understand why they think what they think, is the black box nature of machine learning actually all that surprising?

## Machine Learning Basics for the Newbie

The world of machine learning, which appears intimidating as hell to the newbie, actually isn't that hard but the terms can be terrifying.  Someone recently asked me what I was doing and this was my answer:

"I am working on a weekly supervised learning model for an anti Semitic classifier that will be used in a Kafka data pipeline. "

Here are the very basics of machine learning:

* Machine Learning is just that - a way for a machine to learn from data.
* The underlying idea of machine learning is pretty much just *pattern recognition* based on data fed through a neural network.
* To make machine learning work you "label" a data set which means you tell the machine that for Example X, the answer you want is Foo and for Example Y, the answer is Bar.  And you do this over and over and over (sometimes you have to label 50,000 examples; that's what my current project uses).
* You give a program, generally called a training program, this labeled data and then it thinks on this for a while and creates what is called a **model**.
* The **model** is a trained neural network which understands how to process data like what you trained it with and give back results of the types that you taught it.

There are a lot of terms that I could throw around - Python, Bert / Alberta / Roberta, TensorFlow, Convolutional Neural Network, Adversarial Neural Network and so on but the essence of machine learning are the bullet points above.

## Labeling and Machine Learning 

There are two general approaches to labeling data for machine learning, one classical and one new:

### Classical

With a classical approach, you generate a set of "labeled" data by humans manually labeling a large set of data with yes / no (or something else) options.  This is generally measured in the tens of thousands of chunks of labeled data.  This is generally expensive and time consuming.

### New

A newer approach falls into the category of *Weak Supervision* where you leverage a series of what are called labeling functions (lfs for short) along with a new technology called Snorkel.  This is termed "weak supervision" because the supervision of the process is just that -- weak (less human training).

A labeling function is often nothing more than a regular expression that returns true / false / abstain.  The idea of a labeling function is to leverage human expertise that can be easily codified into a rule set.  You then run these labeling functions against your dataset and build a matrix of the results.  That matrix, along with the data itself allows you to generate a machine learning model which has similar performance characteristics as the classical approach but with a fraction of the amount of training data -- think 500 to 1000 labeled chunks of data instead of tens of thousands of chunks.

## Leveraging the Labeling Functions

It is important to understand that the labeling functions aren't a part of the machine learning model -- they simply generate the training data that create the machine learning model.  So when you process a chunk of data through the machine learning model, it can tell you the result but it can't tell you why.  But, and here's the new thing, you could take the chunk of data you processed through the machine learning model and run it through the labeling functions at runtime to get back a set of matches from the labeling functions.  These matches can make the output of the model explainable.

### Practical Implementation

Here's how this might be implemented practically:

1. Write a set of labeling functions.
2. Process the data set through the labeling functions and generate a model.
3. Deploy the model into a production environment.
4. Deploy the labeling functions into a production environment wrapped into an API that accepts the same data fed into the model.  This might be an http api or a thrift api or whatever; this depends on the system.
4. Process data through the model. 
5. When the user requests "Explain" on the results of the model, pass the data through the labeling functions API and display the results of the labeling functions in a way that the user can understand them.

### The Counter Speech Issue 

My work on this is generally in a hate speech context which means that a problem is counter speech (speech that attempts to address hate speech / fight hate speech).  Given that counter speech tends to use the same words as hate speech, labeling functions that attempt to explain counter speech tend to explain it as hateful (where as the machine learning model tends to identify counter speech as non hateful) .

The issue here is that regular expressions don't understand the linguistic subtleties that a machine learning model based on bert / roberta / albert does understand.

## References

* [A Look Into Snorkel Drybell](https://towardsdatascience.com/a-look-into-snorkel-drybell-8e9e781dc250)
* [Arxiv Paper on Snorkel](https://arxiv.org/abs/1812.00417)
* [ZdNet on Snorkel](https://www.zdnet.com/article/is-googles-snorkel-drybell-the-future-of-enterprise-data-management/)
* [Snorkel.org](https://www.snorkel.org/)
* [Google AI Blog](https://ai.googleblog.com/2019/03/harnessing-organizational-knowledge-for.html)
* [Sculpt on Building AI Classifiers Using NLP (Abraham)](https://medium.com/sculpt/a-technique-for-building-nlp-classifiers-efficiently-with-transfer-learning-and-weak-supervision-a8e2f21ca9c8)
* [Displacy](https://explosion.ai/demos/displacy)
* [Spacy Models](https://spacy.io/models)