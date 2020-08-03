#!/bin/bash
#
# App server orchestration ad-hoc tasks.
set -e

# Configure Django on app server.
ansible app -b -m yum -a "name=MySQL-python state=present"
ansible app -b -m yum -a "name=python-setuptools state=present"
ansible app -b -m easy_install -a "name=django<2 state=present"

# Check Django version.
ansible app -a "python -c 'import django; print django.get_version()'"

# Other commands from the book.
ansible app -b -a "service ntpd status"
ansible app -b -m group -a "name=admin state=present"
ansible app -b -m user -a "name=johndoe group=admin createhome=yes"
ansible app -b -m user -a "name=johndoe state=absent remove=yes"
ansible app -b -m package -a "name=git state=present"
