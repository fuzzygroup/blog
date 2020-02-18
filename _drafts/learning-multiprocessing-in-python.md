---
layout: post
title: Learning Multiprocessing in Python
---
Sigh.

Thread safety
The KafkaProducer can be used across threads without issue, unlike the KafkaConsumer which cannot.

While it is possible to use the KafkaConsumer in a thread-local manner, multiprocessing is recommended.

https://github.com/dpkp/kafka-python
