# DigitalOcean Example for Ansible

[Ansible for DevOps](https://www.ansiblefordevops.com/) contains details and examples for using Ansible to provision and dynamically work with DigitalOcean droplets.

## Dynamic Inventory and Provisioning

Examples using Ansible's DigitalOcean integration are contained within this directory.

  - `provision.yml` contains an example of provisioning a new DigitalOcean droplet, then immediately configuring it with Ansible.
  - `digital_ocean.py` (and `digital_ocean.ini`) is the DigitalOcean dynamic inventory script included with Ansible. Don't use this copy; get the latest version from the Ansible project: [digital_ocean.py](https://github.com/ansible-collections/community.digitalocean/blob/main/scripts/inventory/digital_ocean.py).

Before you can use either of these examples, you will need to set an environment variable with your DigitalOcean API Personal Access Token:

    export DO_API_TOKEN=YOUR_API_TOKEN_HERE

## Author Information

These examples were created by [Jeff Geerling](https://www.jeffgeerling.com/) as an example in [Ansible for DevOps](https://www.ansiblefordevops.com/).
