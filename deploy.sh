#!/bin/bash

# Stop Tomcat before deploying
/opt/tomcat/apache-tomcat-9.0.75/bin/shutdown.sh

# Ensure old deployment is removed
sudo rm -rf /opt/tomcat/apache-tomcat-9.0.75/webapps/ProductManipulation*

# Download the new WAR file from S3
aws s3 cp s3://webapp-bucket-27-03/ProductManipulation.war /tmp/ProductManipulation.war

# Move the new WAR file to Tomcat's webapps folder
sudo mv /tmp/ProductManipulation.war /opt/tomcat/apache-tomcat-9.0.75/webapps/

# Start Tomcat after deployment
/opt/tomcat/apache-tomcat-9.0.75/bin/startup.sh

echo "Deployment completed successfully!"
