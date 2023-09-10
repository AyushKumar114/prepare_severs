#!/bin/bash
VM1_HOST = "VM1_hostname_or_IP"		#Variables for VM1
VM1_USER = "VM1_username"		#Variables for VM1
VM2_HOST = "VM2_hostname_or_IP"		#Variables for VM2
VM2_USER = "VM2_username"		#Variables for VM2

#Function to update the system and install OpenSSH
update_and_install_ssh() {
    echo "Updating system..."
    sudo apt update && sudo apt upgrade -y
    # Remove OpenSSH (if installed) and install OpenSSH
    sudo apt remove -y openssh-server
    sudo apt install -y openssh-server
    echo "OpenSSH installed."
}

#Function to copy public keys to the remote system (VM2)
copy_public_keys() {
 # Assuming the public key is stored in the default location
    echo "Copying public key to VM2..."
    ssh-copy-id $VM2_USER @ $VM2_HOST
}
# Main function to execute the preparation steps
main() {
    update_and_install_ssh
    copy_public_keys
    # SSH into VM2
    echo "SSHing into VM2..."
    ssh $VM2_USER @ $VM2_HOST
}
main

