---
layout: post
title: AuthLogic Tutorial
category: authentication
tags: ["rails", "ruby", "authlogic"]

---
Disclaimer: Before you follow this, if you're using Rails 5, then make damn sure that AuthLogic supports Rails 5.  As of a few weeks ago (mid july 2016) they didn't and trying to get it to work was an absolute sh*t show (and I say that with regret because I bloody well love authlogic).

This blog post is a quick tutorial on how to do authentication with [AuthLogic](https://github.com/binarylogic/authlogic).  Here’s what you need to do:

1.  Add authlogic into the gem file.
2.  Run bundle install
3.  Create a user model. Without this you’ll find that AuthLogic dies with Uninitialized Constant User errors on @user_session = UserSession.new.  There is a low level assumption that a model named user exists.  Fill in the right code here.
4.  Create a UserSessions controller.  Add it to routes.  Fill in the right code here.
5.  Create a user_session model.  Remember it has to inherit from UserSession < Authlogic::Session::Base not ActiveRecord::Base.  Fill in the right code here.
6.  Create a new view in /app/views/user_sessions to capture the username / email and password.
7.  Add the routes for /login and /logout i.e. <br/>
match 'login' => 'user_sessions#new', :as => :login, via: [:get, :post]<br/>
match 'logout' => 'user_sessions#destroy', :as => :logout, via: [:get, :post]<br/>
8.  Add def current_user and def current_user_session to ApplicationController.
9.  Add helper_method :current_user_session, :current_user to ApplicationController to allow these to be called from views.

And Bob’s your uncle.  Unlike Devise which is very, very encapsulated, AuthLogic is discrete — you have to have all these steps and without them it flat out will not work.  With them, however, AuthLogic is outstanding and the ability to get under the hood and do whatever you need with authentication simply cannot be beat.