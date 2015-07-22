# GlusterFS Distributed Filesystem Configuration

TODO.

## Building the VMs

  1. Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
  2. Download and install [Vagrant](http://www.vagrantup.com/downloads.html).
  3. [Mac/Linux only] Install [Ansible](http://docs.ansible.com/intro_installation.html).
  4. Run `ansible-galaxy install -r requirements.txt` in this directory to get the required Ansible roles.
  5. Run `vagrant up` to build the VMs and configure the infrastructure.

When Vagrant is finished provisioning the VMs with Ansible, TODO.

## About the Author

This project was created by [Jeff Geerling](http://jeffgeerling.com/) as an example for [Ansible for DevOps](https://leanpub.com/ansible-for-devops).
