#!/bin/bash
#
# Orchestration tests.
set -e

# Make sure pip3 is available.
sudo apt-get update
sudo apt-get install -y python3-pip python3-setuptools
pip3 install --upgrade setuptools pip

# Install dependencies.
sudo pip3 install ansible

cd orchestration/scripts

# Test Django app installation.
docker run -d --name app -p 80:80 --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro geerlingguy/docker-centos7-ansible
./django-app.sh

# Test Django db installation.
docker run -d --name db -p 3360:3360 --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro geerlingguy/docker-centos7-ansible
./django-db.sh

# Other tests from the book.
./orchestration.sh
