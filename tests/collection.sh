#!/bin/bash
#
# Collection playbook tests.
set -e

# Install dependencies.
pip3 install ansible

cd collection

# Run Ansible playbook.
ansible-playbook -c local -i 'localhost,' main.yml
