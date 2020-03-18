---
layout: post
title: Separating Storage of Symptoms and Patient Using Ruby, Rails and JSON
category: rails
tags: ["rails"]
---
One of the needs of the world of HIPAA when gathering medical data is the need to store data where you separate PII (personally identifying information) from symptoms.  This blog post lays out an approach where you do that.

## Step 1 - Two Data Stores

The first step is two data stores:

* A PII store where the identity of the patient exists
* A symptom store where you file away the symptoms

There needs to be an anonymized way to identify the patient and that can be accomplished with a hash key of various PII attributes.  If nothing else you