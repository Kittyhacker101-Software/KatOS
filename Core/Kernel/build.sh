#!/bin/sh
rm kernelImage

tar -xvf ../../Source/linux-*.tar.xz
cd $(ls -d linux-*)
make mrproper -j 32
cp ../buildconfig .config
#make xconfig
make \
  CFLAGS="-O3 -s -U_FORTIFY_SOURCE -pipe" \
  bzImage -j 32
cp arch/x86_64/boot/bzImage \
  ../kernelImage
cd ..
rm -r linux-*/
