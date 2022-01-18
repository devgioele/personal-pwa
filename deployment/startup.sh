#!/bin/bash

# Build NextJS image
echo "TOR_PRIVATE_KEY = ${TOR_PRIVATE_KEY}"
docker compose -f docker-compose.prod.yml build

# Start docker compose
docker compose up -d