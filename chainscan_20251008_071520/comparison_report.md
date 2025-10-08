# Chainscan Report

**Generated:** Wed  8 Oct 2025 07:15:53 PDT

## Images Analyzed
- **Image 1:** `cgr.dev/chainguard-private/python:3.11.12`
- **Image 2:** `cgr.dev/chainguard-private/python:3.11.13`

> **Analysis Method:** All APK packages and melange.yaml files were downloaded directly
> from packages.wolfi.dev. No container images were run during this analysis.

## APK Packages Downloaded
### cgr.dev_chainguard-private_python_3.11.12
- Melange.yaml files:       26

### cgr.dev_chainguard-private_python_3.11.13
- Melange.yaml files:       26

## Package Differences
```diff
1,28c1,28
< ca-certificates-bundle 20241121-r42
< chainguard-baselayout 20230214-r13
< gdbm 1.25-r1
< glibc 2.41-r4
< glibc-locale-posix 2.41-r4
< ld-linux 2.41-r4
< libbz2-1 1.0.8-r12
< libcrypt1 2.41-r4
< libcrypto3 3.5.0-r2
< libexpat1 2.7.1-r1
< libffi 3.4.8-r1
< libffi 3.4.8-r1
< libgcc 15.1.0-r1
< libssl3 3.5.0-r2
< libstdc++ 15.1.0-r1
< libxcrypt 4.4.38-r2
< mpdecimal 4.0.1-r1
< ncurses 6.5_p20241228-r2
< ncurses-terminfo-base 6.5_p20241228-r2
< py3-pip-wheel 25.1.1-r1
< py3-setuptools-wheel 80.9.0-r0
< python-3.11 3.11.12-r2
< python-3.11-base 3.11.12-r2
< readline 8.2.13-r4
< sqlite-libs 3.50.0-r0
< wolfi-baselayout 20230201-r20
< xz 5.8.1-r1
< zlib 1.3.1-r7
---
> ca-certificates-bundle 20250619-r6
> chainguard-baselayout 20230214-r15
> gdbm 1.26-r1
> glibc 2.42-r0
> glibc-locale-posix 2.42-r0
> ld-linux 2.42-r0
> libbz2-1 1.0.8-r21
> libcrypt1 2.42-r0
> libcrypto3 3.5.4-r0
> libexpat1 2.7.3-r0
> libffi 3.5.2-r1
> libffi 3.5.2-r1
> libgcc 15.2.0-r2
> libssl3 3.5.4-r0
> libstdc++ 15.2.0-r2
> libxcrypt 4.4.38-r4
> mpdecimal 4.0.1-r3
> ncurses 6.5_p20250621-r1
> ncurses-terminfo-base 6.5_p20250621-r1
> py3-pip-wheel 25.2-r1
> py3-setuptools-wheel 80.9.0-r2
> python-3.11 3.11.13-r5
> python-3.11-base 3.11.13-r5
> readline 8.3-r1
> sqlite-libs 3.50.4-r1
> wolfi-baselayout 20230201-r24
> xz 5.8.1-r3
> zlib 1.3.1-r51
```

## Melange.yaml Comparisons
### ca-certificates-bundle
```
======================================
Package: ca-certificates-bundle
Version 1: 20241121-r42 (python:3.11.12)
Version 2: 20250619-r6 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/ca-certificates-bundle-20241121-r42.melange.yaml	2025-05-28 06:35:48
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/ca-certificates-bundle-20250619-r6.melange.yaml	2025-09-05 11:06:51
@@ -1,9 +1,9 @@
 package:
   name: ca-certificates
-  version: "20241121"
-  epoch: 42
+  version: "20250619"
+  epoch: 6
   description: CA certificates from the Mozilla trusted root program
-  commit: cfbfc5c7500721e9c6e95221587c5d6943cddda5
+  commit: ba7ece3f2437a8e7fb3a33424a942dbc3f402f0d
   copyright:
     - license: MPL-2.0 AND MIT
   dependencies:
@@ -19,70 +19,69 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - binutils=2.44-r2
+      - binutils=2.45-r1
       - build-base=1-r8
-      - busybox=1.37.0-r40
-      - ca-certificates-bundle=20241121-r41
-      - cyrus-sasl=2.1.28-r40
-      - gcc=14.2.0-r12
-      - gdbm=1.25-r0
-      - git=2.49.0-r1
-      - glibc-dev=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp=6.3.0-r4
-      - heimdal-libs=7.8.0-r40
-      - isl=0.27-r0
-      - jitterentropy-library-dev=3.6.3-r1
-      - jitterentropy-library=3.6.3-r1
-      - keyutils-libs=1.6.3-r31
-      - krb5-conf=1.0-r6
-      - krb5-libs=1.21.3-r40
-      - ld-linux=2.41-r4
-      - libatomic=14.2.0-r12
-      - libbrotlicommon1=1.1.0-r4
-      - libbrotlidec1=1.1.0-r4
-      - libbz2-1=1.0.8-r11
-      - libcom_err=1.47.2-r21
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r2
-      - libcurl-openssl4=8.14.0-r0
-      - libexpat1=2.7.1-r0
-      - libgcc=14.2.0-r12
-      - libgo=14.2.0-r12
-      - libgomp=14.2.0-r12
-      - libidn2=2.3.8-r0
-      - libldap=2.6.10-r0
-      - libnghttp2-14=1.65.0-r0
-      - libpcre2-8-0=10.45-r1
-      - libpsl=0.21.5-r4
-      - libquadmath=14.2.0-r12
-      - libssl3=3.5.0-r2
-      - libstdc++-dev=14.2.0-r12
-      - libstdc++=14.2.0-r12
-      - libunistring=1.3-r1
-      - libverto=0.3.2-r4
-      - libxcrypt-dev=4.4.38-r1
-      - libxcrypt=4.4.38-r1
-      - libzstd1=1.5.7-r1
-      - linux-headers=6.15-r0
-      - make=4.4.1-r4
-      - mpc=1.3.1-r5
-      - mpfr=4.2.2-r0
-      - ncurses-terminfo-base=6.5_p20241228-r1
-      - ncurses=6.5_p20241228-r1
-      - nss-db=2.41-r4
-      - nss-hesiod=2.41-r4
-      - openssf-compiler-options=20240627-r20
-      - openssl-dev=3.5.0-r2
-      - patch=2.8-r0
-      - perl=5.40.2-r0
-      - pkgconf=2.4.3-r1
-      - posix-cc-wrappers=1-r6
-      - readline=8.2.13-r3
-      - sqlite-libs=3.49.2-r0
-      - wolfi-baselayout=20230201-r20
-      - zlib=1.3.1-r7
+      - busybox=1.37.0-r50
+      - ca-certificates-bundle=20250619-r5
+      - cyrus-sasl=2.1.28-r44
+      - gcc=15.2.0-r1
+      - gdbm=1.26-r1
+      - git=2.51.0-r1
+      - glibc-dev=2.42-r0
+      - glibc-locale-posix=2.42-r0
+      - glibc=2.42-r0
```

### gdbm
```
======================================
Package: gdbm
Version 1: 1.25-r1 (python:3.11.12)
Version 2: 1.26-r1 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/gdbm-1.25-r1.melange.yaml	2025-05-28 06:35:48
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/gdbm-1.26-r1.melange.yaml	2025-08-05 18:44:08
@@ -1,9 +1,9 @@
 package:
   name: gdbm
-  version: "1.25"
+  version: "1.26"
   epoch: 1
   description: GNU dbm is a set of database routines which use extensible hashing
-  commit: cfbfc5c7500721e9c6e95221587c5d6943cddda5
+  commit: 834490e333bbfebd997c42d713e1f728eab3958f
   copyright:
     - license: GPL-3.0-or-later
   resources: {}
@@ -15,43 +15,43 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - binutils=2.44-r2
+      - binutils=2.45-r0
       - build-base=1-r8
-      - busybox=1.37.0-r40
-      - ca-certificates-bundle=20241121-r42
-      - gcc=14.2.0-r12
-      - glibc-dev=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp=6.3.0-r4
-      - isl=0.27-r0
-      - ld-linux=2.41-r4
-      - libatomic=14.2.0-r12
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r2
-      - libgcc=14.2.0-r12
-      - libgo=14.2.0-r12
-      - libgomp=14.2.0-r12
-      - libquadmath=14.2.0-r12
-      - libssl3=3.5.0-r2
-      - libstdc++-dev=14.2.0-r12
-      - libstdc++=14.2.0-r12
-      - libxcrypt-dev=4.4.38-r1
-      - libxcrypt=4.4.38-r1
-      - libzstd1=1.5.7-r2
-      - linux-headers=6.15-r0
-      - make=4.4.1-r5
-      - mpc=1.3.1-r5
-      - mpfr=4.2.2-r0
-      - nss-db=2.41-r4
-      - nss-hesiod=2.41-r4
-      - openssf-compiler-options=20240627-r20
-      - pkgconf=2.4.3-r1
-      - posix-cc-wrappers=1-r6
-      - scanelf=1.3.8-r4
-      - wget=1.25.0-r1
-      - wolfi-baselayout=20230201-r20
-      - zlib=1.3.1-r7
+      - busybox=1.37.0-r47
+      - ca-certificates-bundle=20250619-r5
+      - gcc=15.1.0-r4
+      - glibc-dev=2.41-r56
+      - glibc-locale-posix=2.41-r56
+      - glibc=2.41-r56
+      - gmp=6.3.0-r8
+      - isl=0.27-r4
+      - ld-linux=2.41-r56
+      - libatomic=15.1.0-r4
+      - libcrypt1=2.41-r56
+      - libcrypto3=3.5.1-r1
+      - libgcc=15.1.0-r4
+      - libgo=15.1.0-r4
+      - libgomp=15.1.0-r4
+      - libquadmath=15.1.0-r4
+      - libssl3=3.5.1-r1
+      - libstdc++-dev=15.1.0-r4
+      - libstdc++=15.1.0-r4
+      - libxcrypt-dev=4.4.38-r3
+      - libxcrypt=4.4.38-r3
+      - libzstd1=1.5.7-r3
+      - linux-headers=6.16-r0
+      - make=4.4.1-r8
+      - mpc=1.3.1-r7
+      - mpfr=4.2.2-r2
+      - nss-db=2.41-r56
+      - nss-hesiod=2.41-r56
+      - openssf-compiler-options=20240627-r26
+      - pkgconf=2.5.1-r1
+      - posix-cc-wrappers=1-r7
+      - scanelf=1.3.8-r5
+      - wget=1.25.0-r3
+      - wolfi-baselayout=20230201-r23
+      - zlib=1.3.1-r51
   accounts:
     run-as: ""
```

