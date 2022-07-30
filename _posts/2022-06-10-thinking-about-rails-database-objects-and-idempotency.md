---
layout: post
title: Thinking About Rails Database Objects and Idempotency
date: 2022-06-10 12:47 -0400
category: rails
tags: ["rails"]
---
{% pizzaforukraine  %}

I've been dealing with a new application with a lot of objects and one of my concerns is idempotency.  Idempotency is the idea that you can do the same thing over and over and only create a new object when 

>> Idempotence (UK: /ˌɪdɛmˈpoʊtəns/,[1] US: /ˈaɪdəm-/)[2] is the property of certain operations in mathematics and computer science whereby they can be applied multiple times without changing the result beyond the initial application. [Idempotence](https://en.wikipedia.org/wiki/Idempotence)

Specifically if I'm saving a login and password to a database for a certain project and environment, I only want to save that one time.

I normally handle this with a class level find_or_create method but that, in 2022, is feeling unexpectedly clunky.  It is unclear to me what the current thinking in the Rails world is regarding low level operations like this -- my last technical conference was now in 2016 (and that was for Elixir not even Ruby).  As with so many blog posts, I'm going to sketch out my solution here in the hopes that writing it all down:

* Kick starts the brain
* Puts something out there to spur a conversation

It seems to me that idempotency varies on a class level.  For an account class just the email field might make it idempotent.  For my CodeEnvironmentLogin class, it is going to be several fields:

* code_environment_id
* login
* project_id

**Note**: And, yes, I'm building a development tool as this blog post absolutely reveals.

The fact that this varies on a class level basis to me argues for a class level constant.  Let's call them "identity columns" since they uniquely identify records:

```ruby
IDENTITY_COLUMNS = [:project_id, :code_environment_id, :code_environment_login]
```

Now what we need is a method which can:

* read the identity columns
* generate a where clause using a passed in OpenStruct (all my find_or_create methods us an OpenStruct)
* return true or false if it exists and the object itself

Here's my first stab at it:

```ruby
def self.exists?(struct)
  where_clauses = []
  IDENTITY_COLUMNS.each do |identity_column|
    where_clauses << {identity_column => struct.send(identity_column)}
  end
  #raise where_clauses.inspect
  cel = self.where(where_clauses.first).first
  if cel
    return true, obj
  end
  return false, nil
end
```

I feel mildly dirty about this because the method is a dual return so, technically, it isn't a pure boolean method.  But the *signaling* of the ? suffix on the method is, I think, useful.

This new approach gives a class level find_or_create as follows:

```ruby
def self.find_or_create(struct)
  exists, cel = self.exists?(struct)
  return cel if cel
  
  cel = CodeEnvironmentLogin.new
  cel.date_created_at = Date.today
  cel.project_id = struct.project.id
  cel.account_id = struct.account.id
  cel.team_id = struct.team.id
  cel.code_environment_id = struct.code_environment.id
  cel.login = struct.login
  cel.password = struct.password
  cel.name = struct.name
  cel.active = true

  cel.save
  if cel.persisted?
    return cel
  else
    raise cel.errors.full_messages.inspect
  end
end
```

A note on personal style.  I know that I can pass a hash into a new operation and have everything done at once.  The reason I have deliberately chosen not to is that with a line by line approach, you can:

* Get a failure right down to the exact line number (instead of a line which represents a hash and you don't know where the error is)
* Insert a debugger on any particular line

Given that debugging takes vastly more time than writing initial code, my choice for line by line assignment seems sound but opinions may vary (ymmv).