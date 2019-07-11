---
layout: post
title: Rails, Migrations, Multiple Developers and the Schema WTF Moment
category: rails
tags: ["rails", "schema", "migration"]
---
I’ve been doing Rails now since 2007.  However for much of that time I was a project lead and one of the tasks that I reserved for myself was *all* schema changes.  One of the benefits of that was that because I did all the primary schema changes, I rarely, if ever, had schema conflicts.  I am now on a project where, while I am a Senior Software Engineer, I am not the lead and the schema changes are done by everyone on the team, all the time.  

The consequence of this is that while Rails should handle any schema conflicts correctly, well, *should* is the operative term.  In practice we have found that depending on how you do your git pull and git branching, you often (like every damn branch you make) end up with a schema conflict.  And since our schema file is enormous (think over 3,000 lines in schema.rb), figuring this out can be brutal.  This moment where you realized that your schema is borked is what I call the *Schema WTF Moment*.

While I’ve struggled with this for a while and never found a decent solution, today, I was speaking with another senior guy (my buddy [Sean Kennedy](https;//csphere.github.io/)) and he very cogently explained the issue in a way that made sense.  This is my write up of his description.  He described it thusly:

“If you do a git pull, you should already have the latest schema, affected by any migrations that came in via the pull, but your database tables may not be updated. So, you do need to run the migrations after pulling, but this will often change db/schema.rb. If all you've done is pull and migrate, there's no reason you should be responsible for committing any of the resultant schema changes as they don't technically belong to you, and they may end up being extraneous/incorrect, so resetting the schema diff makes the most sense.”

To help you understand our approach to git, we use:

1. All work is done in a branch.
2. All branches are created from develop.
3. Once a branch is approved, it is merged into develop.
4. The develop branch is automatically deployed to staging with every merge.
5. A production deploy automatically merges develop into master.
6. The master branch is only deployed to production.

Here is my step by step version of what to do before beginning a branch.

1. Switch your code base over to the develop branch.
2. Pull the latest code.
3. Run bundle exec rake db:migrate.  This updates your schema.rb file locally but you want to throw these changes away before beginning any work.
4. Do a git checkout db/schema.rb to throw away the changes
5. Create your new branch.
6. Change to your new branch and begin work
