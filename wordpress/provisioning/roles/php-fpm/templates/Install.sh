#!/bin/bash
##
# install epel-release
sudo yum -y install epel-release yum-utils
# install php7 repo
sudo yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
# enable repo
sudo yum-config-manager --enable remi-php72
# install php dependencies
sudo yum -y install php-cli php-fpm php-mysql php-json php-opcache php-mbstring php-xml php-gd php-curl
# copy paste www.cof
#cp -fv www.conf /etc/php-fpm.d/www.conf

