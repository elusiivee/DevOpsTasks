#!/bin/bash
os_system=$(cat /etc/os-release | grep "^NAME=" | cut -d'=' -f2 | tr -d '"')
if [[ $os_system == "Ubuntu" || $os_system == "Debian" ]]; then
	sudo apt upgrade
	sudo apt install apache2 -y
	echo "Apache2 is  installed!"
elif [[ $os_system == "RHEL" || $os_system == "CentOS" ]]; then
	yum update
	yum install httpd
	systemctl start httpd
	echo "Apache2 is  installed!"
else
	echo "Unknown os"
fi
