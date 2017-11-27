#!/bin/sh
rm InstallFS/root/boot.tar.xz
rm InstallFS/root/rootfs.tar.xz
alias batch="chrt -b 0 nice -n 20"

# Build Initrd
cp -v ../Core/Busybox/busybox_installed -r rootfs
cd rootfs
batch tar -xvf ../../Core/Initfs.tar.xz
batch find . | cpio -R root:root -H newc -o -v | xz -9 -e --check=none > ../rootfs.cpio.xz
cd ..
rm -r rootfs

# Build boot partition data
mkdir isoimage
cd isoimage
cp ../../Core/Kernel/kernelImage ./kernel.xz
cp ../rootfs.cpio.xz ./rootfs.xz
mkdir -p efi/boot
cat << CEOF > ./efi/boot/startup.nsh
echo -off
echo "Loading KatOS..."
\\kernel.xz initrd=\\rootfs.xz quiet
CEOF
batch tar cfv - * | xz -9 -e --check=none > ../InstallFS/root/boot.tar.xz
cd ..
rm -r isoimage
rm rootfs.cpio.xz

# Move root partion data
cp ../Root/rootfs.tar.xz InstallFS/root/rootfs.tar.xz
