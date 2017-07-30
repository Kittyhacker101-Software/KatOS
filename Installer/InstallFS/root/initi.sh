#!/bin/sh

echo "Press enter to install KatOS. Press any other key to exit to the LiveCD."

read -t 60 -n1 -s key

if [ "$key" = "" ] ; then
  sh "/root/install.sh"
else 
  echo "Installer exited. Type /root/install.sh to start the installer within the LiveCD."
  cttyhack /bin/sh
fi
