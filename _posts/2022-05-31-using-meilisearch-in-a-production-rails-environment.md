---
layout: post
title: Using MeiliSearch in a Production Rails Environment
date: 2022-05-31 07:31 -0400
category: rails
tags: ["rails", "meilisearch"]
---
{% pizzaforukraine  %}

I recently migrated [JobHound](https://www.jobhound.io) from its original hosting (DigitalOcean with a custom Docker based deployer) to a new environment (also DigitalOcean but now with deploys managed via [HatchBox](https://www.hatchbox.io)).  In the traditional spirit of all IT migrations where you both get something good and lose something good, I got:

* Better Performance
* Working SSL; I have no idea why it stopped on the old box but it did and wasn't fixable
* Much better deployment (NO MORE DOCKER!)

But I also lost something:

* ElasticSearch or ES

I had implemented ES as a Docker component that was a part of my overall and it really did work beautifully -- the simplest installation of ES that I've ever experienced.

When I found that I couldn't install ES on my Mac without messing about with the memory allocations because certain memory allocation options aren't available on Open Java platform, I started to get concerned.  And then ES just proved to be increasingly byzantine to make work (perhaps this is me).  So I was open to new search technologies and I quick perusal of the [GoRails screencasts](https://gorails.com/episodes) turned me onto [MeiliSearch](https://www.meilisearch.com/), a relatively new Rust based search engine.

I will admit that I have a certain fondness for things written in Rust.  If you aren't aware, Rust is a language which a focus on preventing programmer errors.  And, in my experience, that tends to produce some really great pieces of software.

## Getting Started

This is the process I used to get MeiliSearch up and running for JobHound.  In about 2 hours, I went from never having used MeiliSearch to a fully working installation both locally and on production.  In my experience, that kicks the snot out of ElasticSearch.

### Desired Configuration

I'm working on a pretty standard multi box configuration:

* load balancer
* worker
* web1
* web2
* database

My plan was to setup MeiliSearch on the worker box and have that do al the indexing and querying.  This means that my web boxes would need to talk to MeiliSearch on the worker box over MeiliSearch's default port of 7700.

**Note 1**: I'm running all this on Digital Ocean using Ubuntu 18.04 Bionic.

**Note 2**: This is best read alongside the [official docs](https://blog.meilisearch.com/how-to-integrate-an-extremely-fast-and-relevant-search-into-your-rails-app-using-meilisearch-and-react/).  And the docs are excellent but there are enough things I noticed doing a full installation into both development and production that I wanted to note them.

### Local Installation for Development

I installed MeiliSearch via brew:

    brew install meilisearch

To confirm that your installation is working correctly, goto [http://localhost:7700/](http://localhost:7700/) and you should see a web based UI to verify your indices and perform queries.

### Server Installation for Production Use

Log into your server and change into the /tmp directory:

    cd /tmp

Run:

    curl -L https://install.meilisearch.com | sh

Now you want to move meilisearch to the /usr/bin directory:

    sudo mv meilisearch /usr/bin/

and change its permissions to root:

    sudo chown root:root /usr/bin/meilisearch

### Adding an API Key 

Generate a random high entry token that you can used for an API key.  Here's one way:

    cat /dev/urandom | base64 | head -c 24

This gave me: 

    AntypkbH8DITLhaRG8ru0SIP 
		
which we will use in the next step.

**Note**: Not my actual API key.

### Setting MeiliSearch to Run as a Service

Once you have MeiliSearch installed, you need to create a SystemD service file which can be done like this:

		sudo cat << EOF > /etc/systemd/system/meilisearch.service
		[Unit]
		Description=Meilisearch
		After=systemd-user-sessions.service

		[Service]
		Type=simple
		ExecStart=/usr/bin/meilisearch --http-addr 127.0.0.1:7700 --env production --master-key AntypkbH8DITLhaRG8ru0SIP

		[Install]
		WantedBy=default.target
		EOF

**VERY, VERY IMPORTANT**: If you are using this with a multi box install then you need to specify your machine's IP address above NOT 127.0.0.1.

Once you have installed the service file then you need to use commands like these:

    systemctl start meilisearch
    systemctl status meilisearch
    systemctl stop meilisearch

to maintain meilisearch.

### Locking MeiliSearch Down

There are two aspects to locking down MeiliSearch:

* API Key as mentioned above.  By using the same API key on the server process and on the client machine, only searches with that API key will be executed
* Limiting Access.  Use a firewall to govern access to certain ports and machines

The ufw firewall is a standard Linux thing at this point.  What you need to do is add firewall rules which:

* allow access from web1
* allow access from web2
* allow access from yourself i.e. worker1's ip address

These rules are written as follows:

    sudo ufw allow from 138.x.y.z to any port 7700

**Note**: This would be a real IP address above where x, y, z and replaced by the correct octets of the address.

### Sidebar: Belt and Suspenders

Given the number of API key breaches these days, I opted to lock down MeiliSearch using both API keys and a firewall rule.  This was very deliberate on my part as once upon a time, an engineer who worked for me, left an unprotected ElasticSearch instance running on a test server.  After that box was exploited for a $30,000 bandwidth, I swore that I'd try to never do that again.

### Gemfile

To start, you need to use this line in your Gemfile:

    gem "meilisearch-rails", github: "meilisearch/meilisearch-rails", branch: "release-v0.5.1"

The 0.5.1 gem was never released to [Ruby Gems](https://rubygems.org/gems/meilisearch/versions) so without the line above, you will get the 0.3 version which does not work.  Yes they say that they have fixed this.  And no they haven't (as of the writing of this blog post; [Github Issue](https://github.com/meilisearch/meilisearch-rails/issues/114)).

Once you put that in place, you need the obligatory dance of:

    bundle install

### Initializers - Just Say No 

MeiliSearch has you use an initializer in config/initializers like this:

{% highlight ruby %}
MeiliSearch.configuration = {
  meilisearch_host: 'http://127.0.0.1:7700',
  meilisearch_api_key: '',
}
{% endhighlight %}

I switched that to blocks of code in production.rb and development.rb:


{% highlight ruby %}
MeiliSearch::Rails.configuration = {
  meilisearch_api_key: 'AntypkbH8DITLhaRG8ru0SIP',
  pagination_backend: :kaminari,
  timeout: 2,
  max_retries: 1,
  meilisearch_host: 'http://165.x.y.z:7700'
}
{% endhighlight %}
    
I skipped the initializers because no matter how I used Rails.env.development?, I couldn't make it work with MeiliSearch; bizarre.

### Model Code

Here is all the code to add to your model:

{% highlight ruby %}
  include MeiliSearch::Rails
  meilisearch do
    # all attributes will be sent to Meilisearch if block is left empty
    displayed_attributes ['id', 'title', 'description', 'location', 'why_rejected']
    searchable_attributes ['company', 'title', 'why_rejected', 'location', 'name', 'domain', 'description', 'created_at', 'user_id']
    filterable_attributes ['user_id']
    sortable_attributes [:created_at, :updated_at]
  end
{% endhighlight %}

### Example Search

Here is an example search command that I used in console:

    Job.search("ruby")

which returned all jobs matching the term **ruby**.

You can also use filters to restrict what comes back to only the specified user:

    @jobs = Job.search("ruby", filter: ["user_id=1"])

### Controller

While the MeiliSearch examples give you a lovely React based UI, I'm a bit more old school.  Here's a simple controller which executes the search:

{% highlight ruby %}
class SearchController < ApplicationController
  def index
    @jobs = Job.search(params[:q], filter: ["user_id=#{current_user.id}"])
    @notes = Note.search(params[:q], filter: ["user_id=#{current_user.id}"])
    @cover_letters = CoverLetter.search(params[:q], filter: ["user_id=#{current_user.id}"])
    @tasks = Task.search(params[:q], filter: ["user_id=#{current_user.id}"])
  end
end
{% endhighlight %}

My controller is searching all the user's indexed objects at once and bringing up a UI which shows all of these to the user.

### Indexing Rake Task

Whenever you implement a search system, you are going to need to re-index everything.  There's just no way around it.  Here is an example rake task which handles re-indexing:

{% highlight ruby %}
namespace :search do
  # bundle exec rake search:index_all --trace
  task :index_all => :environment do
    klasses = [Job, Note, CoverLetter, Task]
    klasses.each do |klass|
      klass.reindex!
    end
  end
end
{% endhighlight %}

## Conclusion

I'm now happier with MeiliSearch than I ever was with ElasticSearch.  It was not only simpler and easier to use but I feel I have a better grasp on how MeiliSearch works than I ever have with ElasticSearch.  

Kudos to the team!  Well done!

## References

* [MeiliSearch screencast](https://gorails.com/episodes/how-to-use-meilisearch-rails?autoplay=1) on GoRails
* [Official Rails Tutorial](https://blog.meilisearch.com/how-to-integrate-an-extremely-fast-and-relevant-search-into-your-rails-app-using-meilisearch-and-react/)
* [MeiliSearch Home Page](https://www.meilisearch.com/)
* [Example Rails MeiliSearch App Source code from GoRails](https://github.com/gorails-screencasts/meilisearch-rails-example/)
* [Ruby Gem](https://github.com/meilisearch/meilisearch-rails)
* [MeiliSearch in Production](https://docs.meilisearch.com/learn/cookbooks/running_production.html#step-2-run-meilisearch-as-a-service)
* [Understanding Filterable Attributes](https://docs.meilisearch.com/reference/api/filterable_attributes.html)
* [Master API Keys](https://docs.meilisearch.com/learn/security/master_api_keys.html)