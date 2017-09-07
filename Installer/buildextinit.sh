#!/bin/sh
rm output.iso

cp -v ../Core/Busybox/busybox_installed -r rootfs
cd rootfs
tar -xvf ../../Core/Initfs.tar.xz
find . | cpio -R root:root -H newc -o -v | xz -9 -e --check=none > ../rootfs.cpio.xz
cd ..
rm -r rootfs

tar -xvf syslinux.tar.xz
cd $(ls -d syslinux-*)
SYSLINUX=$(pwd)
cd ..

mkdir isoimage
cp ../Core/Kernel/kernelImage ./isoimage/kernel.xz
cp rootfs.cpio.xz ./isoimage/rootfs.xz
cd isoimage
cp $SYSLINUX/bios/core/isolinux.bin .
cp $SYSLINUX/bios/com32/elflink/ldlinux/ldlinux.c32 .
strip --strip-all --discard-all ldlinux.c32
echo 'default kernel.xz initrd=rootfs.xz quiet' > ./syslinux.cfg
mkdir -p efi/boot
cat << CEOF > ./efi/boot/startup.nsh
echo -off
echo "Loading KatOS External Init..."
\\kernel.xz initrd=\\rootfs.xz quiet
CEOF

cd ..
genisoimage \
  -J \
  -r \
  -o output.iso \
  -b isolinux.bin \
  -c boot.cat \
  -input-charset UTF-8 \
  -no-emul-boot \
  -boot-load-size 4 \
  -boot-info-table \
  ./isoimage
$SYSLINUX/bios/utils/isohybrid output.iso
rm rootfs.cpio.xz
rm -r $SYSLINUX
rm -r isoimage