#!/bin/bash

# Network.sh stolen from @nrclark

echo "auto lo" >> /etc/network/interfaces
echo "iface lo inet loopback" >> /etc/network/interfaces
echo "" >> /etc/network/interfaces

echo "source /etc/network/interfaces.d/*" > /etc/network/interfaces
echo "" >> /etc/network/interfaces

echo "auto eth0" >> /etc/network/interfaces
echo "iface eth0 inet dhcp" >> /etc/network/interfaces
echo "pre-up sleep 2" >> /etc/network/interfaces
echo "" >> /etc/network/interfaces

echo "#VAGRANT-BEGIN" >> /etc/network/interfaces
echo "# This section will be auto-replaced" >> /etc/network/interfaces
echo "auto eth1" >> /etc/network/interfaces
echo "iface eth1 inet manual" >> /etc/network/interfaces
echo "pre-up sleep 2" >> /etc/network/interfaces
echo "" >> /etc/network/interfaces
echo "#VAGRANT-END" >> /etc/network/interfaces
echo "" >> /etc/network/interfaces

sed -i 's/[ #]*GRUB_CMDLINE_LINUX=.*/GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"/g' /etc/default/grub
update-grub


# Removing leftover leases and persistent rules
echo "cleaning up dhcp leases"
rm /var/lib/dhcp/*

# Clean up Apts Rubbish bin
apt-get -y autoremove --purge
apt-get -y clean
apt-get -y autoclean

# Clean up logs + journals
find /var/log -maxdepth 1 -type f -exec cp /dev/null {} \;
find /var/log/apt -maxdepth 1 -type f -exec cp /dev/null {} \;
find /var/log/fsck -maxdepth 1 -type f -exec cp /dev/null {} \;
journalctl --vacuum-time=1seconds


echo "Adding a 2 sec delay to the interface up, to make the dhclient happy"
echo "pre-up sleep 2" >> /etc/network/interfaces

# Display free Disk size
df -h /
