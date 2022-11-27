# Ansible Custom Dynamic Inventory Example

This folder contains custom dynamic inventory scripts for use with Ansible.

Each of the scripts has comments for all the different parts of the code which generate and return the inventory in the proper JSON format expected by Ansible.

## Testing these scripts

A Vagrantfile is provided, so you can build a couple local VMs to test with the inventory scripts. Make sure you have Vagrant and VirtualBox installed, and run `vagrant up` inside this folder to build the two VMs, with the IP addresses `192.168.56.71` and `192.168.56.72`.

Then run the following command to test the inventory file with Ansible:

    # For the PHP script.
    $ ansible all -i inventory.php -m ping
    $ ansible all -i inventory.php -m debug -a "var=host_specific_var"
    
    # For the Python script.
    $ ansible all -i inventory.py -m ping
    $ ansible all -i inventory.py -m debug -a "var=host_specific_var"
