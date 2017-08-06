#!/bin/sh


cd Source
rm *.apk
rm *.tar.xz
rm *.tar.bz2
cd ..


cd Core

cd Busybox
rm -r busybox_installed
rm busybox.tar.bz2
cd ..

cd Kernel
rm kernelImage
rm linux.tar.xz
cd ..

cd ..


cd Root
rm rootfs.tar.xz
rm *.apk
cd ..


cd Installer
rm output.iso
rm InstallFS/root/boot.iso
rm InstallFS/root/boot.tar.xz
rm InstallFS/root/rootfs.tar.xz
rm syslinux.tar.xz
cd ..
