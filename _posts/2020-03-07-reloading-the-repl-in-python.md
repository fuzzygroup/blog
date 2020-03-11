---
layout: post
title: Reloading the REPL in Python
category: python
tags: ["python", "rails"]
---
{:.center}
![607483cd3c96fc17beee37cd0248294a.jpg](/blog/assets/607483cd3c96fc17beee37cd0248294a.jpg)

When you know something well you always look to learn by analogy.  Today's short topic is reloading the REPL (read-evaluate-print-loop) interactive console in Python and then contrast between Python and Rails.  And, yes, I get that Python is a language and Rails is a framework but where you tend to work directly in the Python console, you also tend to work directly in the Rails console (as opposed to the IRB Ruby console on which the Rails console is based but the Rails console improves it a lot).

The reason this is important is that if you use a REPL a lot, well, you are constantly switching between editor and REPL and until this damn blog post, I had to quit my Python console every damn time.  Just imagine me cursing up a blue streak and you will get a small fraction of my frustration when you see the difference below between Python and Rails.

## Python - Launching the Console

    python3

## Rails - Launching the Console

    rails c    

**Note**: You may have to type this as bundle exec rails c (also knowing as the "bundle exec" tax).

## Python - Reloading the Console When You Change Your Code

    import importlib
    importlib.reload(your_module_name_here)

Example:

    import expert_classification
    # try some code; find bug; fix bug
    import importlib
    importlib.reload(expert_classification)
    # try code again

## Rails - Reloading the Console When You Change Your Code

    reload!    

**Note**: If you change your Rails gem stack then you have to exit the console entirely.  I'll give you that.

## Why This Matters, Why Rails is Better Here And a Rant

It is hard to know when you're changing stuff with more than a single module exactly what you changed.  The Rails method of typing **reload!** and having your whole environment reloaded solved this entirely.

**Note**: The reload method on importlib is new in Python 3.4.  **Insert emoji of Munsch scream here** How the hell is this possible that reloading came only on March 17, 2014 when Python started shipping in December 1989?  I can't remember ever not having reload! in Rails.

## Sidebar: Making this Automatic with an iPython Configuration

Create your profile first:

    ipython profile create

Edit it (your editor and path will be different but it will be something like this):

    mate /Users/sjohnson/.ipython/profile_default/ipython_config.py

Put these lines in place:

    c = get_config()
    c.InteractiveShellApp.exec_lines = ['load_ext autoreload', 'autoreload 2']

Save, exit and restart iPython and your changes will be handled automagically.

## Sidebar Original:The Magic Answer with Some Bitterness and Anger - Welcome to Ipython

**Note**: I wrote this sidebar originally and then I found the answer but I like the bitterness and rage here and I know one of my readers will be tickled pink by this (as will her husband should she pass it on).

I did more digging and apparently iPython fixes this with:

    load_ext autoreload
    autoreload 2

**Note**: I'm still going to argue that this being 2 commands instead of 1 (although the 2 parameter to autoreload above does make subsequent code changes automatic) and yes you can supposedly make this automatic with an iPython profile configuration but even:

    ipython profile create

and then modifying the profile to have:

    c = get_config()
    c.InteractiveShellApp.code_to_run = 'load_ext autoreload'
    c.InteractiveShellApp.code_to_run = 'autoreload 2'

isn't right because the 3rd line tosses a syntax error and when I eliminate the third line, the second line causes iPython to exit on startup -- but they do work interactively.  And, yes, yes with sufficient googling I could fix this but I've got code to write and this is an **endless rabbit hole of suckitude** so route this entire blog post to /dev/null and just exit the REPL and re-enter or remember this:

1.  Use ipython not python3
2.  At the start of your session always type **load_ext autoreload**
3. And then type: **autoreload 2**

* [Stack Overflow](https://stackoverflow.com/questions/2534480/proper-way-to-reload-a-python-module-from-the-console)
* [iPython Older](https://ipython.org/ipython-doc/3/config/extensions/autoreload.html)
* [iPython Current](https://ipython.readthedocs.io/en/stable/config/extensions/autoreload.html)

## See Also

* [Geeks for Geeks on Reload](https://www.geeksforgeeks.org/reloading-modules-python/)
* [The Reload Method](https://docs.python.org/3/library/importlib.html#importlib.reload)