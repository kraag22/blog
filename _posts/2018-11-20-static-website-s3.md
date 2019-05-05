---
layout: post-no-feature
title: "How to host static website on S3 with https"
description: "List of things you need to do to host static webpage from S3 bucket."
category: articles
tags: [programming]
---
How to host website with custom domain and https enabled on S3 bucket. Deployment is done by committing to GIT.

### 1. DNS
* Create hosted zone in AWS console
* Route53
* Point your domain name servers to AWS

### 2. Create S3 bucket
* Create S3 bucket
* Enable webhosting
* Content policy

### 3. Create certificate 
* Use correct region
* AWS Certificate Manager

### 4. Cloud Front
* Create Cloud Front
* Point Route53 Domain to Cloud Front

### 5. Automatic deployment
* add deploy script to CircleCI
* add AWS keys to CircleCI


### links
[https://www.davidbaumgold.com/tutorials/host-static-site-aws-s3-cloudfront/#redirect-bare-domain-to-www](https://www.davidbaumgold.com/tutorials/host-static-site-aws-s3-cloudfront/#redirect-bare-domain-to-www)
