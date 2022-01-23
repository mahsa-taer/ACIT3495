#!/bin/bash

# Uninstall older Docker versions (docker, docker.io, docker-engine)
sudo apt-get remove docker docker-engine docker.io containerd runc

# Update & Upgrade
sudo apt-get update -y && sudo apt-get upgrade -y

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common

# Download and add Docker CE GPG key with the following command
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

# Set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -y docker-ce
# sudo docker run hello-world

# Manage Docker as a non-root user
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker
sudo systemctl status docker
