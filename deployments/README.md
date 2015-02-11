# Ruby on Rails App Deployment Demo

This project builds a [Ruby on Rails](http://rubyonrails.org/)-based app inside a VM, using [Passenger](https://www.phusionpassenger.com/) and [Nginx](http://nginx.org/) to run the app. It is meant as a demonstration of web application deployments (in this case, a Rails-based app) using Ansible.

## Building the VM

  1. Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
  2. Download and install [Vagrant](http://www.vagrantup.com/downloads.html).
  3. [Mac/Linux only] Install [Ansible](http://docs.ansible.com/intro_installation.html).
  4. Run `ansible-galaxy install -r requirements.txt` in this directory to get the required Ansible roles.
  5. Run `vagrant up` to build the VM and deploy the version of the app specified in `playbooks/vars.yml`.

Once the VM is built, you can visit `http://192.168.33.7/` (or whatever domain name you point to that IP address in your local hosts file) to view the demo app.

## Deploying application updates

The first 'production' release of this demo app is version `1.1.4`, which includes a basic interface for viewing and managing Articles. Subsequent releases can be deployed by incrementing the `app_version` in `playbooks/vars.yml`, then running the Ansible provisioner again with `vagrant provision`.

Some notable releases you could test:

  - `1.1.4`: The first production release. Basic interface for performing CRUD operations on Articles.
  - `1.2.0`: Major changes to the structure of the app, like the home page and general layout.
  - `1.2.1`: The page title has been updated. (Sometimes it's the little things :).

## About the Author

[Jeff Geerling](http://jeffgeerling.com/), owner of [Midwestern Mac, LLC](http://www.midwesternmac.com/), created this project in 2015 so he could accelerate his Ruby on Rails deployment workflow. This project, and others like it, are also featured as examples in Jeff's book, [Ansible for DevOps](https://leanpub.com/ansible-for-devops).
