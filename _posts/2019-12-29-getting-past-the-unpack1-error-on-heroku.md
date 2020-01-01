---
layout: post
title: Getting Past the unpack1 error on Heroku
---
11373* heroku domains:add okrsnow.com
11374* heroku domains:add www.okrsnow.com
11376* mate _posts/2019-12-29-heroku-and-route-53-using-amazon-for-domain-registration-with-heroku-for-hosting.md
11377* heroku logs
11378* heroku logs --tail
11379* heroku config:set RAILS_MASTER_KEY=123456789abcefg
11380* git push heroku master
11384* git push heroku master
11385* heroku logs --tail
11390* git push heroku master
11391* heroku config:set RAILS_MASTER_KEY=config/credentials/production.yml.enc
11395* git push heroku master
11396* heroku config:set RAILS_MASTER_KEY=f9d510292a72197cb71c44617a6f71690ebe5fde9aaf7c0b19dc0427aeef62e2143e271260e169fd04ab3681f1df173d6079c740f8aeafff491787974809b9aa
11397* git push heroku master
11399* heroku config:set RAILS_MASTER_KEY=65371bc52c911ea14494c5905c07c1cf
11400* git push heroku master
11402  heroku logs tail -f
11404  heroku logs --tail
11409  heroku logs --tail
11411  history | grep heroku
11412  heroku config
11413  bundle exec heroku rake db:migrate
11414  bundle exec heroku rake seed:init

https://jumpstartrails.com/discussions/88


remote:        /tmp/build_b70efc9d2ecef8d7607b7096a75f9e13/vendor/bundle/ruby/2.6.0/gems/rake-13.0.1/exe/rake:27:in `<top (required)>'
remote:
remote:        Caused by:
remote:        ArgumentError: key must be 16 bytes
remote:        /tmp/build_b70efc9d2ecef8d7607b7096a75f9e13/vendor/bundle/ruby/2.6.0/gems/activesupport-6.0.2.1/lib/active_support/message_encryptor.rb:193:in `key='
remote:        /tmp/build_b70efc9d2ecef8d7607b7096a75f9e13/vendor/bundle/ruby/2.6.0/gems/activesupport-6.0.2.1/lib/active_support/message_encryptor.rb:193:in `_decrypt'
remote:        /tmp/build_b70efc9d2ecef8d7607b7096a75f9e13/vendor/bundle/ruby/2.6.0/gems/activesupport-6.0.2.1/lib/active_support/message_encryptor.rb:157:in `decrypt_and_verify'
remote:        /tmp/build_b70efc9d2ecef8d7607b7096a75f9e13/vendor/bundle/ruby/2.6.0/gems/activesupport-6.0.2.1/lib/active_support/messages/rotator.rb:21:in `decrypt_and_verify'
remote