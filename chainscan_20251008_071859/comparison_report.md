# Chainscan Report

**Generated:** Wed  8 Oct 2025 07:19:13 PDT

## Images Analyzed
- **Image 1:** `cgr.dev/chainguard-private/node:24.8`
- **Image 2:** `cgr.dev/chainguard-private/node:24.9`

> **Analysis Method:** All APK packages and melange.yaml files were downloaded directly
> from packages.wolfi.dev. No container images were run during this analysis.

## APK Packages Downloaded
### cgr.dev_chainguard-private_node_24.8
- Melange.yaml files:        4

### cgr.dev_chainguard-private_node_24.9
- Melange.yaml files:        4

## Package Differences
```diff
5c5
< dumb-init 1.2.5-r8
---
> dumb-init 1.2.5-r9
14c14
< libcrypto3 3.5.2-r1
---
> libcrypto3 3.5.4-r0
19c19
< libssl3 3.5.2-r1
---
> libssl3 3.5.4-r0
24c24
< nodejs-24 24.8.0-r0
---
> nodejs-24 24.9.0-r0
```

## Melange.yaml Comparisons
### dumb-init
```
======================================
Package: dumb-init
Version 1: 1.2.5-r8 (node:24.8)
Version 2: 1.2.5-r9 (node:24.9)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071859/downloaded_apks/cgr.dev_chainguard-private_node_24.8/dumb-init-1.2.5-r8.melange.yaml	2025-07-18 19:03:46
+++ ./chainscan_20251008_071859/downloaded_apks/cgr.dev_chainguard-private_node_24.9/dumb-init-1.2.5-r9.melange.yaml	2025-09-29 22:21:17
@@ -1,9 +1,9 @@
 package:
   name: dumb-init
   version: 1.2.5
-  epoch: 8
+  epoch: 9
   description: minimal init system for Linux containers
-  commit: c76e6993c59b095dc8c5c9bdbd4747e6908a7867
+  commit: 6c8f22531d6819acaf86fa5b9d9307c8c9003919
   copyright:
     - license: MIT
   resources: {}
@@ -15,70 +15,70 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - bash=5.3-r2
-      - binutils=2.44-r10
-      - build-base=1-r8
-      - busybox=1.37.0-r47
-      - ca-certificates-bundle=20250619-r3
-      - cyrus-sasl=2.1.28-r42
-      - gcc=15.1.0-r2
-      - gdbm=1.25-r3
-      - git=2.50.1-r1
-      - glibc-dev=2.41-r54
-      - glibc-locale-posix=2.41-r54
-      - glibc=2.41-r54
+      - bash=5.3-r3
+      - binutils=2.45-r2
+      - build-base=1-r9
+      - busybox=1.37.0-r50
+      - ca-certificates-bundle=20250619-r6
+      - cyrus-sasl=2.1.28-r44
+      - gcc=15.2.0-r2
+      - gdbm=1.26-r1
+      - git=2.51.0-r1
+      - glibc-dev=2.42-r0
+      - glibc-locale-posix=2.42-r0
+      - glibc=2.42-r0
       - gmp=6.3.0-r8
       - heimdal-libs=7.8.0-r42
       - isl=0.27-r4
-      - keyutils-libs=1.6.3-r36
+      - keyutils-libs=1.6.3-r37
       - krb5-conf=1.0-r7
-      - krb5-libs=1.21.3-r43
-      - ld-linux=2.41-r54
-      - libatomic=15.1.0-r2
-      - libbrotlicommon1=1.1.0-r6
-      - libbrotlidec1=1.1.0-r6
-      - libcap-utils=2.76-r5
-      - libcap=2.76-r5
-      - libcom_err=1.47.2-r23
-      - libcrypt1=2.41-r54
-      - libcrypto3=3.5.1-r0
-      - libcurl-openssl4=8.15.0-r1
-      - libexpat1=2.7.1-r2
-      - libgcc=15.1.0-r2
-      - libgo=15.1.0-r2
-      - libgomp=15.1.0-r2
-      - libidn2=2.3.8-r3
-      - libldap=2.6.10-r4
-      - libnghttp2-14=1.66.0-r1
-      - libpcre2-8-0=10.45-r3
+      - krb5-libs=1.22.1-r1
+      - ld-linux=2.42-r0
+      - libatomic=15.2.0-r2
+      - libbrotlicommon1=1.1.0-r7
+      - libbrotlidec1=1.1.0-r7
+      - libcap-utils=2.76-r6
+      - libcap=2.76-r6
+      - libcom_err=1.47.3-r1
+      - libcrypt1=2.42-r0
+      - libcrypto3=3.5.2-r1
+      - libcurl-openssl4=8.16.0-r0
+      - libexpat1=2.7.3-r0
+      - libgcc=15.2.0-r2
+      - libgo=15.2.0-r2
+      - libgomp=15.2.0-r2
+      - libidn2=2.3.8-r3
+      - libldap=2.6.10-r5
+      - libnghttp2-14=1.67.1-r0
+      - libpcre2-8-0=10.46-r0
       - libpsl=0.21.5-r6
-      - libquadmath=15.1.0-r2
-      - libssl3=3.5.1-r0
-      - libstdc++-dev=15.1.0-r2
-      - libstdc++=15.1.0-r2
-      - libunistring=1.3-r4
+      - libquadmath=15.2.0-r2
```

