---
layout: post
title: Understanding SAML and SSO and Rails
category: saml
tags: ["sso", "saml", "rails", "ruby"]
---
When you grew up as a developer prior to the Internet, it used to be that technical information was hard to come by.  From my perspective one fo the most miraculous things about being a developer in 2016 is all you have to do is run across a reference to a technology and **wham** all the information that you want is at your finger tips.  So let's say you're browsing [Hacker News](http://news.ycombinator.com/) and you find a reference to [SAML](https://hn.algolia.com/?query=saml&sort=byPopularity&prefix&page=0&dateRange=all&type=story), [Security Assertion Markup Language](https://en.wikipedia.org/wiki/Security_Assertion_Markup_Language), you're just a search away from a deep dive into a topic.  And if you either find yourself interested in it or you have a personal reason to explore it like a wife who's favorite anti technology rant is about passwords (SAML is key to Single Sign On or SSO standards), then you're just a github away from messing with a cool technology.  That's why I'm writing today about SAML instead of my normal AWS / Ruby / Rails stuff.  But, not to worry, I'll bring it around to Ruby / Rails by the end.

# What is SAML ?

SAML is a standard for security, specifically, for building single sign on systems.  Originated in 2002, 

# Core SAML Concepts

Like almost all modern security concepts, SAML is oriented around roles.  There are three key roles: Principal, Identity Provider, Service Provider.

## Role 1: The Principal

The principal is very, very simple -- it is just the user.

## Role 2: The Identity Provider or IdP

The Identity Provider or IdP is the software against which the authentication request is performed.

## Role 3: The Service Provider or SP

The service provider is the software which talks to the IdP that requests and obtains an identity assertion i.e. the SAML Assertion described below.

## Bringing the Roles Together

This works as follows:

* A **principal** goes to a site somewhere on the Internet or an Intranet and wants access to a protected a resource.  This site is the **SP**.
* A mechanism of authentication is used -- typically this would be username / password but it could be multi-factor auth
* The SP requests and obtains an identity assertion from the identity provider or **IdP**. On the basis of this assertion, the service provider can make an access control decision – in other words it can decide whether to perform some service for the connected principal.  Before delivering the identity assertion to the SP, the IdP may request some information from the principal – such as a user name and password – in order to authenticate the principal.

Two sentences in the last bullet were cribbed directly from the Wikipedia article above

## The SAML Assertion

A SAML assertion is a bit of XML containing a packet of security information.  The general format looks like this:

    <saml:Assertion ...>
      ...
    </saml:Assertion>
    
I'm going to cheat here and blatantly cheat and quote wikipedia in case a subtle rewording of my writing interferes with the meaning:

> Loosely speaking, a relying party interprets an assertion as follows:

> Assertion A was issued at time t by issuer R regarding subject S provided conditions C are valid.

> SAML assertions are usually transferred from identity providers to service providers. Assertions contain statements that service providers use to make access-control decisions. Three types of statements are provided by SAML:

    Authentication statements
    Attribute statements
    Authorization decision statements
    Authentication statements assert to the service provider that the principal did indeed authenticate with the identity provider at a particular time using a particular method of authentication. Other information about the authenticated principal (called the authentication context) may be disclosed in an authentication statement.

> An attribute statement asserts that a subject is associated with certain attributes. An attribute is simply a name-value pair. Relying parties use attributes to make access-control decisions.

> An authorization decision statement asserts that a subject is permitted to perform action A on resource R given evidence E. The expressiveness of authorization decision statements in SAML is intentionally limited. More-advanced use cases are encouraged to use XACML instead.

# Caveats

SAML is an old school, big system type of technology.  Its supported although not widely and there seem to be differing opinions as to how to support it and interoperate correctly, in other words it is just like every other technology standard out there.

# How Does This Work with Rails?

Now let's pull this all around and talk about how you might use SAML in the context of a functioning rails app.  There are two basic approaches:

* Your rails app as a SAML client to something else (i.e. your rails app is the service provider or SP)
* Your rails app as the Identity Provider or IdP and other applications talk to you

Happily there are existing open source toolkits for both of these contexts.  

## Rails as an SP

If you want to authenticate thru something else then you likely want that built into your existing Rails authentication strategy.  There are toolkits for this as follows:

* [OmniAuth - SAML](https://github.com/omniauth/omniauth-saml)
* [Devise Saml Authenticatable](https://github.com/apokalipto/devise_saml_authenticatable)
* [Ruby-SAML](https://github.com/onelogin/ruby-saml)

The first two are tied to existing authentication tools in the Rails world and the last one is a generic SAML toolkit on top of which most things in the Ruby SAML world seem to be built.

## Rails as an IdP

While an IdP might be an LDAP system or another traditional authentication engine, there's no reason a Rails app itself can't speak SAML natively and be an IdP of its own.  In this case the toolkit you likely want to use is one of these two:

* [https://github.com/sportngin/saml_idp](https://github.com/sportngin/saml_idp)
* [https://github.com/lawrencepit/ruby-saml-idp](https://github.com/lawrencepit/ruby-saml-idp)

The lawrencepit gem is older and the sportngin gem appears to be a newer fork.  Unfortunately it seems as if the documentation on the sportngin gem is incorrect and you may need lawrencepit's documentation.  I'm still bringing up a functional IDP so I can't say definitively but there's a definite code smell of incorrectly made documentation in sportngin.  It should be noted though that sportngin has done a lot of work to make bringing up an IdP server better.  I'll hopefully update this blog post in the future when I have more concrete answers.  

# Understanding How to Build an IdP with Rails and ruby_idp

I took a stab at building a SAML system using ruby_idp and as part of that effort, I wrote the wiki page for [saml_idp](https://github.com/sportngin/saml_idp/wiki).  Honestly explaining things is the best way I've ever found to understand them so this is my give back to the community and my thanks to the author of saml_idp.

# General Advice

Unfortunately the documentation for all of these tools is, to put it mildly, on the sparse to incorrect side (example - using the sportngin gem, you can't include the controller per the docs, you have to inherit from it instead).  If you're going to do a SAML project based on any of these, you're going to need to:

* Read the standards documentation
* Read the gem source -- and I mean really read it
* Dig in and get your fingers dirty; don't be afraid to fork the gem
* Read the pull requests
* Read the open github issues; even unsolved issues make spark your thinking
* Read the closed github issues
* Read the tests; on projects like these, the tests more than anything else help you understand what parameters to use
* Look at the forks to see if there is anything newer that might help you
* If you're going down the IdP route you will really need to implement a saml client as well; this isn't surprising when you think about it