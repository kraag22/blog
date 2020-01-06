FROM alpine:3.11

RUN apk update
RUN apk add vim
RUN cd /tmp && \
    wget https://github.com/caddyserver/caddy/releases/download/v1.0.4/caddy_v1.0.4_linux_amd64.tar.gz && \
    tar -xzf caddy*.tar.gz caddy && \
    mv ./caddy /usr/local/bin && \
    rm -rf caddy*.tar.gz && \
    mkdir /etc/caddy

COPY ./docker/Caddyfile /etc/caddy/Caddyfile
COPY ./_site /srv/data

ENTRYPOINT ["/usr/local/bin/caddy", "-conf", "/etc/caddy/Caddyfile"]
