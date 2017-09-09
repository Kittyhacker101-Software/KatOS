# KatOS

Welcome to the KatOS repo, where build scripts for making core parts of KatOS are stored.
KatOS is a collab between kittyhacker101, tbodt, and joyesh to make a lightweight and modern operating system.
This project is a early work in progress, and much work needs to be done before it is complete.

# Directory Structure
- Core - Core parts of the KatOS system
- Root - Basic rootfs for installed system.
- Installer - Build scripts for installer iso.
- Source - Packaged files used in KatOS.

# Building
- To build all parts of KatOS, type `./buildall.sh` in your terminal.
- To remove all compiled binaries from your folder, type `./clean.sh` in your terminal.

# Running
To run KatOS in a VM or on a PC, use the file from the /instaler/output.iso folder, or download a precompiled release from the releases page.
KatOS requires a x86_64 CPU, and at least 128MB of RAM. To install KatOS, 256MB of storage space is required and a 64-bit EFI/UEFI motherboard (a workaround for BIOS support is currently experimental, but unfinished).

# More info
Have extra questions, or want to help contribute?
Join the KatOS Discord server at https://discord.gg/qsXJS6m for that and lots more!
If you would like to contact me directly, send an email to kittyhacker101@protonmail.com
Replies to emails often take 2-7 days, so please use GitHub issues instead for bug reports.
