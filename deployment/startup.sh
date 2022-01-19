#!/bin/bash

# Take TOR private key and export it
export TOR_PRIVATE_KEY="$1"
# Build and start containers
sudo docker-compose -f "$2" up -d