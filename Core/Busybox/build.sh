#!/bin/sh
rm -r busybox_installed

chrt -b 0 nice -n 20 tar -xvf ../../Source/busybox-*.tar.bz2
cd $(ls -d busybox-*)
chrt -b 0 nice -n 20 make distclean -j 32
chrt -b 0 nice -n 20 make defconfig -j 32
sed -i "s/.*CONFIG_STATIC.*/CONFIG_STATIC=y/" .config
chrt -b 0 nice -n 20 make \
  EXTRA_CFLAGS="-Os -s -fno-stack-protector -fomit-frame-pointer -U_FORTIFY_SOURCE -pipe" \
  busybox -j 32
chrt -b 0 nice -n 20 make \
  CONFIG_PREFIX="../busybox_installed" \
  install -j 32
cd ..
rm -r busybox-*/
