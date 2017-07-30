# Installer
This folder contains the files needed to build the installer for KatOS.
Note : For the installer to build correctly, you must have all other components of KatOS compiled!

# InstallFS
The InstallFS folder contains the root file system used in the installer.
Note that the the InstallFS only contains an overlay for the rootfs, and is not a fully functioning rootfs.
The fully functional rootfs is built automatically when making the ISO image.

# Building
To build the installer, type `./build.sh` in your terminal.
This will build the initramfs and rootfs packages, move them into the installfs, and then make the iso image for the installer.
