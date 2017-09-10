#!/bin/sh
rm kernelImage

cp ../../Source/linux-*.tar.xz linux.tar.xz
tar -xvf linux.tar.xz
cd $(ls -d linux-*)
make mrproper -j 32
cp ../buildconfig .config
make \
  CFLAGS="-O3 -s -U_FORTIFY_SOURCE -pipe" \
  bzImage -j 32
cp arch/x86_64/boot/bzImage \
  ../kernelImage
cd ..
rm -r linux-*/
