
DIST_BASE="debian"

apt-get update
apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/$DIST_BASE/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$DIST_BASE $(lsb_release -cs) stable"
apt-get install -y docker-ce docker-ce-cli containerd.io

docker run hello-world
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

apt-get install -y docker-compose