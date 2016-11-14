---
layout: post
title: Going Deeper Debugging SAML
category: saml
tags: ["saml", "ruby", "debugging", "mindtouch", "xml", "idp", "sp", "assertion", "saml_idp"]
---
This blog post expands on my current interest in [SAML](https://fuzzygroup.github.io/blog/saml/2016/10/28/understanding-saml-and-sso.html) with a more detailed investigation of SAML, IdP versus SP initiation and how you actually debug it.  In the process of writing this, I reached out to two companies that support SAML in their products and I wanted to express a special thanks to Scott G at [MindTouch](http://www.mindtouch.com/) who did an absolutely fantastic job of answering questions -- honestly the best technical support I've received in years.  Kudos and thank you!

# Tools for Working on SAML

Here are some of the tools for working on SAML that I recently learned about:

* Ruby [libsaml](https://github.com/digidentity/libsaml)
* Firefox SAML Tracer
* Chrome SAML Tracer (not as good)
* [The SAML Decoder](https://www.samltool.com/decode.php).  The UI here sucks blue monkey chunks but it does the job.

# Not All Vendors are Created Equal

When I worked with SAML, my context was: 

* I was creating the IdP
* One vendor ([MindTouch](http://www.mindtouch.com/)) I worked with had us in a SP init role where they would push login stuff to us
* Another vendor (who shall not be named) I worked with had us in an IdP init role where we would push login stuff to them

The experience between the two was night and day different.  The SP Init role vendor was a dream to work with and their product line was so astonishingly forgiving and pleasant that it would tell the errors and how far it got.  The other vendor, well, you had to ask your project manager for each error one at a time.

## Examples of How to Make a UI that Uses SAML

Here are examples of a great SAML user interface for a developer.  This is from [MindTouch](http://www.mindtouch.com/).  Whether we get a success or a failure there's enough context for the developer to actually understand what's happening:

![](/blog/assets/great_saml_ui_mind_touch_saml_success.png)
If you have the debug tracer on then you can see the whole SAML transaction



![](/blog/assets/saml_great_ui_shows_errors.png)
If you hit errors part way thru a SAML transaction then you can see at least as far as you got.



![](/blog/assets/saml_success_but_no_access.png)
If you are requesting a page which requires administrative access you don't have then you'll get logged in but blocked access to the requested resource.  See below under "Local Users Haven't Gone Away - Local Login Has Gone Away"

# Debugging a SAML Transaction

The very first thing you want to do if you're debugging saml stuff is use FireFox and get the [SAML tracer](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwjS3Lbu3pPQAhVL0oMKHTOtAwgQFggdMAA&url=https%3A%2F%2Faddons.mozilla.org%2Fen-US%2Ffirefox%2Faddon%2Fsaml-tracer%2F&usg=AFQjCNHN7JDX_TkQIZOiPV2tMSVDyfgwkA) plugin.  This tool shows you the SAML back and forth flow and it is absolutely brilliant:

![saml_tracer](/blog/assets/saml_tracer.png)

When Scott G was helping me, his first suggestion was "Ok -- go and get the FireFox SAML tracer" and with that we were off to the races.  Good tools always make things better and this was excellent. 

Note: There is also a [Chrome SAML tool](https://chrome.google.com/webstore/detail/saml-chrome-panel/paijfdbeoenhembfhkhllainmocckace?hl=en) which I haven't tried yet.  It doesn't appear to be as complete as SAML Tracer since it only supports post requests.

# Local Users Haven't Gone Away - Local Login Has Gone Away

One thing to understand about SAML is that local users, at the level of the Service Provider, have not gone away.  What has gone away is **local login** and **local passwords**.  Your application will, almost certainly, still have a local set of users that you have to administer.  This becomes most apparent when you want to grant administrative rights to a user who has logged in via saml.  Even my SAML poster child for a great implementation, MindTouch, says this:
  
> Can I automatically seat users as pro members?
> Users cannot be seated by a SAML assertion. A user must be explicitly seated by an administrator using the control panel. If automatic seating is required, this can be accomplished via our API.
> [Mindtouch Docs](https://success.mindtouch.com/Documentation/MindTouchResponsive/Authentication/Authenticate_via_SSO/Implement_SAML_SSO?=)

The way that admin rights are granted to a SAML user is that the Service Provider has an admin tool where a user can be located by whatever is the unique identifier for a user (generally email or username) and then administrative rights are granted to the user.

# IdP versus SP Initiation

When you first get involved with SAML one of the initial things you'll be asked is:

> IdP init or SP Init?

As you may remember from my [last post on SAML](https://fuzzygroup.github.io/blog/saml/2016/10/28/understanding-saml-and-sso.html), IdP is the identity provider, the bit of software that owns the user information and SP is the service provider, the bit of software that us trying to use identity.

This is a really, really big deal in the SAML community and what sounds like a network protocol question is actually a **user flow** question that centers on a chicken and egg issue of what happens first.  The [almost 7,000 results](https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=saml%20idp%20vs%20sp%20initiated) in Google for this very simple thing indicates just how many people are confused about it.  As always Stack Overflow has a [great page on this topic](http://stackoverflow.com/questions/12779532/differences-between-sp-initiated-sso-and-idp-initiated-sso) but let me try and paraphrase:

For IdP Init:

The best advice I can give you is read [this old web page](http://saml.xml.org/wiki/idp-initiated-single-sign-on-post-binding).  When I found this and implemented it exactly this way then IdP Init just fell in to place for me.

For SP init:

1. The user starts on a url on the service provider and when access is needed they are pushed BACK to the IdP to a special login page which is run by the SAML side of the house.  
2. A SAML assertion is generated and pushed to the SP.
3. If the assertion is valid the user is granted access.

Here's the rub from a technical perspective: **IdP Init is MUCH MUCH HARDER**.  When you are doing IdP Init you need to do all the low level SAML junk yourself.  When you are doing SP init then they do the SAML junk.  

Just to illustrate how much work the SP versus IdP approach changes things, you should look at these two configuration UIs below.  One is for SP Init and one is for IdP Init.  The IdP Init one is trivial to configure -- all you have to do is set a few urls.  The SP Init one is much harder to configure -- it requires your certificate and more low level details.  But there's an inversion here -- the more complex it is to configure the SP, the less code you have to write yourself.  Repeat that after me -- the less code you have to write.  I got the SP Init up and running in a matter of hours.  The IdP init took days.

## Configuration Screen when You Are the IdP And the SP wants SP Init

![](/blog/assets/mindtouch_saml_config.png)

## Configuration Screen when You Are the IdP and the SP wants IdP Init 

![](/blog/assets/saml_idp_init_configuration.png)

# Example of a SAML Assertion When You Are the IdP Pushing to an SP

Here's a full example of a SAML assertion.  This, if you updated the time stamps, would correctly validate (a few urls have been changed, however):

    <samlp:Response xmlns:samlp="urn:oasis:names:tc:SAML:2.0:protocol" ID="_a4f7e48e0-88e7-0134-4eb1-22000ab35e7b" Version="2.0" IssueInstant="2016-11-10T19:21:13.116Z" Destination="https://community-staging.foo.com/auth/saml/SSO" Consent="urn:oasis:names:tc:SAML:2.0:consent:unspecified" >
      <Issuer xmlns="urn:oasis:names:tc:SAML:2.0:assertion">http://sso.foo.com/saml/auth</Issuer>
      <samlp:Status>
        <samlp:StatusCode Value="urn:oasis:names:tc:SAML:2.0:status:Success"/>
      </samlp:Status>
      <Assertion xmlns="urn:oasis:names:tc:SAML:2.0:assertion" ID="_a4f7e4b30-88e7-0134-4eb1-22000ab35e7b" IssueInstant="2016-11-10T19:21:13.116Z" Version="2.0">
        <Issuer>http://sso.foo.com/saml/auth</Issuer>
        <ds:Signature xmlns:ds="http://www.w3.org/2000/09/xmldsig#">
          <ds:SignedInfo xmlns:ds="http://www.w3.org/2000/09/xmldsig#">
            <ds:CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/>
            <ds:SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/>
            <ds:Reference URI="#_a4f7e4b30-88e7-0134-4eb1-22000ab35e7b">
              <ds:Transforms>
                <ds:Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature"/>
                <ds:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/>
              </ds:Transforms>
              <ds:DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
              <ds:DigestValue>IxemD9eHnPTFaA9Th4+2mQncXuI=</ds:DigestValue>
            </ds:Reference>
          </ds:SignedInfo>
          <ds:SignatureValue>jrTDXKvv2wevCIIJ48gL1kIvgBwMMtl+RO6wligTVQp7iYglReUIKdnEZo9vuFucd+ocWkg7EQ3N3WWsZiBvyVGTJ80jC8QRTD+CtTEEMMVgtS2BkLFUv7gfH5yZ9Affk+qF+uAEK4Ij2Zy+0Zq6jleQlUTyCoZNDOFzNF1zWHo=</ds:SignatureValue>
          <KeyInfo xmlns="http://www.w3.org/2000/09/xmldsig#">
            <ds:X509Data>
              <ds:X509Certificate>MIICrzCCAhgCCQCAZjKq3Nb4xTANBgkqhkiG9w0BAQsFADCBmzELMAkGA1UEBhMCVVMxCzAJBgNVBAgMAkNBMRUwEwYDVQQHDAxSZWR3b29kIENpdHkxEDAOBgNVBAoMB0ludGVybmExFDASBgNVBAsMC0VuZ2luZWVyaW5nMRowGAYDVQQDDBFzc28uaW50ZXJhbmlhLmNvbTEkMCIGCSqGSIb3DQEJARYVc2pvaG5zb25AaW50ZXJhbmEuY29tMB4XDTE2MTEwMzExMDAwN1oXDTE3MTEwMzExMDAwN1owgZsxCzAJBgNVBAYTAlVTMQswCQYDVQQIDAJDQTEVMBMGA1UEBwwMUmVkd29vZCBDaXR5MRAwDgYDVQQKDAdJbnRlcm5hMRQwEgYDVQQLDAtFbmdpbmVlcmluZzEaMBgGA1UEAwwRc3NvLmludGVyYW5pYS5jb20xJDAiBgkqhkiG9w0BCQEWFXNqb2huc29uQGludGVyYW5hLmNvbTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEA1NaloseOtTva09VahTNozzHbO6rpuT7/FpQOi3eHKWwU4zHgEvOI2biUkTRYocZkunilBxqtTrCgbDay4MqXFykt+lKujnV10OG4+cVUxds8a50nkHXVbpMC48m5gfkUfut4EIURE5RHjLJ/nCpgC67QUl1/ztkFvJaNDJeWoQMCAwEAATANBgkqhkiG9w0BAQsFAAOBgQCTkZmrFEhmW4MoX6OovuKwCNwQBWPXju/po8d7YTVpRf7tIfGsD/4x8jBgUaeSPQ4QXCMQqB6244win3u1veVQd5UYRP37RteEP+F302Gw2MbOl2fYUQoSwINayWA/CinYBQAlzTAJovIsc/P8dNFUsSQzqme2aF1nIuH3h/8/Kg==</ds:X509Certificate>
            </ds:X509Data>
          </KeyInfo>
        </ds:Signature>
        <Subject>
          <NameID Format="urn:oasis:names:tc:SAML:2.0:nameid-format:transient">scott_johnson</NameID>
          <SubjectConfirmation Method="urn:oasis:names:tc:SAML:2.0:cm:bearer">
            <SubjectConfirmationData NotOnOrAfter="2016-11-10T19:25:13.116Z" Recipient="https://community-staging.foo.com/auth/saml/SSO"/>
          </SubjectConfirmation>
        </Subject>
        <Conditions NotBefore="2016-11-10T19:21:13.116Z" NotOnOrAfter="2016-11-10T20:07:13.116Z">
          <AudienceRestriction>
            <Audience>https://community-staging.foo.com/auth/saml</Audience>
          </AudienceRestriction>
        </Conditions>
        <AttributeStatement>
          <Attribute Name="email" NameFormat="urn:oasis:names:tc:SAML:2.0:attrname-format:uri" FriendlyName="email">
            <AttributeValue>sjohnson@foo1.com</AttributeValue>
          </Attribute>
          <Attribute Name="first_name" NameFormat="urn:oasis:names:tc:SAML:2.0:attrname-format:uri" FriendlyName="first_name">
            <AttributeValue>Scott</AttributeValue>
          </Attribute>
          <Attribute Name="last_name" NameFormat="urn:oasis:names:tc:SAML:2.0:attrname-format:uri" FriendlyName="last_name">
            <AttributeValue>Johnson</AttributeValue>
          </Attribute>
        </AttributeStatement>
        <AuthnStatement AuthnInstant="2016-11-10T19:21:13.116Z" SessionIndex="_a4f7e4b30-88e7-0134-4eb1-22000ab35e7b">
          <AuthnContext>
            <AuthnContextClassRef>urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport</AuthnContextClassRef>
          </AuthnContext>
        </AuthnStatement>
      </Assertion>
    </samlp:Response>
    
    
The important thing to understand about SAML assertions is that they are very, very precise -- you have to exactly and correctly match values between the assertion, the response and the metadata signature.  So when you have a problem you need to look for mis-matches.  Even when you think they aren't there they likely are.  SAML, for all of its difficulty, is a well thought out, time tested standard.  It is more likely that you have an implementation problem than SAML itself being broken.
    
# Example of a Debugging Flow

When you start to do this a lot you need to think hard about how to make your debugging flow easier.  I burned a lot of time thinking that I was *almost* there.  And if you're almost there then why do you need to make debugging easy?  Well, honestly, I probably had another 50+ odd debugging sessions before I actually got there.  I finally ended up writing a simple rake task which generated the SAML assertion I needed to validate so instead of logging into a web ui, tailing logs, capturing base64 encoded data, pasting it into ruby as a string, decoding it and then using an editor to make it viewable, I could just type something like this:

    bundle exec rake saml:go1 --trace
    
I cannot express what a huge improvement that was.  So, even if you think you're almost there, you're likely not and you should work on your debugging tools.

Oh and if you're going to do it the hard way then Base64.decode64(encoded_assertion) is your very best friend.  

# Accept that You're Not Going to Understand Everything and Just Try It

One of the better pieces of advice that I can give you is that you can have SAML issues that a vendor swears up and down **will not work** and they still might.  I had a situation where the vendor swore up, down, right, left and sideways that my signatures were wrong and my IdP was at fault.  This was the absolutely worst type of technical support situation where neither party was willing to admit fault.  Things had been checked, re-checked and checked again and everything seemed to be in order.  Finally I thought *screw it* and just tried to authenticate and **whammo** it just plain worked.

To this day the vendor can't explain why.  Here's the XML / Java stack trace in case anyone can tell me why given that the signatures here don't verify but access is still granted.  Personally I would think that you wouldn't validate an untrusted credential but maybe this is a common thing???

    <<   2016-11-10 14:33:04,007 -0800 [937-exec-5] DEBUG  [cid=gqaoh85646, tx=9ab899b9-acd9-43cc-af52-e00f95efe725, rh=54.224.44.177, userId=] ty.trust.ExplicitKeyTrustEvaluator - Successfully validated untrusted credential against trusted key
    <<   2016-11-10 14:33:04,007 -0800 [937-exec-5] DEBUG  [cid=gqaoh85646, tx=9ab899b9-acd9-43cc-af52-e00f95efe725, rh=54.224.44.177, userId=] ture.impl.BaseSignatureTrustEngine - Successfully established trust of KeyInfo-derived credential
    <<   2016-11-10 14:33:04,007 -0800 [937-exec-5] DEBUG  [cid=gqaoh85646, tx=9ab899b9-acd9-43cc-af52-e00f95efe725, rh=54.224.44.177, userId=] ture.saml.LiaWebSSOProfileConsumer - confirmation method: urn:oasis:names:tc:SAML:2.0:cm:bearer
    <<   2016-11-10 14:33:04,007 -0800 [937-exec-5] DEBUG  [cid=gqaoh85646, tx=9ab899b9-acd9-43cc-af52-e00f95efe725, rh=54.224.44.177, userId=] ture.saml.LiaWebSSOProfileConsumer - validating against SP SSO Descriptor (for recipient: https://community-staging.interania.com/auth/saml/SSO)
    <<   2016-11-10 14:33:04,007 -0800 [937-exec-5] DEBUG  [cid=gqaoh85646, tx=9ab899b9-acd9-43cc-af52-e00f95efe725, rh=54.224.44.177, userId=] ture.saml.LiaWebSSOProfileConsumer - does urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST match urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST ?
    <<   AND https://community-staging.interania.com/auth/saml/SSO against https://community-staging.interania.com/auth/saml/SSO ?
    <<   2016-11-10 14:33:04,008 -0800 [937-exec-5] DEBUG  [cid=gqaoh85646, tx=9ab899b9-acd9-43cc-af52-e00f95efe725, rh=54.224.44.177, userId=] .
    .
    .
    .
    .
    org.springframework.security.web.context.HttpSessionSecurityContextRepository$Servlet3SaveToSessionRequestWrapper
    <<   2016-11-10 14:33:04,318 -0800 [937-exec-5] DEBUG  [cid=gqaoh85646, tx=9ab899b9-acd9-43cc-af52-e00f95efe725, rh=54.224.44.177, userId=] ature.saml.LiaSAMLProcessingFilter - ssoParams.settings={profile.name_first=Scott, profile.name_last=Johnson}
    <<   2016-11-10 14:33:04,318 -0800 [937-exec-5] DEBUG  [cid=gqaoh85646, tx=9ab899b9-acd9-43cc-af52-e00f95efe725, rh=54.224.44.177, userId=] ature.saml.LiaSAMLProcessingFilter - Authentication success. Updating SecurityContextHolder to contain: lithium.common.feature.saml.AuthenticationDetailsWrapper@1db556ec: Principal: CoreUser[uid=29,login=scott_johnson]; Credentials: [PROTECTED]; Authenticated: true; Details: lithium.lia.security.authentication.sso.AuthenticationDetails@53d2a043; Not granted any authorities
    <<   2016-11-10 14:33:04,523 -0800 [on Task-30] DEBUG  [cid=, tx=, rh=, userId=-1] otificationServiceEventManagerImpl - event toString for transaction 5ea86fe8-f180-4ee9-82b3-c57ac794523e is: UserRankEvent[rankId=24,userId=29,timeOfAssignment=1478817184501,eventType=USER_RANK_EVENT,useMessageChannel=true,headers=BaseMessageHeaders[tenantId=e0f6dd3c-7987-4346-b4d0-2f5ef70fa74b,messageSentTime=1478817184512,transactionId=5ea86fe8-f180-4ee9-82b3-c57ac794523e,useRequestTimeforWriteTime=true,sourceEndpoint=http://sjc1sapp08.sj.lithium.com:8937,liaCommunityName=gqaoh85646]]
    <<   2016-11-10 14:33:04,558 -0800 [on Task-30] INFO   [cid=, tx=, rh=, userId=-1] otificationServiceEventManagerImpl - posted userRankEvent event to NS
    <<   2016-11-10 14:33:04,622 -0800 [ontainer-4] DEBUG  [cid=, tx=, rh=, userId=-1] tionServiceNotificationManagerImpl - processing notification directive for the event with the original UUID of 5ea86fe8-f180-4ee9-82b3-c57ac794523e and original type of USER_RANK_EVENT
    <<   2016-11-10 14:33:04,625 -0800 [ontainer-4] DEBUG  [cid=, tx=, rh=, userId=-1] tionServiceNotificationManagerImpl - processing notifications for a total of 1 interested entities
    <<   2016-11-10 14:33:04,625 -0800 [ontainer-4] DEBUG  [cid=, tx=, rh=, userId=-1] tionServiceNotificationManagerImpl - processing 1 notifications for entity with type USER and id 29
    <<   2016-11-10 14:33:04,625 -0800 [ontainer-4] DEBUG  [cid=, tx=, rh=, userId=-1] tionServiceNotificationManagerImpl - resolving notification setting for notification
    <<   2016-11-10 14:33:04,626 -0800 [ontainer-4] DEBUG  [cid=, tx=, rh=, userId=-1] tionServiceNotificationManagerImpl - found notification settings on the notification directive payload: lithium.domain.subscriptions.settings.impl.SubscriptionTemplateImpl@247a1a7b[emailDistributionSettings=lithium.domain.subscriptions.settings.impl.DistributionChannelSettingsImpl@7cd9d117[enabled=true,enabedIsDefault=false,distributionFrequency=IMMEDIATE],type=RANK,customKey=<null>,templateMetadata={newsFeedExclusionBoolean=false},headers=<null>]
    <<   2016-11-10 14:33:04,626 -0800 [ontainer-4] DEBUG  [cid=, tx=, rh=, userId=-1] tionServiceNotificationManagerImpl - Notification of type RANK, for userID 29, transactionId 5ea86fe8-f180-4ee9-82b3-c57ac794523e will be sent immediately
# Writing Your Own IdP

I've open sourced [my fork of the Ruby IdP](https://github.com/fuzzygroup/saml_idp) I based this all on and I'll be updating it at least somewhat regularly.  I put a bunch of advice on the home page there.
