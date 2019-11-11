---
layout: post
title: Changing Button Text on Simple Form Submit Buttons
category: rails
tags: ["rails", "simple_form"]
---
This falls into the category of "I'm old and can't remember this so must, must, must write it down" because I keep losing [this html page](https://github.com/plataformatec/simple_form/issues/117).  If you need to change the text on a submit button for a Rails form implemented with simple_form then use:

    <%= f.button :submit, 'Submit This Form', class: 'btn btn-primary' %>

