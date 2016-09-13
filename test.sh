#!/bin/bash

tags=$1
inventory=".vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory"
if [ "$tags" == "" ]; then
    echo "No tags specified"
    ansible-playbook --private-key=~/.vagrant.d/insecure_private_key -u vagrant -i $inventory jenkins-playbook.yml
else
    echo "Filtering to tags: $tags"
    ansible-playbook --private-key=~/.vagrant.d/insecure_private_key --tags $tags -u vagrant -i $inventory jenkins-playbook.yml
fi
