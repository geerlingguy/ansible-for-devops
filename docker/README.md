# Simple Docker Example - Ansible

This is an extremely simple Docker example to help introduce you to managing Docker containers via Ansible. The example is explained in more detail in Chapter 8 of [Ansible for DevOps](https://www.ansiblefordevops.com/).

To run the example, make sure you have Docker installed on the workstation or VM where this playbook is located, then enter the command:

    $ ansible-playbook main.yml

After a minute or so, Ansible will have built and run a `test` container, built from the included Dockerfile.

For a more complete example of using Ansible to build and manage Docker containers, see the [Ansible Vagrant Examples - Docker Flask app example](https://github.com/geerlingguy/ansible-for-devops/tree/master/docker-flask).

## About the Author

This project was created by [Jeff Geerling](https://www.jeffgeerling.com/) as an example for [Ansible for DevOps](https://www.ansiblefordevops.com/).
