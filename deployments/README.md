# Ruby on Rails App Deployment Demo

This project builds a [Ruby on Rails](http://rubyonrails.org/)-based app inside a VM, using [Passenger](https://www.phusionpassenger.com/) and [Nginx](http://nginx.org/) to run the app. It is meant as a demonstration of web application deployments (in this case, a Rails-based app) using Ansible.

## Building the VM

  1. Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
  2. Download and install [Vagrant](http://www.vagrantup.com/downloads.html).
  3. [Mac/Linux only] Install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).
  4. Run `ansible-galaxy install -r requirements.yml` in this directory to get the required Ansible roles.
  5. Run `vagrant up` to build the VM and deploy the version of the app specified in `playbooks/vars.yml`.

Once the VM is built, you can visit `http://192.168.56.7/` (or whatever domain name you point to that IP address in your local hosts file) to view the demo app.

## Deploying application updates

The first 'production' release of this demo app is version `2.0.1`, which includes a basic interface for viewing and managing Articles. Subsequent releases can be deployed by incrementing the `app_version` in `playbooks/vars.yml`, then running the Ansible provisioner again with `vagrant provision`.

Some notable releases you could test:

  - `2.0.1`: First stable release with Article CRUD deployable on modern Ruby versions.
  - `2.1.0`: Includes a fancy new header with a linear gradient background. Marketing is happy.

## About the Author

This project was created by [Jeff Geerling](https://www.jeffgeerling.com/) as an example for [Ansible for DevOps](https://www.ansiblefordevops.com/).
