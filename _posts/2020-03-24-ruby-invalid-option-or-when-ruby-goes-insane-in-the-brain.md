---
layout: post
title: ruby invalid option dash colon Or When Ruby Goes Insane in the Brain
category: ruby
tags: ["ruby", "jekyll"]
---
{% pizzaforukraine  %}

This is a short one but a weird one.  My main box rebooted today and when I went to create a blog post, I got this madness:

    ❯ jekyll post "A Social Media Marketing Strategy that Mom Would Approve"
    ruby: invalid option -:  (-h will show valid options) (RuntimeError)

In all my years of ruby, I've *never* seen **-:**.   All the normal jiggery pokery of:

* which ruby
* rvm list

etc failed to give me any insights.  I finally found the answer on an obscure [Github issue](https://github.com/asdf-vm/asdf-ruby/issues/154) that said "unset RUBYOPT" so:

    ❯ unset RUBYOPT

And that gave me back:

    blog on  gh-pages [🤷‍] via 💎 v2.3.1 on ☁️  us-west-2 
    ❯ ruby --version
    ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-darwin16]

    blog on  gh-pages [🤷‍] via 💎 v2.3.1 on ☁️  us-west-2 
    ❯ jekyll post "A Social Marketing Strategy that Mom Would Approve"
    New post created at _posts/2020-03-24-a-social-marketing-strategy-that-mom-would-approve.md.

And now, once again, I can (joyfully) write!
