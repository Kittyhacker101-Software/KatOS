#!/bin/sh

clear
ls /sys/block
echo "Please enter the device you wish to install KatOS on :"
read -n 3 disk
diskdev="/dev/"$disk
diskboot=$diskdev"1"
diskroot=$diskdev"2"

dd if=/root/boot.iso of=$diskdev
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk $diskdev ${TGTDEV}
	o
	n
	p
	1
	
	+100M
	a
	1
	t
	ef
	n
	p
	2
	
	
	w
EOF
mkfs.vfat $diskboot
mkfs.ext2 $diskroot
mkdir /rootfs
mkdir /boot
mount $diskboot /boot
mount $diskroot /rootfs

cd /boot
tar -xvf /root/boot.tar.xz

cd /rootfs
tar -xvf /root/rootfs.tar.xz

mount -t proc /proc /rootfs/proc
mount --rbind /sys /rootfs/sys
mount --make-rslave /rootfs/sys
mount --rbind /dev /rootfs/dev
mount --make-rslave /rootfs/dev
mount --move /tmp /rootfs/tmp

cp /root/setup.sh /rootfs/tmp

umount /boot
chroot /rootfs /tmp/setup.sh
