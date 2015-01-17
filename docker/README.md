# Simple Docker Example - Ansible

This is an extremely simple Docker example to help introduce you to managing Docker containers via Ansible. The example is explained in more detail in Chapter 8 of [Ansible for DevOps](http://ansiblefordevops.com/).

To run the example, make sure you have Docker installed on the workstation or VM where this playbook is located, then enter the command:

    $ ansible-playbook main.yml

After a minute or so, Ansible will have built and run a `test` container, built from the included Dockerfile.
