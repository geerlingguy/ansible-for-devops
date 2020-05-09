#!/bin/bash
#
# Molecule playbook tests.
set -e

# Make sure pip3 is available.
sudo apt-get update
sudo apt-get install -y python3-pip python3-setuptools
pip3 install --upgrade setuptools pip

# Install dependencies.
sudo pip3 install ansible molecule ansible-test yamllint docker

# Run tests.
cd molecule
molecule test
