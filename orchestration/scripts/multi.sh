#!/bin/bash
#
# Multi-server tests for the orchestration example.
set -e

# Other commands from the book.
ansible multi -b -m dnf -a "name=chrony state=present"
ansible multi -m stat -a "path=/etc/environment"
ansible multi -m copy -a "src=/etc/hosts dest=/tmp/hosts"
ansible multi -b -m fetch -a "src=/etc/hosts dest=/tmp"
ansible multi -m file -a "dest=/tmp/test mode=644 state=directory"
ansible multi -m file -a "dest=/tmp/test state=absent"
ansible multi -b -B 3600 -P 0 -a "dnf -y update"
