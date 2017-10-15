# Root
Basic RootFS for KatOS installed version.
This is where the rootfs for the installed version of KatOS is packaged.

# Packages
- Apk-Keys - Encryption keys for Apk Package Manager
- Apk-Static - Static compiled version of Apk, required for installer to work properly
- Busybox - A compiled version of Busybox compiled aganst Musl
- Musl - Musl C Library

# Building
To build, type `./build.sh` in your terminal.
This will merge all the compiled tarballs into a folder, which is then packaged into the installer.
This should only take a few minutes with a modern storage device, but it may take longer with older hardware. All source files must be downloaded for the build to be sucessful.

# Updating
To update a package code, update the data stored in the /Sources folder, and then run `./build.sh`.
The rootfs build script also uses Basefs.tar.xz, which is located in the /Core folder.
