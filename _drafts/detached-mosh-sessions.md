---
layout: post
title: Detached Mosh Sessions
---
Mosh: You have a detached Mosh session on this server

pgrep mosh-server | grep -v $(ps -o ppid --no-headers $$) | xargs kill

https://stackoverflow.com/questions/17857733/how-do-i-reattach-to-a-detached-mosh-session