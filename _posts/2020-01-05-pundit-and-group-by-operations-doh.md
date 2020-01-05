---
layout: post
title: Pundit and Group By Operations - DOH
category: rails
tags: ["rails", "pundit"]
---
{:.center}
![IMG_6430.jpeg](/blog/assets/IMG_6430.jpeg)

I'm in the process of working out security for a new side project (yes, yes, yes - I know; I have too many of these but they are such a good teaching tool for one's self) and I wanted to use [pundit](https://github.com/varvet/pundit).  Pundit, for those who haven't played with it, is a Ruby gem which makes authorization at the controller level easier.

## Authorization, Authentication, Oh My

Just to review the very basics of computer security, there are two key concepts:

* Authentication is who you are to a system
* Authorization is what you can do to an object within that system

In the Rails world of MVC (model, view, controller) architecture, security happens at the controller because that is where the request from the user comes in.

The way that pundit works is you add a top level directory under app called policies and then there is a generic application_policy.rb as well as a classname_policy.rb file for each ActiveRecord class (change classname to the name of an actual class) in your application.  And, inside each classname_policy.rb file you define permission rules for each controller action.  In short Pundit is a well thought out, fairly seamless way to integrate security in your Rails application.  I like Pundit for more than I ever liked [CanCan](https://github.com/ryanb/cancan), another tool for this same type of problem.

## My Application

Here is the rough security rules that I wanted to follow (comments from the Pundit policy model):

* # yes you can view the object if YOU created it
* # yes you can view the object if you belong to the organization_group
* # yes you can view the object if you belong to the organization and you are a boss

So when I started down this path, I immediately started getting a Pundit error that I've never seen before and that I didn't understand:

    Pundit::NotDefinedError: unable to find policy `HashPolicy` for `{}`    

And this error sent me through the normal spiral of google results only to find relatively few results.  This [one](https://github.com/ankane/groupdate/issues/94), which I didn't read well, however, was prescient.  And I continued down the path of debugging this at a lower and lower level until I found myself dropping byebug into Pundit itself in this method:

```ruby
def policy
  klass = find(object)
  klass.is_a?(String) ? klass.safe_constantize : klass
end
```  

And what I found was that the "object" that Pundit had was just {} which made no sense to me.  And then I looked at my controller and saw what I was doing:

```ruby
def index
  @objectives = current_user.organization.objectives.order('quarter_id ASC, name ASC').group_by(&:quarter_id)
  authorize @objectives
end
```  

What I discovered, as I continued to debug this is that I had a failure in my test setup and that, with the .group_by method which converts an ActiveRecord collection into a hash which points to an ActiveRecord collection meant that all Pundit was getting was nothing more than {} which, naturally, led to the failure above.

The solution was to initially fix my test setup (damn RSpec let statements; how they hell do they actually work; sigh) and then change my controller action to be this:

```ruby
def index
  @objectives = current_user.organization.objectives.order('quarter_id ASC, name ASC')
  authorize @objectives
  @objectives = @objectives.group_by(&:quarter_id)
end
```

And that, naturally, is almost identical to what Ankane had (the prescient github post I cited earlier; big damn sigh).

Note to Self: Pay more attention to Ankane; something I already know.  
