# Ansible Galaxy Role-based Servers

This folder contains two quick demo playbooks which build a LAMP and Apache Solr server, respectively, leaning entirely on Ansible Galaxy roles and their defaults for all functionality.

## Usage

After running `vagrant up`, you can access the installed LAMP site or Solr Admin dashboard following these instructions:

  1. [Edit your hosts file](http://docs.rackspace.com/support/how-to/modify-your-hosts-file/), adding the line `192.168.56.8  galaxy-role-servers.test` so you can connect to the VM.
  2. Open your browser and access the following:
    a. LAMP server: [http://galaxy-role-servers.test/](http://galaxy-role-servers.test/).
    b. Solr Admin dashboard: [http://galaxy-role-servers.test:8983/](http://galaxy-role-servers.test:8983/).

## About the Author

This project was created by [Jeff Geerling](https://www.jeffgeerling.com/) as an example for [Ansible for DevOps](https://www.ansiblefordevops.com/).
