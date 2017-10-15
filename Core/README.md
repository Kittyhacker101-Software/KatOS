# Core
This folder contains core parts of the KatOS system.
Warning : **Messing with these can easily mess up the KatOS build process, and cause issues with other build scripts!**

# File System Structure
- Basefs.tar.xz - Base layout for installed version of KatOS.
- Initfs.tar.xz - Base layout for initramfs.
- InitExtfs.tar.xz - Base layout for external initramfs.
- Busybox - Static compiled version of busybox for use in the initramfs and installer.
- Kernel - Linux kernel.

# Building
To build all contents of this folder, type `./build.sh` in your terminal.
This will rebuild all of the components from source code, and may take a while if you do not have a powerful PC. All source files must be downloaded for the build to be sucessful.

# Updating
To update a component's source code, update the data stored in the /Sources folder, and then run `./build.sh`. Cleaning the build directories is reccomended.
The base layouts are manually made, and do not contain binaries, only config files.
If those stop functioning due to an update, please file a GitHub issue, and I will take a look into the problem.
