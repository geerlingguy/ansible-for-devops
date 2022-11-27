# Node.js Role Example

This example is an extension of the [Node.js example](../nodejs/README.md). Please read through the directions in that example's README to get this example running locally through Vagrant.

The primary difference in this example (as explained in [Ansible for DevOps](https://www.ansiblefordevops.com/)) is that the actual _installation of Node.js_ is done in a new `nodejs` role.

After running `vagrant up`, perform the following steps to access the app via a hostname:

  1. [Edit your hosts file](http://docs.rackspace.com/support/how-to/modify-your-hosts-file/), adding the line `192.168.56.56  nodejs-role.test` so you can connect to the VM.
  2. Open your browser and access [http://nodejs-role.test/](http://nodejs-role.test/).

## About the Author

This project was created by [Jeff Geerling](https://www.jeffgeerling.com/) as an example for [Ansible for DevOps](https://www.ansiblefordevops.com/).
