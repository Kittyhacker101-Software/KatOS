#!/bin/sh


cd Source
sh download.sh
cd ..


cd Core

cd Busybox
sh build.sh
cd ..

cd Kernel
sh build.sh
cd ..

cd ..


cd Root
sh build.sh
cd ..


cd Installer
sh build.sh
cd ..
