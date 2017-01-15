---
layout: post
title: Using Gems to Slay the Monolith Part 1 - Validations
category: rails
tags: ["rails", "ruby", "monolith", "validations"]
---
We all talk quite a bit about the monolithic Ruby application but the simple truth of it is that your rails application really, really wants to be monolithic.  Let's explore the concept of an email sending application that wants to offer an API for contact import.  If you think about this you're basically saying: 

> Let's externalize the process of importing user data

Ideally we'd like to build this with the new Rails 5 api mode that speaks JSON as its lingua franca.  Rails 5 api mode is small, fast and like Rails was before the asset pipeline -- easy.  And, personally, I love API mode.  But since API mode does not ANY view handling this means that you are inherently building two rails applications:

* the user facing portion
* the API 

Since user data inevitably needs to be displayed and generally created in the user facing application as well as in the api, you're talking about a user model that exists in two places.  And that means that all the support cruft like validations needs to exist in both places.  That's not DRY at all -- it is verbose beyond belief.  

# Cross Project Code Sharing 1 - Git

In an idealized world you would think that git would race to our rescue and be the hero here but I've looked into git for cross project model re-use and my response was "icky poo".  Another developer I know, Winston, looked into it and wrote up the options but had a similar feel.

# Cross Project Code Sharing 2 - A Gem Based Approach

When you come right down to it we actually have a model for code sharing in the Rails world and it is the Ruby Gem.  I was in Rails prior to gems and still remember, fondly, the days of plugins.  

What if there was a website to support it??? validationhub.com