### glibc
```
======================================
Package: glibc
Version 1: 2.41-r4 (python:3.11.12)
Version 2: 2.42-r0 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/glibc-2.41-r4.melange.yaml	2025-05-19 14:18:11
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/glibc-2.42-r0.melange.yaml	2025-08-19 12:04:24
@@ -1,9 +1,9 @@
 package:
   name: glibc
-  version: "2.41"
-  epoch: 4
+  version: "2.42"
+  epoch: 0
   description: the GNU C library
-  commit: 5b33da5080987828fa1faf6e3c40cc63515758dd
+  commit: eeaa6d73d4eb96d96308dfda6c7a78ce52ee0453
   copyright:
     - license: LGPL-2.1-or-later
   dependencies:
@@ -11,6 +11,7 @@
       - '!musl'
       - glibc-locale-posix
       - libgcc
+      - merged-lib
       - merged-sbin
       - merged-usrsbin
       - wolfi-baselayout
@@ -22,93 +23,91 @@
     build_repositories:
       - https://apk.cgr.dev/chainguard
       - https://packages.wolfi.dev/os
-    repositories:
-      - https://packages.wolfi.dev/bootstrap/stage3
     keyring:
-      - https://packages.wolfi.dev/bootstrap/stage3/wolfi-signing.rsa.pub
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - bash=5.2.37-r30
-      - binutils=2.44-r2
-      - bison=3.8.2-r6
+      - bash=5.3-r3
+      - binutils=2.45-r0
+      - bison=3.8.2-r53
       - build-base=1-r8
-      - busybox=1.37.0-r40
-      - ca-certificates-bundle=20241121-r40
-      - coreutils=9.7-r0
-      - cyrus-sasl=2.1.28-r40
+      - busybox=1.37.0-r48
+      - ca-certificates-bundle=20250619-r5
+      - coreutils=9.7-r4
+      - cyrus-sasl=2.1.28-r44
       - flex=2.6.4-r8
-      - gawk=5.3.2-r0
-      - gcc=14.2.0-r12
-      - gdbm=1.25-r0
-      - git=2.49.0-r1
-      - glibc-dev=2.41-r3
-      - glibc-locale-posix=2.41-r3
-      - glibc=2.41-r3
-      - gmp-dev=6.3.0-r4
-      - gmp=6.3.0-r4
-      - grep=3.12-r0
-      - heimdal-libs=7.8.0-r40
-      - isl=0.27-r0
-      - keyutils-libs=1.6.3-r31
-      - krb5-conf=1.0-r5
-      - krb5-libs=1.21.3-r40
-      - ld-linux=2.41-r3
-      - libacl1=2.3.2-r6
-      - libatomic=14.2.0-r12
-      - libattr1=2.5.2-r6
-      - libbrotlicommon1=1.1.0-r4
-      - libbrotlidec1=1.1.0-r4
-      - libbz2-1=1.0.8-r11
-      - libcom_err=1.47.2-r21
-      - libcrypt1=2.41-r3
-      - libcrypto3=3.5.0-r1
-      - libcurl-openssl4=8.13.0-r0
-      - libexpat1=2.7.1-r0
-      - libffi=3.4.8-r0
-      - libgcc=14.2.0-r12
-      - libgo=14.2.0-r12
-      - libgomp=14.2.0-r12
-      - libidn2=2.3.8-r0
-      - libldap=2.6.9-r41
-      - libnghttp2-14=1.65.0-r0
-      - libpcre2-8-0=10.45-r1
-      - libpsl=0.21.5-r4
-      - libquadmath=14.2.0-r12
-      - libssl3=3.5.0-r1
-      - libstdc++-dev=14.2.0-r12
-      - libstdc++=14.2.0-r12
-      - libunistring=1.3-r1
-      - libverto=0.3.2-r4
-      - libxcrypt-dev=4.4.38-r1
-      - libxcrypt=4.4.38-r1
```

### glibc-locale-posix
```
======================================
Package: glibc-locale-posix
Version 1: 2.41-r4 (python:3.11.12)
Version 2: 2.42-r0 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/glibc-locale-posix-2.41-r4.melange.yaml	2025-05-19 14:18:11
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/glibc-locale-posix-2.42-r0.melange.yaml	2025-08-19 12:04:24
@@ -1,9 +1,9 @@
 package:
   name: glibc
-  version: "2.41"
-  epoch: 4
+  version: "2.42"
+  epoch: 0
   description: the GNU C library
-  commit: 5b33da5080987828fa1faf6e3c40cc63515758dd
+  commit: eeaa6d73d4eb96d96308dfda6c7a78ce52ee0453
   copyright:
     - license: LGPL-2.1-or-later
   dependencies:
@@ -11,6 +11,7 @@
       - '!musl'
       - glibc-locale-posix
       - libgcc
+      - merged-lib
       - merged-sbin
       - merged-usrsbin
       - wolfi-baselayout
@@ -22,93 +23,91 @@
     build_repositories:
       - https://apk.cgr.dev/chainguard
       - https://packages.wolfi.dev/os
-    repositories:
-      - https://packages.wolfi.dev/bootstrap/stage3
     keyring:
-      - https://packages.wolfi.dev/bootstrap/stage3/wolfi-signing.rsa.pub
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - bash=5.2.37-r30
-      - binutils=2.44-r2
-      - bison=3.8.2-r6
+      - bash=5.3-r3
+      - binutils=2.45-r0
+      - bison=3.8.2-r53
       - build-base=1-r8
-      - busybox=1.37.0-r40
-      - ca-certificates-bundle=20241121-r40
-      - coreutils=9.7-r0
-      - cyrus-sasl=2.1.28-r40
+      - busybox=1.37.0-r48
+      - ca-certificates-bundle=20250619-r5
+      - coreutils=9.7-r4
+      - cyrus-sasl=2.1.28-r44
       - flex=2.6.4-r8
-      - gawk=5.3.2-r0
-      - gcc=14.2.0-r12
-      - gdbm=1.25-r0
-      - git=2.49.0-r1
-      - glibc-dev=2.41-r3
-      - glibc-locale-posix=2.41-r3
-      - glibc=2.41-r3
-      - gmp-dev=6.3.0-r4
-      - gmp=6.3.0-r4
-      - grep=3.12-r0
-      - heimdal-libs=7.8.0-r40
-      - isl=0.27-r0
-      - keyutils-libs=1.6.3-r31
-      - krb5-conf=1.0-r5
-      - krb5-libs=1.21.3-r40
-      - ld-linux=2.41-r3
-      - libacl1=2.3.2-r6
-      - libatomic=14.2.0-r12
-      - libattr1=2.5.2-r6
-      - libbrotlicommon1=1.1.0-r4
-      - libbrotlidec1=1.1.0-r4
-      - libbz2-1=1.0.8-r11
-      - libcom_err=1.47.2-r21
-      - libcrypt1=2.41-r3
-      - libcrypto3=3.5.0-r1
-      - libcurl-openssl4=8.13.0-r0
-      - libexpat1=2.7.1-r0
-      - libffi=3.4.8-r0
-      - libgcc=14.2.0-r12
-      - libgo=14.2.0-r12
-      - libgomp=14.2.0-r12
-      - libidn2=2.3.8-r0
-      - libldap=2.6.9-r41
-      - libnghttp2-14=1.65.0-r0
-      - libpcre2-8-0=10.45-r1
-      - libpsl=0.21.5-r4
-      - libquadmath=14.2.0-r12
-      - libssl3=3.5.0-r1
-      - libstdc++-dev=14.2.0-r12
-      - libstdc++=14.2.0-r12
-      - libunistring=1.3-r1
-      - libverto=0.3.2-r4
-      - libxcrypt-dev=4.4.38-r1
-      - libxcrypt=4.4.38-r1
```

### ld-linux
```
======================================
Package: ld-linux
Version 1: 2.41-r4 (python:3.11.12)
Version 2: 2.42-r0 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/ld-linux-2.41-r4.melange.yaml	2025-05-19 14:18:11
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/ld-linux-2.42-r0.melange.yaml	2025-08-19 12:04:24
@@ -1,9 +1,9 @@
 package:
   name: glibc
-  version: "2.41"
-  epoch: 4
+  version: "2.42"
+  epoch: 0
   description: the GNU C library
-  commit: 5b33da5080987828fa1faf6e3c40cc63515758dd
+  commit: eeaa6d73d4eb96d96308dfda6c7a78ce52ee0453
   copyright:
     - license: LGPL-2.1-or-later
   dependencies:
@@ -11,6 +11,7 @@
       - '!musl'
       - glibc-locale-posix
       - libgcc
+      - merged-lib
       - merged-sbin
       - merged-usrsbin
       - wolfi-baselayout
@@ -22,93 +23,91 @@
     build_repositories:
       - https://apk.cgr.dev/chainguard
       - https://packages.wolfi.dev/os
-    repositories:
-      - https://packages.wolfi.dev/bootstrap/stage3
     keyring:
-      - https://packages.wolfi.dev/bootstrap/stage3/wolfi-signing.rsa.pub
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - bash=5.2.37-r30
-      - binutils=2.44-r2
-      - bison=3.8.2-r6
+      - bash=5.3-r3
+      - binutils=2.45-r0
+      - bison=3.8.2-r53
       - build-base=1-r8
-      - busybox=1.37.0-r40
-      - ca-certificates-bundle=20241121-r40
-      - coreutils=9.7-r0
-      - cyrus-sasl=2.1.28-r40
+      - busybox=1.37.0-r48
+      - ca-certificates-bundle=20250619-r5
+      - coreutils=9.7-r4
+      - cyrus-sasl=2.1.28-r44
       - flex=2.6.4-r8
-      - gawk=5.3.2-r0
-      - gcc=14.2.0-r12
-      - gdbm=1.25-r0
-      - git=2.49.0-r1
-      - glibc-dev=2.41-r3
-      - glibc-locale-posix=2.41-r3
-      - glibc=2.41-r3
-      - gmp-dev=6.3.0-r4
-      - gmp=6.3.0-r4
-      - grep=3.12-r0
-      - heimdal-libs=7.8.0-r40
-      - isl=0.27-r0
-      - keyutils-libs=1.6.3-r31
-      - krb5-conf=1.0-r5
-      - krb5-libs=1.21.3-r40
-      - ld-linux=2.41-r3
-      - libacl1=2.3.2-r6
-      - libatomic=14.2.0-r12
-      - libattr1=2.5.2-r6
-      - libbrotlicommon1=1.1.0-r4
-      - libbrotlidec1=1.1.0-r4
-      - libbz2-1=1.0.8-r11
-      - libcom_err=1.47.2-r21
-      - libcrypt1=2.41-r3
-      - libcrypto3=3.5.0-r1
-      - libcurl-openssl4=8.13.0-r0
-      - libexpat1=2.7.1-r0
-      - libffi=3.4.8-r0
-      - libgcc=14.2.0-r12
-      - libgo=14.2.0-r12
-      - libgomp=14.2.0-r12
-      - libidn2=2.3.8-r0
-      - libldap=2.6.9-r41
-      - libnghttp2-14=1.65.0-r0
-      - libpcre2-8-0=10.45-r1
-      - libpsl=0.21.5-r4
-      - libquadmath=14.2.0-r12
-      - libssl3=3.5.0-r1
-      - libstdc++-dev=14.2.0-r12
-      - libstdc++=14.2.0-r12
-      - libunistring=1.3-r1
-      - libverto=0.3.2-r4
-      - libxcrypt-dev=4.4.38-r1
-      - libxcrypt=4.4.38-r1
```

### libbz2-1
```
======================================
Package: libbz2-1
Version 1: 1.0.8-r12 (python:3.11.12)
Version 2: 1.0.8-r21 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/libbz2-1-1.0.8-r12.melange.yaml	2025-05-28 06:35:48
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/libbz2-1-1.0.8-r21.melange.yaml	2025-08-01 16:05:56
@@ -1,9 +1,9 @@
 package:
   name: bzip2
   version: 1.0.8
-  epoch: 12
+  epoch: 21
   description: a library implementing the bzip2 compression algorithms
-  commit: cfbfc5c7500721e9c6e95221587c5d6943cddda5
+  commit: 2619f318eef93ed7f288a87b446626ed9eff6488
   copyright:
     - license: MPL-2.0 AND MIT
   resources: {}
@@ -15,66 +15,66 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - binutils=2.44-r2
+      - binutils=2.45-r0
       - build-base=1-r8
-      - busybox=1.37.0-r41
-      - ca-certificates-bundle=20241121-r42
-      - cyrus-sasl=2.1.28-r40
-      - gcc=14.2.0-r12
-      - gdbm=1.25-r0
-      - git=2.49.0-r1
-      - glibc-dev=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp=6.3.0-r4
-      - heimdal-libs=7.8.0-r40
-      - isl=0.27-r0
-      - keyutils-libs=1.6.3-r31
-      - krb5-conf=1.0-r6
-      - krb5-libs=1.21.3-r40
-      - ld-linux=2.41-r4
-      - libatomic=14.2.0-r12
-      - libbrotlicommon1=1.1.0-r5
-      - libbrotlidec1=1.1.0-r5
-      - libcom_err=1.47.2-r21
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r2
-      - libcurl-openssl4=8.14.0-r0
-      - libexpat1=2.7.1-r0
-      - libgcc=14.2.0-r12
-      - libgo=14.2.0-r12
-      - libgomp=14.2.0-r12
-      - libidn2=2.3.8-r0
-      - libldap=2.6.10-r0
-      - libnghttp2-14=1.65.0-r0
-      - libpcre2-8-0=10.45-r1
-      - libpsl=0.21.5-r4
-      - libquadmath=14.2.0-r12
-      - libssl3=3.5.0-r2
-      - libstdc++-dev=14.2.0-r12
-      - libstdc++=14.2.0-r12
-      - libunistring=1.3-r1
-      - libverto=0.3.2-r4
-      - libxcrypt-dev=4.4.38-r1
-      - libxcrypt=4.4.38-r1
-      - libzstd1=1.5.7-r2
-      - linux-headers=6.15-r1
-      - make=4.4.1-r5
-      - mpc=1.3.1-r5
-      - mpfr=4.2.2-r0
-      - ncurses-terminfo-base=6.5_p20241228-r1
-      - ncurses=6.5_p20241228-r1
-      - nss-db=2.41-r4
-      - nss-hesiod=2.41-r4
-      - openssf-compiler-options=20240627-r20
-      - patch=2.8-r0
-      - pkgconf=2.4.3-r1
-      - posix-cc-wrappers=1-r6
-      - readline=8.2.13-r3
-      - scanelf=1.3.8-r4
-      - sqlite-libs=3.49.2-r0
-      - wolfi-baselayout=20230201-r20
-      - zlib=1.3.1-r7
+      - busybox=1.37.0-r47
+      - ca-certificates-bundle=20250619-r5
+      - cyrus-sasl=2.1.28-r43
+      - gcc=15.1.0-r4
+      - gdbm=1.26-r0
+      - git=2.50.1-r1
+      - glibc-dev=2.41-r56
+      - glibc-locale-posix=2.41-r56
+      - glibc=2.41-r56
+      - gmp=6.3.0-r8
+      - heimdal-libs=7.8.0-r42
+      - isl=0.27-r4
+      - keyutils-libs=1.6.3-r36
+      - krb5-conf=1.0-r7
```