### libcrypto3
```
======================================
Package: libcrypto3
Version 1: 3.5.2-r1 (node:24.8)
Version 2: 3.5.4-r0 (node:24.9)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071859/downloaded_apks/cgr.dev_chainguard-private_node_24.8/libcrypto3-3.5.2-r1.melange.yaml	2025-08-16 14:46:23
+++ ./chainscan_20251008_071859/downloaded_apks/cgr.dev_chainguard-private_node_24.9/libcrypto3-3.5.4-r0.melange.yaml	2025-10-02 05:23:55
@@ -1,9 +1,9 @@
 package:
   name: openssl
-  version: 3.5.2
-  epoch: 1
+  version: 3.5.4
+  epoch: 0
   description: the OpenSSL cryptography suite
-  commit: bea0f7b0984dd631538eb15205c930b83d5ea7c8
+  commit: 335661ff334440db9352fb0f936452c6e7743f7a
   copyright:
     - license: Apache-2.0
   dependencies:
@@ -21,17 +21,17 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - binutils=2.45-r0
-      - build-base=1-r8
-      - busybox=1.37.0-r48
-      - ca-certificates-bundle=20250619-r5
+      - binutils=2.45-r2
+      - build-base=1-r9
+      - busybox=1.37.0-r50
+      - ca-certificates-bundle=20250619-r6
       - cyrus-sasl=2.1.28-r44
-      - gcc=15.2.0-r0
+      - gcc=15.2.0-r2
       - gdbm=1.26-r1
-      - git=2.50.1-r1
-      - glibc-dev=2.41-r56
-      - glibc-locale-posix=2.41-r56
-      - glibc=2.41-r56
+      - git=2.51.0-r1
+      - glibc-dev=2.42-r0
+      - glibc-locale-posix=2.42-r0
+      - glibc=2.42-r0
       - gmp=6.3.0-r8
       - heimdal-libs=7.8.0-r42
       - isl=0.27-r4
@@ -39,51 +39,51 @@
       - jitterentropy-library=3.5.0-r0
       - keyutils-libs=1.6.3-r37
       - krb5-conf=1.0-r7
-      - krb5-libs=1.22-r2
-      - ld-linux=2.41-r56
-      - libatomic=15.2.0-r0
+      - krb5-libs=1.22.1-r1
+      - ld-linux=2.42-r0
+      - libatomic=15.2.0-r2
       - libbrotlicommon1=1.1.0-r7
       - libbrotlidec1=1.1.0-r7
       - libbz2-1=1.0.8-r21
       - libcom_err=1.47.3-r1
-      - libcrypt1=2.41-r56
-      - libcrypto3=3.5.2-r0
-      - libcurl-openssl4=8.15.0-r4
-      - libexpat1=2.7.1-r3
-      - libgcc=15.2.0-r0
-      - libgo=15.2.0-r0
-      - libgomp=15.2.0-r0
+      - libcrypt1=2.42-r0
+      - libcrypto3=3.5.3-r2
+      - libcurl-openssl4=8.16.0-r1
+      - libexpat1=2.7.3-r0
+      - libgcc=15.2.0-r2
+      - libgo=15.2.0-r2
+      - libgomp=15.2.0-r2
       - libidn2=2.3.8-r3
       - libldap=2.6.10-r5
-      - libnghttp2-14=1.66.0-r1
-      - libpcre2-8-0=10.45-r3
+      - libnghttp2-14=1.67.1-r0
+      - libpcre2-8-0=10.46-r0
       - libpsl=0.21.5-r6
-      - libquadmath=15.2.0-r0
-      - libssl3=3.5.2-r0
-      - libstdc++-dev=15.2.0-r0
-      - libstdc++=15.2.0-r0
-      - libunistring=1.3-r4
+      - libquadmath=15.2.0-r2
+      - libssl3=3.5.3-r2
+      - libstdc++-dev=15.2.0-r2
+      - libstdc++=15.2.0-r2
+      - libunistring=1.4-r0
       - libverto=0.3.2-r6
       - libxcrypt-dev=4.4.38-r4
       - libxcrypt=4.4.38-r4
       - libzstd1=1.5.7-r3
-      - linux-headers=6.16.1-r0
+      - linux-headers=6.16.9-r0
```

