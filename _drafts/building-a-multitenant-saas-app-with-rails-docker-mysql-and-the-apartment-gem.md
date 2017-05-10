---
layout: post
title: Building a Multitenant SAAS App with Rails, Docker, MySQL and the Apartment Gem
category: rails
tags: ["rails", "saas", "mysql", "multitenant", "docker", "saas", "mysql"]
---
# SAAS and Provisioning

This document lays out the SAAS and provisioning aspects of SeiraWatch.  

# Types of SAAS Isolation

At the heart of any SAAS app is isolating one user's data from another.  There are several ways to do this but the simplest are:

* scoping
* schemaing
* separating

Scoping refers to bundling a user_id or account_id parameter with every single query so that you are always injecting the isolation with every query.  There are several disadvantages to this:

* Assumes that every db query is ActiveRecord and can be automagically done
* Eliminates straight sql or pushes it down to the user
* If something goes wrong User A gets access to User B's data
* Adds a tricky bit of Rails magic to what is literally the most complex part of your application (storage)
* Pushes performance issues right onto the developer since every index has to incorporate user_id or account_id as well as all othe rthings
* The core db will grow in size infiniitely leading to an ever more costly database server

Schemaing means using the ability of Postgres to run multiple schemas per physical database.  This is dramatically better than scoping but also has disadvantages:

* Ties you irrevocably to Postgres
* The core db will grow in size infiniitely leading to an ever more costly database server

Separating means just what it sounds -- every user or account gets a **separate** database.  This is the approach that WordPress uses and its hard to argue with the sucess of WordPress.  While everything has its issues, I like the disavantages here best of all:

* More expensive since it means more physical databases but this is 2017 and we're up to 64 bit servers now; we can get past this.
* In a broken up, non-monolith this is intimidating to implement but its actually pretty easy once you get your head around it

# Provisioning Approach

In order to make the provisioning work we need to rely on the Apartment gem.  Apartment is a multitenancy gem which allows subdomain based tenancy so we can have a domain structure like this:

www.seirawatch.com - the site
nickjj.seirawatch.com - nick's account
fuzzygroup.seirawatch.com - scott's account
...

Each new customer will get to register a username and that will become their subdomain that they log in by.  We will end up running one seira_watch_web_app container which can be autoscaled (since each database connection is separate) for load and we only need to run enough initial capacity that at least one instance is always available.

The way that the Apartment gem works is by changing the database it is using on the fly automatically based on the subdomain.  Here's a peek at the logs from a test application:

    # when I visited blog_1_development.lvmh.me:3000 (I started puma with -b lvmh.me:3000)
    Started GET "/" for 127.0.0.1 at 2017-04-23 23:24:19 -0400
       (0.1ms)  use `apartment_development`
       (0.2ms)  SELECT DATABASE() as db
       (0.1ms)  use `blog_1_development`
    Processing by Rails::WelcomeController#index as HTML
      Parameters: {"internal"=>true}
      Rendering /Users/sjohnson/.rvm/gems/ruby-2.3.1/gems/railties-5.0.2/lib/rails/templates/rails/welcome/index.html.erb
      Rendered /Users/sjohnson/.rvm/gems/ruby-2.3.1/gems/railties-5.0.2/lib/rails/templates/rails/welcome/index.html.erb (4.5ms)
    Completed 200 OK in 11ms (Views: 7.1ms | ActiveRecord: 0.0ms)

      # when I visited foo.lvmh.me:3000 (I started puma with -b lvmh.me:3000)
       (0.5ms)  use `apartment_development`
    Started GET "/" for 127.0.0.1 at 2017-04-23 23:24:23 -0400
       (0.6ms)  use `apartment_development`
       (0.3ms)  SELECT DATABASE() as db
       (0.2ms)  use `foo`
    Processing by Rails::WelcomeController#index as HTML
      Parameters: {"internal"=>true}
      Rendering /Users/sjohnson/.rvm/gems/ruby-2.3.1/gems/railties-5.0.2/lib/rails/templates/rails/welcome/index.html.erb
      Rendered /Users/sjohnson/.rvm/gems/ruby-2.3.1/gems/railties-5.0.2/lib/rails/templates/rails/welcome/index.html.erb (3.3ms)
    Completed 200 OK in 9ms (Views: 6.0ms | ActiveRecord: 0.0ms)

## Adding an API from Another Monolith Component

The way that Apartment works is that has a call:

> Apartment::Tenant.create(tenant_name)

what you invoke in order to create the "tenancy" database (think subdomain) and this either runs migrations or uses schema.rb to create a new database.  The problem is that if you're NOT building a monolith you are running in a context AWAY from the schema you need to clone.  The solution is two fold:

* Add an api for provisioning to the SAAS app which allows for two calls: create_db and add_user
* The create_db call takes a single, unique, username, a fully validated string and then invokes Apartment::Tenant.create
* The add_user method takes all the params for the user instance that we want on the model and builds the user_instance

This will allow a user to:

* sign up at the web site (or commerce portion) if I decide to decouple signup and commerce from the home page
* goto the subdomain and be automatically prompted for login 
* normal cookie based login approaches will preserve the login for the period of time of the cookie
* allows normal development to continue with something like bundle exec rails s -p3010 -b lvh.me and still allow the right database to be selected when I goto nickjj.lvh.me:3010
* should work brilliantly with Docker as a deployment tech and allow Docker to be used to test locally the entire stack

