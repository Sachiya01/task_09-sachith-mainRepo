#!/bin/bash
set -e
# Log everything
exec > /var/log/user-data.log 2>&1

until ping -c1 archive.ubuntu.com &>/dev/null; do sleep 2; done

echo "Starting Jenkins setup..."
sudo apt clean
sudo rm -rf /var/lib/apt/lists/*



# Update system
sudo apt update -y

# Install Java
sudo apt install -y openjdk-21-jdk

# Create keyrings directory
mkdir -p /etc/apt/keyrings

# Add Jenkins GPG key
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

# Add Jenkins repository (THIS WAS MISSING / WRONG)
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update again so Jenkins appears
sudo apt update -y

# Install Jenkins
sudo apt install jenkins -y

# Enable and start Jenkins
systemctl enable jenkins
systemctl start jenkins

echo "Jenkins setup completed"
