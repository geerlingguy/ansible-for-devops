#!/bin/bash
#
# Molecule playbook tests.
set -e

# Install dependencies.
pip install ansible molecule ansible-test yamllint docker

# Run tests.
cd ../molecule
molecule test
