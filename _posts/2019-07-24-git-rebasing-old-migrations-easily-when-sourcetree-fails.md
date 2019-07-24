---
layout: post
title: Git Rebasing Old Migrations Easily When SourceTree Fails
category: rails
tags: ["rails", "ruby", "migrations"]
---
So I've written before about schema.rb changes, SourceTree and migrations and the problem with git rebase before:

* [Schema WTF Take 1](https://fuzzyblog.io/blog/rails/2019/05/09/rails-migrations-multiple-developers-and-the-schema-wtf-moment.html)
* [Schema WTF Take 2](https://fuzzyblog.io/blog/rails/2019/05/10/the-schema-wtf-moment-take-2-an-excursion-into-sourcetree.html)

I just hit this again and my normal pairing partner is offline and while he has the patience to deal with the crazy ass error messages from SourceTree, I do not.  Personally I think Atlassian (the maker of SourceTree) should simply be killed with fire while my pagan friends dance naked around a drum circle but hey -- that's just me.  

Anyway my tooling has let me down.  And, yes I could learn the specific range level commit commands that SourceTree is generating behind the scenes but I think there's an easier way.  Here's what I did:

1. Abort the git rebase with git rebase --abort
2. Change back into my develop branch which is now current.
3. Copy schema.rb to ~ i.e. cp db/schema.rb ~
4. Look at my pull request to identify the specific migration that I ran.
5. Roll back the specific migration with: rake db:migrate:down VERSION=20190610143443
6. Copy in the schema.rb from ~ i.e. cp ~/schema.rb db
7. Run the migration with bundle exec rake db:migrate
8. Do the git add / commit / push dance
9. Get someone to do the pull request review

And that, dear reader, should have worked swimmingly.  Alas, it did not.  And this was one of those software engineering cases where trying to understand something fully likely would have been a waste of time.  This change amounted to a few lines in a model, a migration to add an index and a small update to a spec file -- I simply recreated the branch from the current develop as "-a" (on top of the original branch number) and then re-made the same damn changes.  Yeah that sucks but it worked.  

Today was definitely a day in the trenches.  Sigh.