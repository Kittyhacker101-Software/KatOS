#!/bin/sh

clear

echo "Press enter to install KatOS. Press any other key to exit to the LiveCD."

read -n1 -s key

if [ "$key" = "" ] ; then
  sh "/root/install.sh"
else 
  echo "Installer exited. Type /root/install.sh to start the installer again."
  cttyhack /bin/sh
fi
