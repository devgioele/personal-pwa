#!/bin/bash

echo "Arguments:"
for i in "$@"; do
  echo "$i"
done

# Quit if wrong number of args
if [ "$#" -ne 2 ]; then
    echo "Illegal number of arguments!"
    exit 1
fi

# Remove running containers
# shellcheck disable=SC2046
sudo docker rm -f $(sudo docker ps -a -q)
# Take TOR private key and export it
export TOR_PRIVATE_KEY="$1"
# Build and start containers
sudo docker-compose -f "$2" up -d