#!/bin/bash

echo vagrant:bascht | /usr/sbin/chpasswd
find /home/vagrant
mv /home/vagrant/.ssh /home/bascht/.ssh
find /home/bascht -xdev ! -type l -exec chown 1000:1000 {} +
sed -i s/vagrant/bascht/g /etc/passwd
sed -i s/vagrant/bascht/g /etc/group
sed -i s/vagrant/bascht/g /etc/shadow
sed -i s/vagrant/bascht/g /etc/sudoers.d/vagrant
