#!/bin/bash
apt update -y
apt install -y nodejs npm git

cd /home/ubuntu
git clone https://github.com/NileshKaklij-cloud/ec2-terraform-repo.git
cd frontend-repo

npm install

nohup node server.js > output.log 2>&1 &
