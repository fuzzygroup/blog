---
layout: post
title: Accessing MariaDB without sudo on Ubuntu
category: mariadb
tags: ["mariadb", "ubuntu", "sudo"]
---
So I'm finally able to get back to trying Rails development on my Ubuntu box and the first real error I found was when I tried to create a database -- I couldn't get into MariaDB unless I used sudo -- very, very odd.  I found the solution on [Ubuntu Forums](https://ubuntuforums.org/showthread.php?t=2275033):

    sudo mysql -u root
    use mysql;
    update user set plugin='' where User='root';
    flush privileges;
    \q

Honestly I have no idea what this is.  Sigh.  Oh well it works and it is documented at least.