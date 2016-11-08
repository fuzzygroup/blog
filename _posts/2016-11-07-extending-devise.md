---
layout: post
title: Extending Devise
category: rails
tags ["rails", "devise", "login", "authorization"]
---
Devise is now close to a standard in the Rails community.  And, despite some concerns that I generally have about it, Devise is a solid piece of software with much to recommend it.  My concerns are always around extending it and I thought that perhaps I should actually document how to extend Devise so I don't have to rely on their [wiki](https://github.com/plataformatec/devise/wiki) (which is oddly incorrect in places) -- expand it to all pages and look at the number of things all named 

# Branching to Custom Urls After Specific Actions

The simple way for this is to define a custom action in ApplicationController.  Example:

    def after_sign_in_path_for(resource) 
      return "/users"
    end
    
Theoretically any path should be able to be returned
    
# Generating Your Own Controllers

While the after_sign_in_path_for approach works the problem is that if you want to do something really custom then you need your own controller.  Let's say you want to deeply hook into login and registration.  Then you need to generate new controllers as follows:

    rails generate devise:controllers users
    
This will produce this output:

    Running via Spring preloader in process 59017
    create  app/controllers/users/confirmations_controller.rb
    create  app/controllers/users/passwords_controller.rb
    create  app/controllers/users/registrations_controller.rb
    create  app/controllers/users/sessions_controller.rb
    create  app/controllers/users/unlocks_controller.rb
    create  app/controllers/users/omniauth_callbacks_controller.rb    

Now that's more than we actually want.  There are options that let you specify exactly which controller you want but I didn't have a lot of luck making them work so I just deleted what I didn't want.  

Usually you find out that you need this after you've already gotten Devise working and have a custom set of routes.  In my case I had this set of routes:

    devise_for :users, path: "auth", path_names: {sign_in: 'login', 
                                                  sign_out: 'logout',
                                                  password: 'secret', 
                                                  confirmation: 'verification', 
                                                  unlock: 'unblock', 
                                                  registration: 'register', 
                                                  sign_up: 'cmon_let_me_in'}
    
After generating my controllers, here's how I changed the routes above to integrate:
    
    devise_for :users, path: "auth", controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    },
    path_names:  {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'secret',
      confirmation: 'verification',
      unlock: 'unblock',
      registration: 'register',
      sign_up: 'cmon_let_me_in'
    }

Now once you generate your controllers, Devise will give you a nice stub showing that you need to uncomment an action to revise it and super is there indicating that you can mostly just inherit the functionality you want.  You can then add your own code either before or after the super.  If you're uncomfortable with super then you can always go and get the full devise controller code from Github:

* [Registrations Controller](https://github.com/plataformatec/devise/blob/master/app/controllers/devise/registrations_controller.rb)
* [Sessions Controller](https://github.com/plataformatec/devise/blob/master/app/controllers/devise/sessions_controller.rb)

Note: In case it wasn't obvious the registrations controller creates accounts and the sessions controller creates logins.  Both are restful so, for example, sessions#new is the login form and sessions#create is the actual login itself.