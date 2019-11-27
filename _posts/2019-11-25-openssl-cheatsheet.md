# Keys & certificates cheatsheet

## Keys

### generate private key

```openssl genrsa -out private.pem 2048```

### check private key

```openssl pkey -in private.pem -text```

### extract public key from private

```openssl rsa -in private.pem -pubout -out pubkey.pem```

### extract public key from private for SSH

```ssh-keygen -y -f private.pem > key.pub```

### check public key

```openssl rsa -inform PEM -pubin -in pubkey.pem -text -noout```

### change format of key to pkcs8
```openssl pkcs8 -topk8 -nocrypt -in private.key -out private-pkcs8.key```

## Certificates

### generate certificate authority from private key
```openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 4096 -out rootCA.crt```

### generate csr request using key
```openssl req -sha512 -new -key xxx.key -out xxx.csr -conf config.conf```

### check csr request
```openssl req -in mydomain.com.csr -noout -text```

### save serial to file
```openssl x509 -in rootCA.crt -text -noout -serial```
At the end is serial "serial=XXXX" take only XXXX part ad save it to file "serial"

### generate server certificate
```openssl x509 -days 365 -req -sha512 -in xxx.csr -CAserial serial -CA rootCA.crt -CAkey ca.key -out new.crt -extensions v3_req -extfile server.conf```
    
### generate client certificate
```openssl x509 -days 365 -req -sha512 -in xxx.csr -CAserial serial -CA rootCA.crt -CAkey ca.key -out new.crt -extensions v3_req -extensions usr_cert -extfile client.conf```
    
## Config files

### server.conf
```
[req]
distinguished_name = req_distinguished_name
req_extensions = v3_req
prompt = no

[req_distinguished_name]
countryName                     = XX
stateOrProvinceName             = XXXXXX
localityName                    = XXXXXX
postalCode                      = XXXXXX
organizationName                = XXXXXX
organizationalUnitName          = XXXXXX
commonName                      = XXXXXX
emailAddress                    = XXXXXX

[v3_req]
keyUsage = keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1 = DOMAIN NAME
IP.1 = IP ADDRESS
```

### client.conf
```
[req]
distinguished_name = req_distinguished_name
req_extensions = v3_req
prompt = no

[req_distinguished_name]
countryName                     = XX
stateOrProvinceName             = XXXXXX
localityName                    = XXXXXX
postalCode                      = XXXXXX
organizationName                = XXXXXX
organizationalUnitName          = XXXXXX
commonName                      = XXXXXX
emailAddress                    = XXXXXX

[ usr_cert ]
# Extensions for server certificates (`man x509v3_config`).
basicConstraints = CA:FALSE
nsCertType = client, server
nsComment = "Client Certificate"
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid,issuer:always
keyUsage = critical, digitalSignature, keyEncipherment, keyAgreement, nonRepudiation
extendedKeyUsage = serverAuth, clientAuth

[v3_req]
keyUsage = keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth, clientAuth

```
 
## Links
* [list of commands](https://gist.github.com/webtobesocial/5313b0d7abc25e06c2d78f8b767d4bc3)
* [how to generate certificate with SAN](https://geekflare.com/san-ssl-certificate/)
* [setting certificates for Filebeat and Logstash](https://documentation.wazuh.com/3.2/installation-guide/optional-configurations/elastic_ssl.html)
* [script for generation certs](https://gist.github.com/jhamrick/ac0404839b5c7dab24b5)
* [tutorial for secure Logstash&Filebeat + info about config files](https://benjaminknofe.com/blog/2018/07/08/logstash-authentication-with-ssl-certificates/)