### libssl3
```
======================================
Package: libssl3
Version 1: 3.5.2-r1 (node:24.8)
Version 2: 3.5.4-r0 (node:24.9)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071859/downloaded_apks/cgr.dev_chainguard-private_node_24.8/libssl3-3.5.2-r1.melange.yaml	2025-08-16 14:46:23
+++ ./chainscan_20251008_071859/downloaded_apks/cgr.dev_chainguard-private_node_24.9/libssl3-3.5.4-r0.melange.yaml	2025-10-02 05:23:55
@@ -1,9 +1,9 @@
 package:
   name: openssl
-  version: 3.5.2
-  epoch: 1
+  version: 3.5.4
+  epoch: 0
   description: the OpenSSL cryptography suite
-  commit: bea0f7b0984dd631538eb15205c930b83d5ea7c8
+  commit: 335661ff334440db9352fb0f936452c6e7743f7a
   copyright:
     - license: Apache-2.0
   dependencies:
@@ -21,17 +21,17 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - binutils=2.45-r0
-      - build-base=1-r8
-      - busybox=1.37.0-r48
-      - ca-certificates-bundle=20250619-r5
+      - binutils=2.45-r2
+      - build-base=1-r9
+      - busybox=1.37.0-r50
+      - ca-certificates-bundle=20250619-r6
       - cyrus-sasl=2.1.28-r44
-      - gcc=15.2.0-r0
+      - gcc=15.2.0-r2
       - gdbm=1.26-r1
-      - git=2.50.1-r1
-      - glibc-dev=2.41-r56
-      - glibc-locale-posix=2.41-r56
-      - glibc=2.41-r56
+      - git=2.51.0-r1
+      - glibc-dev=2.42-r0
+      - glibc-locale-posix=2.42-r0
+      - glibc=2.42-r0
       - gmp=6.3.0-r8
       - heimdal-libs=7.8.0-r42
       - isl=0.27-r4
@@ -39,51 +39,51 @@
       - jitterentropy-library=3.5.0-r0
       - keyutils-libs=1.6.3-r37
       - krb5-conf=1.0-r7
-      - krb5-libs=1.22-r2
-      - ld-linux=2.41-r56
-      - libatomic=15.2.0-r0
+      - krb5-libs=1.22.1-r1
+      - ld-linux=2.42-r0
+      - libatomic=15.2.0-r2
       - libbrotlicommon1=1.1.0-r7
       - libbrotlidec1=1.1.0-r7
       - libbz2-1=1.0.8-r21
       - libcom_err=1.47.3-r1
-      - libcrypt1=2.41-r56
-      - libcrypto3=3.5.2-r0
-      - libcurl-openssl4=8.15.0-r4
-      - libexpat1=2.7.1-r3
-      - libgcc=15.2.0-r0
-      - libgo=15.2.0-r0
-      - libgomp=15.2.0-r0
+      - libcrypt1=2.42-r0
+      - libcrypto3=3.5.3-r2
+      - libcurl-openssl4=8.16.0-r1
+      - libexpat1=2.7.3-r0
+      - libgcc=15.2.0-r2
+      - libgo=15.2.0-r2
+      - libgomp=15.2.0-r2
       - libidn2=2.3.8-r3
       - libldap=2.6.10-r5
-      - libnghttp2-14=1.66.0-r1
-      - libpcre2-8-0=10.45-r3
+      - libnghttp2-14=1.67.1-r0
+      - libpcre2-8-0=10.46-r0
       - libpsl=0.21.5-r6
-      - libquadmath=15.2.0-r0
-      - libssl3=3.5.2-r0
-      - libstdc++-dev=15.2.0-r0
-      - libstdc++=15.2.0-r0
-      - libunistring=1.3-r4
+      - libquadmath=15.2.0-r2
+      - libssl3=3.5.3-r2
+      - libstdc++-dev=15.2.0-r2
+      - libstdc++=15.2.0-r2
+      - libunistring=1.4-r0
       - libverto=0.3.2-r6
       - libxcrypt-dev=4.4.38-r4
       - libxcrypt=4.4.38-r4
       - libzstd1=1.5.7-r3
-      - linux-headers=6.16.1-r0
+      - linux-headers=6.16.9-r0
```

