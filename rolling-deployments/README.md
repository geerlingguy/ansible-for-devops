# Node.js API App Demo

This project builds a [Node.js](https://nodejs.org/)-based API app inside a VM. It is meant as a demonstration of application deployments (in this case, a Node.js-based app) using Ansible.

## Building the VM

  1. Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
  2. Download and install [Vagrant](http://www.vagrantup.com/downloads.html).
  3. [Mac/Linux only] Install [Ansible](http://docs.ansible.com/intro_installation.html).
  4. Run `ansible-galaxy install -r requirements.txt` in this directory to get the required Ansible roles.
  5. Run `vagrant up` to build the VM and deploy the version of the app specified in `playbooks/vars.yml`.

Once the VM is built, you can test the API by running the following command (copy and paste verbatim, without the leading `$`), which requests the `/hello/:name` endpoint on each server:

    $ for i in {2..5}; \
        do curl -w "\n" "http://192.168.3.$i:8080/hello/john"; \
      done

If the above command outputs `"hello john"` on four lines, everything worked correctly!

## Deploying application updates

The first 'production' release of this demo app is version `1.0.0`, which contains one simple endpoint for `/hello/:name` and an integration test to make sure it's working correctly. Subsequent releases can be deployed by incrementing the `app_version` in `playbooks/vars.yml`, then running the Ansible provisioner again with `vagrant provision`.

Some notable releases you could test:

  - `1.0.0`: The first stable release, but only one boring `/hello/:name` endpoint.
  - `1.0.1`: New `/ping/:server` endpoint, but one test is broken.
  - `1.0.2`: Tests are fixed, and `/ping/:server` endpoint responds correctly.

## About the Author

[Jeff Geerling](http://jeffgeerling.com/), owner of [Midwestern Mac, LLC](http://www.midwesternmac.com/), created this project in 2015 so he could accelerate his Node.js deployment workflow. This project, and others like it, are also featured as examples in Jeff's book, [Ansible for DevOps](https://leanpub.com/ansible-for-devops).
