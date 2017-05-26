# DigitalOcean Example for Ansible

Chapter 7 of [Ansible for DevOps](https://www.ansiblefordevops.com/) contains details and examples for using Ansible to provision and dynamically work with DigitalOcean droplets.

## Dynamic Inventory and Provisioning

Examples using Ansible's DigitalOcean integration are contained within this directory.

  - `provision.yml` contains an example of provisioning a new DigitalOcean droplet, then immediately configuring it with Ansible.
  - `digital_ocean.py` is the DigitalOcean dynamic inventory script included with Ansible. Don't use this copy; get a fresh, up-to-date copy from the Ansible project instead.

Before you can use either of these examples, you will need to set an environment variable with your DigitalOcean API Personal Access Token:

    export DO_API_TOKEN=YOUR_API_TOKEN_HERE

## Author Information

These examples were created in 2015 by [Jeff Geerling](https://www.jeffgeerling.com/), author of [Ansible for DevOps](https://www.ansiblefordevops.com/).
