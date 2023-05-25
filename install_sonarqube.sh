#!/bin/bash

# Update package lists
sudo apt-get update

# Install prerequisites
sudo apt-get install -y openjdk-11-jdk unzip

# Download and extract SonarQube
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.2.1.47736.zip
unzip sonarqube-9.2.1.47736.zip

# Move SonarQube directory to /opt
sudo mv sonarqube-9.2.1.47736 /opt/sonarqube

# Configure SonarQube
sudo sed -i 's|#sonar.jdbc.username=|sonar.jdbc.username=sonarqube|' /opt/sonarqube/conf/sonar.properties
sudo sed -i 's|#sonar.jdbc.password=|sonar.jdbc.password=sonarqube|' /opt/sonarqube/conf/sonar.properties
sudo sed -i 's|#sonar.jdbc.url=jdbc:mysql://localhost:3306/sonar?useUnicode=true&amp;characterEncoding=utf8|sonar.jdbc.url=jdbc:mysql://localhost:3306/sonarqube?useUnicode=true&amp;characterEncoding=utf8|' /opt/sonarqube/conf/sonar.properties

# Start SonarQube
sudo /opt/sonarqube/bin/linux-x86-64/sonar.sh start

# Wait for SonarQube to start
sleep 60

# Check SonarQube status
sudo /opt/sonarqube/bin/linux-x86-64/sonar.sh status
