---
layout: post
title: Setting Up Custom Rails Loggers
---
module Clockwork
  configure do |config|
    config[:logger] = Logger.new("clockwork.log")
  end
end

https://stackoverflow.com/questions/24189871/clockwork-gem-logger-not-working?rq=1