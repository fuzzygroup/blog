---
layout: post
title: When Jupyter Notebooks Won't Import Libraries
category: python
tags: ["python", "jupyter", "data_science"]
---
I don't claim to be an expert when it comes to Python.  At best I'm an apprentice striving to be a journey man.  One of the interesting tools in the Python / Data Science ecosystem is the Jupyter Notebook which gives a cell based representation of code, visualizations, documentation and execution flow and allows you to package things up for distribution i.e. hand your work, in a complete fashion, from say Data Scientist 1 ("Rebekah") to Data Scientist 2 ("Dawn").  This is a laudable goal and one that I theoretically agree with. 

**Note**: Jupyter Notebooks do NOT include data so that's still external to the notebook, something that can easily bite you (as it is currently biting me).

In practice, however, I haven't been so lucky as to make this work cleanly with a Python virtual environment like VENV.  Here are some of the things I tried:

* Installing jupyter into the virtual env and running from bin/jupyter notebook
* [Following Angelo Basille's Directions](https://anbasile.github.io/programming/2017/06/25/jupyter-venv/)
* [Following Janakiev's Directions](https://janakiev.com/blog/jupyter-virtual-envs/)
* [Changing the Kernel](https://stackoverflow.com/questions/44586234/how-to-change-kernel-when-jupyter-notebook-shows-only-one-python?rq=1)

If you're curious about how to use Python Virtual Environments, I wrote a [solid tutorial back in September](https://fuzzyblog.io/blog/python/2019/09/09/working-up-to-bert-installing-tensorflow-for-python.html) that I used to get a full installation of Tensor Flow up and running.  I've referred back to this over and over, each time I needed a Python Virtual Environment, so I know it works.

I'm sure there is a way to mess about with virtual environments and Jupyter Notebooks to make them work but, honestly, I'm skeptical on notebooks and how they obfuscate code and data together anyway so I thought "How do I just make this a Python script".  And, thanks to my pairing partner, Grant, there is, indeed, a way.

## Making a Jupyter Notebook into a Python Script with a Virtual Env

1.  Follow the instructions [here](https://fuzzyblog.io/blog/python/2019/09/09/working-up-to-bert-installing-tensorflow-for-python.html) to setup VENV for a new project in a new directory.
2. Use File menu, Export as Python to write a single Python script representing the notebook.
3. Create a requirements.txt file as per the instructions [here](https://fuzzyblog.io/blog/python/2019/09/10/building-a-python-requirements-txt-file.html).
4. Go through the Python code that was exported and convert the import / from instructions to the right [PyPy package index](http://packages.pypy.org/) name entry in the requirements.txt file.  Be aware that there isn't a straight correspondence between the import statements and the package names.  For example you import from "metal" in the notebook I'm porting but the package name is actually "snorkel-metal" and you import from sklearn but the package name is actually scikit-learn.  Python's there's only one way to do this mantra, in the area of package management, is just plain crap.  Sigh.
5. Run pip3 install -r requirements.txt
5. Run your python script and then adjust the requirements.txt file accordingly.  You will almost certainly need to change some things but, by and large, I'm finding that this process does work.  