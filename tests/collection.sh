#!/bin/bash
#
# Collection playbook tests.
set -e

# Make sure pip3 is available.
sudo apt-get update
sudo apt-get install -y python3-pip python3-setuptools
pip3 install --upgrade setuptools pip

# Install dependencies.
pip3 install ansible

cd collection

# Run Ansible playbook.
ansible-playbook -c local -i 'localhost,' main.yml
