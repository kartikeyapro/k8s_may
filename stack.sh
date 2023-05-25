#!/bin/bash
TOM_URL=https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz
TOM_HOME_PATH=/opt/apache-tomcat-9.0.75.tar.gz
TOM_WEBAPP=/opt/apache-tomcat-9.0.75/webapps

echo " Downloading java"
wget https://files01.tchspt.com/temp/jdk-9.0.4_linux-x64_bin.rpm

echo " Installing JAVA "
rpm -ivh jdk-9.0.4_linux-x64_bin.rpm

echo "Downloading Tomcat "
wget $TOM_URL -O $TOM_HOME_PATH

echo " Extracting Tomcat "
cd /opt/
tar -xvf $TOM_HOME_PATH 

echo " clear webapps dir"
cd $TOM_WEBAPP
rm -rf *;
