#!/bin/bash

# Nginx is the one that needs to be running,

# Check if Apache2 is running
if ps -aux | grep apache2 | grep -v grep > /dev/null
then
    echo "Apache is running"
    echo "Going to stop it..."
    sudo systemctl stop apache2
    if [ $? -eq 0 ]
	then
	    echo "apache2 service stopped successfully"
	else
	    echo "apache2 service could not be stopped"
    fi
else
    echo "Apache2 is not running"
fi

# Check if Nginx is running
if ps -aux | grep nginx | grep -v grep > /dev/null
then
    echo "Nginx is running"
else
    echo "nginx is not running"
    echo "Going to start the service..."
    sudo systemctl start nginx
    if [ $? -eq 0 ]
	then
	    echo "nginx service started successfully"
	else
	    echo "nginx service could not be started"
    fi
fi

