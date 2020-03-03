---
layout: post
title: The Math of Machine Labeling Faceted Data
category: machine_learning
tags: ["machine_learning", "labeling"]
---
I find myself working on a project where we needed to label (approximately) 50,000 pieces of data for a particular machine learning project.  We are now talking about adding 9 facets to our data and this means:

* 50,000 pieces of data to train a model for generic classification
* 9 facets 
* 50,000 pieces of data * 9 facets = 450,000 labeling operations

So now let's tackle some math based on the number of labelers (a labeler is the person who does the labeling work):

* With one person doing labeling then there are 450,000 labeling operations for one person
* With 10 people doing labeling then there are 45,000 labeling operations per person
* With 20 people doing labeling then there are 22,500 labeling operations per person

And now let's work time considerations into this.  Let's assume that there are 3 quarters of the year for labeling or 9 months.

* With one person that means 450,000 operations / 9 or 45,000 things per month - assuming 40 hours per week / 160 hours per month / 9 * 160 or 1,440 hours total.  So 450,000 / 1,440 or 312.5 labeling operations per hour.  Given that there are 60 minutes in an hour that means about 312.5 / 60 or 5.2 things need to be labeled per minute.
* With 10 people doing labeling that means 31 labeling operations 
