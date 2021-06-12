# Molecule Example for Ansible

This directory contains an example Molecule configuration for an Ansible playbook that allows easy development and testing of the playbook.

The Molecule configuration can be run locally or in a Continuous Integration (CI) environment, to ensure the playbook is always working correctly.

To run the Molecule environment, you must have `molecule` (with it's `docker` driver) and the `docker` Python library installed:

    pip3 install molecule[docker] docker

Additionally, there are lint tools configured to ensure code formatting is correct, so you need to make sure the lint tools are installed:

    pip3 install yamllint ansible-lint

Once everything is ready, run:

    molecule test

Or, if you just want to build an environment, have the playbook run inside it, then be able to log in and observe the environment, run:

    molecule converge

And then, to log into the environment:

    molecule login

## About the Author

This project was created by [Jeff Geerling](https://www.jeffgeerling.com/) as an example for [Ansible for DevOps](https://www.ansiblefordevops.com/).
