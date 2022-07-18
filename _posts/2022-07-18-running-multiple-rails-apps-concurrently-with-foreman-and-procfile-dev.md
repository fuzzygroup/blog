---
layout: post
title: Running Multiple Rails Apps Concurrently with Foreman and Procfile.dev
date: 2022-07-18 09:15 -0400
category: rails
tags: ["rails", "foreman", "procfile"]
---
{:.center}
![Pizza](/blog/assets/pfu/289214624_134557099241886_3934308353915036057_n.jpeg)

{:.center}
Pizza courtesy of Pizza for Ukraine!

{:.center}
[Donate Now to Pizza for Ukraine](https://www.pizzaforukraine.com/)


As I've said, I build a lot of side projects and I really, really like the model of having:

> ALL MY APPS RUNNING CONCURRENTLY

I may be a scattered, distracted developer trying to do too damn much but that's my damn right.  And I have 64 gigs of RAM so why shouldn't I be this way.

What I want is to be able to switch from app to app and make changes.  This is important because some apps provide APIs which other apps rely on and having to figure out what thing is on what port, etc, is just plain distracting.

Foreman and Procfile.dev is a way around this but there's a major hitch in your getalong (as my Texas wife might say).

Here's a sample Procfile.dev for an app I'm building called Cartazzi which makes a developer's life easier:

    web: bin/rails server -p 5000
    css: yarn build:css --watch
    js: yarn build --reload
    # docker: docker-compose up
    
And here's a Profile.dev for another application called Poolwizard which helps you maintain your swimming pool:

    #web: bin/rails server -p $PORT
    web: bin/rails server -p 5700
    css: yarn build:css --watch
    js: yarn build --reload
    # docker: docker-compose up
    worker: bundle exec sidekiq

If you run Cartazzi and Poolwizard together then you're going to get crashes and here's the error:

    ❯ foreman start -f Procfile.dev
    09:11:53 web.1    | started with pid 72877
    09:11:53 css.1    | started with pid 72878
    09:11:53 js.1     | started with pid 72879
    09:11:53 worker.1 | started with pid 72881
    09:11:53 js.1     | yarn run v1.22.5
    09:11:53 css.1    | yarn run v1.22.5
    09:11:53 css.1    | $ tailwindcss --postcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/builds/application.css --watch
    09:11:53 js.1     | $ node esbuild.config.js --reload
    09:11:54 js.1     | node:events:371
    09:11:54 js.1     |       throw er; // Unhandled 'error' event
    09:11:54 js.1     |       ^
    09:11:54 js.1     |
    09:11:54 js.1     | Error: listen EADDRINUSE: address already in use :::5200
    09:11:54 js.1     |     at Server.setupListenHandle [as _listen2] (node:net:1306:16)
    09:11:54 js.1     |     at listenInCluster (node:net:1354:12)
    09:11:54 js.1     |     at Server.listen (node:net:1441:7)
    09:11:54 js.1     |     at buildAndReload (/Users/sjohnson/Sync/coding/rails/poolwizard/esbuild.config.js:54:6)
    09:11:54 js.1     |     at Object.<anonymous> (/Users/sjohnson/Sync/coding/rails/poolwizard/esbuild.config.js:100:3)
    09:11:54 js.1     |     at Module._compile (node:internal/modules/cjs/loader:1109:14)
    09:11:54 js.1     |     at Object.Module._extensions..js (node:internal/modules/cjs/loader:1138:10)
    09:11:54 js.1     |     at Module.load (node:internal/modules/cjs/loader:989:32)
    09:11:54 js.1     |     at Function.Module._load (node:internal/modules/cjs/loader:829:14)
    09:11:54 js.1     |     at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:76:12)
    09:11:54 js.1     | Emitted 'error' event on Server instance at:
    09:11:54 js.1     |     at emitErrorNT (node:net:1333:8)
    09:11:54 js.1     |     at processTicksAndRejections (node:internal/process/task_queues:83:21) {
    09:11:54 js.1     |   code: 'EADDRINUSE',
    09:11:54 js.1     |   errno: -48,
    09:11:54 js.1     |   syscall: 'listen',
    09:11:54 js.1     |   address: '::',
    09:11:54 js.1     |   port: 5200
    09:11:54 js.1     | }
    09:11:54 js.1     | error Command failed with exit code 1.
    09:11:54 js.1     | info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
    09:11:54 js.1     | exited with code 1
    09:11:54 system   | sending SIGTERM to all processes
    09:11:54 worker.1 | terminated by SIGTERM
    09:11:54 css.1    | exited with code 1
    09:11:54 web.1    | terminated by SIGTERM

The first time I looked at this, I saw the port error and I assumed that the error was the rails server because I **knew** that was running on a specific port.  The actual error though here is node -- which ISN'T EVEN IN THE Procfile.dev because it is run behind the scenes by yarn.

Here's the fix:

    #web: bin/rails server -p $PORT
    web: bin/rails server -p 5700
    css: yarn build:css --watch
    js: PORT=5701 yarn build --reload
    # docker: docker-compose up
    worker: bundle exec sidekiq

To understand this we need to put on our Unix underpinning's hat and think about this.  You have Yarn executing and running Node as a process.  Node inherits the environment variables that Yarn had which means if we set the PORT variable for Yarn then Node will inherit it.  

The convention I'm adopting is this:

> In all my Procfile.dev's, yarn build will get the port number of the Rails server + 1.

## Thank You

I didn't figure this out on my own, a fellow Rails guy on Twitter, [Kyle Keesling](https://twitter.com/@kylekeesling) told me that this should work.  That was enough for me to know that it could be figured out and to force me back into diagnostic mode.  Thanks Kyle!  Also Kyle is building a course on Stripe and Rails which looks good.  Check it out [here](https://store.kylekeesling.com/stripe-on-rails).

## See Also

* [Running Node on a Port](https://stackoverflow.com/questions/39472215/how-to-run-the-node-app-in-different-port-as-temporarily)