#!/bin/sh
rm *.apk
rm *.tar.xz
rm *.tar.bz2

wget https://www.busybox.net/downloads/busybox-1.27.2.tar.bz2
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.14.1.tar.xz
wget https://www.kernel.org/pub/linux/utils/boot/syslinux/Testing/6.04/syslinux-6.04-pre1.tar.xz
wget http://nl.alpinelinux.org/alpine/v3.6/main/x86_64/alpine-keys-2.1-r1.apk
wget http://nl.alpinelinux.org/alpine/v3.6/main/x86_64/apk-tools-static-2.7.4-r0.apk
wget http://nl.alpinelinux.org/alpine/v3.6/main/x86_64/busybox-1.26.2-r9.apk
wget http://nl.alpinelinux.org/alpine/v3.6/main/x86_64/musl-1.1.16-r14.apk
