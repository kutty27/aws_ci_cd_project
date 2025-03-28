#!/bin/bash

# Stop Tomcat
/opt/tomcat/apache-tomcat-9.0.75/bin/shutdown.sh
sleep 5

# Remove the existing WAR file and exploded directory
rm -rf /opt/tomcat/apache-tomcat-9.0.75/webapps/ProductManipulation.war
rm -rf /opt/tomcat/apache-tomcat-9.0.75/webapps/ProductManipulation/

# Start Tomcat
/opt/tomcat/apache-tomcat-9.0.75/bin/startup.sh
