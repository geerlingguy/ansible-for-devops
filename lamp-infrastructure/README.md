# Web Architecture Example - Ansible

This is a simple example of a complete web architecture configuration using Ansible to configure a set of VirtualBox VMs that are created using the configuration inside the included Vagrantfile.

The architecture for this simple web application will be:

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
               |  192.168.2.6                |
                -----------------------------
                               |
                      ------------------
                     |  db.dev (MySQL)  |
                     |  192.168.2.5     |
                      ------------------

## Build and configure the servers

To build the VMs and configure them using Ansible, follow these steps (both from within this directory):

  1. Run `vagrant up`.
  2. Run `ansible-playbook main.yml -i inventory`.

This guide assumes you already have Vagrant, VirtualBox, and Ansible installed locally.

After everything is booted and configured, visit http://varnish.dev/ (if you configured the domain in your hosts file) in a browser, and refresh to see the effect.
