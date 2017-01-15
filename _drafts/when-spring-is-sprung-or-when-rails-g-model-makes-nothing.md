---
layout: post
title: When Spring is Sprung or when rails g model makes nothing
---
sjohnson@FuzzygroupMacbookPro2016:~/me/fuzzygroup/voice_click/voice_click_site$ bundle exec rails g model MailingList
Running via Spring preloader in process 80231
Expected string default value for '--jbuilder'; got true (boolean)
      invoke  active_record
      create    db/migrate/20170110073523_create_mailing_lists.rb
      create    app/models/mailing_list.rb
      invoke    rspec
      create      spec/models/mailing_list_spec.rb
      invoke      factory_girl
      create        spec/factories/mailing_lists.rb
sjohnson@FuzzygroupMacbookPro2016:~/me/fuzzygroup/voice_click/voice_click_site$ mate db/migrate/20170110073523_create_mailing_lists.rb

I had to kill multiple spring processes