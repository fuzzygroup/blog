---
layout: post
title: NightmareJS and XVFB
---
var Xvfb = require('xvfb');
var Nightmare = require('nightmare');

var xvfb = new Xvfb({
  silent: true
});
xvfb.startSync();

var nightmare = Nightmare({
  show: false,
  webPreferences: {
    partition: 'custom'
  }
});

nightmare
  .goto('https://google.com')
  .evaluate(function() {
    return document.title;
  })
  .end()
  .then(function(title) {
    console.log(title);
    xvfb.stopSync();
  });
  
  https://github.com/segmentio/nightmare/issues/602
  
  http://elementalselenium.com/tips/38-headless
  
  https://github.com/sebastienvercammen/ptc-acc-gen/issues/23
  
  https://github.com/nodejs/node-gyp/issues/569
  
  https://github.com/segmentio/nightmare/issues/602
  
  http://stackoverflow.com/questions/32518777/nightmare-js-browsing-and-parsing-multiple-sites
  
  https://github.com/teampoltergeist/poltergeist#customization