### libcrypt1
```
======================================
Package: libcrypt1
Version 1: 2.41-r4 (python:3.11.12)
Version 2: 2.42-r0 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/libcrypt1-2.41-r4.melange.yaml	2025-05-19 14:18:11
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/libcrypt1-2.42-r0.melange.yaml	2025-08-19 12:04:24
@@ -1,9 +1,9 @@
 package:
   name: glibc
-  version: "2.41"
-  epoch: 4
+  version: "2.42"
+  epoch: 0
   description: the GNU C library
-  commit: 5b33da5080987828fa1faf6e3c40cc63515758dd
+  commit: eeaa6d73d4eb96d96308dfda6c7a78ce52ee0453
   copyright:
     - license: LGPL-2.1-or-later
   dependencies:
@@ -11,6 +11,7 @@
       - '!musl'
       - glibc-locale-posix
       - libgcc
+      - merged-lib
       - merged-sbin
       - merged-usrsbin
       - wolfi-baselayout
@@ -22,93 +23,91 @@
     build_repositories:
       - https://apk.cgr.dev/chainguard
       - https://packages.wolfi.dev/os
-    repositories:
-      - https://packages.wolfi.dev/bootstrap/stage3
     keyring:
-      - https://packages.wolfi.dev/bootstrap/stage3/wolfi-signing.rsa.pub
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - bash=5.2.37-r30
-      - binutils=2.44-r2
-      - bison=3.8.2-r6
+      - bash=5.3-r3
+      - binutils=2.45-r0
+      - bison=3.8.2-r53
       - build-base=1-r8
-      - busybox=1.37.0-r40
-      - ca-certificates-bundle=20241121-r40
-      - coreutils=9.7-r0
-      - cyrus-sasl=2.1.28-r40
+      - busybox=1.37.0-r48
+      - ca-certificates-bundle=20250619-r5
+      - coreutils=9.7-r4
+      - cyrus-sasl=2.1.28-r44
       - flex=2.6.4-r8
-      - gawk=5.3.2-r0
-      - gcc=14.2.0-r12
-      - gdbm=1.25-r0
-      - git=2.49.0-r1
-      - glibc-dev=2.41-r3
-      - glibc-locale-posix=2.41-r3
-      - glibc=2.41-r3
-      - gmp-dev=6.3.0-r4
-      - gmp=6.3.0-r4
-      - grep=3.12-r0
-      - heimdal-libs=7.8.0-r40
-      - isl=0.27-r0
-      - keyutils-libs=1.6.3-r31
-      - krb5-conf=1.0-r5
-      - krb5-libs=1.21.3-r40
-      - ld-linux=2.41-r3
-      - libacl1=2.3.2-r6
-      - libatomic=14.2.0-r12
-      - libattr1=2.5.2-r6
-      - libbrotlicommon1=1.1.0-r4
-      - libbrotlidec1=1.1.0-r4
-      - libbz2-1=1.0.8-r11
-      - libcom_err=1.47.2-r21
-      - libcrypt1=2.41-r3
-      - libcrypto3=3.5.0-r1
-      - libcurl-openssl4=8.13.0-r0
-      - libexpat1=2.7.1-r0
-      - libffi=3.4.8-r0
-      - libgcc=14.2.0-r12
-      - libgo=14.2.0-r12
-      - libgomp=14.2.0-r12
-      - libidn2=2.3.8-r0
-      - libldap=2.6.9-r41
-      - libnghttp2-14=1.65.0-r0
-      - libpcre2-8-0=10.45-r1
-      - libpsl=0.21.5-r4
-      - libquadmath=14.2.0-r12
-      - libssl3=3.5.0-r1
-      - libstdc++-dev=14.2.0-r12
-      - libstdc++=14.2.0-r12
-      - libunistring=1.3-r1
-      - libverto=0.3.2-r4
-      - libxcrypt-dev=4.4.38-r1
-      - libxcrypt=4.4.38-r1
```

### libcrypto3
```
======================================
Package: libcrypto3
Version 1: 3.5.0-r2 (python:3.11.12)
Version 2: 3.5.4-r0 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/libcrypto3-3.5.0-r2.melange.yaml	2025-05-28 06:35:48
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/libcrypto3-3.5.4-r0.melange.yaml	2025-10-02 05:23:55
@@ -1,9 +1,9 @@
 package:
   name: openssl
-  version: 3.5.0
-  epoch: 2
+  version: 3.5.4
+  epoch: 0
   description: the OpenSSL cryptography suite
-  commit: cfbfc5c7500721e9c6e95221587c5d6943cddda5
+  commit: 335661ff334440db9352fb0f936452c6e7743f7a
   copyright:
     - license: Apache-2.0
   dependencies:
@@ -21,70 +21,70 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - binutils=2.44-r2
-      - build-base=1-r8
-      - busybox=1.37.0-r40
-      - ca-certificates-bundle=20241121-r41
-      - cyrus-sasl=2.1.28-r40
-      - gcc=14.2.0-r12
-      - gdbm=1.25-r0
-      - git=2.49.0-r1
-      - glibc-dev=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp=6.3.0-r4
-      - heimdal-libs=7.8.0-r40
-      - isl=0.27-r0
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
+      - gmp=6.3.0-r8
+      - heimdal-libs=7.8.0-r42
+      - isl=0.27-r4
       - jitterentropy-library-dev=3.5.0-r0
       - jitterentropy-library=3.5.0-r0
-      - keyutils-libs=1.6.3-r31
-      - krb5-conf=1.0-r6
-      - krb5-libs=1.21.3-r40
-      - ld-linux=2.41-r4
-      - libatomic=14.2.0-r12
-      - libbrotlicommon1=1.1.0-r4
-      - libbrotlidec1=1.1.0-r4
-      - libbz2-1=1.0.8-r11
-      - libcom_err=1.47.2-r21
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r1
-      - libcurl-openssl4=8.14.0-r0
-      - libexpat1=2.7.1-r0
-      - libgcc=14.2.0-r12
-      - libgo=14.2.0-r12
-      - libgomp=14.2.0-r12
-      - libidn2=2.3.8-r0
-      - libldap=2.6.10-r0
-      - libnghttp2-14=1.65.0-r0
-      - libpcre2-8-0=10.45-r1
-      - libpsl=0.21.5-r4
-      - libquadmath=14.2.0-r12
-      - libssl3=3.5.0-r1
-      - libstdc++-dev=14.2.0-r12
-      - libstdc++=14.2.0-r12
-      - libunistring=1.3-r1
-      - libverto=0.3.2-r4
-      - libxcrypt-dev=4.4.38-r1
-      - libxcrypt=4.4.38-r1
-      - libzstd1=1.5.7-r1
-      - linux-headers=6.15-r0
-      - make=4.4.1-r4
-      - mpc=1.3.1-r5
-      - mpfr=4.2.2-r0
-      - ncurses-terminfo-base=6.5_p20241228-r1
-      - ncurses=6.5_p20241228-r1
-      - nss-db=2.41-r4
-      - nss-hesiod=2.41-r4
-      - openssf-compiler-options=20240627-r20
-      - patch=2.8-r0
-      - perl=5.40.2-r0
-      - pkgconf=2.4.3-r1
-      - posix-cc-wrappers=1-r6
-      - readline=8.2.13-r3
```

### libexpat1
```
======================================
Package: libexpat1
Version 1: 2.7.1-r1 (python:3.11.12)
Version 2: 2.7.3-r0 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/libexpat1-2.7.1-r1.melange.yaml	2025-05-28 06:35:48
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/libexpat1-2.7.3-r0.melange.yaml	2025-09-24 16:24:12
@@ -1,9 +1,9 @@
 package:
   name: expat
-  version: 2.7.1
-  epoch: 1
+  version: 2.7.3
+  epoch: 0
   description: XML SAX Parser library written in C
-  commit: cfbfc5c7500721e9c6e95221587c5d6943cddda5
+  commit: 30e89f62f474698bdf5b78fcf7820d7f4d643b68
   copyright:
     - license: MIT
   resources: {}
@@ -15,43 +15,43 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - binutils=2.44-r2
-      - build-base=1-r8
-      - busybox=1.37.0-r40
-      - ca-certificates-bundle=20241121-r42
-      - gcc=14.2.0-r12
-      - glibc-dev=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp=6.3.0-r4
-      - isl=0.27-r0
-      - ld-linux=2.41-r4
-      - libatomic=14.2.0-r12
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r2
-      - libgcc=14.2.0-r12
-      - libgo=14.2.0-r12
-      - libgomp=14.2.0-r12
-      - libquadmath=14.2.0-r12
-      - libssl3=3.5.0-r2
-      - libstdc++-dev=14.2.0-r12
-      - libstdc++=14.2.0-r12
-      - libxcrypt-dev=4.4.38-r1
-      - libxcrypt=4.4.38-r1
-      - libzstd1=1.5.7-r2
-      - linux-headers=6.15-r0
-      - make=4.4.1-r5
-      - mpc=1.3.1-r5
-      - mpfr=4.2.2-r0
-      - nss-db=2.41-r4
-      - nss-hesiod=2.41-r4
-      - openssf-compiler-options=20240627-r20
-      - pkgconf=2.4.3-r1
-      - posix-cc-wrappers=1-r6
-      - scanelf=1.3.8-r4
-      - wget=1.25.0-r1
-      - wolfi-baselayout=20230201-r20
-      - zlib=1.3.1-r7
+      - binutils=2.45-r2
+      - build-base=1-r9
+      - busybox=1.37.0-r50
+      - ca-certificates-bundle=20250619-r6
+      - gcc=15.2.0-r2
+      - glibc-dev=2.42-r0
+      - glibc-locale-posix=2.42-r0
+      - glibc=2.42-r0
+      - gmp=6.3.0-r8
+      - isl=0.27-r4
+      - ld-linux=2.42-r0
+      - libatomic=15.2.0-r2
+      - libcrypt1=2.42-r0
+      - libcrypto3=3.5.2-r1
+      - libgcc=15.2.0-r2
+      - libgo=15.2.0-r2
+      - libgomp=15.2.0-r2
+      - libquadmath=15.2.0-r2
+      - libssl3=3.5.2-r1
+      - libstdc++-dev=15.2.0-r2
+      - libstdc++=15.2.0-r2
+      - libxcrypt-dev=4.4.38-r4
+      - libxcrypt=4.4.38-r4
+      - libzstd1=1.5.7-r3
+      - linux-headers=6.16.8-r0
+      - make=4.4.1-r8
+      - mpc=1.3.1-r7
+      - mpfr=4.2.2-r2
+      - nss-db=2.42-r0
+      - nss-hesiod=2.42-r0
+      - openssf-compiler-options=20240627-r29
+      - pkgconf=2.5.1-r1
+      - posix-cc-wrappers=1-r7
+      - scanelf=1.3.8-r5
+      - wget=1.25.0-r6
+      - wolfi-baselayout=20230201-r24
+      - zlib=1.3.1-r51
```

