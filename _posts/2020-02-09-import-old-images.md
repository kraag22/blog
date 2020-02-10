---
layout: post-no-feature
title: "Backup old photos"
description: "Import old images with wrong dates to Mac Photos app."
category: articles
tags: [programming]
---
You will need awesome commandline program called [jhead](https://www.sentex.ca/~mwandel/jhead/). It can set EXIF "create date" to file system timestamp. You can do it in bulk with this command:

```
ls -d */ | xargs -I {} bash -c "./jhead -ft '{}'*"
```

It will do it for every photo in every subdirectory in current folder.


### links
* [Download jhead command](https://www.sentex.ca/~mwandel/jhead/)
* [How to import directories to iCloud photos](https://photofocus.com/software/how-to-import-folder-hierarchies-in-apple-photos/)
* [Show EXIF in Acorn](https://flyingmeat.com/acorn/docs/image_metadata.html)
