#!/bin/sh

cd Busybox
sh build.sh
cd ..

cd Kernel
sh build.sh
cd ..
