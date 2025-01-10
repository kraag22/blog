---
layout: post-no-feature
title: "Make local services public"
description: "Create tunnel to local network so services can be accessed via public domains."
category: articles
tags: [programming]
---

This guide will show you how to use Cloudflare tunnels to make services on your
local network accessible from the outside world via a secure HTTPS domain. So
you can setup https://xxx.yourdomain.com to point for example to 127.0.0.1:5000
on your local network.

## Use Cloudflare tunnels
Install `cloudflared` docker container on local server and set up a domain to
proxy traffic via a Cloudflare tunnel.

### Buy domain and point NS to Cloudflare
* Add new domain in Cloudflare admin
* Setup nameservers of domain to point on Cloudflare (aron.ns.cloudflare.com, kirk.ns.cloudflare.com)
* Finish adding new domain in admin

### Setup Cloudflare tunnel
* In the Cloudflare admin console, navigate to: `Zero Trust -> Network -> Tunnels`
* Follow the instructions to create and configure the tunnel.


### links
* [Blog howto](https://www.crosstalksolutions.com/cloudflare-tunnel-easy-setup/)
* [Youtube howto](https://youtu.be/ZvIdFs3M5ic?si=ZGYkVQTYym2oojrR)

