#!/bin/sh

echo -e 'toor\ntoor\n' | passwd root
rm /init

mkdir -p /var/cache/apk
ln -s /var/cache/apk /etc/apk/cache

apk --root / --initdb add
apk update
apk add alpine-keys
apk add musl
apk add openssl
apk add busybox
apk add apk-tools
apk cache clean

clear
echo "KatOS has been installed. You may remove the LiveCD now."
echo "Press any key to reboot your computer..."
read -n1
reboot
