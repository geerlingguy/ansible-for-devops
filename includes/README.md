# Playbook includes example - Drupal LAMP server

This example playbook takes the `drupal` playbook example (included in the same ansible-for-devops repository) and cleans it up using Ansible `includes`.

After running `vagrant up`, you can access the installed Drupal site following these instructions:

  1. [Edit your hosts file](http://docs.rackspace.com/support/how-to/modify-your-hosts-file/), adding the line `192.168.56.89  drupal.test` so you can connect to the VM.
  2. Open your browser and access [http://drupal.test/](http://drupal.test/).

## About the Author

This project was created by [Jeff Geerling](https://www.jeffgeerling.com/) as an example for [Ansible for DevOps](https://www.ansiblefordevops.com/).