Issues:

* We need to block the common domains that we don't want a user to register like www, help, search, admin, etc (this can be done when the username is created with a Rails validator)
* Exactly how we let fuzzygroup into the SAAS container but not www is unclear but I would expect that's an nginx proxying thing

# Thoughts?

# References

* [Apartment Gem](https://github.com/influitive/apartment)
* [MultiTenant Gem](https://github.com/wireframe/multitenant)
* [MultiTenant Blog Post](http://codecrate.com/2011/03/multitenant-locking-down-your-app-and.html)
* [Quora](https://www.quora.com/How-can-I-operate-a-DB-model-for-a-Rails-multi-tenant-application-with-a-multiple-database-model)
* [ActiveRecord-Multi-Tenant](https://github.com/citusdata/activerecord-multi-tenant)
* [ActsAsTenant](https://github.com/ErwinM/acts_as_tenant)
* [Blog Post About Apartment](https://influitive.io/our-multi-tenancy-journey-with-postgres-schemas-and-apartment-6ecda151a21f)

# Creating a Tenant

> Apartment::Tenant.create('fuzzygroup5')

# The Initializer

Shown below is the apartment.rb initializer.  The changes needed to enable db level tenancy are indicated by **jsj** in the comments.

    # You can have Apartment route to the appropriate Tenant by adding some Rack middleware.
    # Apartment can support many different "Elevators" that can take care of this routing to your data.
    # Require whichever Elevator you're using below or none if you have a custom one.
    #
    # require 'apartment/elevators/generic'
    # require 'apartment/elevators/domain'
    require 'apartment/elevators/subdomain'
    # require 'apartment/elevators/first_subdomain'

    #
    # Apartment Configuration
    #
    Apartment.configure do |config|

      # Add any models that you do not want to be multi-tenanted, but remain in the global (public) namespace.
      # A typical example would be a Customer or Tenant model that stores each Tenant's information.
      #
      # config.excluded_models = %w{ Tenant }

      # In order to migrate all of your Tenants you need to provide a list of Tenant names to Apartment.
      # You can make this dynamic by providing a Proc object to be called on migrations.
      # This object should yield either:
      # - an array of strings representing each Tenant name.
      # - a hash which keys are tenant names, and values custom db config (must contain all key/values required in database.yml)
      #
      # config.tenant_names = lambda{ Customer.pluck(:tenant_name) }
      # config.tenant_names = ['tenant1', 'tenant2']
      # config.tenant_names = {
      #   'tenant1' => {
      #     adapter: 'postgresql',
      #     host: 'some_server',
      #     port: 5555,
      #     database: 'postgres' # this is not the name of the tenant's db
      #                          # but the name of the database to connect to before creating the tenant's db
      #                          # mandatory in postgresql
      #   },
      #   'tenant2' => {
      #     adapter:  'postgresql',
      #     database: 'postgres' # this is not the name of the tenant's db
      #                          # but the name of the database to connect to before creating the tenant's db
      #                          # mandatory in postgresql
      #   }
      # }
      # config.tenant_names = lambda do
      #   Tenant.all.each_with_object({}) do |tenant, hash|
      #     hash[tenant.name] = tenant.db_configuration
      #   end
      # end
      #
      
      # jsj - this needed to be turned OFF 
      ###config.tenant_names = lambda { ToDo_Tenant_Or_User_Model.pluck :database }

      #
      # ==> PostgreSQL only options

      # Specifies whether to use PostgreSQL schemas or create a new database per Tenant.
      # The default behaviour is true.
      #
      # config.use_schemas = true
  
      # jsj - this needed to be set to false
      # required for mysql / Rails 5:
      # https://github.com/influitive/apartment/issues/345#issuecomment-258733219
      config.use_schemas = false

      # Apartment can be forced to use raw SQL dumps instead of schema.rb for creating new schemas.
      # Use this when you are using some extra features in PostgreSQL that can't be respresented in
      # schema.rb, like materialized views etc. (only applies with use_schemas set to true).
      # (Note: this option doesn't use db/structure.sql, it creates SQL dump by executing pg_dump)
      #
      # config.use_sql = false

      # There are cases where you might want some schemas to always be in your search_path
      # e.g when using a PostgreSQL extension like hstore.
      # Any schemas added here will be available along with your selected Tenant.
      #
      # config.persistent_schemas = %w{ hstore }

      # <== PostgreSQL only options
      #

      # By default, and only when not using PostgreSQL schemas, Apartment will prepend the environment
      # to the tenant name to ensure there is no conflict between your environments.
      # This is mainly for the benefit of your development and test environments.
      # Uncomment the line below if you want to disable this behaviour in production.
      #
      # config.prepend_environment = !Rails.env.production?
    end

    # Setup a custom Tenant switching middleware. The Proc should return the name of the Tenant that
    # you want to switch to.
    # Rails.application.config.middleware.use 'Apartment::Elevators::Generic', lambda { |request|
    #   request.host.split('.').first
    # }

    # Rails.application.config.middleware.use 'Apartment::Elevators::Domain'
    
    # jsj - this needed to be set
    Rails.application.config.middleware.use 'Apartment::Elevators::Subdomain'
    # Rails.application.config.middleware.use 'Apartment::Elevators::FirstSubdomain'
    
