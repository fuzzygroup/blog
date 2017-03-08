---
layout: post
title: When Sidekiq Makes You Nuts Check Your Types
category: rails
tags: ["rails", "sidekiq"]
description: Sidekiq usually works great but when you get really weird errors, check to make sure you're not passing in something other than a primitive type as a method parameter.
---
Much of what I do at the job I'm in the process of leaving is large scale data processing and it is all done through queues and [Sidekiq](http://www.sidekiq.org).  I generally do it with a method call that looks like this:

> CompileWorker.perform_async(id)

Today though I had to do it and pass in a date to my method call so I had this:

> CompileWorker.perform_async(id, date)

And I got crazy, crazy, crazy results -- my object would get about 10 lines into the call and then ... nothing.  I'd test my method line by line in rails console on production and it would work perfectly.  I even went so far as to isolate it down to one Sidekiq thread and one redis server (on local host no less to make sure that no other sidekiq worker was messing with things).  And nothing made any difference.  Finally I realized that the crucial difference was actually that I was passing in a date.  Here's the docs:

> Don't pass symbols, named parameters or complex Ruby objects (like Date or Time!) as those will not survive the dump/load round trip correctly. [More](https://github.com/mperham/sidekiq/wiki/Best-Practices)

And, sure enough, when I removed the date by treating it as an internal constant, it worked perfectly.  Here's the workaround I came up with:

```ruby
def compile(date=)
  if date.is_a?(String)
    date = Date.parse(date)
  end
end
```

And then I call it as 

```ruby
CompileWorker.perform_async(id, date.to_s)
```

This allows my internal use of the compile method where a date is passed in normally to function without issue but to work correctly when called in an asynchronous manner.

I actually don't have a problem with Sidekiq working in this fashion but it does bother me that while the Sidekiq documentation warns about this, there's no error thrown or alert raised.  Now it might be impossible to pull off an error message but this is a damn easy mistake to make.  I knew about the ActiveRecord object limitation in Sidekiq but didn't have a clue that it extended to a simple date.