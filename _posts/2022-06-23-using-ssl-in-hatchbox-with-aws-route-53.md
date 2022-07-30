---
layout: post
title: Using SSL in HatchBox with AWS Route 53
date: 2022-06-23 03:01 -0400
category: rails
tags: ["rails", "hatchbox", "aws", "route53", "cartazzi"]
---
{% pizzaforukraine  %}

HatchBox continues to be my favorite tool for Rails deployment hands down.  And this includes Dockarno -- my own Bash based Docker deployment tool.  When something you pay for replaces something you wrote yourself, that's a sign of its very, very strong goodness.

I just used HatchBox to support SSL wildcard deployment for something I'm building and the process was a tad bit tricky so I thought I'd write it up.

HatchBox has excellent built in SSL support using Let's Encrypt but when you use wildcard SSL, you get asked for the Route 53 Key and the Route 53 secret.  Here's how you get those:

## On AWS, in Route 53

In Route 53, make sure you have *.domain.extension defined to allow it to be wildcard.  

## On AWS, in IAM

In the IAM console, you need to:

* Add a user
* Add that user to a group
* Add a JSON policy document 

Here is the JSON policy that you need to add:

    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": "route53:GetChange",
                "Resource": "arn:aws:route53:::change/*"
            },
            {
                "Effect": "Allow",
                "Action": "route53:ChangeResourceRecordSets",
                "Resource": "arn:aws:route53:::hostedzone/*"
            },
            {
                "Effect": "Allow",
                "Action": "route53:ListHostedZonesByName",
                "Resource": "*"
            },
            {
                "Effect": "Allow",
                "Action": "route53:ListHostedZones",
                "Resource": "*"
            },
            {
                "Effect": "Allow",
                "Action": "route53:ListResourceRecordSets",
                "Resource": "*"
            }
        ]
    }
    

After you've added that user then you will be prompted with the normal AWS access key / secret key.  Save the credentials and then add them to HatchBox.  HatchBox will then got thru an API session with AWS and validate the key.

## My Experience and Chris's Brilliant Work

I started from documentation I found online (see below) that turned out to be incomplete.  When I examined the HatchBox log for the transaction, I saw this:

    -----> Connecting to SOMETHING3-lb (138.68.227.244 port 22) as root

    Uploaded /etc/logrotate.d/acme.sh

    Executing 'curl https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh | sh -s -- --install-online'
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed

      0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
    100  211k  100  211k    0     0  4139k      0 --:--:-- --:--:-- --:--:-- 4139k
    [Thu Jun 23 06:55:55 UTC 2022] Installing from online archive.
    [Thu Jun 23 06:55:55 UTC 2022] Downloading https://github.com/acmesh-official/acme.sh/archive/master.tar.gz
    [Thu Jun 23 06:55:56 UTC 2022] Extracting master.tar.gz
    [Thu Jun 23 06:55:56 UTC 2022] It is recommended to install socat first.
    [Thu Jun 23 06:55:56 UTC 2022] We use socat for standalone server if you use standalone mode.
    [Thu Jun 23 06:55:56 UTC 2022] If you don't use standalone mode, just ignore this warning.
    [Thu Jun 23 06:55:56 UTC 2022] Installing to /root/.acme.sh
    [Thu Jun 23 06:55:56 UTC 2022] Installed to /root/.acme.sh/acme.sh
    [Thu Jun 23 06:55:56 UTC 2022] Installing alias to '/root/.bashrc'
    [Thu Jun 23 06:55:56 UTC 2022] OK, Close and reopen your terminal to start using acme.sh
    [Thu Jun 23 06:55:56 UTC 2022] Installing cron job
    53 0 * * * "/root/.acme.sh"/acme.sh --cron --home "/root/.acme.sh" > /dev/null
    [Thu Jun 23 06:55:56 UTC 2022] Good, bash is found, so change the shebang to use bash as preferred.
    [Thu Jun 23 06:55:57 UTC 2022] OK
    [Thu Jun 23 06:55:57 UTC 2022] Install success!

    Executing '~/.acme.sh/acme.sh --set-default-ca --server letsencrypt'
    [Thu Jun 23 06:55:58 UTC 2022] Changed default CA to: https://acme-v02.api.letsencrypt.org/directory

    Executing 'AWS_ACCESS_KEY_ID='DELETEDCOZIMNOTSTUPID' AWS_SECRET_ACCESS_KEY='DELETEDCOZIMSTILLNOTSTUPID' AWS_DNS_SLOWRATE=1 ~/.acme.sh/acme.sh --issue -d *.SOMETHING.com -d SOMETHING.com --dns dns_aws --force --log'
    [Thu Jun 23 06:56:00 UTC 2022] Using CA: https://acme-v02.api.letsencrypt.org/directory
    [Thu Jun 23 06:56:00 UTC 2022] Multi domain='DNS:*.SOMETHING.com,DNS:SOMETHING.com'
    [Thu Jun 23 06:56:00 UTC 2022] Getting domain auth token for each domain
    [Thu Jun 23 06:56:02 UTC 2022] Getting webroot for domain='*.SOMETHING.com'
    [Thu Jun 23 06:56:02 UTC 2022] Getting webroot for domain='SOMETHING.com'
    [Thu Jun 23 06:56:02 UTC 2022] Adding txt value: fjN5n0AgRpvyYlqedjL-8KLS9rrgEzVAWdbb9gfh1kY for domain:  _acme-challenge.SOMETHING.com
    [Thu Jun 23 06:56:03 UTC 2022] Getting existing records for _acme-challenge.SOMETHING.com
    [Thu Jun 23 06:56:03 UTC 2022] Response error:
    SenderAccessDeniedUser: arn:aws:iam::835336135388:user/hatchboxdns2 is not authorized to perform: route53:ListResourceRecordSets on resource: arn:aws:route53:::hostedzone/Z1OSXVLV0259TW because no identity-based policy allows the route53:ListResourceRecordSets action427a3f8b-97ff-40fc-8079-3b2799e51463
    [Thu Jun 23 06:56:04 UTC 2022] Error add txt for domain:_acme-challenge.SOMETHING.com
    [Thu Jun 23 06:56:04 UTC 2022] Please check log file for more details: /root/.acme.sh/acme.sh.log

    -----> Command returned exit code 1

This is where Chris did is normally brilliant work.  By passing through the full response error (and building a user viewable log facility), I was able to see:

    SenderAccessDeniedUser: arn:aws:iam::835336135388:user/hatchboxdns2 is not authorized to perform: route53:ListResourceRecordSets on resource: arn:aws:route53:::hostedzone/Z1OSXVLV0259TW because no identity-based policy allows the route53:ListResourceRecordSets action427a3f8b-97ff-40fc-8079-3b2799e51463
    

And that told me I needed to add **route53:ListResourceRecordSets** to my JSON policy.

Outstanding!

## See Also

[This](https://docs.certifytheweb.com/docs/dns/providers/awsroute53/) was helpful but not complete and I had to update the JSON policy document per above.  The one in the article wasn't complete enough; it was missing the last two actions above.