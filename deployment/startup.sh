#!/bin/bash

# Build and start containers
echo "$1"
sudo docker-compose -f "$1" up -d