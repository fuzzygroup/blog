---
layout: post
title: The Schema WTF Moment Take 2 - An Excursion into SourceTree
category: rails
tags: ["rails", "db", "schema"]
---
I recently wrote about the [Rails Schema WTF](https://fuzzyblog.io/blog/rails/2019/05/09/rails-migrations-multiple-developers-and-the-schema-wtf-moment.html) moment, that moment when you’re making changes to your system and you have issues with what to commit.  The problem I wrote about there was what happens when you get a migration from another developer.  This time I’m writing about what to do when you create a migration.

The primary idea here isn’t much different from what I wrote about the other day but the core idea is the same — you only want to commit to version control the changes to the schema.rb file that your migration caused.  Let’s start with a sample migration:

    class AddUniqueIndexToThingss < ActiveRecord::Migration[5.0]
      def up
        execute "CREATE UNIQUE INDEX unique_index_things_on_id ON public.things USING btree (id, project_id) where deleted_at is null;"
      end

      def down
        execute "drop index unique_index_things_on_id"
      end
    end
    
If you think thru this migration, it is going to introduce two changes to schema.rb:

 * A new date stamp on the schema.rb file will be listed at the top
 * A single line for the index creation will be added
 
So conceptually what you want to do is do a git add and commit of only these things:

 * The migration file itself
 * The date stamp line
 * The index creation line

And therein lies the problem because while Git is a fantastic tool, from the command line, you never want to have to commit a range of lines because it is just plain ugly.  Even after a decade plus of using git from the command line, I don’t know how to do that.  

And this brings us to SourceTree.  SourceTree is a Git user interface which makes this particular task actually easy.  Here are the steps:

1. Run SourceTree.  
2. If SourceTree doesn’t open the right git project automatically, navigate to the correct project with File menu, Open command.
3. You should set your view to *Flat list (single column)* and also *Split view staging* if it isn’t that way.  This is done with the hamburger icon to the right of *Pending Files, sorted by path*.
4.  In the panel on the lower left, select the checkbox next to the migration itself.  This will move the migration file up to the Staged Files area.  This is equivalent to a *git add* operation.
5. In the panel on the lower left click on the schema file.  This gives you a text view of the whole schema file on the right.  Start by finding BOTH lines for the date stamp (one will be red and one will be green).  Select BOTH of these and click the *Stage lines* button.  This is equivalent to a git add command for only these lines.  
6. In the text view of the whole schema file, scroll down until you find the exact changes from your migration.  In this case we are looking for an index creation line on the things table.  This line was an addition to your schema.rb file so it should be in green.  When you find it, select that line (or lines), highlighting them, and then click *Stage lines*.
7. In the left most bottom pane, right click the overall schema.rb file and click "Reset" from the context menu.
8. Press Command + Shift + C and write a commit message and then click the Commit message.

## Thank You

As always, thank you [Sean Kennedy](https;//csphere.github.io/) for teaching me this particular trick and also for editing this post for clarity.  Appreciated.
