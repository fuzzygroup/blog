---
layout: post
title: Rails Cleaning UTF-8 on ActiveRecord Save
---

Quick Tip: Cleaning Unicode Before Saving ActiveRecord Objects

ActiveSupport::Inflector.transliterate

before_save :transliterate

  def transliterate
    self.title = ActiveSupport::Inflector.transliterate(self.title)
    self.body = ActiveSupport::Inflector.transliterate(self.body)
  end
  
  https://stackoverflow.com/questions/225471/how-do-i-replace-accented-latin-characters-in-ruby