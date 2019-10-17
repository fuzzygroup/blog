---
layout: post
title: A Step by Step Guide to Running Streamlit, PyTorch and Bert on a Cheap AWS Instance
category: python
tags: ["python", "streamlit", "pytorch", "aws"]
---
[Streamlit](https://streamlit.io/) is an ideal tool for taking machine learning prototypes and building quick and dirty web front ends to them.  Yesterday in about a half hour, I:

* Created an aws instance
* Got python and pip onto the instance
* Took a codebase managed by git and installed it 
* Got a small machine learning app up and running with [PyTorch](https://streamlit.io/)

The rest of this blog post goes over the specifics because there were several gotcha's that might catch you (my instance was too small, then my instance had too little disc space and then git lfs reared up and bit me in the proverbial arse).  

This isn't written with the exact step by step process but more "if you are moderately aws experienced then you'll understand the steps".

1.  Create an AWS Ubuntu 18.04 ec2 instance using the AWS ec2 dashboard.  Because building python and pytorch is actually large and slow, you need to have extra memory and disc space.  I used a t2.large and I doubled the disc space to 16 gigs.
2. When you create the instance make sure that you allow for 8501 as the open port for traffic since that is Streamlit's default.
3. Install git lfs support as documented [here](https://github.com/git-lfs/git-lfs/wiki/Installation) or see [my blog post on this](https://fuzzyblog.io/blog/git/2019/10/17/git-large-file-support-silently-fails.html) if you have models checked into Git.  This is generally two steps: **sudo apt-get install git-lfs** and then **git lfs install** in the repo directory (note that this is out of order in these directions since I don't know if you are using lfs).
4. Install your code with a git checkout.  If your codebase isn't public then you should generate ssh keys on the box and add the public key onto your repo (or make the repo public for the two seconds it takes to clone it and then make it private again).
5. Install python with: **sudo apt install python3**
6. Install pip with: **sudo apt install python3-pip**
7. Install your python dependencies with: **pip3 install -r requirements.txt**
8.  Run Streamlit in the background with the & operator after your python script or:  

    streamlit run dashboard.py &

This allows Streamlit to detach and run even after you log out.  After Streamlit starts up, it will give you the url that you can give out to let people test it.

Note: I haven't yet put all of this into an Ansible playbook for installing Streamlit but I'm not far from doing that because this whole process, well, SUCKED!  *chuckle*
