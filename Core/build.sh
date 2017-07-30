#!/bin/sh

cd Kernel
sh build.sh
cd ..

cd Busybox
sh build.sh
cd ..
