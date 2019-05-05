---
layout: post-no-feature
title: "Why is programming hard"
description: "If you hear sombody saying, that programming is hard. It is true."
category: articles
tags: [programming]
---
## Learning
Let's try to imagine, you want to learn same cool framework. For example `Polymer`. There is plenty of online lessons so you try this one [on egghead](https://egghead.io/lessons/create-a-custom-element-using-polymer). It has 4 minutes and it's clear and understandable. Cool. But what could happen, when you try to do it yourself?

## Coding
First thing in lesson says that you should start with command `bower install polymer`. What could go wrong? Maybe this:

``` 
module.js:487
    throw err;
    ^

Error: Cannot find module 'internal/fs'
    at Function.Module._resolveFilename (module.js:485:15)
    at Function.Module._load (module.js:437:25)
    at Module.require (module.js:513:17)
    at require (internal/module.js:11:18)
    at evalmachine.<anonymous>:40:20
    at Object.<anonymous> (/usr/local/lib/node_modules/bower/node_modules/graceful-fs/fs.js:11:1)
    at Module._compile (module.js:569:30)
    at Object.Module._extensions..js (module.js:580:10)
    at Module.load (module.js:503:32)
    at tryModuleLoad (module.js:466:12)
```

So you will google and try to fix this. You will find, that bower is kind of deprecated and you should use yarn. But you don't want care about yarn now, you just want to play with Polymer :) Somehow you find that there is problem with bower, because even `bower --version` fails. But bower worked fine few months ago... You can reinstall bower, it doesn't help.

## Fix
So to quickly fix it, you use `nvm` to downgrade your version node. Now bower can install polymer. And after 20 minutes of work you tried to code first 5 seconds of online lesson.
