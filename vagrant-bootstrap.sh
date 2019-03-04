#!/bin/bash

echo vagrant:bascht | /usr/sbin/chpasswd
find /home/vagrant
mv /home/vagrant/.ssh /home/bascht/.ssh
find /home/bascht -xdev -exec chown vagrant:vagrant {} +
sed -i s/vagrant/bascht/g /etc/passwd
sed -i s/vagrant/bascht/g /etc/group
sed -i s/vagrant/bascht/g /etc/shadow
sed -i s/vagrant/bascht/g /etc/sudoers.d/vagrant
