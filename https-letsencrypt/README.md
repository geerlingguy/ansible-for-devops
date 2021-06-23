# HTTPS Let's Encrypt Demo

This demonstrates generating valid TLS certificates using Let's Encrypt and Certbot on a public web server.

## Quick Start Guide

### 1 - Install dependencies

  1. Install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).
  2. Install role dependencies: `ansible-galaxy install -r requirements.yml`

### 2 - Create a publicly-accessible VM/VPS

  1. Create a publicly-accessible VM running Ubuntu 20.04 (on your favorite cloud provider, like AWS, DigitalOcean, etc.).
  2. Point a valid domain name at this server's IP address (e.g. using Route53 or your DNS provider).
  3. Make sure your SSH key is added to your user account, and your account has `sudo` access.
  4. Make sure you can SSH into the server using `ssh myuser@subdomain.example.com` (where `subdomain.example.com` is the domain name you have pointed at the server's IP address).

### 3 - Configure the inventory

Copy the `inventory.example` to `inventory`, and change:

  1. The server name under the `[letsencrypt]` group to the domain name pointed at your new server.
  2. The value for `letsencrypt_email` to an email address you control.

### 4 - Run the playbook

Run the Ansible playbook to automatically generate a Let's Encrypt certificate and use it in an example Nginx configuration:

    ansible-playbook -i inventory main.yml

### 5 - Verify the certificate works

After the playbook completes, visit your site at the https URL and verify it works with a valid certificate: `https://domain.example.com/`

Or use openssl on the command line to verify the certificate details:

    openssl s_client -showcerts -connect domain.example.com:443

## About the Author

This project was created by [Jeff Geerling](https://www.jeffgeerling.com/) as an example for [Ansible for DevOps](https://www.ansiblefordevops.com/).
