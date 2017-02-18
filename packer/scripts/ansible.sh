#!/bin/bash
apt install -y ansible
ansible-galaxy install -r /tmp/requirements.yml
