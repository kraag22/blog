---
layout: post-no-feature
title: "HOWTO solve CVEs in maven deps in kotlin"
description: "Cheatsheet for finding and solving CVEs in maven dependencies."
category: articles
tags: [programming]
---

### Usefull webpages

find packages [central.sonatype.com](https://central.sonatype.com/search?q=spring-boot-starter-camunda-test)

find vulnerabilities [ossindex.sonatype.org](https://ossindex.sonatype.org/)

find CVEs [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2023-2976)

### List dependencies

```
gradle dependencies
```

### Setting Up the Dependency Check Plugin
Next, you'll need to set up the OWASP [Dependency-Check](https://jeremylong.github.io/DependencyCheck/dependency-check-gradle/configuration-aggregate.html) Gradle plugin. Add the following to your build.gradle file:
```
plugins {
    id("org.owasp.dependencycheck").version("11.1.1")
}
```


### Setup
The plugin requires the commons-compress library, so make sure to add it to your buildscript block:
```
buildscript {
    dependencies {
        classpath("org.apache.commons:commons-compress:[1.27.1,)")
    }
}
```


Configure dependency check job
```
dependencyCheck {
    failBuildOnCVSS = 4.0f
    suppressionFile = "owasp-dependencycheck-suppressions.xml"
    skipConfigurations = listOf("cucumberRuntime", "testImplementation", "developmentOnly")
    nvd {
        apiKey = "API_KEY"
        delay = 3500
    }
    analyzers {
        assemblyEnabled = false
        nodeEnabled = false
    }
}
```

List vulnerabilities
```
./gradlew --no-daemon -x test --build-cache dependencyCheckAnalyze
```
