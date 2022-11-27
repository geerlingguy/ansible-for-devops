# Web Architecture Example - Ansible

This is a simple example of a complete web architecture configuration using Ansible to configure a set of VMs either on local infrastructure using VirtualBox and Vagrant (using the included Vagrantfile), or on a cloud hosting provider (in this case, DigitalOcean).

The architecture for the example web application will be:

                       --------------------------
                      |  varnish.test (Varnish)  |
                      |  192.168.56.2            |
                       --------------------------
                          /                   \
         ----------------------          ----------------------
        |  www1.test (Apache)  |        |  www2.test (Apache)  |
        |  192.168.56.3        |        |  192.168.56.4        |
         ----------------------          ----------------------
                          \                   /
                      ------------------------------
                     |  memcached.test (Memcached)  |
                     |  192.168.56.7                |
                      ------------------------------
                          /                   \
     -----------------------------       ----------------------------
    |  db1.test (MySQL - Master)  |     |  db2.test (MySQL - Slave)  |
    |  192.168.56.5               |     |  192.168.56.6              |
     -----------------------------       ----------------------------

*IP addresses and hostnames in this diagram are modeled after local VirtualBox/Vagrant-based VMs.*

This architecture offers multiple levels of caching and high availability/redundancy on almost all levels, though to keep it simple, there are single points of failure. All persistent data stored in the database is stored in a slave server, and one of the slowest and most constrained parts of the stack (the web servers, in this case running a PHP application through Apache) is easy to scale horizontally, behind Varnish, which is acting as a caching (reverse proxy) layer and load balancer.

For the purpose of demonstration, Varnish's caching is completely disabled, so you can refresh and see both Apache servers (with caching enabled, Varnish would cache the first response then keep serving it without hitting the rest of the stack). You can see the caching and load balancing configuration in `playbooks/varnish/templates/default.vcl`).

## Prerequisites

Before you can run any of these playbooks, you will need to [install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html), and run the following command to download dependencies (from within the same directory as this README file):

    $ ansible-galaxy install -r requirements.yml

If you would like to build the infrastructure locally, you will also need to install the latest versions of [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html).

## Build and configure the servers (Local)

To build the VMs and configure them using Ansible, follow these steps (both from within this directory):

  1. Run `vagrant up`.
  2. Run `ansible-playbook configure.yml -i inventories/vagrant/`.

This guide assumes you already have Vagrant, VirtualBox, and Ansible installed locally.

After everything is booted and configured, visit http://varnish.test/ (if you configured the domain in your hosts file with the line `192.168.56.2  varnish.test`) in a browser, and refresh a few times to see that Varnish, Apache, PHP, Memcached, and MySQL are all working properly!

## Build and configure the servers (DigitalOcean)

Pre-suppositions: You have a DigitalOcean account, and you have a Personal Access Token for your account. Additionally, you have `dopy` and Ansible installed on your workstation (install `dopy` with `sudo pip install dopy`).

To build the droplets and configure them using Ansible, follow these steps (both from within this directory):

  1. Set your DigitalOcean Personal Access Token: `export DO_API_TOKEN=[token here]`
  2. Run `ansible-playbook provision.yml`.

After everything is booted and configured, visit the IP address of the Varnish server that was created in your DigitalOcean account in a browser, and refresh a few times to see that Varnish, Apache, PHP, Memcached, and MySQL are all working properly!

### Notes

  - Public IP addresses are used for all cross-droplet communication (e.g. PHP to MySQL/Memcached communication, MySQL master/slave replication). For better security and potentially a tiny performance improvement, you can use droplets' `private_ip_address` for cross-droplet communication.
  - Hosting active or inactive droplets on DigitalOcean will incur hosting fees (normally $0.01 USD/hour for the default 512mb droplets used in this example). While the charges will be nominal (likely less than $1 USD for many hours of testing), it's important to destroy droplets you aren't actively using!
  - You can use the included `digital_ocean.py` inventory script for dynamic inventory (`python digital_ocean.py --pretty` to test).

## Build and configure the servers (AWS)

Pre-suppositions: You have an Amazon Web Services account with a valid payment method configured, and you have your AWS Access Key and AWS Secret Key from your account. Additionally, you have `boto` and Ansible installed on your workstation (install `boto` with `pip install boto`).

To build the droplets and configure them using Ansible, follow these steps (both from within this directory):

  1. Set your AWS Access Key: `export AWS_ACCESS_KEY_ID=[access key here]`
  2. Set your AWS Secret Key: `export AWS_SECRET_ACCESS_KEY=[secret key here]`
  3. Run `ansible-playbook provision.yml`.

After everything is booted and configured, visit the IP address of the Varnish server that was created in your AWS account in a browser, and refresh a few times to see that Varnish, Apache, PHP, Memcached, and MySQL are all working properly!

### Notes

  - Public IP addresses are used for all cross-instance communication (e.g. PHP to MySQL/Memcached communication, MySQL master/slave replication). For better security and potentially a tiny performance improvement, you can use instances' `private_ip` for cross-instance communication.
  - Hosting instances on AWS may incur hosting fees (unless all usage falls within AWS's first-year free tier limits). While the charges will be nominal (likely less than $1 USD for many hours of testing), it's important to destroy instances you aren't actively using!
  - You can use the included `aws_ec2.yml` inventory plugin configuration for dynamic inventory (`ansible-inventory -i inventories/aws/aws_ec2.yml --graph` to test).

## About the Author

This project was created by [Jeff Geerling](https://www.jeffgeerling.com/) as an example for [Ansible for DevOps](https://www.ansiblefordevops.com/).
