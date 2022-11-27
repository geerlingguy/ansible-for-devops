# Node.js API App Demo

This project builds a [Node.js](https://nodejs.org/)-based API app inside a VM. It is meant as a demonstration of application deployments (in this case, a Node.js-based app) using Ansible.

## Building the VM

  1. Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
  2. Download and install [Vagrant](http://www.vagrantup.com/downloads.html).
  3. [Mac/Linux only] Install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).
  4. Run `ansible-galaxy install -r requirements.yml` in this directory to get the required Ansible roles.
  5. Run `vagrant up` to build the VM and deploy the version of the app specified in `playbooks/vars.yml`.

Once the VM is built, you can test the API by running the following command (copy and paste verbatim, without the leading `$`), which requests the `/hello/:name` endpoint on each server:

    $ for i in {2..5}; \
        do curl -w "\n" "http://192.168.56.$i:8080/hello/john"; \
      done

If the above command outputs `"hello john"` on four lines, everything worked correctly!

## Deploying application updates

The first 'production' release of this demo app is version `1.0.0`, which contains one simple endpoint for `/hello/:name` and an integration test to make sure it's working correctly. Subsequent releases can be deployed by incrementing the `app_version` in `playbooks/vars.yml`, then running the Ansible provisioner again with `vagrant provision`.

Some notable releases you could test:

  - `2.0.0`: The first stable release, passing all tests.
  - `2.0.1`: A code change was made which broke one of the tests.
  - `2.0.2`: The code was fixed, and all tests pass again.

## About the Author

This project was created by [Jeff Geerling](https://www.jeffgeerling.com/) as an example for [Ansible for DevOps](https://www.ansiblefordevops.com/).
