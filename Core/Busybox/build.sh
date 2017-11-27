#!/bin/sh
rm -r busybox_installed
alias batch="chrt -b 0 nice -n 20"

batch tar -xvf ../../Source/busybox-*.tar.bz2
cd $(ls -d busybox-*)
batch make distclean -j 32
batch make defconfig -j 32
sed -i "s/.*CONFIG_STATIC.*/CONFIG_STATIC=y/" .config
batch make \
  EXTRA_CFLAGS="-Os -s -fno-stack-protector -fomit-frame-pointer -U_FORTIFY_SOURCE -pipe" \
  busybox -j 32
batch make \
  CONFIG_PREFIX="../busybox_installed" \
  install -j 32
cd ..
rm -r busybox-*/
