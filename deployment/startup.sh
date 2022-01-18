#!/bin/bash

# Debug
echo "TOR_PRIVATE_KEY = ${TOR_PRIVATE_KEY}"
# Build and start containers
docker compose up -f docker-compose.prod.yml -d