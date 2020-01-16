---
layout: post
title: What is Machine Learning?
category: machine_learning
tags: ["machine_learning"]
---
{:.center}
![IMG_5718.jpeg](/blog/assets/IMG_5718.jpeg)

I have written a number of posts about different aspects of Machine Learning but, it occurs to me, not a single one that actually says "Machine Learning is xyz and here are the definitions" so here goes.

> Machine Learning is a technology that allows a computer ("the Machine")  to take a "corpus" of "labeled" "training data" and then "learn" how to do something that the training data teaches the computer.

And, while it is a simplification, the underlying thing idea driving machine learning is that of *pattern recognition* that is driven by a **neural network**.

Basically the Machine Learning process amounts to:

1. Take a bunch of data and construct a set of examples that illustrate what you want the machine to learn.  This is called *Training Data* and the overall collection amounts to a *Corpus*.
2. Add metadata to these examples in a way that represent what you want the machine to learn.  Examples could be blocks of text, images, video files or whatever.  I personally work mostly in text but I have machine learning buddies who do things learning on images of cancerous masses.  This is called *Labeling*.  Labeling might consist of different things like adding Yes / No / Abstain values to a tweet or even extracting information from a recipe like the ingredients.
3. Running a computer program, the *training program*, against the data to generate a "neural network", a computational engine that works much like the associative memory in our brains.  And, just as we don't understand how our brains work, we often don't understand how a neural network works.  This is known as the explainability problem in Machine Learning and I talk about it [here](https://fuzzyblog.io/blog/machine_learning/2020/01/10/adding-explainability-to-machine-learning-routines-via-re-execution-of-labeling-functions.html).

Now, you have to be careful, because this is a simplification of a very complex technology but the above is the essence of Machine Learning.

Each of the key terms above, as well as a few others relevant to Machine Learning is described below.

## GPU

A GPU or "Graphics Processing Unit" is a very, very powerful computer chip that is needed to run the training program that trains the neural network.  Without a GPU, creating the neural network can literally take weeks.  [Wikipedia](https://en.wikipedia.org/wiki/Graphics_processing_unit).

## Neural Network

A neural network is an approach to computation that makes a computer work more similarly to a human brain.  [Wikipedia](https://en.wikipedia.org/wiki/Neural_network)

## Corpus

This is a fancy damn word that means "related collection of stuff".  Generally Machine Learning refers to a [textual corpus](https://en.wikipedia.org/wiki/Text_corpus) but it could be a collection of images.

## Labels

Labels are the values applied to training data that represent what you want the machine to learn.

## Labeling

Labeling is the process of adding labels to the training data.

## Labeler

The labeler is the software that makes applying labels to the training data easier.  A labeler might be a special computer program or even Microsoft Excel or something like AirTable.

## Training Set

The training set is the collection of data that you use to generate your models.  The amount of data in a training set varies but it can often be as much as tens of thousands of labeled examples.

## Test Set

The test set is the collection of labeled data that you use to make sure that your trained model learns the way you think it does.  After you train your model using the training set then you benchmark your model against the test set.  Depending on how you build your models there can actually be many different sets.

## Precision / Recall / F1 / AUC and Other Weird Words

These are terms that are used to measure how your model performs and are different mathematical approaches for model performance.   


