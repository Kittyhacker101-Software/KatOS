#!/bin/sh

apk --root / --initdb add
apk update
apk add alpine-keys musl openssl busybox apk-tools ca-certificates
apk cache clean

# Glibc Compatibility is for Kittyhacker101 Software programs, which depend on Glibc
wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk
apk add glibc-2.25-r0.apk
rm glibc-2.25-r0.apk

clear
passwd root
chown -R root:root /root

apk add dropbear byobu
mkdir /etc/dropbear
for key_type in rsa dss ecdsa; do
  /usr/bin/dropbearkey \
    -t $key_type \
    -f /etc/dropbear/dropbear_${key_type}_host_key
done
byobu-enable

clear
echo "KatOS has been installed. You may remove the LiveCD now."
echo "Press any key to reboot your computer..."
read -n1
reboot
