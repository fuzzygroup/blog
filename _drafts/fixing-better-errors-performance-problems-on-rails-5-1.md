---
layout: post
title: Fixing Better Errors Performance Problems on Rails 5.1
---

https://github.com/charliesome/better_errors/issues/77

https://github.com/charliesome/better_errors/issues/341

Add to application controller:

before_action :better_errors_hack, if: -> { Rails.env.development? }

def better_errors_hack
  request.env['puma.config'].options.user_options.delete :app
end