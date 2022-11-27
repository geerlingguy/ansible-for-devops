# Ansible Vagrant profile for ELK (Elasticsearch, Logstash, Kibana)

This project builds a two-server ELK stack using Elasticsearch, Logstash, Kibana, and Filebeat to ship, store, and expose logs.

The first server (`logs`) has the entire ELK stack running, and pushes local auth.log entries into Elasticsearch via Filebeat and Logstash. The second server (`web`) runs an Nginx webserver and pushes the webserver access.log file and the server's auth.log entries into Elasticsearch via the `logs` server's Logstash instance.

Logs are transmitted securely using a self-signed certificate (see the `elk-example` certificate).

## Building the VMs

  1. Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
  2. Download and install [Vagrant](http://www.vagrantup.com/downloads.html).
  3. [Mac/Linux only] Install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).
  4. Run `ansible-galaxy install -r requirements.yml` in this directory to get the required Ansible roles.
  5. Run `vagrant up` to build the VMs.

Once the VMs are up and running (after `vagrant up` is complete and you're back at the command prompt), you can log into either one via SSH if you'd like by typing in `vagrant ssh [name]` (either `logs` for the ELK server, or `web` for the Nginx web server). Otherwise, the next steps are below.

### Setting up your hosts file

You need to modify your host machine's hosts file (Mac/Linux: `/etc/hosts`; Windows: `%systemroot%\system32\drivers\etc\hosts`), adding the lines below:

    192.168.56.90  logs.test
    192.168.56.91  web.test

(Where `logs.test`/`web.test` is the hostname you have configured in the `Vagrantfile`).

After that is configured, you could visit http://logs.test/ in a browser, and you'll see the Kibana dashboard, and you can visit http://web.test/, and you'll see Nginx's default index page.

If you'd like additional assistance editing your hosts file, please read [How do I modify my hosts file?](http://docs.rackspace.com/support/how-to/modify-your-hosts-file/) from Rackspace.

## Author Information

Created in 2014 by [Jeff Geerling](https://www.jeffgeerling.com/), author of [Ansible for DevOps](https://www.ansiblefordevops.com/).
