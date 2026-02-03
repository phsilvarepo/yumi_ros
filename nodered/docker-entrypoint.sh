#!/bin/bash

# Install dependencies if package.json exists and node_modules is empty
if [ -f /data/package.json ]; then
    echo "Checking for Node-RED dependencies..."
    if [ ! -d /data/node_modules ] || [ -z "$(ls -A /data/node_modules 2>/dev/null)" ]; then
        echo "Installing Node-RED dependencies from package.json..."
        cd /data && npm install
    else
        echo "Dependencies already installed, skipping..."
    fi
fi

# Start Node-RED with settings file
exec node-red --userDir /data --settings /data/settings.js
