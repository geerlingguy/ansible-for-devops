# GlusterFS Distributed Filesystem Configuration

This project creates a distributed filesystem on two servers using [GlusterFS](http://www.gluster.org/).

## Building the VMs

  1. Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
  2. Download and install [Vagrant](http://www.vagrantup.com/downloads.html).
  3. [Mac/Linux only] Install [Ansible](http://docs.ansible.com/ansible/latest/intro_installation.html).
  4. Run `ansible-galaxy install -r requirements.yml` in this directory to get the required Ansible roles.
  5. Run `vagrant up` to build the VMs and configure the infrastructure.

When Vagrant is finished provisioning the VMs with Ansible, run the following two commands to confirm that Gluster is operating nominally:

```
# Get status for the Gluster cluster.
$ ansible gluster -i inventory -a "gluster peer status" -b

# Get volume info for the Gluster cluster.
ansible gluster -i inventory -a "gluster volume info" -b
```

You can also do the following to confirm that files are being replicated/distributed correctly:

  1. Log into the first server: `vagrant ssh gluster1`
  2. Create a file in the mounted gluster volume: `sudo touch /mnt/gluster/test`
  3. Log out of the first server: `exit`
  4. Log into the second server: `vagrant ssh gluster2`
  5. List the contents of the gluster directory: `ls /mnt/gluster`

You should see the `test` file you created in step 2; this means Gluster is working correctly!

## About the Author

This project was created by [Jeff Geerling](https://www.jeffgeerling.com/) as an example for [Ansible for DevOps](https://www.ansiblefordevops.com/).
