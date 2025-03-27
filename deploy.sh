#!/bin/bash
sudo yum update -y
# Install Java 17 (Amazon Corretto)
sudo yum install java-17-amazon-corretto-devel -y
wget https://github.com/kutty27/ProductManipulation/blob/main/apache-tomcat-9.0.75-windows-x64.zip
unzip apache-tomcat-9.0.75-windows-x64.zip
# Extract Tomcat
unzip apache-tomcat-9.0.75-windows-x64.zip
# Move Tomcat to /opt directory
sudo mkdir /opt/tomcat
sudo mv apache-tomcat-9.0.75 /opt/tomcat
# Grant execution permissions to Tomcat scripts
sudo chmod +x /opt/tomcat/apache-tomcat-9.0.75/bin/*.sh
# Download WAR file from S3 bucket
aws s3 cp s3://webapp-bucket-27-03/ProductManipulation.war /opt/tomcat/apache-tomcat-9.0.75/webapps/
# Start Tomcat server
/opt/tomcat/apache-tomcat-9.0.75/bin/startup.sh
