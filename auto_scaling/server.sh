#!/bin/bash

sudo yum -y install httpd
sudo systemctl start httpd --now
sudo systemctl enable httpd --now

sudo yum -y install firewalld
sudo systemctl start firewalld --now
sudo systemctl enable firewalld --now

setenforce 0

sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-port=3000/tcp
sudo firewall-cmd --reload

echo aws instance test > /var/www/html/index.html
