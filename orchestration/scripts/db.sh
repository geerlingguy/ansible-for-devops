#!/bin/bash
#
# Database server orchestration ad-hoc tasks.
set -e

# Configure MySQL (MariaDB) server.
ansible db -b -m yum -a "name=mariadb-server state=present"
ansible db -b -m service -a "name=mariadb state=started enabled=yes"
ansible db -b -a "iptables -F"
ansible db -b -a "iptables -A INPUT -s 192.168.60.0/24 -p tcp -m tcp --dport 3306 -j ACCEPT"

# Configure DB user for Django.
ansible db -b -m yum -a "name=MySQL-python state=present"
ansible db -b -m mysql_user -a "name=django host=% password=12345 priv=*.*:ALL state=present"
