#!/bin/sh
rm rootfs.tar.xz

cp -v ../Core/Busybox/busybox_installed -r install/
cd install
tar -xvf ../../Source/alpine-keys-*.apk
tar -xvf ../../Source/musl-*.ap
tar -xvf ../../Source/busybox-*.apk
tar -xvf ../../Core/Basefs.tar.xz
cd ..

tar -xvf ../Source/apk-tools-static-*.apk
cp sbin/apk.static install/sbin/apk
rm -r sbin

rm install/init
mkdir -p install/var/cache/apk
ln -s /var/cache/apk install/etc/apk/cache
cat << CEOF > install/etc/apk/repositories
http://nl.alpinelinux.org/alpine/edge/main/
http://nl.alpinelinux.org/alpine/edge/community/
http://nl.alpinelinux.org/alpine/edge/testing/
CEOF

cd install
tar cfv - * | xz -9 -e --check=none > ../rootfs.tar.xz
cd ..
rm -r install
