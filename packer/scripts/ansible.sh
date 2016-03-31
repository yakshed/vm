#!/bin/bash
apt-get install -y software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get install -y ansible
ansible-galaxy install -r /tmp/ansible/requirements.yml
