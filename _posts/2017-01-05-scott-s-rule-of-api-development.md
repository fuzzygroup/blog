---
layout: post
title: Scott's Rule of API Development
category: software_engineering
tags: ["software_engineering", "api", "curl", "ansible", "aws", "rails"]
---
{% pizzaforukraine  %}

So on Tuesday I wrote a new api that allows an [Ansible](https://www.ansible.com/) playbook to register an AWS instance with an internal service I'm writing.  This is for the purpose of monitoring large jobs (think tens if not hundreds of lightweight EC2 instances) so that they can be shut down programmatically when they are done.  

In some kind of alternate universe I'd just do all this with [AWS Lambda](https://aws.amazon.com/lambda/) but I'm working in a monolithic rails code base so I used my [Large Datasets approach](https://fuzzygroup.github.io/blog/rails/2017/01/03/processing-large-datasets-on-aws-using-ruby-rails-and-sidekiq.html) I documented earlier this week.  

My ansible playbook creates the EC2 instances, binds the whole process together and initiates everything -- I can literally run one playbook and have 40 workers (or really N workers) created and an entire data set start processing along with getting an internal record of all the instances and the job so that I can do proper cost accounting, dynamic instance shut down and the whole nine yards.  This is a big step for me.  I am getting close to a technical goal that I've been working towards either for six months or about 7 years depending on how you measure it.

So [Nick](http://nickjanetaks.com/) and I did all this fancy, fancy EC2 automation -- AMI creation, instance creation, job launching -- and the thing that ***failed*** was a simple *http post API* call using the [Ansible URI module](http://docs.ansible.com/ansible/uri_module.html).  Like everyone else in the industry I've written a post API, I don't know -- 50 times? 100 times? --- and they always fail the first time.  And this brings me to what I'm going to immodestly call Scott's Rule of API Development:

> **Scott's Rule of API Development**.  Always, always, always test your APIs with [curl](https://curl.haxx.se/) from an external box before you actually try and use them.

Seriously -- I hit this problem six months ago at [TheraChat](http://www.therachat.io) when I wrote their MVP.  I hit it yesterday.  I seemingly hit it every single damn time I make an API.  Hence Scott's Rule of API Development.  Now, that said, what does using curl to test an api actually mean / how do you do it:

1.  Create your API.  
2.  Write your curl statement. Here's a sample which I used once upon a time for an authorization API (the -d tells curl to post it): *curl -i -d "api_key=forceawakens13928534aY&&mobile_number=317-531-4853&password=BLAH" "http://app.foo.com/api/authorize"*
3.  Test it locally against your development system.  Fix any bugs.  Lather / Rinse / Repeat.
4.  Deploy your code.
5.  Run it on another box that isn't your actual API to make sure that there are no security glitches / remote code issues / etc.
6.  If this API is part of a full stack Rails app then don't forget to disable forgery protection in Application Controller with *protect_from_forgery with: :null_session*.
7.  For bonus points store the curl commands that exercise your API as part of your code base and always try them before a release.  APIs can be tricky little buggers and they are both difficult to get and seem to break easily.  Regularly testing with curl prevents that and makes users of your API much, much happier.

Yes test coverage should prevent what's described in #7 but I'd strongly recommend belt and suspenders on this one.  When the people who rely on your API have issues you can always give them a curl statement and say "Well this works for me -- what about you".  You can't do that we test coverage as APIs are often used from a variety of languages and environments but curl is absolutely **universal**.
