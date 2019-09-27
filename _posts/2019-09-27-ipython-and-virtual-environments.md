---
layout: post
title: iPython and Virtual Environments
category: python
tags: ["python", "ipython"]
---
{:.center}
![IMG_8780.jpeg](/blog/assets/IMG_8780.jpeg)

As I've written before, I personally find virtual environments to be the [devil /  Satan's Step Child for programming](https://fuzzyblog.io/blog/ruby/2019/07/10/when-rbenv-well-won-t-rbenv-fixing-shell-extension-madness.html) but there's no other option so, well, [fsck](https://en.wikipedia.org/wiki/Fsck) ME.  Anyway this is now something I am wrestling with in terms of Python.  

My problem was this persnickety little prick of an error:

    /Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/IPython/core/interactiveshell.py:931: 
    UserWarning: Attempting to work in a virtualenv. If you encounter problems, please install 
    IPython inside the virtualenv.

This starts with at least one problem -- what the hell is iPython.  Apparently iPython is "interactive Python".  Now I don't really understand how Python or Python3 isn't interactive when both of them can load up a functional repl but, whatever.  Apparently iPython improves debugging or at least has some bit of color coding (so maybe think of it as ruby + [awesome_print](https://rubygems.org/gems/awesome_print/versions/1.8.0)).  So this error message means:

1.  I'm in the virtual environment from VENV.
2.  iPython is likely coming in from the system layer so I'm probably getting a Python 2.x instead of a Python 3.x.

A bunch of googles left me scratching my head until I found this [Stack Overflow page](https://stackoverflow.com/questions/20327621/calling-ipython-from-a-virtualenv) with about a half dozen approaches.  Hmmmph - this calls [TOOWTDI](https://wiki.python.org/moin/TOOWTDI) very much into question, imho.  And then that seemed to work and I wrote the first draft of this blog post.  And then it near immediately stopped working.  *grumble*.

A spate of more googling occurred and I found this [alias approach](https://coderwall.com/p/xdox9a/running-ipython-cleanly-inside-a-virtualenv) -- which seemed to work nicely.

Here turned out to be the approach for fixing it:

    # edit your .bashrc or .zshrc (I use zsh)
    vi ~/.zshrc
    
    # add this alias statement
    alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
    
    # make the alias active by sourcing it
    source ~/.zshrc
    

You now need to use the ipy alias whenever you want iPython:

    cat jsons/reddit.json| ipy template_expert.py

While, I'm still not entirely sure why I need iPython but the cool kids seem to use it and the color coding and back traces are much better:

{:.center}
![without_ipython.png](/blog/assets/without_ipython.png)

Note: This is without iPython.


{:.center}
![with_ipython.png](/blog/assets/with_ipython.png)

Note: This is with iPython.

**Note**: I'm intrigued by the idea of [ASDF](https://github.com/asdf-vm/asdf) possibly fixing shell extension madness by at least making this uniform across languages.  Anyone tried this yet?  I need a single solution for at least Python and Ruby (and preferably Elixir / Rust).