### libffi
```
======================================
Package: libffi
Version 1: 3.4.8-r1 (python:3.11.12)
Version 2: 3.5.2-r1 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/libffi-3.4.8-r1.melange.yaml	2025-05-28 06:35:48
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/libffi-3.5.2-r1.melange.yaml	2025-08-05 17:03:52
@@ -1,9 +1,9 @@
 package:
   name: libffi
-  version: 3.4.8
+  version: 3.5.2
   epoch: 1
   description: portable foreign function interface library
-  commit: cfbfc5c7500721e9c6e95221587c5d6943cddda5
+  commit: 04deb9807c398ff68064238e09e92f22d7c33cdf
   copyright:
     - license: MIT
   resources: {}
@@ -15,73 +15,73 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - autoconf=2.72-r2
-      - automake=1.18-r0
-      - binutils=2.44-r2
+      - autoconf=2.72-r5
+      - automake=1.18.1-r2
+      - binutils=2.45-r0
       - build-base=1-r8
-      - busybox=1.37.0-r41
-      - ca-certificates-bundle=20241121-r42
-      - cyrus-sasl=2.1.28-r40
-      - gcc=14.2.0-r12
-      - gdbm=1.25-r1
-      - git=2.49.0-r1
-      - glibc-dev=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp=6.3.0-r4
-      - heimdal-libs=7.8.0-r40
-      - isl=0.27-r0
-      - keyutils-libs=1.6.3-r31
-      - krb5-conf=1.0-r6
-      - krb5-libs=1.21.3-r40
-      - ld-linux=2.41-r4
-      - libatomic=14.2.0-r12
-      - libbrotlicommon1=1.1.0-r5
-      - libbrotlidec1=1.1.0-r5
-      - libbz2-1=1.0.8-r12
-      - libcom_err=1.47.2-r21
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r2
-      - libcurl-openssl4=8.14.0-r0
-      - libexpat1=2.7.1-r1
-      - libgcc=14.2.0-r12
-      - libgo=14.2.0-r12
-      - libgomp=14.2.0-r12
-      - libidn2=2.3.8-r0
-      - libldap=2.6.10-r0
+      - busybox=1.37.0-r48
+      - ca-certificates-bundle=20250619-r5
+      - cyrus-sasl=2.1.28-r44
+      - gcc=15.1.0-r4
+      - gdbm=1.26-r1
+      - git=2.50.1-r1
+      - glibc-dev=2.41-r56
+      - glibc-locale-posix=2.41-r56
+      - glibc=2.41-r56
+      - gmp=6.3.0-r8
+      - heimdal-libs=7.8.0-r42
+      - isl=0.27-r4
+      - keyutils-libs=1.6.3-r37
+      - krb5-conf=1.0-r7
+      - krb5-libs=1.22-r2
+      - ld-linux=2.41-r56
+      - libatomic=15.1.0-r4
+      - libbrotlicommon1=1.1.0-r7
+      - libbrotlidec1=1.1.0-r7
+      - libbz2-1=1.0.8-r21
+      - libcom_err=1.47.3-r1
+      - libcrypt1=2.41-r56
+      - libcrypto3=3.5.2-r0
+      - libcurl-openssl4=8.15.0-r4
+      - libexpat1=2.7.1-r3
+      - libgcc=15.1.0-r4
+      - libgo=15.1.0-r4
+      - libgomp=15.1.0-r4
+      - libidn2=2.3.8-r3
+      - libldap=2.6.10-r5
       - libltdl=2.4.7-r5
-      - libnghttp2-14=1.65.0-r0
-      - libpcre2-8-0=10.45-r1
-      - libpsl=0.21.5-r4
-      - libquadmath=14.2.0-r12
-      - libssl3=3.5.0-r2
-      - libstdc++-dev=14.2.0-r12
-      - libstdc++=14.2.0-r12
```

### libgcc
```
======================================
Package: libgcc
Version 1: 15.1.0-r1 (python:3.11.12)
Version 2: 15.2.0-r2 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/libgcc-15.1.0-r1.melange.yaml	2025-06-02 10:31:02
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/libgcc-15.2.0-r2.melange.yaml	2025-09-08 06:41:17
@@ -1,9 +1,9 @@
 package:
   name: gcc
-  version: 15.1.0
-  epoch: 1
+  version: 15.2.0
+  epoch: 2
   description: the GNU compiler collection
-  commit: 21f898ccd7a998d94cd29990e1af7361c36568b4
+  commit: 8d9055b64a522be8a6976125fee4b92b83b4e286
   copyright:
     - license: GPL-3.0-or-later WITH GCC-exception-3.1
   dependencies:
@@ -25,64 +25,64 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - binutils=2.44-r4
-      - bison=3.8.2-r6
+      - binutils=2.45-r1
+      - bison=3.8.2-r53
       - build-base=1-r8
-      - busybox=1.37.0-r41
-      - ca-certificates-bundle=20241121-r42
-      - file=5.46-r3
+      - busybox=1.37.0-r50
+      - ca-certificates-bundle=20250619-r6
+      - file=5.46-r4
       - flex-dev=2.6.4-r8
       - flex=2.6.4-r8
-      - gawk=5.3.2-r0
-      - gcc=15.1.0-r0
-      - glibc-dev=2.41-r4
-      - glibc-iconv=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp-dev=6.3.0-r6
-      - gmp=6.3.0-r6
-      - isl-dev=0.27-r1
-      - isl=0.27-r1
-      - ld-linux=2.41-r4
-      - libatomic=15.1.0-r0
-      - libbz2-1=1.0.8-r12
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r2
+      - gawk=5.3.2-r3
+      - gcc=15.2.0-r1
+      - glibc-dev=2.42-r0
+      - glibc-iconv=2.42-r0
+      - glibc-locale-posix=2.42-r0
+      - glibc=2.42-r0
+      - gmp-dev=6.3.0-r8
+      - gmp=6.3.0-r8
+      - isl-dev=0.27-r4
+      - isl=0.27-r4
+      - ld-linux=2.42-r0
+      - libatomic=15.2.0-r1
+      - libbz2-1=1.0.8-r21
+      - libcrypt1=2.42-r0
+      - libcrypto3=3.5.2-r1
       - libfl2=2.6.4-r8
-      - libgcc=15.1.0-r0
-      - libgo=15.1.0-r0
-      - libgomp=15.1.0-r0
-      - libmagic=5.46-r3
-      - libquadmath=15.1.0-r0
-      - libssl3=3.5.0-r2
-      - libstdc++-dev=15.1.0-r0
-      - libstdc++=15.1.0-r0
-      - libxcrypt-dev=4.4.38-r2
-      - libxcrypt=4.4.38-r2
-      - libzstd1=1.5.7-r2
-      - linux-headers=6.15-r1
-      - m4=1.4.20-r2
-      - make=4.4.1-r5
-      - mpc-dev=1.3.1-r6
-      - mpc=1.3.1-r6
-      - mpfr-dev=4.2.2-r1
-      - mpfr=4.2.2-r1
-      - ncurses-terminfo-base=6.5_p20241228-r2
-      - ncurses=6.5_p20241228-r2
-      - nss-db=2.41-r4
-      - nss-hesiod=2.41-r4
-      - openssf-compiler-options=20240627-r20
-      - patch=2.8-r0
-      - perl=5.40.2-r0
-      - pkgconf=2.4.3-r2
-      - posix-cc-wrappers=1-r6
-      - scanelf=1.3.8-r4
-      - texinfo=7.2-r1
-      - wget=1.25.0-r1
```

### libssl3
```
======================================
Package: libssl3
Version 1: 3.5.0-r2 (python:3.11.12)
Version 2: 3.5.4-r0 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/libssl3-3.5.0-r2.melange.yaml	2025-05-28 06:35:48
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/libssl3-3.5.4-r0.melange.yaml	2025-10-02 05:23:55
@@ -1,9 +1,9 @@
 package:
   name: openssl
-  version: 3.5.0
-  epoch: 2
+  version: 3.5.4
+  epoch: 0
   description: the OpenSSL cryptography suite
-  commit: cfbfc5c7500721e9c6e95221587c5d6943cddda5
+  commit: 335661ff334440db9352fb0f936452c6e7743f7a
   copyright:
     - license: Apache-2.0
   dependencies:
@@ -21,70 +21,70 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - binutils=2.44-r2
-      - build-base=1-r8
-      - busybox=1.37.0-r40
-      - ca-certificates-bundle=20241121-r41
-      - cyrus-sasl=2.1.28-r40
-      - gcc=14.2.0-r12
-      - gdbm=1.25-r0
-      - git=2.49.0-r1
-      - glibc-dev=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp=6.3.0-r4
-      - heimdal-libs=7.8.0-r40
-      - isl=0.27-r0
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
+      - gmp=6.3.0-r8
+      - heimdal-libs=7.8.0-r42
+      - isl=0.27-r4
       - jitterentropy-library-dev=3.5.0-r0
       - jitterentropy-library=3.5.0-r0
-      - keyutils-libs=1.6.3-r31
-      - krb5-conf=1.0-r6
-      - krb5-libs=1.21.3-r40
-      - ld-linux=2.41-r4
-      - libatomic=14.2.0-r12
-      - libbrotlicommon1=1.1.0-r4
-      - libbrotlidec1=1.1.0-r4
-      - libbz2-1=1.0.8-r11
-      - libcom_err=1.47.2-r21
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r1
-      - libcurl-openssl4=8.14.0-r0
-      - libexpat1=2.7.1-r0
-      - libgcc=14.2.0-r12
-      - libgo=14.2.0-r12
-      - libgomp=14.2.0-r12
-      - libidn2=2.3.8-r0
-      - libldap=2.6.10-r0
-      - libnghttp2-14=1.65.0-r0
-      - libpcre2-8-0=10.45-r1
-      - libpsl=0.21.5-r4
-      - libquadmath=14.2.0-r12
-      - libssl3=3.5.0-r1
-      - libstdc++-dev=14.2.0-r12
-      - libstdc++=14.2.0-r12
-      - libunistring=1.3-r1
-      - libverto=0.3.2-r4
-      - libxcrypt-dev=4.4.38-r1
-      - libxcrypt=4.4.38-r1
-      - libzstd1=1.5.7-r1
-      - linux-headers=6.15-r0
-      - make=4.4.1-r4
-      - mpc=1.3.1-r5
-      - mpfr=4.2.2-r0
-      - ncurses-terminfo-base=6.5_p20241228-r1
-      - ncurses=6.5_p20241228-r1
-      - nss-db=2.41-r4
-      - nss-hesiod=2.41-r4
-      - openssf-compiler-options=20240627-r20
-      - patch=2.8-r0
-      - perl=5.40.2-r0
-      - pkgconf=2.4.3-r1
-      - posix-cc-wrappers=1-r6
-      - readline=8.2.13-r3
```

### libstdc++
```
======================================
Package: libstdc++
Version 1: 15.1.0-r1 (python:3.11.12)
Version 2: 15.2.0-r2 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/libstdc++-15.1.0-r1.melange.yaml	2025-06-02 10:31:02
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/libstdc++-15.2.0-r2.melange.yaml	2025-09-08 06:41:17
@@ -1,9 +1,9 @@
 package:
   name: gcc
-  version: 15.1.0
-  epoch: 1
+  version: 15.2.0
+  epoch: 2
   description: the GNU compiler collection
-  commit: 21f898ccd7a998d94cd29990e1af7361c36568b4
+  commit: 8d9055b64a522be8a6976125fee4b92b83b4e286
   copyright:
     - license: GPL-3.0-or-later WITH GCC-exception-3.1
   dependencies:
@@ -25,64 +25,64 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - binutils=2.44-r4
-      - bison=3.8.2-r6
+      - binutils=2.45-r1
+      - bison=3.8.2-r53
       - build-base=1-r8
-      - busybox=1.37.0-r41
-      - ca-certificates-bundle=20241121-r42
-      - file=5.46-r3
+      - busybox=1.37.0-r50
+      - ca-certificates-bundle=20250619-r6
+      - file=5.46-r4
       - flex-dev=2.6.4-r8
       - flex=2.6.4-r8
-      - gawk=5.3.2-r0
-      - gcc=15.1.0-r0
-      - glibc-dev=2.41-r4
-      - glibc-iconv=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp-dev=6.3.0-r6
-      - gmp=6.3.0-r6
-      - isl-dev=0.27-r1
-      - isl=0.27-r1
-      - ld-linux=2.41-r4
-      - libatomic=15.1.0-r0
-      - libbz2-1=1.0.8-r12
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r2
+      - gawk=5.3.2-r3
+      - gcc=15.2.0-r1
+      - glibc-dev=2.42-r0
+      - glibc-iconv=2.42-r0
+      - glibc-locale-posix=2.42-r0
+      - glibc=2.42-r0
+      - gmp-dev=6.3.0-r8
+      - gmp=6.3.0-r8
+      - isl-dev=0.27-r4
+      - isl=0.27-r4
+      - ld-linux=2.42-r0
+      - libatomic=15.2.0-r1
+      - libbz2-1=1.0.8-r21
+      - libcrypt1=2.42-r0
+      - libcrypto3=3.5.2-r1
       - libfl2=2.6.4-r8
-      - libgcc=15.1.0-r0
-      - libgo=15.1.0-r0
-      - libgomp=15.1.0-r0
-      - libmagic=5.46-r3
-      - libquadmath=15.1.0-r0
-      - libssl3=3.5.0-r2
-      - libstdc++-dev=15.1.0-r0
-      - libstdc++=15.1.0-r0
-      - libxcrypt-dev=4.4.38-r2
-      - libxcrypt=4.4.38-r2
-      - libzstd1=1.5.7-r2
-      - linux-headers=6.15-r1
-      - m4=1.4.20-r2
-      - make=4.4.1-r5
-      - mpc-dev=1.3.1-r6
-      - mpc=1.3.1-r6
-      - mpfr-dev=4.2.2-r1
-      - mpfr=4.2.2-r1
-      - ncurses-terminfo-base=6.5_p20241228-r2
-      - ncurses=6.5_p20241228-r2
-      - nss-db=2.41-r4
-      - nss-hesiod=2.41-r4
-      - openssf-compiler-options=20240627-r20
-      - patch=2.8-r0
-      - perl=5.40.2-r0
-      - pkgconf=2.4.3-r2
-      - posix-cc-wrappers=1-r6
-      - scanelf=1.3.8-r4
-      - texinfo=7.2-r1
-      - wget=1.25.0-r1
```

