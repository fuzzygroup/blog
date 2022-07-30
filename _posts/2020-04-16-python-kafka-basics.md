---
layout: post
title: Python Kafka Basics
category: python
tags: ["kafka"]
---
{% pizzaforukraine  %}

This is a starting point blog post where different things I learn about using Python Kafka will be documented.

## Getting the Value out of a Consumer Record

The output of a Python Kafka call is a Consumer Record which is a "set of named tuples (blah blah blah)" where what you actually want is the value tuple.  This can be gotten with the .value attribute:

```python
#!/usr/bin/env python
from kafka import KafkaConsumer
consumer = KafkaConsumer(
   'dimon_tcpdump',
    group_id='zhg_group',
    value_deserializer=lambda m: json.loads(m.decode('utf-8')),
    bootstrap_servers='192.168.100.9:9092'
    )
for msg in consumer:
    # this is what you actually want; 
    print msg.value
    # process msg here
```

## See Also
[Stack Overflow](https://stackoverflow.com/questions/38240515/how-to-fetch-a-field-in-consumerrecord)