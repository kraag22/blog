---
layout: post-no-feature
title: "kubectl fails"
description: "Any kubectl command fails and only prints runtime stack."
category: articles
tags: [programming]
---
If you install kubectl via brew and every comand fail with some cryptic runtime stack like this:

```
kubectl version
failed MSpanList_Insert 0x1c5d000 0x2b0621b1193 0x0
fatal error: MSpanList_Insert

runtime stack:
runtime.throw(0x1a00f6b)
	/usr/src/go/src/runtime/panic.go:491 +0xad fp=0x7ffeefbfefa0 sp=0x7ffeefbfef70
runtime.MSpanList_Insert(0x1a37888, 0x1c5d000)
	/usr/src/go/src/runtime/mheap.c:692 +0x8f fp=0x7ffeefbfefc8 sp=0x7ffeefbfefa0
MHeap_FreeSpanLocked(0x1a34480, 0x1c5d000, 0x100)
	/usr/src/go/src/runtime/mheap.c:583 +0x163 fp=0x7ffeefbff008 sp=0x7ffeefbfefc8
MHeap_Grow(0x1a34480, 0x8, 0x0)
	/usr/src/go/src/runtime/mheap.c:420 +0x1a8 fp=0x7ffeefbff048 sp=0x7ffeefbff008
MHeap_AllocSpanLocked(0x1a34480, 0x1, 0x0)
	/usr/src/go/src/runtime/mheap.c:298 +0x365 fp=0x7ffeefbff088 sp=0x7ffeefbff048
mheap_alloc(0x1a34480, 0x1, 0x12, 0x0)
	/usr/src/go/src/runtime/mheap.c:190 +0x121 fp=0x7ffeefbff0b0 sp=0x7ffeefbff088
runtime.MHeap_Alloc(0x1a34480, 0x1, 0x10000000012, 0xcf29)
	/usr/src/go/src/runtime/mheap.c:240 +0x66 fp=0x7ffeefbff0e8 sp=0x7ffeefbff0b0
MCentral_Grow(0x1a3c1f8, 0x0)
	/usr/src/go/src/runtime/mcentral.c:197 +0x8b fp=0x7ffeefbff150 sp=0x7ffeefbff0e8
runtime.MCentral_CacheSpan(0x1a3c1f8, 0x0)
	/usr/src/go/src/runtime/mcentral.c:85 +0x167 fp=0x7ffeefbff188 sp=0x7ffeefbff150
runtime.MCache_Refill(0x1c59000, 0x12, 0x0)
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
	/usr/src/go/src/runtime/mcache.c:90 +0xa0 fp=0x7ffeefbff1b0 sp=0x7ffeefbff188
runtime.mcacheRefill_m()
	/usr/src/go/src/runtime/malloc.c:368 +0x57 fp=0x7ffeefbff1d0 sp=0x7ffeefbff1b0
runtime.onM(0x15219d8)
	/usr/src/go/src/runtime/asm_amd64.s:273 +0x9a fp=0x7ffeefbff1d8 sp=0x7ffeefbff1d0
runtime.mallocgc(0x120, 0x119e280, 0x0, 0x0)
	/usr/src/go/src/runtime/malloc.go:178 +0x849 fp=0x7ffeefbff288 sp=0x7ffeefbff1d8
runtime.newobject(0x119e280, 0x1c59000)
	/usr/src/go/src/runtime/malloc.go:353 +0x49 fp=0x7ffeefbff2b0 sp=0x7ffeefbff288
runtime.newG(0x26dda)
	/usr/src/go/src/runtime/proc.go:233 +0x2a fp=0x7ffeefbff2c8 sp=0x7ffeefbff2b0
allocg(0x1a1d480)
	/usr/src/go/src/runtime/proc.c:925 +0x1f fp=0x7ffeefbff2d8 sp=0x7ffeefbff2c8
runtime.malg(0x8000, 0x1a1d980)
	/usr/src/go/src/runtime/proc.c:2106 +0x1f fp=0x7ffeefbff308 sp=0x7ffeefbff2d8
runtime.mpreinit(0x1a1e320)
	/usr/src/go/src/runtime/os_darwin.c:137 +0x27 fp=0x7ffeefbff320 sp=0x7ffeefbff308
mcommoninit(0x1a1e320)
	/usr/src/go/src/runtime/proc.c:201 +0xc9 fp=0x7ffeefbff348 sp=0x7ffeefbff320
runtime.schedinit()
	/usr/src/go/src/runtime/proc.c:138 +0x55 fp=0x7ffeefbff370 sp=0x7ffeefbff348
runtime.rt0_go(0x7ffeefbff3a0, 0x2, 0x7ffeefbff3a0, 0x0, 0x2, 0x7ffeefbff5b0, 0x7ffeefbff5b8, 0x0, 0x7ffeefbff5c0, 0x7ffeefbff5fc, ...)
	/usr/src/go/src/runtime/asm_amd64.s:95 +0x116 fp=0x7ffeefbff378 sp=0x7ffeefbff370
```

Just try to look which kubectl binary is used. If you see something like this, it is wrong

```
which kubectl
/Users/kraag22/google-cloud-sdk/bin/kubectl
```

Make sure that you use binary from ```brew```. So fix your $PATH

### links
[Disussion about same issue on github](https://github.com/kubernetes/kubernetes/issues/39316)

