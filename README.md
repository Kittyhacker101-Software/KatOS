# KatOS

Welcome to the KatOS repo, where build scripts for making core parts of KatOS are stored.
KatOS is a modern and lightweight operating system for server systems.

# Directory Structure
- Core - Core parts of the KatOS system
- Root - Basic rootfs for installed system.
- Installer - Build scripts for installer iso.
- Source - Packaged files used in KatOS.

# Building
- To build all parts of KatOS, type `./buildall.sh` in your terminal.
- To clean all binaries from your build directory, type `./clean.sh` in your terminal (reccomended when you are updating/modifying core components).

# Running
To run KatOS in a VM or on a PC, download the repo and build an iso file, or download a precompiled release from the releases page. Make sure that your system can meet the minimum requirements for KatOS, and that your chosen hardware can run Linux 4.x kernels properly. When installed, root:toor is the default login. Note that changing your password and possibly adding a non-administrator account is reccomended after installation.

# Minimum requirements
- Any x86_64 CPU
- 128 MB of RAM
- ~512 MB of storage space
- 64-bit EFI/UEFI motherboard (must be able to load startup.nsh)

# Recommended requirements
- AMD or Intel x86_64 CPU, running at 512MHz or higher.
- 256 MB of RAM
- 1GB of storage space
- 64-bit EFI/UEFI motherboard (must be able to load startup.nsh)

# More info
Have extra questions, or want to help contribute?
Join the KatOS Discord server at https://discord.gg/qsXJS6m for that and lots more!
If you would like to contact me directly, send an email to kittyhacker101@protonmail.com
Replies to emails often take 2-7 days, so please use GitHub issues instead for bug reports.