### libxcrypt
```
======================================
Package: libxcrypt
Version 1: 4.4.38-r2 (python:3.11.12)
Version 2: 4.4.38-r4 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/libxcrypt-4.4.38-r2.melange.yaml	2025-05-28 06:35:48
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/libxcrypt-4.4.38-r4.melange.yaml	2025-08-07 08:46:15
@@ -1,9 +1,9 @@
 package:
   name: libxcrypt
   version: 4.4.38
-  epoch: 2
+  epoch: 4
   description: Modern library for one-way hashing of passwords
-  commit: cfbfc5c7500721e9c6e95221587c5d6943cddda5
+  commit: 25fca201019e4ce1d92f487fd18836f1fbe883be
   copyright:
     - license: GPL-2.0-or-later AND LGPL-2.1-or-later
   dependencies:
@@ -21,80 +21,80 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - apk-tools=2.14.10-r3
-      - autoconf=2.72-r2
-      - automake=1.18-r0
-      - binutils=2.44-r2
+      - apk-tools=2.14.10-r7
+      - autoconf=2.72-r5
+      - automake=1.18.1-r2
+      - binutils=2.45-r0
       - build-base=1-r8
-      - busybox=1.37.0-r41
-      - ca-certificates-bundle=20241121-r42
-      - cyrus-sasl=2.1.28-r40
-      - gcc=14.2.0-r12
-      - gdbm=1.25-r1
-      - gettext=0.22.5-r1
-      - git=2.49.0-r1
-      - glibc-dev=2.41-r4
-      - glibc-iconv=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp=6.3.0-r4
-      - heimdal-libs=7.8.0-r40
-      - isl=0.27-r0
-      - keyutils-libs=1.6.3-r31
-      - krb5-conf=1.0-r6
-      - krb5-libs=1.21.3-r40
-      - ld-linux=2.41-r4
-      - libatomic=14.2.0-r12
-      - libbrotlicommon1=1.1.0-r5
-      - libbrotlidec1=1.1.0-r5
-      - libbz2-1=1.0.8-r12
-      - libcom_err=1.47.2-r21
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r2
-      - libcurl-openssl4=8.14.0-r0
-      - libexpat1=2.7.1-r1
-      - libgcc=14.2.0-r12
-      - libgo=14.2.0-r12
-      - libgomp=14.2.0-r12
-      - libidn2=2.3.8-r0
-      - libldap=2.6.10-r0
+      - busybox=1.37.0-r48
+      - ca-certificates-bundle=20250619-r5
+      - cyrus-sasl=2.1.28-r44
+      - gcc=15.1.0-r4
+      - gdbm=1.26-r1
+      - gettext=0.22.5-r5
+      - git=2.50.1-r1
+      - glibc-dev=2.41-r56
+      - glibc-iconv=2.41-r56
+      - glibc-locale-posix=2.41-r56
+      - glibc=2.41-r56
+      - gmp=6.3.0-r8
+      - heimdal-libs=7.8.0-r42
+      - isl=0.27-r4
+      - keyutils-libs=1.6.3-r37
+      - krb5-conf=1.0-r7
+      - krb5-libs=1.22-r2
+      - ld-linux=2.41-r56
+      - libatomic=15.1.0-r4
+      - libbrotlicommon1=1.1.0-r7
+      - libbrotlidec1=1.1.0-r7
+      - libbz2-1=1.0.8-r21
+      - libcom_err=1.47.3-r1
+      - libcrypt1=2.41-r56
+      - libcrypto3=3.5.2-r0
+      - libcurl-openssl4=8.15.0-r4
+      - libexpat1=2.7.1-r3
+      - libgcc=15.1.0-r4
+      - libgo=15.1.0-r4
+      - libgomp=15.1.0-r4
+      - libidn2=2.3.8-r3
+      - libldap=2.6.10-r5
       - libltdl=2.4.7-r5
-      - libnghttp2-14=1.65.0-r0
```

### mpdecimal
```
======================================
Package: mpdecimal
Version 1: 4.0.1-r1 (python:3.11.12)
Version 2: 4.0.1-r3 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/mpdecimal-4.0.1-r1.melange.yaml	2025-05-28 06:35:48
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/mpdecimal-4.0.1-r3.melange.yaml	2025-07-17 09:41:54
@@ -1,9 +1,9 @@
 package:
   name: mpdecimal
   version: 4.0.1
-  epoch: 1
+  epoch: 3
   description: complete implementation of the general decimal arithmetic specification
-  commit: cfbfc5c7500721e9c6e95221587c5d6943cddda5
+  commit: 816f399eca16c98994a5f607d6a8de6df29939b9
   copyright:
     - license: BSD-2-Clause
   resources: {}
@@ -15,43 +15,43 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - binutils=2.44-r2
+      - binutils=2.44-r9
       - build-base=1-r8
-      - busybox=1.37.0-r41
-      - ca-certificates-bundle=20241121-r42
-      - gcc=14.2.0-r12
-      - glibc-dev=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp=6.3.0-r4
-      - isl=0.27-r0
-      - ld-linux=2.41-r4
-      - libatomic=14.2.0-r12
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r2
-      - libgcc=14.2.0-r12
-      - libgo=14.2.0-r12
-      - libgomp=14.2.0-r12
-      - libquadmath=14.2.0-r12
-      - libssl3=3.5.0-r2
-      - libstdc++-dev=14.2.0-r12
-      - libstdc++=14.2.0-r12
-      - libxcrypt-dev=4.4.38-r1
-      - libxcrypt=4.4.38-r1
-      - libzstd1=1.5.7-r2
-      - linux-headers=6.15-r1
-      - make=4.4.1-r5
-      - mpc=1.3.1-r5
-      - mpfr=4.2.2-r0
-      - nss-db=2.41-r4
-      - nss-hesiod=2.41-r4
-      - openssf-compiler-options=20240627-r20
-      - pkgconf=2.4.3-r1
-      - posix-cc-wrappers=1-r6
+      - busybox=1.37.0-r46
+      - ca-certificates-bundle=20250619-r2
+      - gcc=15.1.0-r1
+      - glibc-dev=2.41-r53
+      - glibc-locale-posix=2.41-r53
+      - glibc=2.41-r53
+      - gmp=6.3.0-r8
+      - isl=0.27-r3
+      - ld-linux=2.41-r53
+      - libatomic=15.1.0-r1
+      - libcrypt1=2.41-r53
+      - libcrypto3=3.5.1-r0
+      - libgcc=15.1.0-r1
+      - libgo=15.1.0-r1
+      - libgomp=15.1.0-r1
+      - libquadmath=15.1.0-r1
+      - libssl3=3.5.1-r0
+      - libstdc++-dev=15.1.0-r1
+      - libstdc++=15.1.0-r1
+      - libxcrypt-dev=4.4.38-r2
+      - libxcrypt=4.4.38-r2
+      - libzstd1=1.5.7-r2
+      - linux-headers=6.15.6-r1
+      - make=4.4.1-r8
+      - mpc=1.3.1-r6
+      - mpfr=4.2.2-r2
+      - nss-db=2.41-r53
+      - nss-hesiod=2.41-r53
+      - openssf-compiler-options=20240627-r25
+      - pkgconf=2.5.1-r0
+      - posix-cc-wrappers=1-r7
       - scanelf=1.3.8-r4
-      - wget=1.25.0-r1
-      - wolfi-baselayout=20230201-r20
-      - zlib=1.3.1-r7
+      - wget=1.25.0-r3
+      - wolfi-baselayout=20230201-r22
+      - zlib=1.3.1-r51
   accounts:
     run-as: ""
     users:
```

### ncurses
```
======================================
Package: ncurses
Version 1: 6.5_p20241228-r2 (python:3.11.12)
Version 2: 6.5_p20250621-r1 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/ncurses-6.5_p20241228-r2.melange.yaml	2025-05-28 06:35:48
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/ncurses-6.5_p20250621-r1.melange.yaml	2025-07-18 20:08:53
@@ -1,9 +1,9 @@
 package:
   name: ncurses
-  version: 6.5_p20241228
-  epoch: 2
+  version: 6.5_p20250621
+  epoch: 1
   description: console display library
-  commit: cfbfc5c7500721e9c6e95221587c5d6943cddda5
+  commit: dedd0db9fa052224b3d83efd470f6c700a30b98d
   copyright:
     - license: MIT
   dependencies:
@@ -18,45 +18,45 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - binutils=2.44-r2
+      - binutils=2.44-r10
       - build-base=1-r8
-      - busybox=1.37.0-r40
-      - ca-certificates-bundle=20241121-r42
-      - gcc=14.2.0-r12
-      - glibc-dev=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp=6.3.0-r4
-      - isl=0.27-r0
-      - ld-linux=2.41-r4
-      - libatomic=14.2.0-r12
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r2
-      - libgcc=14.2.0-r12
-      - libgo=14.2.0-r12
-      - libgomp=14.2.0-r12
-      - libquadmath=14.2.0-r12
-      - libssl3=3.5.0-r2
-      - libstdc++-dev=14.2.0-r12
-      - libstdc++=14.2.0-r12
-      - libxcrypt-dev=4.4.38-r1
-      - libxcrypt=4.4.38-r1
+      - busybox=1.37.0-r47
+      - ca-certificates-bundle=20250619-r3
+      - gcc=15.1.0-r3
+      - glibc-dev=2.41-r54
+      - glibc-locale-posix=2.41-r54
+      - glibc=2.41-r54
+      - gmp=6.3.0-r8
+      - isl=0.27-r4
+      - ld-linux=2.41-r54
+      - libatomic=15.1.0-r3
+      - libcrypt1=2.41-r54
+      - libcrypto3=3.5.1-r0
+      - libgcc=15.1.0-r3
+      - libgo=15.1.0-r3
+      - libgomp=15.1.0-r3
+      - libquadmath=15.1.0-r3
+      - libssl3=3.5.1-r0
+      - libstdc++-dev=15.1.0-r3
+      - libstdc++=15.1.0-r3
+      - libxcrypt-dev=4.4.38-r2
+      - libxcrypt=4.4.38-r2
       - libzstd1=1.5.7-r2
-      - linux-headers=6.15-r0
-      - make=4.4.1-r5
-      - mpc=1.3.1-r5
-      - mpfr=4.2.2-r0
-      - ncurses-terminfo-base=6.5_p20241228-r1
-      - ncurses=6.5_p20241228-r1
-      - nss-db=2.41-r4
-      - nss-hesiod=2.41-r4
-      - openssf-compiler-options=20240627-r20
-      - pkgconf=2.4.3-r1
-      - posix-cc-wrappers=1-r6
-      - scanelf=1.3.8-r4
-      - wget=1.25.0-r1
-      - wolfi-baselayout=20230201-r20
-      - zlib=1.3.1-r7
+      - linux-headers=6.15.7-r0
+      - make=4.4.1-r8
+      - mpc=1.3.1-r7
+      - mpfr=4.2.2-r2
+      - ncurses-terminfo-base=6.5_p20250621-r0
+      - ncurses=6.5_p20250621-r0
+      - nss-db=2.41-r54
+      - nss-hesiod=2.41-r54
+      - openssf-compiler-options=20240627-r25
+      - pkgconf=2.5.1-r1
+      - posix-cc-wrappers=1-r7
+      - scanelf=1.3.8-r5
+      - wget=1.25.0-r3
```

