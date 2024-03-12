#!/bin/bash

# Update the Debian apt repositories, install OpenJDK 17, a

sudo apt update -y
sudo apt install fontconfig openjdk-17-jre -y
java -version

# Installing Jenkins
sudo apt-get update -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y

# Start Jenkins Service


sudo systemctl enable jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins