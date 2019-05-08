---
layout: post-no-feature
title: "Deploy code with Travis-CI via SSH"
description: "How to setup SSH deployment in Travis. Store keys, "
category: articles
tags: [programming]
---
If you are using automatic building and testing with Travis CI, it would be nice to automatically deploy code. So your `pull requests` will be tested and after you merge them to master branch - code will be redeployed.

### Prepare SSH key for Travis
We need to store private key base64 encoded to Travis.

* Create or reuse private key which can connect to your production server
* Ensure key is NOT encrypted
* Encode key to base64
``` bash
cat ~/.ssh/your_private_key | base64 > privkey.base64
```

### Save private key in Travis
In your repository settings create environment variable `ssh_key` with base64 encoded private key.

![Repository settings]({{ site.url }}/images/travis-settings.png)

Variable should be created this way:
![Set ssh_key variable]({{ site.url }}/images/travis-ssh-key.png)

### Add deployment steps to `.travis.yml`

#### Add server to known hosts
You need to add your server's IP address or domain to `known hosts` or your deployment job will stuck on something like this
``` bash
The authenticity of host '...' can't be established.
ECDSA key fingerprint is ....
Are you sure you want to continue connecting (yes/no)? 
```
You can fix it this way
``` bash
addons:
  ssh_known_hosts: 188.226.180.247
```

#### Add key to `ssh-agent`
Before deployment we need to decode key from base64 format and add it to `ssh-agent`
``` bash
before_deploy:
  - echo "$ssh_key" | base64 -d > /tmp/deploy_key
  - eval "$(ssh-agent -s)"
  - chmod 600 /tmp/deploy_key
  - ssh-add /tmp/deploy_key
```

#### Deploy with `rsync`
Copy builded artifact to server everytime there is new commit to `master` branch in your GIT repository.
``` bash
deploy:
  provider: script
  skip_cleanup: true
  script:
    - rsync -r --delete-after --quiet $TRAVIS_BUILD_DIR/PATH_TO_ARTIFACT root@YOUR_SERVER:PATH_ON_SERVER
  on:
    branch: master
```

Change these constants

* PATH_TO_ARTIFACT - path to builded code in Travis workspace
* YOUR_SERVER - IP address or name of your server
* PATH_ON_SERVER - Path where should be code on your server

#### Restart service
If you need to restart something after code is deployed, you can do it this way

``` bash
after_deploy:
  - ssh root@YOUR_SERVER "service XXX restart"
```
This will restart any service on Ubuntu. But you can run any `bash` command instead of it.
