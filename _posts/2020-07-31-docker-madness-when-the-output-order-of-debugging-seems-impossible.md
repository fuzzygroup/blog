---
layout: post
title: Docker Madness - When The Output Order of Debugging Seems Impossible
category: docker
tags: ["docker", "python"]
---
{:.center}
![IMG_3775.jpeg](/blog/assets/IMG_3775.jpeg)

Yesterday I was stuck in a hellish debugging cesspool -- you know what I mean -- when you are debugging a mysterious crash right down embedding line by line print statements and nothing is making sense.  And I don't mean that its not making a lot of sense; I mean that its making NO DAMN SENSE.  I was debugging on a GPU instance on AWS that was running a TensorFlow application and what I kept seeing was output appearing before the routine invoking it was executing.  And this was a worst case scenario right down to the very first line of my Python code being:

```python
print("AT START")
```

Happily I was pairing with my colleague Grant and he did that wonderful pairing step of "this makes no damn sense; let me apply my Google Fu to this" and he discovered that Docker buffers output at times and he recommend this change to the Dockerfile:

**Before**:

    # rest of Dockerfile appears here
    CMD [ "python3", "./main.py" ]

**After**:

    # rest of Dockerfile appears here
    CMD [ "python3", "-u", "./main.py" ]

Here is the relevant [Stack Overflow post](https://stackoverflow.com/questions/29663459/python-app-does-not-print-anything-when-running-detached-in-docker).

Thank you Grant!