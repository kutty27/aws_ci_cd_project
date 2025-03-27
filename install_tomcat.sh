#!/bin/bash

# Update system packages
sudo yum update -y

# Install Java 17 (Amazon Corretto)
sudo yum install java-17-amazon-corretto-devel -y

# Download Apache Tomcat from S3 bucket
if ! aws s3 cp s3://webapp-bucket-27-03/apache-tomcat-9.0.75-windows-x64.zip apache-tomcat-9.0.75.zip; then
  echo "ERROR: Failed to download Tomcat from S3" >&2
  exit 1
fi

# Extract Tomcat
sudo unzip apache-tomcat-9.0.75.zip 

# Move Tomcat to /opt directory
sudo mkdir -p /opt/tomcat
sudo mv apache-tomcat-9.0.75 /opt/tomcat/

# Grant execution permissions to Tomcat scripts
sudo chmod +x /opt/tomcat/apache-tomcat-9.0.75/bin/*.sh

# Start Tomcat
/opt/tomcat/apache-tomcat-9.0.75/bin/startup.sh

echo "Tomcat 9 installed and started successfully!"
