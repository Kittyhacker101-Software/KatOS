#!/bin/sh

cp ../Source/syslinux-*.tar.xz syslinux.tar.xz
sh updatefs.sh
sh makeiso.sh
