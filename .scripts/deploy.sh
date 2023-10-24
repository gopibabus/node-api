#!/bin/bash

set -e

echo "Deployment started ..."

# Enter maintenance mode or return true
# if already is in maintenance mode
(pm2 stop server.js --message 'The app is being (quickly!) updated. Please try again in a minute.') || true

# Pull the latest version of the app
git fetch origin master
git reset --hard origin/master
git pull origin master

# Compile npm assets
npm install --omit=dev

# Exit maintenance mode
pm2 start server.js

echo "Deployment finished!"