### nodejs-24
```
======================================
Package: nodejs-24
Version 1: 24.8.0-r0 (node:24.8)
Version 2: 24.9.0-r0 (node:24.9)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071859/downloaded_apks/cgr.dev_chainguard-private_node_24.8/nodejs-24-24.8.0-r0.melange.yaml	2025-09-10 14:22:31
+++ ./chainscan_20251008_071859/downloaded_apks/cgr.dev_chainguard-private_node_24.9/nodejs-24-24.9.0-r0.melange.yaml	2025-09-25 14:21:18
@@ -1,14 +1,14 @@
 package:
   name: nodejs-24
-  version: 24.8.0
+  version: 24.9.0
   epoch: 0
   description: JavaScript runtime built on V8 engine
-  commit: 21336ef289a6dcd26f191c941a010ad045fd7af9
+  commit: e5c85cb95b5983117be8bdcd6d063dfdd2141736
   copyright:
     - license: MIT
   dependencies:
     provides:
-      - nodejs=24.8.0-r0
+      - nodejs=24.9.0-r0
   resources:
     cpu: "33"
     memory: 64Gi
@@ -21,10 +21,10 @@
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
       - apk-tools=2.14.10-r8
-      - binutils=2.45-r1
+      - binutils=2.45-r2
       - brotli-dev=1.1.0-r7
       - brotli=1.1.0-r7
-      - build-base=1-r8
+      - build-base=1-r9
       - busybox=1.37.0-r50
       - c-ares-dev=1.34.5-r3
       - c-ares=1.34.5-r3
@@ -58,7 +58,7 @@
       - libcrypto3=3.5.2-r1
       - libcurl-openssl4=8.16.0-r0
       - libev=4.33-r9
-      - libexpat1=2.7.1-r3
+      - libexpat1=2.7.3-r0
       - libffi=3.5.2-r1
       - libgcc=15.2.0-r2
       - libgo=15.2.0-r2
@@ -66,7 +66,7 @@
       - libicu77=77.1-r1
       - libidn2=2.3.8-r3
       - libldap=2.6.10-r5
-      - libnghttp2-14=1.67.0-r0
+      - libnghttp2-14=1.67.1-r0
       - libpcre2-8-0=10.46-r0
       - libpsl=0.21.5-r6
       - libquadmath=15.2.0-r2
@@ -74,25 +74,25 @@
       - libstdc++-dev=15.2.0-r2
       - libstdc++=15.2.0-r2
       - libunistring=1.3-r4
-      - libuuid=2.41.1-r4
+      - libuuid=2.41.2-r0
       - libuv-dev=1.51.0-r2
       - libuv=1.51.0-r2
       - libverto=0.3.2-r6
       - libxcrypt-dev=4.4.38-r4
       - libxcrypt=4.4.38-r4
       - libzstd1=1.5.7-r3
-      - linux-headers=6.16.6-r0
+      - linux-headers=6.16.9-r0
       - make=4.4.1-r8
       - mpc=1.3.1-r7
       - mpdecimal=4.0.1-r3
       - mpfr=4.2.2-r2
       - ncurses-terminfo-base=6.5_p20250621-r1
       - ncurses=6.5_p20250621-r1
-      - nghttp2-dev=1.67.0-r0
-      - nghttp2=1.67.0-r0
+      - nghttp2-dev=1.67.1-r0
+      - nghttp2=1.67.1-r0
       - nss-db=2.42-r0
       - nss-hesiod=2.42-r0
-      - openssf-compiler-options=20240627-r27
+      - openssf-compiler-options=20240627-r29
       - openssl-dev=3.5.2-r1
       - pkgconf=2.5.1-r1
       - posix-cc-wrappers=1-r7
@@ -100,15 +100,15 @@
       - py3.13-jinja2=3.1.6-r1
       - py3.13-markupsafe=3.0.2-r3
       - py3.13-setuptools=80.9.0-r2
-      - python-3.13-base=3.13.7-r1
+      - python-3.13-base=3.13.7-r2
       - readline=8.3-r1
       - samurai=1.2-r3
       - scanelf=1.3.8-r5
       - sqlite-libs=3.50.4-r1
       - wolfi-base=1-r7
```

