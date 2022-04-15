#!/bin/bash
#
# Molecule playbook tests.
set -e

# Install dependencies.
pip3 install ansible molecule[docker] ansible-lint yamllint docker

cd molecule

# Run default test (Rocky Linux).
molecule test

# Run tests on Debian.
MOLECULE_DISTRO=debian10 molecule test
