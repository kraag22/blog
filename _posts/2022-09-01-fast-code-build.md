---
layout: post-no-feature
title: "4 times faster code execution on Apple Silicon"
description: "How to setup indelliJ IDEA to run code 4x faster on Apple chips."
category: articles
tags: [programming]
---
If you are java or kotlin programmer and you are using IntelliJ IDEA on new Mac be sure you are using correct Java JDK. It can make `huge` difference how fast you code is build. I was using generic JDK previously and running my tests took more than 3 minutes.

![Old JDK](/images/jdk.png)

With `Correto JDK` for aarch64 they are 4x times faster!

![Correto JDK](/images/apple-jdk.png)


So please pick some JDK wich is for your platform. For Apple Sillicon it is `aarch64`

![Pick correct JDK](/images/jdk-pick.png)


### links
* [aarch64](https://blogs.oracle.com/javamagazine/post/java-arm64-aarch64-development)


