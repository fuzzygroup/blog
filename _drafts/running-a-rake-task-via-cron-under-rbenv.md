---
layout: post
title: Running a Rake Task via Cron Under rbenv
---
0 */2 * * * export PATH=/home/deploy/.rbenv/shims:/home/deploy/.rbenv/bin:/usr/bin:$PATH; eval "$(rbenv init -)"; cd /home/deploy/covid_near_me_on_GCP/current && bundle exec rake data:init


https://benscheirman.com/2013/12/using-rbenv-in-cron-jobs/