---
layout: post
title: When rails credentials:edit Won't Save Your Credentials
category: rails
tags: ["rails", "credentials"]
---
{:.center}
![IMG_1474.jpeg](/blog/assets/IMG_1474.jpeg)

Rails 5.2 and Rails 6 introduced the idea of rails credentials:edit which allowed you to create encrypted credentials that stored things like API keys with commands like this:

    rails credentials:edit --environment development

What this does is create a file in config/credentials and edit and then (theoretically) save it, in an encrypted state.

I was recently using this on a Rails 6 application and I found that no matter what I did my credentials **did not** save.  A [colleague](https://eethomp.github.io/) of mine traced this to an issue with the $EDITOR variable I had set via this [Stack Overflow post](https://stackoverflow.com/questions/48539408/rails-5-2-encrypted-credentials-not-saving):

> I had this problem in rails 5.2.0 using textmate as the editor. It turns out the credentials file must be closed after save in order for the changes to persist.

My $EDITOR variable was set to:

    echo $EDITOR
    /usr/local/bin/mate

The solution was actually simple -- specify the editor before you run the command (and use VI as the editor) so:

    EDITOR=vi rails credentials:edit --environment development

And bada bing, bada boom -- my credentials were actually saved.

## See Also

* [Big Binary](https://blog.bigbinary.com/2019/07/03/rails-6-adds-support-for-multi-environment-credentials.html)
* [Stack Overflow](https://stackoverflow.com/questions/50435193/cannot-edit-rails-credentials-rails-5-2)
* [CedarCode](https://medium.com/cedarcode/rails-5-2-credentials-9b3324851336)