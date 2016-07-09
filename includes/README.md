# Playbook includes example - Drupal LAMP server

This example playbook takes the `drupal` playbook example (included in the same ansible-for-devops repository) and cleans it up using Ansible `includes`.

After running `vagrant up`, you can access the installed Drupal site following these instructions:

  1. [Edit your hosts file](http://www.rackspace.com/knowledge_center/article/how-do-i-modify-my-hosts-file), adding the line `192.168.88.8  drupaltest.dev` so you can connect to the VM.
  2. Open your browser and access [http://drupaltest.dev/](http://drupaltest.dev/).

## About the Author

This project was created by [Jeff Geerling](http://www.jeffgeerling.com/) as an example for [Ansible for DevOps](http://www.ansiblefordevops.com/).
