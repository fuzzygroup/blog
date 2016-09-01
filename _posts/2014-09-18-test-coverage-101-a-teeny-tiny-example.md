---
layout: post
title: Test Coverage 101 - A Teeny Tiny Example
category: test coverage
tags: ["ruby", "tdd", "testing", "test coverage"]

---
I spoke with a potential client recently and one of the topics at hand was "Does the code base you own have test coverage?"  "No; we know that we need it but its not there presently".  I suspect that we may do some level of mentoring along with development services so there's no time like the present for an example.  I just completed a teeny, tiny routine which is designed to test a url for whether or not is absolute.  Here's a code snippet: 

<pre>
class Url
  def self.is_absolute?(url)
    return false if url.blank?
    return false if url[0] == '/'
    begin
     parts = URI.parse(url)
     return true if parts.host.present?
     return false
   rescue Exception => e
     return false
   end
   return false
 end
end
</pre>

This is from our abstract Url class which qualifies as PORO - plain old ruby objects; just a class which we use absolutely everywhere and is at the heart of our crawling logic.  Let's walk thru it:

1.  return false if the incoming url is actually nil.  Or "".  .blank? returns true when the object you're calling it on is, well, blank.  
2.  return false if the first character of the url is actually just a / character.  This is a cheap performance operation to make sure that you don't call URI.parse on a url like "/foo/bar"
3.  The next block is a begin / rescue construct which wraps around URI.parse.  Why?  Well URI.parse has a tendency to throw exceptions with bad data.  Here's a url which looks right but is technically wrong: http://google.com&q=bar  Now in damn near all browsers that will work and Google will even search it but an & character that is not preceded by a ? or a / causes this:
<pre>
URI.parse("http://google.com&q=bar")
URI::InvalidURIError: the scheme http does not accept registry part: google.com&q=bar (or bad hostname?)
from /Users/sjohnson/.rvm/rubies/ruby-1.9.3-p484/lib/ruby/1.9.1/uri/generic.rb:213:in `initialize'
from /Users/sjohnson/.rvm/rubies/ruby-1.9.3-p484/lib/ruby/1.9.1/uri/http.rb:84:in `initialize'
from /Users/sjohnson/.rvm/rubies/ruby-1.9.3-p484/lib/ruby/1.9.1/uri/common.rb:214:in `new'
from /Users/sjohnson/.rvm/rubies/ruby-1.9.3-p484/lib/ruby/1.9.1/uri/common.rb:214:in `parse'
from /Users/sjohnson/.rvm/rubies/ruby-1.9.3-p484/lib/ruby/1.9.1/uri/common.rb:747:in `parse'
from (irb):25
from /Users/sjohnson/.rvm/gems/ruby-1.9.3-p484@banks/gems/railties-4.1.4/lib/rails/commands/console.rb:90:in `start'
from /Users/sjohnson/.rvm/gems/ruby-1.9.3-p484@banks/gems/railties-4.1.4/lib/rails/commands/console.rb:9:in `start'
from /Users/sjohnson/.rvm/gems/ruby-1.9.3-p484@banks/gems/railties-4.1.4/lib/rails/commands/commands_tasks.rb:69:in `console'
from /Users/sjohnson/.rvm/gems/ruby-1.9.3-p484@banks/gems/railties-4.1.4/lib/rails/commands/commands_tasks.rb:40:in `run_command!'
from /Users/sjohnson/.rvm/gems/ruby-1.9.3-p484@banks/gems/railties-4.1.4/lib/rails/commands.rb:17:in `<top (required)>'
from bin/rails:8:in `require'
from bin/rails:8:in `<main>'
</pre>
4.  If the URI.parse succeeds then we check if parts.host (the host of the url) is present and if so we return true.  Otherwise we return false in all other cases.


Here's the result of the test coverage:

<pre>
bundle exec rspec spec/models/url_spec.rb:6 < ~/appdatallc/banks >
Run options: include {:locations=>{"./spec/models/url_spec.rb"=>[6]}}
Url
 .is_absolute?
 should return false when the url is nil
 should return true when a url is absolute
 should return false when a url is relative
 should return false when a url is broken
Finished in 0.05188 seconds (files took 9.18 seconds to load)
</pre>

And here's the actual test coverage:

<pre>
describe ".is_absolute?" do
   it "should return false when the url is nil" do
    url = nil
    expect(Url.is_absolute?(url)).to eq false
  end
  it "should return true when a url is absolute" do
    url = "http://foo.bar.com/"
    expect(Url.is_absolute?(url)).to eq true
  end
  it "should return false when a url is relative" do
    url = "/forms/index.php"
    expect(Url.is_absolute?(url)).to eq false
  end
  it "should return false when a url is broken" do
    url = "http://foo.bar.com&bah=1"
    expect(Url.is_absolute?(url)).to eq false
  end
 end
</pre>