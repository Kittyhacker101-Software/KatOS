# KatOS

Welcome to the KatOS repo, where build scripts for making core parts of KatOS are stored.
KatOS is a modern and lightweight operating system for server systems.
This project is a work in progress, and will be finished very soon.

# Directory Structure
- Core - Core parts of the KatOS system
- Root - Basic rootfs for installed system.
- Installer - Build scripts for installer iso.
- Source - Packaged files used in KatOS.

# Building
- To build all parts of KatOS, type `./buildall.sh` in your terminal.
- To clean all binaries from your build directory, type `./clean.sh` in your terminal (reccomended when you are updating/modifying core components).

# Running
To run KatOS in a VM or on a PC, download the repo and build an iso file, or download a precompiled release from the releases page.
KatOS requires a x86_64 CPU, and at least 128MB of RAM (booting on lower amounts of RAM would require modifications to the kernel). To install KatOS, 512MB of storage space is required (although installing on smaller devices may be possible) and a 64-bit EFI/UEFI motherboard (BIOS support is possible with the use of KatOS's external init). Note that not all EFI implementations are the same, so KatOS may not work on your device, even it it supports EFI.

When installed, root:toor is the default login. Note that changing your password and possibly adding a non-administrator account is reccomended after installation.

# More info
Have extra questions, or want to help contribute?
Join the KatOS Discord server at https://discord.gg/qsXJS6m for that and lots more!
If you would like to contact me directly, send an email to kittyhacker101@protonmail.com
Replies to emails often take 2-7 days, so please use GitHub issues instead for bug reports.
