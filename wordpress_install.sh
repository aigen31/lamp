#!/bin/bash

curl -O https://wordpress.org/latest.zip
unzip latest.zip 
mv wordpress/* ./www
rm latest.zip
docker-compose up -d
sudo chmod -R 777 ./www
