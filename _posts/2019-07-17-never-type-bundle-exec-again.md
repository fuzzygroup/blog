---
layout: post
title: Never Type Bundle Exec Again
category: rails
tags: ["rails", "ruby"]
---
The command prefix "bundle exec" is something that I've typed probably a thousand, thousand, thousand times.  The bundle exec prefix goes in front of so many damn Rails commands and while I've seen other developers alias it to "be", that never felt right to me.  And now there's a workaround where I don't even have to type that thanks to the miracle of [Z-Shell](https://en.wikipedia.org/wiki/Z_shell) and [Oh My Zsh](https://ohmyz.sh/).  

Edit your ~/.zshrc and add search for the word plugins and then change that line to this:

    plugins=(git bundler brew gem heroku)

Then you and to do a source on it:

    source ~/.zshrc

And then you can do this magic:

    rails g migration add_frequency_and_economic_value_to_habits
      invoke  active_record
      create    db/migrate/20190717211807_add_frequency_and_economic_value_to_habits.rb
      
And that makes my life better by 13 characters that I'm never going to have to type again.  Honest to the FSM, I'm mildly aroused right now ...

And thank you to [CoderWall](https://coderwall.com/p/weixga/no-more-bundle-exec-with-oh-my-zsh) for publishing this originally.