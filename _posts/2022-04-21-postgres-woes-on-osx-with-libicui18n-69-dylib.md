---
layout: post
title: Postgres Woes on OSX with libicui18n.69.dylib
date: 2022-04-21 09:33 -0400
category: postgres
tags: ["postgres", "osx"]
---
{% pizzaforukraine  %}

Perhaps it is me but I've found that homebrew seems to give more errors and take longer than it used it.  I just got hit with this error:

		/usr/local/opt/postgresql/bin/postgres -v
		dyld: Library not loaded: /usr/local/opt/icu4c/lib/libicui18n.69.dylib
		  Referenced from: /usr/local/opt/postgresql/bin/postgres
		  Reason: image not found
			
Digging into the OSX postgres log here:

    tail -n 100 /usr/local/var/log/postgresql.log
		
helped but didn't tell me what to do.

An awful lot of googling didn't find me an answer but then I [hit on](https://stackoverflow.com/questions/53828891/dyld-library-not-loaded-usr-local-opt-icu4c-lib-libicui18n-62-dylib-error-run):

    brew reinstall icu4c
		
That churned for a bit but then declared a decisive victory:

		🍺  /usr/local/Cellar/maxima/5.46.0: 2,842 files, 119.1MB
		==> Running `brew cleanup maxima`...
		Removing: /usr/local/Cellar/maxima/5.45.1_4... (2,774 files, 118.4MB)
		Removing: /Users/sjohnson/Library/Caches/Homebrew/maxima--5.45.1_4... (38.3MB)
		==> Upgrading postgresql
		  13.2_2 -> 14.2_1

		==> Installing dependencies for postgresql: krb5
		==> Installing postgresql dependency: krb5
		==> Pouring krb5--1.19.3.catalina.bottle.tar.gz
		🍺  /usr/local/Cellar/krb5/1.19.3: 162 files, 5.2MB
		==> Installing postgresql
		==> Pouring postgresql--14.2_1.catalina.bottle.tar.gz
		==> Caveats
		To migrate existing data from a previous major version of PostgreSQL run:
		  brew postgresql-upgrade-database

		This formula has created a default database cluster with:
		  initdb --locale=C -E UTF-8 /usr/local/var/postgres
		For more details, read:
		  https://www.postgresql.org/docs/14/app-initdb.html

		To restart postgresql after an upgrade:
		  brew services restart postgresql
		Or, if you don't want/need a background service you can just run:
		  /usr/local/opt/postgresql/bin/postgres -D /usr/local/var/postgres
		==> Summary
		🍺  /usr/local/Cellar/postgresql/14.2_1: 3,305 files, 45.5MB
		==> Running `brew cleanup postgresql`...
		Removing: /usr/local/Cellar/postgresql/13.2_2... (3,218 files, 42.6MB)
		Removing: /Users/sjohnson/Library/Caches/Homebrew/postgresql--13.2_2... (11.1MB)
		==> Checking for dependents of upgraded formulae...
		==> No broken dependents found!
		==> Caveats
		==> postgresql@11
		This formula has created a default database cluster with:
		  initdb --locale=C -E UTF-8 /usr/local/var/postgresql@11
		For more details, read:
		  https://www.postgresql.org/docs/11/app-initdb.html

		postgresql@11 is keg-only, which means it was not symlinked into /usr/local,
		because this is an alternate version of another formula.

		If you need to have postgresql@11 first in your PATH, run:
		  echo 'export PATH="/usr/local/opt/postgresql@11/bin:$PATH"' >> ~/.zshrc

		For compilers to find postgresql@11 you may need to set:
		  export LDFLAGS="-L/usr/local/opt/postgresql@11/lib"
		  export CPPFLAGS="-I/usr/local/opt/postgresql@11/include"

		For pkg-config to find postgresql@11 you may need to set:
		  export PKG_CONFIG_PATH="/usr/local/opt/postgresql@11/lib/pkgconfig"


		To restart postgresql@11 after an upgrade:
		  brew services restart postgresql@11
		Or, if you don't want/need a background service you can just run:
		  /usr/local/opt/postgresql@11/bin/postgres -D /usr/local/var/postgresql@11
		==> maxima
		Emacs Lisp files have been installed to:
		  /usr/local/share/emacs/site-lisp/maxima
		==> postgresql
		To migrate existing data from a previous major version of PostgreSQL run:
		  brew postgresql-upgrade-database

		This formula has created a default database cluster with:
		  initdb --locale=C -E UTF-8 /usr/local/var/postgres
		For more details, read:
		  https://www.postgresql.org/docs/14/app-initdb.html

		To restart postgresql after an upgrade:
		  brew services restart postgresql
		Or, if you don't want/need a background service you can just run:
		  /usr/local/opt/postgresql/bin/postgres -D /usr/local/var/postgres

I followed this up with:

    echo 'export PATH="/usr/local/opt/postgresql@11/bin:$PATH"' >> ~/.zshrc

And then to confirm success:

    brew services restart postgresql@11
		
And, once again, I have postgres running locally.  