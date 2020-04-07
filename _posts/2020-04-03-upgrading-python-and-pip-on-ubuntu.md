---
layout: post
title: Upgrading Python and Pip and VirtualEnv on Ubuntu
category: python
tags: ["python"]
---
I found myself this morning trying to get a Python stack running on an Ubuntu instance only to hit this crap:

    Installing collected packages: numpy, pytz, six, python-dateutil, pandas, nltk, pyparsing, cycler, kiwisolver, matplotlib, kafka-python, pyyaml, murmurhash, zipp, importlib-metadata, catalogue, plac, tqdm, setuptools, srsly, cymem, preshed, blis, wasabi, thinc, idna, urllib3, certifi, chardet, requests, spacy, pluggy, attrs, py, more-itertools, wcwidth, packaging, pytest, langdetect, spacy-langdetect, editorconfig, jsbeautifier, docutils, jmespath, botocore, s3transfer, boto3, torch, dataclasses, tokenizers, click, joblib, regex, sacremoses, filelock, sentencepiece, transformers, scipy, scikit-learn, gunicorn, WebOb, firefly-python, pycparser, cffi, zstandard, lefthook, termcolor, fire, redis, sseclient, absl-py, protobuf, markdown, pyasn1, pyasn1-modules, cachetools, rsa, google-auth, tensorboard-plugin-wit, werkzeug, grpcio, wheel, oauthlib, requests-oauthlib, google-auth-oauthlib, tensorboard, future, pytorch-lightning
    Segmentation fault (core dumped)

So I guess it is time to do the Python upgrade dance.  Here you go:

    pip3 install --upgrade pip
    sudo apt-get update && sudo apt-get upgrade
    sudo apt-get install python3.7
    sudo pip3 install --upgrade virtualenv

## Stack Overflow References

1. [Pip upgrade](https://stackoverflow.com/questions/38613316/how-to-upgrade-pip3).
2. [Python Upgrade](https://askubuntu.com/questions/1086649/how-to-update-python-to-the-latest-version-on-ubuntu-18-04)