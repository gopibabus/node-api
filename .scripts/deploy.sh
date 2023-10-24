#!/bin/bash

set -e

NODE_PATH=/root/.nvm/versions/node/v18.10.0/bin/node
PM2_PATH=/root/.nvm/versions/node/v18.10.0/bin/pm2
NPM_PATH=/root/.nvm/versions/node/v18.10.0/bin/npm

echo "Deployment started ..."

# Enter maintenance mode or return true if already in maintenance mode
($NODE_PATH $PM2_PATH stop server.js) || true

# Pull the latest version of the app
git fetch origin master
git reset --hard origin/master
git pull origin master

# Compile npm assets
$NODE_PATH $NPM_PATH install --omit=dev

# Exit maintenance mode
($NODE_PATH $PM2_PATH start server.js)

echo "Deployment finished!"