### ncurses-terminfo-base
```
======================================
Package: ncurses-terminfo-base
Version 1: 6.5_p20241228-r2 (python:3.11.12)
Version 2: 6.5_p20250621-r1 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/ncurses-terminfo-base-6.5_p20241228-r2.melange.yaml	2025-05-28 06:35:48
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/ncurses-terminfo-base-6.5_p20250621-r1.melange.yaml	2025-07-18 20:08:53
@@ -1,9 +1,9 @@
 package:
   name: ncurses
-  version: 6.5_p20241228
-  epoch: 2
+  version: 6.5_p20250621
+  epoch: 1
   description: console display library
-  commit: cfbfc5c7500721e9c6e95221587c5d6943cddda5
+  commit: dedd0db9fa052224b3d83efd470f6c700a30b98d
   copyright:
     - license: MIT
   dependencies:
@@ -18,45 +18,45 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - binutils=2.44-r2
+      - binutils=2.44-r10
       - build-base=1-r8
-      - busybox=1.37.0-r40
-      - ca-certificates-bundle=20241121-r42
-      - gcc=14.2.0-r12
-      - glibc-dev=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp=6.3.0-r4
-      - isl=0.27-r0
-      - ld-linux=2.41-r4
-      - libatomic=14.2.0-r12
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r2
-      - libgcc=14.2.0-r12
-      - libgo=14.2.0-r12
-      - libgomp=14.2.0-r12
-      - libquadmath=14.2.0-r12
-      - libssl3=3.5.0-r2
-      - libstdc++-dev=14.2.0-r12
-      - libstdc++=14.2.0-r12
-      - libxcrypt-dev=4.4.38-r1
-      - libxcrypt=4.4.38-r1
+      - busybox=1.37.0-r47
+      - ca-certificates-bundle=20250619-r3
+      - gcc=15.1.0-r3
+      - glibc-dev=2.41-r54
+      - glibc-locale-posix=2.41-r54
+      - glibc=2.41-r54
+      - gmp=6.3.0-r8
+      - isl=0.27-r4
+      - ld-linux=2.41-r54
+      - libatomic=15.1.0-r3
+      - libcrypt1=2.41-r54
+      - libcrypto3=3.5.1-r0
+      - libgcc=15.1.0-r3
+      - libgo=15.1.0-r3
+      - libgomp=15.1.0-r3
+      - libquadmath=15.1.0-r3
+      - libssl3=3.5.1-r0
+      - libstdc++-dev=15.1.0-r3
+      - libstdc++=15.1.0-r3
+      - libxcrypt-dev=4.4.38-r2
+      - libxcrypt=4.4.38-r2
       - libzstd1=1.5.7-r2
-      - linux-headers=6.15-r0
-      - make=4.4.1-r5
-      - mpc=1.3.1-r5
-      - mpfr=4.2.2-r0
-      - ncurses-terminfo-base=6.5_p20241228-r1
-      - ncurses=6.5_p20241228-r1
-      - nss-db=2.41-r4
-      - nss-hesiod=2.41-r4
-      - openssf-compiler-options=20240627-r20
-      - pkgconf=2.4.3-r1
-      - posix-cc-wrappers=1-r6
-      - scanelf=1.3.8-r4
-      - wget=1.25.0-r1
-      - wolfi-baselayout=20230201-r20
-      - zlib=1.3.1-r7
+      - linux-headers=6.15.7-r0
+      - make=4.4.1-r8
+      - mpc=1.3.1-r7
+      - mpfr=4.2.2-r2
+      - ncurses-terminfo-base=6.5_p20250621-r0
+      - ncurses=6.5_p20250621-r0
+      - nss-db=2.41-r54
+      - nss-hesiod=2.41-r54
+      - openssf-compiler-options=20240627-r25
+      - pkgconf=2.5.1-r1
+      - posix-cc-wrappers=1-r7
+      - scanelf=1.3.8-r5
+      - wget=1.25.0-r3
```

### py3-pip-wheel
```
======================================
Package: py3-pip-wheel
Version 1: 25.1.1-r1 (python:3.11.12)
Version 2: 25.2-r1 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/py3-pip-wheel-25.1.1-r1.melange.yaml	2025-05-28 06:35:48
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/py3-pip-wheel-25.2-r1.melange.yaml	2025-09-30 07:21:53
@@ -1,9 +1,9 @@
 package:
   name: py3-pip
-  version: 25.1.1
+  version: "25.2"
   epoch: 1
   description: The PyPA recommended tool for installing Python packages.
-  commit: cfbfc5c7500721e9c6e95221587c5d6943cddda5
+  commit: 3ad2488ad452e42f42efcc5c7bee1deb3b8b319f
   copyright:
     - license: MIT
   dependencies:
@@ -17,76 +17,77 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - binutils=2.44-r2
-      - build-base=1-r8
-      - busybox=1.37.0-r40
-      - ca-certificates-bundle=20241121-r41
-      - cyrus-sasl=2.1.28-r40
-      - gcc=14.2.0-r12
-      - gdbm=1.25-r0
-      - git=2.49.0-r1
-      - glibc-dev=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp=6.3.0-r4
-      - heimdal-libs=7.8.0-r40
-      - isl=0.27-r0
-      - keyutils-libs=1.6.3-r31
-      - krb5-conf=1.0-r5
-      - krb5-libs=1.21.3-r40
-      - ld-linux=2.41-r4
-      - libatomic=14.2.0-r12
-      - libbrotlicommon1=1.1.0-r4
-      - libbrotlidec1=1.1.0-r4
-      - libbz2-1=1.0.8-r11
-      - libcom_err=1.47.2-r21
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r1
-      - libcurl-openssl4=8.14.0-r0
-      - libexpat1=2.7.1-r0
-      - libffi=3.4.8-r0
-      - libgcc=14.2.0-r12
-      - libgo=14.2.0-r12
-      - libgomp=14.2.0-r12
-      - libidn2=2.3.8-r0
-      - libldap=2.6.10-r0
-      - libnghttp2-14=1.65.0-r0
-      - libpcre2-8-0=10.45-r1
-      - libpsl=0.21.5-r4
-      - libquadmath=14.2.0-r12
-      - libssl3=3.5.0-r1
-      - libstdc++-dev=14.2.0-r12
-      - libstdc++=14.2.0-r12
-      - libunistring=1.3-r1
-      - libverto=0.3.2-r4
-      - libxcrypt-dev=4.4.38-r1
-      - libxcrypt=4.4.38-r1
-      - libzstd1=1.5.7-r1
-      - linux-headers=6.15-r0
-      - make=4.4.1-r4
-      - mpc=1.3.1-r5
-      - mpdecimal=4.0.1-r0
-      - mpfr=4.2.2-r0
-      - ncurses-terminfo-base=6.5_p20241228-r1
-      - ncurses=6.5_p20241228-r1
-      - nss-db=2.41-r4
-      - nss-hesiod=2.41-r4
-      - openssf-compiler-options=20240627-r19
-      - pip-zipapp=25.1.1-r0
-      - pkgconf=2.4.3-r1
-      - posix-cc-wrappers=1-r5
-      - py3-pip-wheel=25.1.1-r0
-      - py3-setuptools-wheel=80.9.0-r0
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
+      - gmp=6.3.0-r8
+      - heimdal-libs=7.8.0-r42
+      - isl=0.27-r4
+      - keyutils-libs=1.6.3-r37
```

### py3-setuptools-wheel
```
======================================
Package: py3-setuptools-wheel
Version 1: 80.9.0-r0 (python:3.11.12)
Version 2: 80.9.0-r2 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/py3-setuptools-wheel-80.9.0-r0.melange.yaml	2025-05-26 19:15:24
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/py3-setuptools-wheel-80.9.0-r2.melange.yaml	2025-07-17 09:42:56
@@ -1,9 +1,9 @@
 package:
   name: py3-setuptools-wheel
   version: 80.9.0
-  epoch: 0
+  epoch: 2
   description: python3 setuptools wheel from pypi
-  commit: c11d054772f55a19d6ced4e23d5dc9c543fee264
+  commit: 779eb8058e6989fbc5674eed7221fb741de7a381
   copyright:
     - license: MIT
   resources: {}
@@ -15,18 +15,18 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - busybox=1.37.0-r40
-      - ca-certificates-bundle=20241121-r41
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - ld-linux=2.41-r4
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r1
-      - libgcc=14.2.0-r12
-      - libssl3=3.5.0-r1
-      - libxcrypt=4.4.38-r1
-      - wget=1.25.0-r1
-      - wolfi-baselayout=20230201-r20
+      - busybox=1.37.0-r46
+      - ca-certificates-bundle=20250619-r1
+      - glibc-locale-posix=2.41-r53
+      - glibc=2.41-r53
+      - ld-linux=2.41-r53
+      - libcrypt1=2.41-r53
+      - libcrypto3=3.5.1-r0
+      - libgcc=15.1.0-r1
+      - libssl3=3.5.1-r0
+      - libxcrypt=4.4.38-r2
+      - wget=1.25.0-r2
+      - wolfi-baselayout=20230201-r22
   accounts:
     run-as: ""
     users:
```

### python-3.11-base
```
======================================
Package: python-3.11-base
Version 1: 3.11.12-r2 (python:3.11.12)
Version 2: 3.11.13-r5 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/python-3.11-base-3.11.12-r2.melange.yaml	2025-06-03 01:37:02
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/python-3.11-base-3.11.13-r5.melange.yaml	2025-09-03 03:51:14
@@ -1,14 +1,14 @@
 package:
   name: python-3.11
-  version: 3.11.12
-  epoch: 2
+  version: 3.11.13
+  epoch: 5
   description: the Python programming language
-  commit: 7efbdef363436a1cbbc36344a46b5e91a2bb8431
+  commit: ba1ebc945eae51fb24872bf64fd830c3a4c653b1
   copyright:
     - license: PSF-2.0
   dependencies:
     runtime:
-      - python-3.11-base=3.11.12-r2
+      - python-3.11-base=3.11.13-r5
     provides:
       - python3=3.11.999
       - python-3=3.11.999
@@ -21,84 +21,84 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - binutils=2.44-r4
+      - binutils=2.45-r1
       - build-base=1-r8
-      - busybox=1.37.0-r41
-      - bzip2-dev=1.0.8-r12
-      - ca-certificates-bundle=20241121-r42
-      - cyrus-sasl=2.1.28-r42
-      - expat-dev=2.7.1-r1
-      - gcc=15.1.0-r1
-      - gdbm-dev=1.25-r1
-      - gdbm=1.25-r1
-      - git=2.49.0-r2
-      - glibc-dev=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp=6.3.0-r6
-      - heimdal-libs=7.8.0-r41
-      - isl=0.27-r1
-      - jitterentropy-library-dev=3.6.3-r1
-      - jitterentropy-library=3.6.3-r1
-      - keyutils-libs=1.6.3-r32
-      - krb5-conf=1.0-r6
-      - krb5-libs=1.21.3-r42
-      - ld-linux=2.41-r4
-      - libatomic=15.1.0-r1
-      - libbrotlicommon1=1.1.0-r5
-      - libbrotlidec1=1.1.0-r5
-      - libbz2-1=1.0.8-r12
-      - libcom_err=1.47.2-r22
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r2
-      - libcurl-openssl4=8.14.0-r2
-      - libexpat1=2.7.1-r1
-      - libffi-dev=3.4.8-r1
-      - libffi=3.4.8-r1
-      - libgcc=15.1.0-r1
-      - libgo=15.1.0-r1
-      - libgomp=15.1.0-r1
-      - libidn2=2.3.8-r1
-      - libldap=2.6.10-r2
-      - libnghttp2-14=1.65.0-r1
-      - libpcre2-8-0=10.45-r2
-      - libpsl=0.21.5-r5
-      - libquadmath=15.1.0-r1
-      - libssl3=3.5.0-r2
-      - libstdc++-dev=15.1.0-r1
-      - libstdc++=15.1.0-r1
-      - libunistring=1.3-r2
-      - libverto=0.3.2-r5
-      - libxcrypt-dev=4.4.38-r2
-      - libxcrypt=4.4.38-r2
-      - libzstd1=1.5.7-r2
-      - linux-headers=6.15-r1
-      - make=4.4.1-r5
-      - mpc=1.3.1-r6
-      - mpdecimal-dev=4.0.1-r1
-      - mpdecimal=4.0.1-r1
-      - mpfr=4.2.2-r1
-      - ncurses-dev=6.5_p20241228-r2
-      - ncurses-terminfo-base=6.5_p20241228-r2
-      - ncurses=6.5_p20241228-r2
-      - nss-db=2.41-r4
-      - nss-hesiod=2.41-r4
-      - openssf-compiler-options=20240627-r20
-      - openssl-dev=3.5.0-r2
-      - patch=2.8-r0
-      - pkgconf=2.4.3-r2
-      - posix-cc-wrappers=1-r6
```

