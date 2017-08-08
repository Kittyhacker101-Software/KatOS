#!/bin/sh
rm InstallFS/root/boot.iso
rm InstallFS/root/boot.tar.xz
rm InstallFS/root/rootfs.tar.xz

# Build Initrd
cp -v ../Core/Busybox/busybox_installed -r rootfs
strip --strip-all -v \
  rootfs/bin/* \
  rootfs/usr/bin/* \
  rootfs/sbin/* \
  rootfs/usr/sbin/* 
cd rootfs
tar -xvf ../../Core/Initfs.tar.xz
find . | cpio -R root:root -H newc -o -v | xz -9 -e --check=none > ../rootfs.cpio.xz
cd ..
rm -r rootfs

tar -xvf syslinux.tar.xz
cd $(ls -d syslinux-*)
SYSLINUX=$(pwd)
cd ..

# Build boot partition data..
mkdir isoimage
cp ../Core/Kernel/kernelImage ./isoimage/kernel.xz
cp rootfs.cpio.xz ./isoimage/rootfs.xz
cd isoimage
cp $SYSLINUX/bios/core/isolinux.bin .
mkdir -p efi/boot
cat << CEOF > ./efi/boot/startup.nsh
echo -off
echo "Loading KatOS..."
\\kernel.xz initrd=\\rootfs.xz quiet
CEOF
tar cfv - * | xz -9 -e --check=none > ../boot.tar.xz
cd ..
rm -r isoimage
rm rootfs.cpio.xz
rm -r $SYSLINUX

# Move files into installer filesystem
mv boot.iso InstallFS/root/boot.iso
mv boot.tar.xz InstallFS/root/boot.tar.xz
cp ../Root/rootfs.tar.xz InstallFS/root/rootfs.tar.xz
