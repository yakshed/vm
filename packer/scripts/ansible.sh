#!/bin/bash
apt-get install -y ansible
ansible-galaxy install -r /tmp/requirements.yml
