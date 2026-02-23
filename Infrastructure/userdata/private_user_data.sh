#!/bin/bash
set -e
# Log everything
exec > /var/log/user-data.log 2>&1

until ping -c1 archive.ubuntu.com &>/dev/null; do sleep 2; done

echo "Starting Jenkins setup..."
sudo apt clean
sudo rm -rf /var/lib/apt/lists/*


#Jenkins installation
sudo apt update -y

sudo apt install -y openjdk-21-jdk

mkdir -p /etc/apt/keyrings

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update -y

sudo apt install jenkins -y

systemctl enable jenkins
systemctl start jenkins



echo "Jenkins setup completed"
echo "Jenkins setup completed"
echo "Jenkins setup completed"
echo "Jenkins setup completed"
echo "Jenkins setup completed"



#Install aws cli 

sudo apt install curl unzip -y

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip

unzip awscliv2.zip
sudo ./aws/install 

echo "AWS setup completed"
echo "AWS setup completed"
echo "AWS setup completed"
echo "AWS setup completed"
echo "AWS setup completed"


#Install docker

sudo apt-get update
sudo apt-get install ca-certificates 
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

echo "Docker setup completed"
echo "Docker setup completed"
echo "Docker setup completed"
echo "Docker setup completed"
echo "Docker setup completed"

sudo usermod -aG docker jenkins
sudo systemctl restart jenkins

echo "Usermod for Jenkins completed"
echo "Usermod for Jenkins completed"  
echo "Usermod for Jenkins completed"


wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

echo "Terraform installation completed"
echo "Terraform installation completed"
echo "Terraform installation completed"


echo "ALL INSTALLATIONS COMPLETED"
echo "ALL INSTALLATIONS COMPLETED"
echo "ALL INSTALLATIONS COMPLETED"
echo "ALL INSTALLATIONS COMPLETED"
echo "ALL INSTALLATIONS COMPLETED"
echo "ALL INSTALLATIONS COMPLETED"
echo "ALL INSTALLATIONS COMPLETED"
echo "ALL INSTALLATIONS COMPLETED"
echo "ALL INSTALLATIONS COMPLETED"
echo "ALL INSTALLATIONS COMPLETED"


