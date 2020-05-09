#!/bin/bash
#
# Molecule playbook tests.
set -e

# Make sure pip3 is available.
sudo apt-get install -y python3-pip

# Install dependencies.
sudo pip3 install ansible molecule ansible-test yamllint docker

# Run tests.
cd ../molecule
molecule test
