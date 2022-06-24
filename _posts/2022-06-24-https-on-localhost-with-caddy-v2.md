---
layout: post-no-feature
title: "HTTPS on localhost with Caddy"
description: "How to run HTTPS on loclahost with Caddy v2 server."
category: articles
tags: [programming]
---
Sometimes you may need HTTPS on your localhost. For example when you want to try some otherwise restricted API in JavaScript. There is easy way how to do that with [Caddy server](https://caddyserver.com).

This config file will create reverse proxy from `https://localhost:2000` to some service which runs on `127.0.0.1:4000`.

### Caddy v2 config file

```
localhost:2000
reverse_proxy 127.0.0.1:4000
tls internal
```

### run with
```
caddy run -config Caddyfile
```


You can do it even without config file with these commands

### run
```
caddy trust
caddy reverse-proxy --to 127.0.0.1:4000 --from localhost:2000
```

Both of these commands will add self-signed certificate to your truststore and you will have to confirm warning in your browser complaining about it.

### links
* [Caddy server](https://caddyserver.com)

