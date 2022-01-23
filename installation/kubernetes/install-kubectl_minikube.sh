#!/bin/bash


# Update all system packages to the latest release
sudo apt-get update && sudo apt-get install apt-transport-https && sudo apt-get upgrade


# Install KVM or VirtualBox Hypervisor (For VirtualBox users)
sudo apt install virtualbox virtualbox-ext-pack

# Download minikube (Binary package)
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube

# Confirm version installed
minikube version

# Install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

chmod +x ./kubectl

# Move the binary in to PATH
sudo mv ./kubectl /usr/local/bin/kubectl

# Confirm version installed
kubectl version -o json  --client

# Start minikube
minikube start

# Check cluster status
kubectl cluster-info

# View Config (Minikube configuration file is located under ~/.minikube/machines/minikube/config.json)
kubectl config view

# Check running nodes
kubectl get nodes


# Stop minikube (stop a running local kubernetes cluster)
# minikube stop

# Delete a local kubernetes cluster
# minikube delete

# Enable kubernetes dashboard
# minikube addons list

# Open directly on your default browser
# minikube dashboard

# Get the URL of the dashboard
# minikube dashboard --url
