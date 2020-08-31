#!/bin/bash
#
# Molecule playbook tests.
set -e

# Make sure pip3 is available.
sudo apt-get update
sudo apt-get install -y python3-pip python3-setuptools

# Upgrade Docker to work with docker-py.
curl https://gist.githubusercontent.com/geerlingguy/ce883ad4aec6a5f1187ef93bd338511e/raw/36612d28981d92863f839c5aefe5b7dd7193d6c6/travis-ci-docker-upgrade.sh | sudo bash

# Install dependencies.
pip3 install wheel ansible molecule ansible-lint yamllint docker

cd molecule

# Run default test (CentOS).
molecule test

# Run tests on Debian.
MOLECULE_DISTRO=debian10 molecule test
