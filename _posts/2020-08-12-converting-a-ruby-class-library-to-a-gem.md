---
layout: post
title: Converting a Ruby Class Library to a Gem
category: ruby
tags: ["ruby"]
---
{:.center}
![IMG_4795.jpeg](/blog/assets/IMG_4795.jpeg)


This blog post talks about my experiences converting a handful of Ruby class libraries to gems.  As do a lot of software engineers, I have a series of routines that I bring into almost every Ruby project I tackle that deal with what I consider core stuff you always need: url handling, database stuff, time parsing and so on.  Normally I just copy these from project to project but the sheer plethora of them has recently made me see the need to go down the gem route:

    ❯ mdfind -name url_common.rb | wc -l 
          62

All of these files are named *common.rb so you will see a number of these on my Github page.  I don't claim that any of them are particularly wonderful, brilliant, complete or even well coded; I simply find them useful.

In order to figure out which was the right version of the 62 different files I found above, I wrote a separate blog post about using mdfind.

## The How

Here is the quick tldr of how to build a gem.

1. Create a gems directory where you can group all the gems you have.  Once you have one, I suspect you're going to have many.
2. Change into that gems directory.
2. Create a repo for the gem and clone it locally.
3. Change into the repo you just cloned.
4. Do a gem signin
5. Do a bundle gem project_name
6. Edit project_name/project_name.gemspec
7. Update your Gemfile with any dependencies.
8. Change into project_name
9. Do a bundle install
10. Do a bundle exec rake build; this gives you the pkg/* stuff below (see next command).
11. Do a gem push  pkg/url_common-0.1.0.gem
13. Oh and write the code and the tests.  This exists within the lib directory structure.

## Tips and Tricks

### 1. Change into the project_name/lib Directory to Run bundle install

My first attempt at following the directions gave me this:

    ❯ bundle install
    Could not locate Gemfile

And the easy solution was to change into the project_name/lib directory. So:

    cd url_common/lib

Yep.  I was an idiot for not realizing this.  Sigh.

### 2. Change into the project_name/lib Directory to Run bundle exec rake build

Similar to 1 above, my attempt to run bundle exec rake build gave me this failure:

    ❯ bundle exec rake build
    Could not locate Gemfile or .bundle/ directory

Again.  I was an idiot.  And, again, same solution -- change to the right directory.

### 3. Use irb for Debugging

In order to debug the gem you are building:

* Change into the project_name/lib directory
* run irb
* require your gem i.e. require 'url_common'

And now you can execute commands from your gem like:

```ruby
UrlCommon.foo
```

### 4. If You Have a Class Library then You Don't Need class project_name

My prior class libraries were all structured like this:

```ruby
class ProjectName
  def self.foo
  end
  
  def self.bar
  end
end
```

That now becomes something like this:

```ruby
require "url_common/version"
require 'any_gem_you_need'

module UrlCommon
  class Error < StandardError; end
  
  def self.foo
  end
  
  def self.bar
  end
end
```

Given that modules provide a namespace just as a class does and the . syntax invokes methods uniformly, this lets you invoke your "class methods" the same way you did when they were actually class methods.

### 5. The .try Method is a Rails Thing Not a Ruby Thing

Even though I like the semantic clarity of .try(:method_symbol), you can use &.method_name instead:

```ruby
#return parts.hostname.sub(/^www\./, '') + parts.try(:path) + '?' + parts.query 
return parts.hostname.sub(/^www\./, '') + parts&.path + '?' + parts.query 
```

This is a [Ruby 2.3](https://medium.com/@CohenCarlisle/why-you-shouldnt-be-using-rails-try-for-nil-safe-navigation-in-ruby-d3123a3965ac) change so it should be available to everyone by now.

### 6. Within Your Gem You Can't Reference the Namespace

I hit this error:

    1) UrlCommon.url_base should return the url base w/o the www
       Failure/Error: base_domain = UrlCommon.get_base_domain(url)

       NoMethodError:
         undefined method `get_base_domain' for UrlCommon::UrlCommon:Class
       # ./lib/url_common.rb:84:in `url_base'
       # ./spec/url_common_spec.rb:97:in `block (3 levels) in <top (required)>'
    

This came from this line of code:

    def self.url_base(url, base_domain=nil)
      if base_domain.nil?
        base_domain = UrlCommon.get_base_domain(url)
      end
    #...
    end

and the fix turned out to be:

    def self.url_base(url, base_domain=nil)
      if base_domain.nil?
        base_domain = get_base_domain(url)
      end
    #...
    end

despite there being a def self.get_base_domain method defined in the module.  **Shrug**

## Conclusion

I haven't tried to build a gem in **years**.  Building a gem is substantially easier in 2020 than it was circa 2007 - 2009.  Kudos to the entire Ruby tooling team.  Recommended.

## Sources

See these sources:

* [SitePoint (good but dated)](https://www.sitepoint.com/creating-your-first-gem/)
* [Dev.to (EXCELLENT)](https://dev.to/aryaziai/how-to-create-a-ruby-gem-9m2)
* [RubyGems (you will need an account)](https://rubygems.org/)
* [Bundler.io (EXCELLENT)](https://bundler.io/guides/creating_gem.html)
* [My First Gem -- url_common](https://github.com/fuzzygroup/url_common/tree/master)
* [My First Gem -- url_common -- on RubyGems](https://rubygems.org/gems/url_common)