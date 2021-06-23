# Simple Ansible Infrastructure Orchestration Example

Ansible playbooks are flexible and powerful. But sometimes, you just need to run a single command on a set of hosts. That's where the simple `ansible` command comes in handy.

Just like the device in Ender's Game, the `ansible` command allows you to run commands or call Ansible modules immediately on one or one hundred of servers.

This project configures three Virtual Machines using Vagrant and VirtualBox: `app1`, `app2`, and `db`, to emulate a small-scale real-world infrastructure (two application servers and a database server), so you can practice running `ansible` commands across them, and work on a flexible Ansible inventory.

## Quick Start Guide

### 1 - Install dependencies (VirtualBox, Vagrant, Ansible)

  1. Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
  2. Download and install [Vagrant](http://www.vagrantup.com/downloads.html).
  3. [Mac/Linux only] Install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

Note for Windows users: *This guide assumes you're on a Mac or Linux host. Windows hosts are unsupported at this time.*

### 2 - Build the Virtual Machine

  1. Download this project and put it wherever you want.
  2. Open Terminal, cd to this directory (containing the `Vagrantfile` and this README file).
  3. Type in `vagrant up`, and let Vagrant do its magic.

Note: *If there are any errors during the course of running `vagrant up`, and it drops you back to your command prompt, just run `vagrant provision` to continue building the VM from where you left off. If there are still errors after doing this a few times, post an issue to this project's issue queue on GitHub with the error.*

### 3 - Create an Inventory file, and run `ansible` commands

Read through the third chapter of [Ansible for DevOps](https://www.ansiblefordevops.com/) for details.

## About the Author

This project was created by [Jeff Geerling](https://www.jeffgeerling.com/) as an example for [Ansible for DevOps](https://www.ansiblefordevops.com/).
