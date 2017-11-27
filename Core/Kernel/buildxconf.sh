#!/bin/sh
rm kernelImage

chrt -b 0 nice -n 20 tar -xvf ../../Source/linux-*.tar.xz
cd $(ls -d linux-*)
chrt -b 0 nice -n 20 make mrproper -j 32
cp ../buildconfig .config
make xconfig
chrt -b 0 nice -n 20 make \
  CFLAGS="-O3 -s -U_FORTIFY_SOURCE -pipe" \
  bzImage -j 32
cp arch/x86_64/boot/bzImage \
  ../kernelImage
cd ..
