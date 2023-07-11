#!/bin/bash

# Check if server.ini is there
# If not, remove ip from known_hosts

read -p "Enter Server IP: " server_ip

echo -e "[server] \n$server_ip ansible_ssh_user=root" > server.ini

ansible-playbook -i server.ini setup-server.yml --ask-pass -K

# test if connection has worked
ssh niklas@$server_ip