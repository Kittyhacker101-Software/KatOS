#!/bin/sh

cd Source
sh download.sh
cd ..

cd Core
sh build.sh
cd ..

cd Root
sh build.sh
cd ..

cd Installer
sh build.sh
cd ..
