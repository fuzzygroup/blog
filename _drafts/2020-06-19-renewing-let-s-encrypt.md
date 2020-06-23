---
layout: post
title: Renewing Let's Encrypt
---
https://community.letsencrypt.org/t/renew-letsencrypt-certificate/34677/2

certbot renew
Requesting to rerun /usr/local/bin/certbot with root privileges...
Upgrading certbot-auto 1.3.0 to 1.5.0...
Replacing certbot-auto...
Creating virtual environment...
Installing Python packages...
Installation succeeded.
Saving debug log to /var/log/letsencrypt/letsencrypt.log

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Processing /etc/letsencrypt/renewal/www.covidnearme.org.conf
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Cert is due for renewal, auto-renewing...
Plugins selected: Authenticator webroot, Installer None
Renewing an existing certificate
Performing the following challenges:
http-01 challenge for covidnearme.org
http-01 challenge for www.covidnearme.org
Using the webroot path /home/deploy/.letsencrypt for all unmatched domains.
Waiting for verification...
Cleaning up challenges

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
new certificate deployed without reload, fullchain is
/etc/letsencrypt/live/www.covidnearme.org/fullchain.pem
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

Congratulations, all renewals succeeded. The following certs have been renewed:
  /etc/letsencrypt/live/www.covidnearme.org/fullchain.pem (success)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



# m h  dom mon dow   command
0 5 * * * certbot renew

certbot certificates
Requesting to rerun /usr/local/bin/certbot with root privileges...
[sudo] password for deploy:
Upgrading certbot-auto 1.4.0 to 1.5.0...
Replacing certbot-auto...
Creating virtual environment...
Installing Python packages...
Installation succeeded.
Saving debug log to /var/log/letsencrypt/letsencrypt.log

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Found the following certs:
  Certificate Name: cartazzi.com
    Serial Number: 46505a9230c713ffd0ebdabd7a08171ecab
    Domains: www.cartazzi.com cartazzi.com
    Expiry Date: 2020-07-05 12:47:02+00:00 (VALID: 16 days)
    Certificate Path: /etc/letsencrypt/live/cartazzi.com/fullchain.pem
    Private Key Path: /etc/letsencrypt/live/cartazzi.com/privkey.pem
  Certificate Name: covidnearmefoundation.org
    Serial Number: 356b28f296eebdb75e899d69f4807785344
    Domains: www.covidnearmefoundation.org covidnearmefoundation.org
    Expiry Date: 2020-08-04 20:21:46+00:00 (VALID: 46 days)
    Certificate Path: /etc/letsencrypt/live/covidnearmefoundation.org/fullchain.pem
    Private Key Path: /etc/letsencrypt/live/covidnearmefoundation.org/privkey.pem
  Certificate Name: netlabeler.com
    Serial Number: 4f4ee2c639fa5e6c631d305b4d11626bef6
    Domains: www.netlabeler.com netlabeler.com
    Expiry Date: 2020-07-05 12:42:55+00:00 (VALID: 16 days)
    Certificate Path: /etc/letsencrypt/live/netlabeler.com/fullchain.pem
    Private Key Path: /etc/letsencrypt/live/netlabeler.com/privkey.pem
  Certificate Name: scottsfeedfinder.com
    Serial Number: 315436fee264f84a95c8c0f57b2b2c5f54a
    Domains: www.scottsfeedfinder.com scottsfeedfinder.com
    Expiry Date: 2020-07-05 12:45:27+00:00 (VALID: 16 days)
    Certificate Path: /etc/letsencrypt/live/scottsfeedfinder.com/fullchain.pem
    Private Key Path: /etc/letsencrypt/live/scottsfeedfinder.com/privkey.pem
  Certificate Name: www.covidnearme.org
    Serial Number: 301d4f45d538f48b10cb1da18e954b27217
    Domains: www.covidnearme.org covidnearme.org
    Expiry Date: 2020-06-10 14:17:05+00:00 (INVALID: EXPIRED)
    Certificate Path: /etc/letsencrypt/live/www.covidnearme.org/fullchain.pem
    Private Key Path: /etc/letsencrypt/live/www.covidnearme.org/privkey.pem
  Certificate Name: www.wipmarks.com
    Serial Number: 41179b036172459048f4d93770edf5d61bb
    Domains: www.wipmarks.com wipmarks.com
    Expiry Date: 2020-08-27 11:31:20+00:00 (VALID: 68 days)
    Certificate Path: /etc/letsencrypt/live/www.wipmarks.com/fullchain.pem
    Private Key Path: /etc/letsencrypt/live/www.wipmarks.com/privkey.pem
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
