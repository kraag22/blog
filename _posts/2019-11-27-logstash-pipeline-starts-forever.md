---
layout: post-no-feature
title: "Logstash pipeline with S3 output starts tens of minutes"
description: "What to do when your logstash pipelines starts tens of minutes"
category: articles
tags: [programming]
---
When your logstash pipelines starts tens of minutes, you can have these problems:

* [Not enought entropy](https://github.com/jruby/jruby/wiki/Improving-startup-time#ensure-your-system-has-adequate-entropy) - logstash doesn't have enought random numbers
* You have a lot S3 outputs (doesn't matter if one bucket or many of them [Github issue](https://github.com/logstash-plugins/logstash-output-s3/issues/208))

## S3 output plugin
Try to limit number of outputs. If you want to save logs to different paths in you S3 bucket. You can use [mutate filter](https://logz.io/blog/logstash-mutate-filter/) and add path to event. And then use only one S3 output.

Second option is to disable [validation](https://www.elastic.co/guide/en/logstash/current/plugins-outputs-s3.html#plugins-outputs-s3-validate_credentials_on_root_bucket) and [metrics](https://www.elastic.co/guide/en/logstash/current/plugins-outputs-s3.html#plugins-outputs-s3-enable_metric), that helps to speed start time.

```
validate_credentials_on_root_bucket=false
enable_metrics=false
```

### Links
* [Github issue](https://github.com/logstash-plugins/logstash-output-s3/issues/208)
* [Elasic docs for S3 output plugin](https://www.elastic.co/guide/en/logstash/current/plugins-outputs-s3.html)
* [How to debug Logstash](https://logz.io/blog/debug-logstash/)
* [Not enought entropy](https://github.com/jruby/jruby/wiki/Improving-startup-time#ensure-your-system-has-adequate-entropy)
* [How to setup filebeat/logstash incredible tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-elasticsearch-logstash-and-kibana-elastic-stack-on-ubuntu-18-04)