### python-3.11
```
======================================
Package: python-3.11
Version 1: 3.11.12-r2 (python:3.11.12)
Version 2: 3.11.13-r5 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/python-3.11-3.11.12-r2.melange.yaml	2025-06-03 01:37:02
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/python-3.11-3.11.13-r5.melange.yaml	2025-09-03 03:51:14
@@ -1,14 +1,14 @@
 package:
   name: python-3.11
-  version: 3.11.12
-  epoch: 2
+  version: 3.11.13
+  epoch: 5
   description: the Python programming language
-  commit: 7efbdef363436a1cbbc36344a46b5e91a2bb8431
+  commit: ba1ebc945eae51fb24872bf64fd830c3a4c653b1
   copyright:
     - license: PSF-2.0
   dependencies:
     runtime:
-      - python-3.11-base=3.11.12-r2
+      - python-3.11-base=3.11.13-r5
     provides:
       - python3=3.11.999
       - python-3=3.11.999
@@ -21,84 +21,84 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - binutils=2.44-r4
+      - binutils=2.45-r1
       - build-base=1-r8
-      - busybox=1.37.0-r41
-      - bzip2-dev=1.0.8-r12
-      - ca-certificates-bundle=20241121-r42
-      - cyrus-sasl=2.1.28-r42
-      - expat-dev=2.7.1-r1
-      - gcc=15.1.0-r1
-      - gdbm-dev=1.25-r1
-      - gdbm=1.25-r1
-      - git=2.49.0-r2
-      - glibc-dev=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp=6.3.0-r6
-      - heimdal-libs=7.8.0-r41
-      - isl=0.27-r1
-      - jitterentropy-library-dev=3.6.3-r1
-      - jitterentropy-library=3.6.3-r1
-      - keyutils-libs=1.6.3-r32
-      - krb5-conf=1.0-r6
-      - krb5-libs=1.21.3-r42
-      - ld-linux=2.41-r4
-      - libatomic=15.1.0-r1
-      - libbrotlicommon1=1.1.0-r5
-      - libbrotlidec1=1.1.0-r5
-      - libbz2-1=1.0.8-r12
-      - libcom_err=1.47.2-r22
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r2
-      - libcurl-openssl4=8.14.0-r2
-      - libexpat1=2.7.1-r1
-      - libffi-dev=3.4.8-r1
-      - libffi=3.4.8-r1
-      - libgcc=15.1.0-r1
-      - libgo=15.1.0-r1
-      - libgomp=15.1.0-r1
-      - libidn2=2.3.8-r1
-      - libldap=2.6.10-r2
-      - libnghttp2-14=1.65.0-r1
-      - libpcre2-8-0=10.45-r2
-      - libpsl=0.21.5-r5
-      - libquadmath=15.1.0-r1
-      - libssl3=3.5.0-r2
-      - libstdc++-dev=15.1.0-r1
-      - libstdc++=15.1.0-r1
-      - libunistring=1.3-r2
-      - libverto=0.3.2-r5
-      - libxcrypt-dev=4.4.38-r2
-      - libxcrypt=4.4.38-r2
-      - libzstd1=1.5.7-r2
-      - linux-headers=6.15-r1
-      - make=4.4.1-r5
-      - mpc=1.3.1-r6
-      - mpdecimal-dev=4.0.1-r1
-      - mpdecimal=4.0.1-r1
-      - mpfr=4.2.2-r1
-      - ncurses-dev=6.5_p20241228-r2
-      - ncurses-terminfo-base=6.5_p20241228-r2
-      - ncurses=6.5_p20241228-r2
-      - nss-db=2.41-r4
-      - nss-hesiod=2.41-r4
-      - openssf-compiler-options=20240627-r20
-      - openssl-dev=3.5.0-r2
-      - patch=2.8-r0
-      - pkgconf=2.4.3-r2
-      - posix-cc-wrappers=1-r6
```

### readline
```
======================================
Package: readline
Version 1: 8.2.13-r4 (python:3.11.12)
Version 2: 8.3-r1 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/readline-8.2.13-r4.melange.yaml	2025-05-28 06:35:48
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/readline-8.3-r1.melange.yaml	2025-07-18 05:49:48
@@ -1,9 +1,9 @@
 package:
   name: readline
-  version: 8.2.13
-  epoch: 4
+  version: "8.3"
+  epoch: 1
   description: GNU readline library
-  commit: cfbfc5c7500721e9c6e95221587c5d6943cddda5
+  commit: b0ab5e2e7fad981f5ca302a7b7f999f307e1ba85
   copyright:
     - license: GPL-3.0-or-later
   resources: {}
@@ -15,47 +15,46 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - binutils=2.44-r2
+      - binutils=2.44-r10
       - build-base=1-r8
-      - busybox=1.37.0-r41
-      - ca-certificates-bundle=20241121-r42
-      - gcc=14.2.0-r12
-      - glibc-dev=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp=6.3.0-r4
-      - isl=0.27-r0
-      - ld-linux=2.41-r4
-      - libatomic=14.2.0-r12
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r2
-      - libgcc=14.2.0-r12
-      - libgo=14.2.0-r12
-      - libgomp=14.2.0-r12
-      - libquadmath=14.2.0-r12
-      - libssl3=3.5.0-r2
-      - libstdc++-dev=14.2.0-r12
-      - libstdc++=14.2.0-r12
-      - libxcrypt-dev=4.4.38-r1
-      - libxcrypt=4.4.38-r1
+      - busybox=1.37.0-r46
+      - ca-certificates-bundle=20250619-r2
+      - gcc=15.1.0-r2
+      - glibc-dev=2.41-r54
+      - glibc-locale-posix=2.41-r54
+      - glibc=2.41-r54
+      - gmp=6.3.0-r8
+      - isl=0.27-r3
+      - ld-linux=2.41-r54
+      - libatomic=15.1.0-r2
+      - libcrypt1=2.41-r54
+      - libcrypto3=3.5.1-r0
+      - libgcc=15.1.0-r2
+      - libgo=15.1.0-r2
+      - libgomp=15.1.0-r2
+      - libquadmath=15.1.0-r2
+      - libssl3=3.5.1-r0
+      - libstdc++-dev=15.1.0-r2
+      - libstdc++=15.1.0-r2
+      - libxcrypt-dev=4.4.38-r2
+      - libxcrypt=4.4.38-r2
       - libzstd1=1.5.7-r2
-      - linux-headers=6.15-r1
-      - make=4.4.1-r5
-      - mpc=1.3.1-r5
-      - mpfr=4.2.2-r0
-      - ncurses-dev=6.5_p20241228-r2
-      - ncurses-terminfo-base=6.5_p20241228-r2
-      - ncurses=6.5_p20241228-r2
-      - nss-db=2.41-r4
-      - nss-hesiod=2.41-r4
-      - openssf-compiler-options=20240627-r20
-      - patch=2.8-r0
-      - pkgconf=2.4.3-r2
-      - posix-cc-wrappers=1-r6
+      - linux-headers=6.15.6-r1
+      - make=4.4.1-r8
+      - mpc=1.3.1-r7
+      - mpfr=4.2.2-r2
+      - ncurses-dev=6.5_p20250621-r0
+      - ncurses-terminfo-base=6.5_p20250621-r0
+      - ncurses=6.5_p20250621-r0
+      - nss-db=2.41-r54
+      - nss-hesiod=2.41-r54
+      - openssf-compiler-options=20240627-r25
+      - pkgconf=2.5.1-r1
+      - posix-cc-wrappers=1-r7
       - scanelf=1.3.8-r4
-      - wget=1.25.0-r1
-      - wolfi-baselayout=20230201-r20
```

### sqlite-libs
```
======================================
Package: sqlite-libs
Version 1: 3.50.0-r0 (python:3.11.12)
Version 2: 3.50.4-r1 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/sqlite-libs-3.50.0-r0.melange.yaml	2025-05-29 09:22:31
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/sqlite-libs-3.50.4-r1.melange.yaml	2025-08-20 12:00:59
@@ -1,9 +1,9 @@
 package:
   name: sqlite
-  version: 3.50.0
-  epoch: 0
+  version: 3.50.4
+  epoch: 1
   description: C library which implements an SQL database engine
-  commit: 555173a96b80e35d5716f9dc43e1fe0f599c072d
+  commit: 91627cd60c5b9bf639f4a453d82f5eec39793a99
   copyright:
     - license: blessing
   resources: {}
@@ -15,48 +15,53 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - binutils=2.44-r3
+      - binutils=2.45-r0
       - build-base=1-r8
-      - busybox=1.37.0-r41
-      - ca-certificates-bundle=20241121-r42
-      - gcc=14.2.0-r13
-      - glibc-dev=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp=6.3.0-r5
-      - isl=0.27-r1
-      - ld-linux=2.41-r4
-      - libatomic=14.2.0-r13
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r2
-      - libgcc=14.2.0-r13
-      - libgo=14.2.0-r13
-      - libgomp=14.2.0-r13
-      - libquadmath=14.2.0-r13
-      - libssl3=3.5.0-r2
-      - libstdc++-dev=14.2.0-r13
-      - libstdc++=14.2.0-r13
-      - libxcrypt-dev=4.4.38-r2
-      - libxcrypt=4.4.38-r2
-      - libzstd1=1.5.7-r2
-      - linux-headers=6.15-r1
-      - make=4.4.1-r5
-      - mpc=1.3.1-r6
-      - mpfr=4.2.2-r1
+      - busybox=1.37.0-r48
+      - ca-certificates-bundle=20250619-r5
+      - gcc=15.2.0-r0
+      - glibc-dev=2.41-r56
+      - glibc-locale-posix=2.41-r56
+      - glibc=2.41-r56
+      - gmp=6.3.0-r8
+      - isl=0.27-r4
+      - ld-linux=2.41-r56
+      - libatomic=15.2.0-r0
+      - libcrypt1=2.41-r56
+      - libcrypto3=3.5.2-r1
+      - libgcc=15.2.0-r0
+      - libgo=15.2.0-r0
+      - libgomp=15.2.0-r0
+      - libquadmath=15.2.0-r0
+      - libssl3=3.5.2-r1
+      - libstdc++-dev=15.2.0-r0
+      - libstdc++=15.2.0-r0
+      - libxcrypt-dev=4.4.38-r4
+      - libxcrypt=4.4.38-r4
+      - libzstd1=1.5.7-r3
+      - linux-headers=6.16.1-r0
+      - make=4.4.1-r8
+      - mpc=1.3.1-r7
+      - mpfr=4.2.2-r2
       - ncurses-dev=6.5_p20240629-r0
-      - ncurses-terminfo-base=6.5_p20241228-r2
-      - ncurses=6.5_p20241228-r2
-      - nss-db=2.41-r4
-      - nss-hesiod=2.41-r4
-      - openssf-compiler-options=20240627-r20
-      - pkgconf=2.4.3-r2
-      - posix-cc-wrappers=1-r6
-      - readline-dev=8.2.13-r4
-      - readline=8.2.13-r4
-      - scanelf=1.3.8-r4
-      - wget=1.25.0-r1
-      - wolfi-baselayout=20230201-r20
-      - zlib=1.3.1-r7
+      - ncurses-terminfo-base=6.5_p20250621-r1
+      - ncurses=6.5_p20250621-r1
+      - nss-db=2.41-r56
+      - nss-hesiod=2.41-r56
+      - openssf-compiler-options=20240627-r26
```

