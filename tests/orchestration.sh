#!/bin/bash
#
# Orchestration tests.
set -e

# Install dependencies.
pip3 install ansible

cd orchestration/scripts

# Test Django app installation.
docker run -d --name app -p 80:80 --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro geerlingguy/docker-rockylinux8-ansible
./app.sh

# Test Django db installation.
docker run -d --name db -p 3360:3360 --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro geerlingguy/docker-rockylinux8-ansible
./db.sh

# Other tests from the book.
./multi.sh
