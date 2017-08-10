#!/bin/sh
rm *.apk
rm *.tar.xz
rm *.tar.bz2

wget https://www.busybox.net/downloads/busybox-1.27.1.tar.bz2
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.12.5.tar.xz
wget https://www.kernel.org/pub/linux/utils/boot/syslinux/Testing/6.04/syslinux-6.04-pre1.tar.xz
wget http://nl.alpinelinux.org/alpine/latest-stable/main/x86_64/alpine-keys-2.1-r1.apk
wget http://nl.alpinelinux.org/alpine/latest-stable/main/x86_64/apk-tools-static-2.7.2-r0.apk
wget http://nl.alpinelinux.org/alpine/latest-stable/main/x86_64/busybox-1.26.2-r6.apk
wget http://nl.alpinelinux.org/alpine/latest-stable/main/x86_64/musl-1.1.16-r13.apk
