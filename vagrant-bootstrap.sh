#!/bin/bash

echo vagrant:bascht | /usr/sbin/chpasswd
mv /home/vagrant /home/bascht
find /home/bascht -xdev ! -type l -exec chown 1000:1000 {} +
sed -i s/vagrant/bascht/g /etc/passwd
sed -i s/vagrant/bascht/g /etc/group
sed -i s/vagrant/bascht/g /etc/shadow
sed -i s/vagrant/bascht/g /etc/sudoers.d/vagrant
