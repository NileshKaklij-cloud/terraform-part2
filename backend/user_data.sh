#!/bin/bash
apt update -y
apt install -y python3-pip git

cd /home/ubuntu
git clone https://github.com/NileshKaklij-cloud/ec2-terraform-repo.git
cd backend-repo

pip3 install -r requirements.txt

nohup python3 app.py > output.log 2>&1 &
