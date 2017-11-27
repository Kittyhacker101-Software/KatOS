#!/bin/sh
rm kernelImage
alias batch="chrt -b 0 nice -n 20"

batch tar -xvf ../../Source/linux-*.tar.xz
cd $(ls -d linux-*)
batch make mrproper -j 32
cp ../buildconfig .config
make xconfig
batch make \
  CFLAGS="-O3 -s -U_FORTIFY_SOURCE -pipe" \
  bzImage -j 32
cp arch/x86_64/boot/bzImage \
  ../kernelImage
cd ..
