
#!/bin/bash

# Set the username and the path to the SSH key on the local machine
ssh-keygen -t rsa -b 2048 -f "$HOME/.ssh/id_rsa" -N ""

# Set the list of remote servers
username="ubuntu"
ssh_key_path=/home/ubuntu/.ssh/id_rsa.pub
servers=(
  3.94.203.188
  52.87.243.66
  3.93.220.119
)

# Loop through the servers and copy the SSH key
for server in "${servers[@]}"
do
    echo "Copying SSH key to $server..."
    ssh-copy-id -i $ssh_key_path $username@$server
done