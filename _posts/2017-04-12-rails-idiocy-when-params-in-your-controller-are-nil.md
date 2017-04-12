---
layout: post
title: Rails Idiocy - When Params In Your Controller Are Nil
category: rails
tags: ["rails"]
description: If you find that params in your controller is nil then look at your params.require call in your strong_params routine.
---
So I got up early and got cracking on some code and then I hit an absolute wall -- the kind of thing that just stops you cold.  I was debugging a controller in my side project and I got a nil on accessing a member on the params hash.  And since this was something I'd done previously I thought it odd but added debugger to my controller and evaluated params:

    [12, 21] in /Users/sjohnson/Dropbox/fuzzygroup/hyde/seira_watch_web_app/app/controllers/instructors_controller.rb
       12:   end
       13:
       14:   def create
       15:     @instructor = Instructor.new# => (params[:instructor])
       16:     debugger
    => 17:     if params[:instructor][:url] =~ /http/
       18:     else
       19:       flash[:error] = "Please specify a valid url"
       20:       redirect_to edit_instructor_path(@instructor) and return
       21:     end
    (byebug) params
    nil
    
A decade plus in Rails and Ghu only knows how many controllers and I don't think I've ever seen nil for params.  I mean params is effectively a god object that is always there.  How the hell does it become nil?

This was when I put my keyboard down, went over to my editor and started doing some writing.  I knew in my gut that this was an oddball issue and what I really needed was another set of eyes.  And, an hour later, my buddy [Nick](http://www.nickjanetakis.com/blog/), gave me a hand over Google Hangouts pointing out that I had something wrong my strong params method:

```ruby
def instructor_params
  params.require[:instructor].permit(:url)
end
```
    
The above code is lexically correct and won't cause any errors but it will absolutely screw everything up and make params goto nil.  This should have been:

```ruby
def instructor_params
  params.require(:instructor).permit(:url)
end
```

The difference between [ ] and () is of course very, very real but it is subtle, particularly from a visual angle where you can easily mistake them.