---
layout: post
title: A Bash Function for the 2 AM Blind Deploy
category: bash
tags: ["devops", "deploy", "bash"]
description: When you know that you're going to be woken up in the middle of the night with a new service, the smart thing is to make sure that your deploy routines take care of not only error checking but making it very obvious if there's a problem.
---
I'm doing a lot more bash scripting these days -- ever since I opted to write my new deployer, dockerano, in Bash.  Tackling something significant in Bash has absolutely forced me, 20 years plus after I started using it, to finally start to understand it.  By no means do I feel that I have a good handle on Bash -- I'm still heavily reliant on [ShellCheck](http://fuzzyblog.io/blog/bash/2017/07/17/improving-your-bash-scripting-with-shellcheck.html) but I can actually do things with Bash that I feel somewhat confident about.

Here's a bash function that I extended this morning to add OSX specific audio output after a deploy.  The problem at hand is what I call the "2 AM sleep blind deploy".  We all know what this is: 

* You get a downtime alert on a service
* You blearily struggle out of bed at 2 am and fix the code
* You deploy it and you want to get back to bed as soon as possible
* Something goes wrong with the deploy and you get alerted again just **after** you get back in bed
* Lather, rinse, repeat until it is either fixed or morning comes

I'm getting close to release on my much obliquely referenced new product and so deploy issues are now first and foremost in my mind. My task for this morning was to add audio output to my deployer **when** there is a failure.  Here's what I did:

1.  My first task was to recognize that this only ever had to run on OSX as I develop and deploy from OSX.
2.  There were two options - afplay and say.  The **afplay** utility plays any media file from the command line and that's good but a loud noise alone won't tell me *what* is down just that *something* is down.  And while this works well -- once upon a time, I used to trigger Billy Idol's White Wedding whenever something was down -- this time I wanted something a bit more nuanced and information rich.  I could also use the osx command **say** to speak anything including the url which is failing.  Here is a [Stack Overflow](https://superuser.com/questions/298201/how-can-i-play-a-sound-from-the-command-line-in-mac-os-x) on the options.
3.  An sample of this is "say http://foo.com/ is down" which will be played thru the speaker.

My new tech stack is 7 different services each of which provides a simple health check api but since the obviously differ for each service, I needed a way to store this on a per service basis which I opted to do with a .dockerano_post_deploy_check_urls file in the root directory of each project.  This file can store as many urls as are needed and it will be looped over by the bash script.  Given that most of the site needs to work in both http and https and with www and non www variants, I didn't want a single check url.  If you allow for both https and http and non www and www variants, that amounts to 4 urls:

* http://foo.com/health
* http://www.foo.com/health
* https://foo.com/health
* https://www.foo.com/health

And, yes, this may be overkill but it is all too easy for almost anything to break so I would argue that the right thing to do is be aggressive in your testing.

Here's the bash function I wrote for this with the addition of say:

    function verify_site_is_up_after_post_deploy() {
      sleep 5
      IFS=$'\n' read -d '' -r -a site_urls < .dockerano_post_deploy_check_urls  
  
      for site_url in "${site_urls[@]}"; do
        echo "  Processing url: $site_url"
        if curl --output /dev/null --silent --head --fail "$site_url"; then
          status_message_good "$url exists; deploy worked"
        else
          status_message_bad "$url DOES NOT EXIST; DEPLOY FAILURE!!!!"
          say "$url is DOWN!"
        fi
    
      done
    }

I adapted the code above based on this  [source](https://unix.stackexchange.com/questions/148985/how-to-get-a-response-from-any-url).