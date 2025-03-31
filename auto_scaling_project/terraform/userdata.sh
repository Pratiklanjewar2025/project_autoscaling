#!/bin/bash
sudo apt update -y
sudo apt install -y nginx docker.io
systemctl start nginx
systemctl enable nginx
docker run -d -p 80:80 your-docker-image
