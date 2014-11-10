# Web Architecture Example - Ansible

This is a simple example of a complete web architecture configuration using Ansible to configure a set of VMs either on local infrastructure using VirtualBox and Vagrant (using the included Vagrantfile), or on a cloud hosting provider.

The architecture for the example web application will be:

                        -------------------------
                       |  varnish.dev (Varnish)  |
                       |  192.168.2.2            |
                        -------------------------
                          /                   \
           ---------------------          ---------------------
          |  www1.dev (Apache)  |        |  www1.dev (Apache)  |
          |  192.168.2.3        |        |  192.168.2.4        |
           ---------------------          ---------------------
                          \                   /
                      -----------------------------
                     |  memcached.dev (Memcached)  |
                     |  192.168.2.7                |
                      -----------------------------
                          /                   \
      ----------------------------       ----------------------------
     |  db1.dev (MySQL - Master)  |     |  db2.dev (MySQL - Slave)   |
     |  192.168.2.5               |     |  192.168.2.6               |
      ----------------------------       ----------------------------

This architecture offers multiple levels of caching and high availability/redundancy on almost all levels, though to keep it simple, there are a few 'single points of failure'. All persistent data stored in the database is stored in a slave server, and one of the slowest and most constrained parts of the stack (the web servers, in this case running a PHP application through Apache) is easy to scale horizontally, behind Varnish, which is acting as a caching (reverse proxy) layer as well as a load balancer.

## Build and configure the servers (Local)

To build the VMs and configure them using Ansible, follow these steps (both from within this directory):

  1. Run `vagrant up`.
  2. Run `ansible-playbook configure.yml -i inventories/vagrant/`.

This guide assumes you already have Vagrant, VirtualBox, and Ansible installed locally.

After everything is booted and configured, visit http://varnish.dev/ (if you configured the domain in your hosts file) in a browser, and refresh a few times to see that Varnish, Apache, PHP, Memcached, and MySQL are all working properly!

## Build and configure the servers (DigitalOcean)

Pre-suppositions: You have a DigitalOcean account, and you grabbed your v1 API Client ID and API Key from the account.

To build the droplets and configure them using Ansible, follow these steps (both from within this directory):

  1. Set your DigitalOcean v1 Client ID: `export DO_CLIENT_ID=[client ID here]`
  2. Set your DigitalOcean v1 API Key: `export DO_API_KEY=[api key here]`
  3. Run `ansible-playbook provision.yml`.

After everything is booted and configured, visit the IP address of the Varnish server that was created in your DigitalOcean account in a browser, and refresh a few times to see that Varnish, Apache, PHP, Memcached, and MySQL are all working properly!

### Notes

  - Public IP addresses are used for all cross-droplet communication (e.g. PHP to MySQL/Memcached communication, MySQL master/slave replication). For better security and potentially a tiny performance improvement, you can use droplets' `private_ip_address` for cross-droplet communication.
  - Hosting active or inactive droplets on DigitalOcean will incur hosting fees (normally $0.01 USD/hour for the default 512mb droplets used in this example). While the charges will be nominal (likely less than $1 USD for many hours of testing), it's important to destroy droplets you aren't actively using!
