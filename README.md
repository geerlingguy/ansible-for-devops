# Ansible for DevOps Examples

[![CI](https://github.com/geerlingguy/ansible-for-devops/workflows/CI/badge.svg?event=push)](https://github.com/geerlingguy/ansible-for-devops/actions?query=workflow%3ACI) [![Molecule CI](https://github.com/geerlingguy/ansible-for-devops/workflows/Molecule%20CI/badge.svg?event=push)](https://github.com/geerlingguy/ansible-for-devops/actions?query=workflow%3A%22Molecule+CI%22)

This repository contains Ansible examples developed to support different sections of [Ansible for DevOps](https://www.ansiblefordevops.com/), a book on [Ansible](http://www.ansible.com/) by [Jeff Geerling](https://www.jeffgeerling.com/).

Most of the examples are full-fledged VM examples, which use Vagrant, VirtualBox, and Ansible to boot and configure VMs on your local workstation. Not all playbooks follow all of Ansible's best practices, as they illustrate particular Ansible features in an instructive manner.

For more interesting examples of what you can do with Ansible, please see the [Ansible Vagrant Examples](https://github.com/geerlingguy/ansible-vagrant-examples) repository, and browse through some of [geerlingguy's roles on Ansible Galaxy](https://galaxy.ansible.com/geerlingguy/).

## Examples and Chapters in which they're used

Here is an outline of all the examples contained in this repository, by chapter:

### Chapter 1

  - N/A

### Chapter 2

  - [`first-ansible-playbook`](first-ansible-playbook/): A very basic playbook that installs `chronyd` on CentOS and ensures it is running.

### Chapter 3

  - [`orchestration`](orchestration/): A simple multiple-VM Vagrant configuration and Ansible inventory to allow testing of multi-server orchestration with `ansible` ad-hoc commands.

### Chapter 4

  - [`drupal`](drupal/): A single-file playbook which configures the LAMP stack on a Linux host and installs Drupal.
  - [`includes`](includes/): The same playbook as the [`drupal`](drupal/) example, but using `include`s to make the playbook more understandable.
  - [`nodejs`](nodejs/): A single-file playbook which configures a Node.js app to run on a Linux host.
  - [`solr`](solr/): A single-file playbook which installs Apache Solr on a Linux host.

### Chapter 5

  - N/A

### Chapter 6

  - [`nodejs-role`](nodejs-role/): The same playbook as the [`nodejs`](nodejs/) example, but using a role to break out the Node.js aspects into a separate `nodejs` role.
  - [`galaxy-role-servers`](galaxy-role-servers/): A couple very short playbooks that demonstrate how easy it is to get new servers running leveraging the power of community Ansible Galaxy roles.

### Chapter 7

  - [`test-plugin`](test-plugin/): A simple test plugin that verifies a given value is representative of the color blue.
  - [`collection`](collection/): An example local collection to demonstrate the basic structure of content collections.

### Chapter 8

  - [`dynamic-inventory`](dynamic-inventory/): Two example dynamic inventory scripts (one in PHP, one in Python) for use with Ansible.

### Chapter 9

  - [`lamp-infrastructure`](lamp-infrastructure/): A multi-server LAMP-based web application infrastructure focused on high-availability and performance for a LAMP-stack app.
  - [`elk`](elk/): A two-server example of the Elasticsearch-Logstash-Kibana stack, which uses one server to store and visualize logs centrally, and another server to send logs via Filebeat.
  - [`gluster`](gluster/): A two-server example of building a fast networked storage setup using Gluster.

### Chapter 10

  - [`deployments`](deployments/): A playbook that deploys a Ruby on Rails application into an environment that runs Passenger and Nginx to handle web requests.
  - [`deployments-balancer`](deployments-balancer/): A playbook that handles zero-downtime deployments to webservers running behind an HAProxy load balancer.
  - [`deployments-rolling`](deployments-rolling/): A playbook that demonstrates rolling deployments to multiple servers for a Node.js app.

### Chapter 11

  - [`security`](security/): A playbook containing many security automation tasks to demonstrate how Ansible helps automate security hardening.

### Chapter 12

  - [`jenkins`](jenkins/): A playbook that installs and configures Jenkins for CI/CD.

### Chapter 13

  - [`molecule`](molecule/): A Molecule example used for testing and developing an Ansible playbook, or for testing in a Continuous Integration (CI) environment.
  - [`molecule-ci.yml` GitHub Actions workflow](.github/workflows/molecule-ci.yml): A GitHub Actions workflow which runs the `molecule` example in a CI environment.

### Chapter 14

  - [`https-self-signed`](https-self-signed/): A playbook that generates self-signed certificates.
  - [`https-letsencrypt`](https-letsencrypt/): A playbook that demonstrates automated certificate management with Let's Encrypt and Ansible.
  - [`https-nginx-proxy`](https-nginx-proxy/): A playbook that demonstrates proxying HTTPS traffic through Nginx to HTTP backends.

### Chapter 15

  - [`docker`](docker/): Very simple playbook demonstrating Ansible's ability to manage Docker container images.
  - [`docker-hubot`](docker-hubot/): Slightly more involved example of Ansible's ability to manage and run Docker container images.
  - [`docker-flask`](docker-flask/): A sample Flask app built with Ansible playbooks running inside the container.

### Chapter 16

  - [`kubernetes`](kubernetes/): A playbook that builds a three-node Kubernetes cluster.

## License

MIT

## Sponsors

* [TinyPilot](https://tinypilotkvm.com): An open-source, low-cost KVM over IP for managing your servers.

The above sponsor(s) are supporting Jeff Geerling on [GitHub Sponsors](https://github.com/sponsors/geerlingguy). You can sponsor Jeff's work too, to help him continue improving this book and Ansible open source work!

## Buy the Book

[![Ansible for DevOps Cover](https://s3.amazonaws.com/titlepages.leanpub.com/ansible-for-devops/medium)](https://www.ansiblefordevops.com/)

Buy [Ansible for DevOps](https://www.ansiblefordevops.com/) for your e-reader or in paperback format.
