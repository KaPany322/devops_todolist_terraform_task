#!/bin/bash
set -euo pipefail

# Script to silently install and start the todo web app on the virtual machine. 
# Note that all commands bellow are without sudo - that's because extention mechanism 
# runs scripts under root user. 

# install system updates and isntall python3-pip package using apt. '-yq' flags are 
# used to suppress any interactive prompts - we won't be able to confirm operation 
# when running the script as VM extention.  
apt-get update -yq
apt-get install -yq python3-pip

# The VM extension downloads and extracts the repository archive to /opt/todo.
mkdir -p /app
cp -a /opt/todo/app/. /app/
chmod +x /app/start.sh

# create a service for the app via systemctl and start the app
mv /app/todoapp.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable todoapp
systemctl restart todoapp
