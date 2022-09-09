#!/bin/bash
#
# App server orchestration ad-hoc tasks.
set -e

# Configure Django on app server.
ansible app -b -m dnf -a "name=python3-pip state=present"
ansible app -b -m pip -a "executable=pip3 name=django<4 state=present"

# Check Django version.
ansible app -a "python3 -m django --version"

# Other commands from the book.
# ansible app -b -a "systemctl status chronyd"
ansible app -b -m group -a "name=admin state=present"
ansible app -b -m user -a "name=johndoe group=admin createhome=yes"
ansible app -b -m user -a "name=johndoe state=absent remove=yes"
ansible app -b -m package -a "name=git state=present"
