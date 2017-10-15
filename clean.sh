#!/bin/sh


cd Source
rm *.apk
rm *.tar.xz
rm *.tar.bz2
cd ..


cd Core

cd Busybox
rm -r busybox_installed
cd ..

cd Kernel
rm kernelImage
cd ..

cd ..


cd Root
rm rootfs.tar.xz
cd ..


cd Installer
rm output.iso
rm extinit.iso
rm InstallFS/root/boot.tar.xz
rm InstallFS/root/rootfs.tar.xz
cd ..