### wolfi-baselayout
```
======================================
Package: wolfi-baselayout
Version 1: 20230201-r20 (python:3.11.12)
Version 2: 20230201-r24 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/wolfi-baselayout-20230201-r20.melange.yaml	2025-03-31 06:08:32
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/wolfi-baselayout-20230201-r24.melange.yaml	2025-09-11 14:14:54
@@ -1,9 +1,9 @@
 package:
   name: wolfi-baselayout
   version: "20230201"
-  epoch: 20
+  epoch: 24
   description: baselayout data for Wolfi
-  commit: 09ff0c144f957f0a8c5f9b867cb486b31d507610
+  commit: 5e4608aee947a07d2d0aced99d17a278298dce6b
   copyright:
     - license: MIT
   dependencies:
@@ -13,6 +13,10 @@
       - merged-sbin
       - merged-bin
       - merged-usrsbin
+      - merged-lib
+  checks:
+    disabled:
+      - usrmerge
   resources: {}
 environment:
   contents:
@@ -22,15 +26,15 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - busybox=1.37.0-r30
-      - ca-certificates-bundle=20241121-r2
-      - glibc-locale-posix=2.40-r23
-      - glibc=2.40-r23
-      - ld-linux=2.40-r23
-      - libcrypt1=2.40-r23
-      - libgcc=14.2.0-r11
-      - libxcrypt=4.4.38-r1
-      - wolfi-baselayout=20230201-r19
+      - busybox=1.37.0-r50
+      - ca-certificates-bundle=20250619-r6
+      - glibc-locale-posix=2.42-r0
+      - glibc=2.42-r0
+      - ld-linux=2.42-r0
+      - libcrypt1=2.42-r0
+      - libgcc=15.2.0-r2
+      - libxcrypt=4.4.38-r4
+      - wolfi-baselayout=20230201-r23
   accounts:
     run-as: ""
     users:
@@ -52,6 +56,7 @@
     GOPATH: /home/build/.cache/go
     GOTOOLCHAIN: local
     HOME: /home/build
+    PYTHONHASHSEED: "0"
 pipeline:
   - name: Generate /etc/shadow
     runs: |
@@ -75,17 +80,18 @@
       for i in dev etc etc/profile.d etc/secfixes.d home proc root var/log usr/bin usr/local/lib sys tmp var/spool/cron opt run usr/lib; do
       	mkdir -p "/home/build/melange-out/wolfi-baselayout"/${i}
       done
-      mkdir -p /home/build/melange-out/wolfi-baselayout/lib
-      ln -s usr/bin /home/build/melange-out/wolfi-baselayout/sbin
-      ln -s usr/bin /home/build/melange-out/wolfi-baselayout/bin
-      ln -s bin /home/build/melange-out/wolfi-baselayout/usr/sbin
-      for i in lib64 usr/lib64 usr/local/lib64; do
-      	ln -s lib "/home/build/melange-out/wolfi-baselayout"/${i}
-      done
+      chmod 1777 "/home/build/melange-out/wolfi-baselayout/tmp"
+      ln -sf usr/bin /home/build/melange-out/wolfi-baselayout/sbin
+      ln -sf usr/bin /home/build/melange-out/wolfi-baselayout/bin
+      ln -sf bin /home/build/melange-out/wolfi-baselayout/usr/sbin
+      ln -sf usr/lib /home/build/melange-out/wolfi-baselayout/lib
+      ln -sf usr/lib /home/build/melange-out/wolfi-baselayout/lib64
+      ln -sf lib /home/build/melange-out/wolfi-baselayout/usr/lib64
+      ln -sf lib /home/build/melange-out/wolfi-baselayout/usr/local/lib64
       for i in etc/passwd etc/group etc/shadow etc/services etc/hosts etc/profile etc/shells etc/protocols etc/profile.d/locale.sh etc/nsswitch.conf etc/os-release etc/secfixes.d/wolfi; do
       	install -m644 vendor/${i} "/home/build/melange-out/wolfi-baselayout"/${i}
       done
-      install -m600 vendor/etc/shadow "/home/build/melange-out/wolfi-baselayout"/etc/shadow
+      install -m000 vendor/etc/shadow "/home/build/melange-out/wolfi-baselayout"/etc/shadow
       ln -s /etc/crontabs "/home/build/melange-out/wolfi-baselayout"/var/spool/cron/crontabs
       ln -s /proc/mounts "/home/build/melange-out/wolfi-baselayout"/etc/mtab
       ln -s /var/mail "/home/build/melange-out/wolfi-baselayout"/var/spool/mail
@@ -93,6 +99,11 @@
       chmod 0700 "/home/build/melange-out/wolfi-baselayout"/root
       mkdir -p "/home/build/melange-out/wolfi-baselayout"/var/empty
       chmod 755 "/home/build/melange-out/wolfi-baselayout"/var/empty
+update:
+  enabled: false
+  manual: false
+  require-sequential: false
```

### xz
```
======================================
Package: xz
Version 1: 5.8.1-r1 (python:3.11.12)
Version 2: 5.8.1-r3 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/xz-5.8.1-r1.melange.yaml	2025-05-28 06:35:48
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/xz-5.8.1-r3.melange.yaml	2025-09-18 13:08:46
@@ -1,9 +1,9 @@
 package:
   name: xz
   version: 5.8.1
-  epoch: 1
+  epoch: 3
   description: Library and CLI tools for XZ and LZMA compressed files
-  commit: cfbfc5c7500721e9c6e95221587c5d6943cddda5
+  commit: aab4d43bfe60faf9735dc83a66dfc1200a80d597
   copyright:
     - license: GPL-3.0-or-later
   resources: {}
@@ -15,43 +15,43 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - binutils=2.44-r2
-      - build-base=1-r8
-      - busybox=1.37.0-r40
-      - ca-certificates-bundle=20241121-r42
-      - gcc=14.2.0-r12
-      - glibc-dev=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp=6.3.0-r4
-      - isl=0.27-r0
-      - ld-linux=2.41-r4
-      - libatomic=14.2.0-r12
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r2
-      - libgcc=14.2.0-r12
-      - libgo=14.2.0-r12
-      - libgomp=14.2.0-r12
-      - libquadmath=14.2.0-r12
-      - libssl3=3.5.0-r2
-      - libstdc++-dev=14.2.0-r12
-      - libstdc++=14.2.0-r12
-      - libxcrypt-dev=4.4.38-r1
-      - libxcrypt=4.4.38-r1
-      - libzstd1=1.5.7-r2
-      - linux-headers=6.15-r0
-      - make=4.4.1-r5
-      - mpc=1.3.1-r5
-      - mpfr=4.2.2-r0
-      - nss-db=2.41-r4
-      - nss-hesiod=2.41-r4
-      - openssf-compiler-options=20240627-r20
-      - pkgconf=2.4.3-r1
-      - posix-cc-wrappers=1-r6
-      - scanelf=1.3.8-r4
-      - wget=1.25.0-r1
-      - wolfi-baselayout=20230201-r20
-      - zlib=1.3.1-r7
+      - binutils=2.45-r2
+      - build-base=1-r9
+      - busybox=1.37.0-r50
+      - ca-certificates-bundle=20250619-r6
+      - gcc=15.2.0-r2
+      - glibc-dev=2.42-r0
+      - glibc-locale-posix=2.42-r0
+      - glibc=2.42-r0
+      - gmp=6.3.0-r8
+      - isl=0.27-r4
+      - ld-linux=2.42-r0
+      - libatomic=15.2.0-r2
+      - libcrypt1=2.42-r0
+      - libcrypto3=3.5.2-r1
+      - libgcc=15.2.0-r2
+      - libgo=15.2.0-r2
+      - libgomp=15.2.0-r2
+      - libquadmath=15.2.0-r2
+      - libssl3=3.5.2-r1
+      - libstdc++-dev=15.2.0-r2
+      - libstdc++=15.2.0-r2
+      - libxcrypt-dev=4.4.38-r4
+      - libxcrypt=4.4.38-r4
+      - libzstd1=1.5.7-r3
+      - linux-headers=6.16.7-r0
+      - make=4.4.1-r8
+      - mpc=1.3.1-r7
+      - mpfr=4.2.2-r2
+      - nss-db=2.42-r0
+      - nss-hesiod=2.42-r0
+      - openssf-compiler-options=20240627-r27
+      - pkgconf=2.5.1-r1
+      - posix-cc-wrappers=1-r7
+      - scanelf=1.3.8-r5
+      - wget=1.25.0-r6
+      - wolfi-baselayout=20230201-r24
+      - zlib=1.3.1-r51
   accounts:
```

### zlib
```
======================================
Package: zlib
Version 1: 1.3.1-r7 (python:3.11.12)
Version 2: 1.3.1-r51 (python:3.11.13)
======================================

=== Raw YAML Diff ===
--- ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.12/zlib-1.3.1-r7.melange.yaml	2025-05-28 06:35:48
+++ ./chainscan_20251008_071520/downloaded_apks/cgr.dev_chainguard-private_python_3.11.13/zlib-1.3.1-r51.melange.yaml	2025-07-17 09:44:10
@@ -1,11 +1,15 @@
 package:
   name: zlib
   version: 1.3.1
-  epoch: 7
+  epoch: 51
   description: a library implementing the zlib compression algorithms
-  commit: cfbfc5c7500721e9c6e95221587c5d6943cddda5
+  commit: aa6b1a2aa6f8a444fc26b4415a66584030fa79d3
   copyright:
     - license: MPL-2.0 AND MIT
+  dependencies:
+    runtime:
+      - merged-lib
+      - wolfi-baselayout
   resources: {}
 environment:
   contents:
@@ -15,72 +19,72 @@
     keyring:
       - https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
     packages:
-      - autoconf=2.72-r2
-      - automake=1.18-r0
-      - binutils=2.44-r2
+      - autoconf=2.72-r3
+      - automake=1.18.1-r0
+      - binutils=2.44-r9
       - build-base=1-r8
-      - busybox=1.37.0-r40
-      - ca-certificates-bundle=20241121-r41
-      - cyrus-sasl=2.1.28-r40
-      - gcc=14.2.0-r12
-      - gdbm=1.25-r0
-      - git=2.49.0-r1
-      - glibc-dev=2.41-r4
-      - glibc-locale-posix=2.41-r4
-      - glibc=2.41-r4
-      - gmp=6.3.0-r4
-      - heimdal-libs=7.8.0-r40
-      - isl=0.27-r0
-      - keyutils-libs=1.6.3-r31
-      - krb5-conf=1.0-r5
-      - krb5-libs=1.21.3-r40
-      - ld-linux=2.41-r4
-      - libatomic=14.2.0-r12
-      - libbrotlicommon1=1.1.0-r4
-      - libbrotlidec1=1.1.0-r4
-      - libbz2-1=1.0.8-r11
-      - libcom_err=1.47.2-r21
-      - libcrypt1=2.41-r4
-      - libcrypto3=3.5.0-r1
-      - libcurl-openssl4=8.14.0-r0
-      - libexpat1=2.7.1-r0
-      - libgcc=14.2.0-r12
-      - libgo=14.2.0-r12
-      - libgomp=14.2.0-r12
-      - libidn2=2.3.8-r0
-      - libldap=2.6.10-r0
+      - busybox=1.37.0-r46
+      - ca-certificates-bundle=20250619-r2
+      - cyrus-sasl=2.1.28-r42
+      - gcc=15.1.0-r1
+      - gdbm=1.25-r2
+      - git=2.50.1-r0
+      - glibc-dev=2.41-r53
+      - glibc-locale-posix=2.41-r53
+      - glibc=2.41-r53
+      - gmp=6.3.0-r8
+      - heimdal-libs=7.8.0-r41
+      - isl=0.27-r3
+      - keyutils-libs=1.6.3-r35
+      - krb5-conf=1.0-r6
+      - krb5-libs=1.21.3-r42
+      - ld-linux=2.41-r53
+      - libatomic=15.1.0-r1
+      - libbrotlicommon1=1.1.0-r5
+      - libbrotlidec1=1.1.0-r5
+      - libbz2-1=1.0.8-r18
+      - libcom_err=1.47.2-r22
+      - libcrypt1=2.41-r53
+      - libcrypto3=3.5.1-r0
+      - libcurl-openssl4=8.15.0-r0
+      - libexpat1=2.7.1-r2
+      - libgcc=15.1.0-r1
+      - libgo=15.1.0-r1
+      - libgomp=15.1.0-r1
+      - libidn2=2.3.8-r2
+      - libldap=2.6.10-r3
       - libltdl=2.4.7-r5
-      - libnghttp2-14=1.65.0-r0
```

