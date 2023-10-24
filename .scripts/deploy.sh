#!/bin/bash

set -e

NODE_PATH=/root/.nvm/versions/node/v18.10.0/bin/node
# PM2_PATH=/root/.nvm/versions/node/v18.10.0/bin/pm2
NPM_PATH=/root/.nvm/versions/node/v18.10.0/bin/npm

echo "Deployment started ..."

# Enter maintenance mode or return true
# if already is in maintenance mode
($NODE_PATH $NPM_PATH run stop --message 'The app is being (quickly!) updated. Please try again in a minute.') || true

# Pull the latest version of the app
git fetch origin master
git reset --hard origin/master
git pull origin master

# Compile npm assets
$NODE_PATH $NPM_PATH install --omit=dev

# Exit maintenance mode
$NODE_PATH $NPM_PATH run start

echo "Deployment finished!"
