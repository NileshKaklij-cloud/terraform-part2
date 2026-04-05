#!/bin/bash
apt update -y
apt install -y python3 python3-pip nodejs npm

pip3 install flask

# Flask app
cat <<EOF > /home/ubuntu/app.py
from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "Flask Running"

app.run(host="0.0.0.0", port=5000)
EOF

nohup python3 /home/ubuntu/app.py &

# Express app
mkdir /home/ubuntu/nodeapp
cd /home/ubuntu/nodeapp

npm init -y
npm install express

cat <<EOF > index.js
const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Express Running');
});

app.listen(3000, '0.0.0.0');
EOF

nohup node index.js &
