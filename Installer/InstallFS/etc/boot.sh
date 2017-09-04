#!/bin/sh

for DEVICE in /sys/class/net/* ; do
  ip link set ${DEVICE##*/} up
  [ ${DEVICE##*/} != lo ] && udhcpc -b -i ${DEVICE##*/} -s /etc/rc.dhcp &>/dev/null &
done
