#!/bin/bash
# Update the package index
sudo apt update
# Install prerequisites
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
# Add Docker GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# Add Docker repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# Update the package index again
sudo apt update
# Install Docker
sudo apt install -y docker-ce docker-ce-cli containerd.io
# Add the current user to the "docker" group to avoid using sudo with Docker commands
sudo usermod -aG docker $USER
# Install Portainer via Docker
docker volume create portainer_data
docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
echo "Docker and Portainer have been installed. Please log out and log back in to use Docker without sudo."
