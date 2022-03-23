---
layout: post-no-feature
title: "Upgrade Caddy to version 2"
description: "How to migrate from Caddy v1 to Caddy v2."
category: articles
tags: [programming]
---
Second version of Caddy server introduced incompatibilities with previous version. There is [Caddy migration guide](https://caddyserver.com/docs/v2-upgrade). I was following it and changed old `proxy` config to new `reverse_proxy`.

### Caddy v1 config

```
example.com {
  tls somebody@example.com
  proxy / 127.0.0.1:2000
  log /var/log/example.log
}
```

### invalid Caddy v2 config
```
example.com {
  tls somebody@example.com

  reverse_proxy / 127.0.0.1:2000
  log {
    format console
    output file /var/log/example.log
  }
}
```


But there were strage errors on my page.


I couldn't fetch favicon:
```
filename /favicon.ico
Status 502 Bad Gateway
```

And most of the requests (getting images, javascript files,...) succeeded with returning nothing:
```
length 0, http status 200
```

There is another change - `reverse_proxy` now only proxy given path. So you have to specify, which paths to use. So with `/*` we proxy everything to our service on port 2000.

### correct Caddy v2 config
```
example.com {
  tls somebody@example.com

  reverse_proxy /* 127.0.0.1:2000
  log {
    format console
    output file /var/log/example.log
  }
}
```


### links
* [Caddy migration guide](https://caddyserver.com/docs/v2-upgrade)

