# christopheradams-playbook

Manages personal infrastructure.

## Requirements

1. Install [Ansible]
2. Install the Linode API Python library:

    ```sh
    pip install linode_api4
    ```

3. Create a [Linode API token]

4. Set environment variables:

   ```sh
    export LINODE_ACCESS_TOKEN='mytoken'
    export ROOT_PASSWORD='mypassword123'
    export SSH_PUBKEY='/path/to/my_rsa.pub'
    ```

## Instructions

### Create webserver

Create the webserver:

    ansible-playbook webserver_create.yml

### Inventory webserver

Check the Linode inventory, and note the IP address:

    ansible-inventory -i linode.yml --graph --vars

Add the IP address to your `/etc/hosts` file:

    127.0.0.1       localhost
    192.0.2.0 christopherad-web

Ping the server:

    ansible -m ping christopherad_group -i linode.yml -u root

### Install webserver

    ansible-playbook -vv -i linode.yml webserver_install.yml -u root

### Maintain webserver

Add an authorized SSH key:

    ansible-playbook -vv -i linode.yml webserver_authorize.yml -u root -e public_key=/path/to/id_rsa.pub

Upgrade (reboots automatically):

    ansible-playbook -vv -i linode.yml webserver_upgrade.yml -u root

Reboot:

    ansible-playbook -vv -i linode.yml webserver_reboot.yml -u root

### Build website

    ansible-playbook -vv -i linode.yml webserver_build.yml -u root

### Enable website

    ansible-playbook -vv -i linode.yml webserver_enable.yml -u root

[Ansible]: https://www.linode.com/docs/applications/configuration-management/getting-started-with-ansible/#install-ansible
[Linode API token]: https://www.linode.com/docs/platform/api/getting-started-with-the-linode-api/#get-an-access-token

