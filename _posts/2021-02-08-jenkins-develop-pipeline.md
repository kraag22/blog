---
layout: post-no-feature
title: "Develop Jenkins pipelines with Sublime Text"
description: "How to debug Jenkinsfile efficiently on local computer."
category: articles
tags: [programming]
---
When you are developing new Jenkins pipeline, it can be tedious process. Every change you made needs to be committed and pushed. You need to create test job and run it. And only ofter that you will get noticed about small typo and you have to start again. 
Much efficient way would be to check syntax locally. Jenkis has nice API for [Jenkisfile validation](https://www.jenkins.io/doc/book/pipeline/development/#linter).  

```
curl --user username:password -X POST -F  \
  "jenkinsfile=<path_to_your_jenkinsfile" \
  http://your_jenkins_url/pipeline-model-converter/validate

```

So you need some running instance of Jenkins. Run it locally in docker or use some server.
This API validates syntax of Jenkinsfile and returns where all the issues.

### Integration to Sublime Text as Build System
If you are using Sublime Text, you can add this validation as **Build System** and run it easily with **Cmd + B** and get instat result.

#### Validation script
Firstly you have to create shell script, which will take path to a Jenkinsfile as param and call the API.

```
#!/usr/bin/env bash
USER=your_jenkins_user
PASSWORD=your_jenkins_password

curl --user $USER:$PASSWORD -X POST -F "jenkinsfile=<$1" \
  http://your_jenkins_url/pipeline-model-converter/validate

```

Save this content as file **validate.sh**. Don't forget to allow execution and then pass path of any Jenkinfile to it ```validate.sh /tmp/super.Jenkinsfile```. Check how it works!

#### Create new Build System
Go to Sublime Text and click on **Tools -> Build System -> New Build System** and save this JSON there.

```
{
    "cmd": ["/Users/somebody/validate.sh", "$file"],
    "file_regex": ".*Jenkinsfile",
    "selector": "source.jenkins"
}

```

Change path of validation script to correct place. Then you can use new build for all files with **.Jenkinsfile** extension.
![New build](/images/set-build.png)

After you press **Cmd + B** to run build, output of the validation script will be shown on the bottom the screen.

![Jenkins with Build window](/images/jenkins-run.png)
You can see warning about missing *agent* section in pipeline.

### links
* [Jenkins validate API](https://www.jenkins.io/doc/book/pipeline/development/#linter)
* [Sublime Text Build system](https://www.sublimetext.com/docs/3/build_systems.html)

