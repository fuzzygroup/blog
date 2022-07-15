---
layout: post
title: Generating Permalinks in Rails Apps
date: 2022-07-12 12:29 -0400
category: rails
tags: ["rails"]
---
If you are authoring a Rails app that aims to have public url persistence then you likely do not want to use auto-incrementing IDs to represent public things for your app.  For example:

    https://foo.com/pull_quotes/1024

tells the visitor that there are at least 1024 things and that they can likely go up and down that number to see all the data in your site.  A permalink, a term from the blogging world, replaces that id number with a string like:

    https://foo.com/pull_quotes/dfd2349
    
The rest of this post documents what you need to do to every model to support this.

## Model Level Changes

The first thing to realize is that NOT every model needs this.  You only need this for publicly viewing, linked to models.  Think your primary model, your user record and so on.

Here's what you need to do (code examples below):

1. Add a token field to every model.  Call the field which stores your unique identifier *token*.  It could be anything but use the same for every model.  This needs to be a string field with a unique index.
2. Add a before_create to every model called generate_token.
3. For multiple models, extract this into a concern.
4. Modify routes to use tokens.
5. Change the Controller set_ method.

Each of these is discussed below.

### Add a Token Field to Each Model 

    rails g migration add_token_to_pull_quotes
    
    class AddTokenToPullQuotes < ActiveRecord::Migration[7.0]
      def change
        add_column :pull_quotes, :token, :string, null:false
        add_index :pull_quotes, :token, unique: true
      end
    end
    
### We're Skipping Straight to the Concern

Once you have this in one place, I can absolutely guarantee that you're going to use it multiple places so let's simply add it as a concern; DRY is still a thing in Rails.

    module Tokenable
      extend ActiveSupport::Concern
    
      included do
        before_create :generate_token
      end
      
      def to_param
        token
      end
    
      protected
    
      def generate_token
        self.token = loop do
          random_token = SecureRandom.urlsafe_base64(nil, false)
          break random_token unless self.class.exists?(token: random_token)
        end
      end
      
    end
    
Add this to any model you want to use tokens in with the line:

    include Tokenable
    
at the top of the class file.

### Routes

Ah routing, how I love thee and simultaneously hate thee with the passion of a thousand dying suns.

Here's what our routing looks like before the tokens are added:

        pull_quotes GET    /pull_quotes(.:format)                                                                            pull_quotes#index
                    POST   /pull_quotes(.:format)                                                                            pull_quotes#create
     new_pull_quote GET    /pull_quotes/new(.:format)                                                                        pull_quotes#new
    edit_pull_quote GET    /pull_quotes/:id/edit(.:format)                                                                   pull_quotes#edit
         pull_quote GET    /pull_quotes/:id(.:format)                                                                        pull_quotes#show
                    PATCH  /pull_quotes/:id(.:format)                                                                        pull_quotes#update
                    PUT    /pull_quotes/:id(.:format)                                                                        pull_quotes#update
                    DELETE /pull_quotes/:id(.:format)                                                                        pull_quotes#destroy
                           /*path(.:format)                                                                                  pull_quotes#index
                           
And here's the change that is needed:

                             pull_quotes GET    /pull_quotes(.:format)                                                                            pull_quotes#index
                                         POST   /pull_quotes(.:format)                                                                            pull_quotes#create
                          new_pull_quote GET    /pull_quotes/new(.:format)                                                                        pull_quotes#new
                         edit_pull_quote GET    /pull_quotes/:token/edit(.:format)                                                                pull_quotes#edit
                              pull_quote GET    /pull_quotes/:token(.:format)                                                                     pull_quotes#show
                                         PATCH  /pull_quotes/:token(.:format)                                                                     pull_quotes#update
                                         PUT    /pull_quotes/:token(.:format)                                                                     pull_quotes#update
                                         DELETE /pull_quotes/:token(.:format)                                                                     pull_quotes#destroy
                                                /*path(.:format)                                                                                  pull_quotes#index
                                                
Even though I joke about Rails Routes, the above routes really shows the power of the rails routing layer.  Here's the only change that was needed:

Before:

    resources :pull_quotes
    
After:

    resources :pull_quotes, param: :token

Just adding that little bit of code tells routing exactly what to do.

### Change the Controller set_whatever Method

Most rails apps now use a set_whatever style method to handle getting the instance variable for a view.   That now needs to look as follows:

    def set_pull_quote
      @pull_quote = PullQuote.where(token: params[:token]).first
    end