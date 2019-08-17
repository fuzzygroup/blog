#!/bin/bash

#jekyll s && git add . && git commit -m %1 && j

# Commit the specified file to jekyll and push it 
# Get the word count
WORD_COUNT=`cat $1 | wc | awk '{ print $2 }'`
curl -d '{"key1":"value1", "key2":"value2"}' -H "Content-Type: application/json" -X POST http://localhost:3000/data
