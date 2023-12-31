#!/bin/bash

# Install docker and all necessary packages
sudo apt update
sudo apt install -y curl
sudo apt install -y apt-transport-https ca-certificates
sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Run docker without the need for root
sudo usermod -aG docker $USER

# Install Portainer
docker volume create portainer_data
sudo docker pull portainer/portainer-ce
docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

echo "Docker and Portainer have been installed. Please log out and log back in to use Docker without sudo."
