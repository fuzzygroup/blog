---
layout: post
title: Rails 6 Upgrade Notes
category: rails
tags: ["rails", "rails6"]
---
So I made the upgrade to Rails 6 for my current side project. This is a slightly sizable side project weighing in at about 4K lines of code, 130 odd tests so while it isn't giant, nor is it inconsequential.  This document lays out the issues I found.

## Issue 01: Test Database Settings Were Removed from Database.yml

Yes I get that I shouldn't have credentials directly in database.yml.  Yes I know that these should be in a .yml file, etc.  Still it is my damn choice and I pretty strongly disagree with the decision to actually remove settings from database.yml.

## Issue 02: Massive Deprecation Warnings Regarding Case Sensitive Validations

I got hit with a wave of these validation issues:

    DEPRECATION WARNING: Uniqueness validator will no longer enforce case 
    sensitive comparison in Rails 6.1. To continue case sensitive comparison
    on the :email attribute in User model, pass `case_sensitive: true` option 
    explicitly to the uniqueness validator. (called from block (3 levels) in 
    <top (required)> at /Users/sjohnson/Dropbox/fuzzygroup/change_me_now/
    web_change_me_now/spec/controllers/habits_controller_spec.rb:11)
    
Normally I leave deprecation warnings in place to force better habits but these were just too much.  The solution was to add this line:

    config.active_support.deprecation = :log
    
to config/environments/test.rb.  Thanks to [Stack Overflow](https://stackoverflow.com/questions/5591509/suppress-ruby-warnings-when-running-specs) for pointing out this fix.

# Issue 03: Zeitwerk

One of the parts of Rails 6 that I am thoroughly impressed by is the new [Zeitwerk gem](https://medium.com/@fxn/zeitwerk-a-new-code-loader-for-ruby-ae7895977e73). Unfortunately I had a weird thing happen:

    rspec spec
    WARN: Unresolved or ambigious specs during Gem::Specification.reset:
          zeitwerk (~> 2.1, >= 2.1.8)
          Available/installed versions of this gem:
          - 2.1.10
          - 2.1.9
    WARN: Clearing out unresolved specs. Try 'gem cleanup <gem>'

Here is the fix:

    gem cleanup zeitwerk