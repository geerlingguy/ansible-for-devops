# Deployment Demo - Deploying with a Load Balancer

This project builds a simple application architecture with a load balancer which distributes requests between two application servers. The load balancer is running HAProxy, and HAProxy is configured to proxy traffic served from two Apache servers. A deployment playbook is also included, to illustrate zero-downtime deployments with application servers behind HAProxy.

The infrastructure is fairly simple, with the following structure:

                     ------------------------
                    | HAProxy (192.168.56.2) |
                     ------------------------
                               |
                _______________________________
               |                               |
     -----------------------         -----------------------
    | Apache (192.168.56.3) |       | Apache (192.168.56.4) |
     -----------------------         -----------------------

## Building the VMs

  1. Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
  2. Download and install [Vagrant](http://www.vagrantup.com/downloads.html).
  3. [Mac/Linux only] Install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).
  4. Run `ansible-galaxy install -r requirements.yml` in this directory to get the required Ansible roles.
  5. Run `vagrant up` to build the VMs and configure the infrastructure.

When Vagrant is finished provisioning the VMs with Ansible, you should be able to visit `http://192.168.56.2/`, and you'll see the default Ubuntu Apache 2 'installation complete' page (loaded from one of the two backend web servers through HAProxy).

## Performing a zero-downtime deployment

An example deployment playbook is included at `playbooks/deploy.yml`. You can run this playbook with the following command:

    $ ansible-playbook -i inventory playbooks/deploy.yml

The deployment playbook will run serially over all the webservers, and for each one, take it out of the load balancer, run the deployment (in this case, it just prints a debug message), and put it back in the load balancer once port 80 is available on the webserver.

## About the Author

This project was created by [Jeff Geerling](https://www.jeffgeerling.com/) as an example for [Ansible for DevOps](https://www.ansiblefordevops.com/).
