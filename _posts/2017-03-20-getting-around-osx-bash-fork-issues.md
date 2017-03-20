---
layout: post
title: Getting Around OSX Bash Fork Issues
category: osx
tags: ["osx", "bash", "rails", "fork", "mac"]
description: When you hit problems with Rails development and OSX Bash forking issues, you can get around them by changing the file_watcher.
---
If you've ever seen this error under OSX:

    -bash: fork: Resource temporarily unavailable
    -bash: fork: Resource temporarily unavailable
    -bash: fork: Resource temporarily unavailable
    -bash: fork: Resource temporarily unavailable
    -bash: fork: Resource temporarily unavailable
    -bash: fork: Resource temporarily unavailable
    -bash: cannot make pipe for command substitution: Too many open files
    
then you know that it usually signals "Oh crap - restart the box".  If you're a Rails developer then you may be hitting this due to problems with the new [Puma development server and the evented listener](https://github.com/puma/puma-dev/issues/56).  

The solution is to change the listener in config/environments/development.rb from:

> config.file_watcher = ActiveSupport::EventedFileUpdateChecker

to:

> config.file_watcher = ActiveSupport::FileUpdateChecker

You might also want to kill the listen gem as well (read the linked issue above).