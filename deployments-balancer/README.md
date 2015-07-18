# Deployment Demo - Deploying with a Load Balancer

This project builds a simple application architecture with a load balancer which distributes requests between two application servers. The load balancer is running HAProxy, and HAProxy is configured to proxy traffic served from two Apache servers.

TODO - Include a playbook that performs a deployment that swaps in/out app servers from haproxy during the deployment.

## Building the VM

  1. Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
  2. Download and install [Vagrant](http://www.vagrantup.com/downloads.html).
  3. [Mac/Linux only] Install [Ansible](http://docs.ansible.com/intro_installation.html).
  4. Run `ansible-galaxy install -r requirements.txt` in this directory to get the required Ansible roles.
  5. Run `vagrant up` to build the VMs and configure the infrastructure.

## About the Author

This project was created by [Jeff Geerling](http://jeffgeerling.com/) as an example for [Ansible for DevOps](https://leanpub.com/ansible-for-devops).
