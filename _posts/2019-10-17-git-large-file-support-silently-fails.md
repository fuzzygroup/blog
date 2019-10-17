---
layout: post
title: Git Large File Support Silently Skips Over Checkouts When Git LFS Isn't Installed
category: git
tags: ["git", "python", "pytorch", "streamlit"]
---
This error bit me and a coworker **hard** yesterday and I haven't seen it well documented anywhere so I wanted to make this very, very clear.  When you have large files checked into git and you are using git-lfs (git large file support), if you don't have the git large file support extensions installed on the machine where you do the checkout, you get what appears to be a correct checkout but the large files end up being, well, not missing but simply placeholders.  

In our case we had a machine learning model using Bert and PyTorch and the model file, in models/bertASmodel.pt appeared to check out correctly but here was what we actually got:

    ls -l models/
    -rw-rw-r-- 1 ubuntu ubuntu 134 Oct 16 19:10 bertASmodel.pt
    
Yep.  That's a 134 byte machine learning model!  W00t!  **Snark**. But when we look at it:
  
    cat models/bertASmodel.pt
    
    version https://git-lfs.github.com/spec/v1
    oid sha256:de6988063e95c1775e0b84e256b2c58a5964845325c2263778cda4d33520f50a
    size 438039816

After we installed git lfs support, we get this

    ls -l models/
    total 427780
    -rw-rw-r-- 1 ubuntu ubuntu 438039816 Oct 17 18:19 bertASmodel.pt

Yep.  That's now 400 odd megs.

If you need to install git lfs then the instructions are [here](https://github.com/git-lfs/git-lfs/wiki/Installation).

## Pytorch Errors When The Model is Present but Missing

Now the really, really interesting thing here was the error that PyTorch came up with when the model file was just this 138 byte file.  Because the model file wasn't actually missing, it seems like PyTorch went a tiny bit insane:

    UnpicklingError: invalid load key, 'v'.
    File "/home/ubuntu/.local/lib/python3.6/site-packages/streamlit/ScriptRunner.py", line 310, in _run_script exec(code, module.__dict__)
    File "/home/ubuntu/hate-language-modeling/dashboard.py", line 49, in <module> model = load_model(model_dir / 'bertASmodel.pt')
    File "/home/ubuntu/hate-language-modeling/dashboard.py", line 14, in load_model model = torch.load(filename, map_location=lambda storage, loc: storage)
    File "/home/ubuntu/.local/lib/python3.6/site-packages/torch/serialization.py", line 426, in load return _load(f, map_location, pickle_module, **pickle_load_args)
    File "/home/ubuntu/.local/lib/python3.6/site-packages/torch/serialization.py", line 603, in _load magic_number = pickle_module.load(f, **pickle_load_args)
    
Now this might make sense to someone with better Python skills than I but to me this is fairly maddening.