---
layout: post
title: Getting Around the Makara ActiveRecord Proxy
category: rails
tags: ["ruby", "rails"]
---
One of the key approaches to database scalability is the use of a replica server so that read only queries (i.e. SELECT queries) get shunted away from the master database.  When you use a framework based approach to development such as Rails, this is generally implemented as an ActiveRecord connector that sits between your SQL and the server on which it gets executed.  One such example is [Makara](https://github.com/taskrabbit/makara) from TaskRabbit.

The problem here is that not all SELECT queries are created equally and not all select queries can run correctly on a replica.  I recently had the situation where a given query was complex enough (think 500+ lines of select query) that it could only execute on the replica server maybe 3 times out of 10 with a 45 plus second runtime.  I was assured by the query author that this would execute correctly on the production database.  And while I was absolutely dubious about this, I realized that there was literally no way to prove this without getting around Makara.  

I looked at Makara and like a lot of gems, I didn't find the documentation much to my liking (although I had a hint that if I got funky with it, it might work) but then I saw this little snippet:

"Calls inside a transaction will always be sent to the master (otherwise changes from within the transaction could not be read back on most transaction isolation levels)"

And that gave me this example (not the real sql; just something I had open in a db console):

    results = ActiveRecord::Base.transaction do 
      ActiveRecord::Base.connection.select_rows
      ("
      select user_id, date_created_at, sum(int_val) from metrics where habit_id = 2 
      group by date_created_at order by date_created_at desc LIMIT 10;
      ") 
    end
    
And, sure enough, that worked.  