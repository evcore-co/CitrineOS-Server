#!/usr/bin/env bash

ROOT=$(pwd)

cd $ROOT/citrineos-core/Server
npm run start

# COMPOSE_FILE="docker-compose.yml"

# if [ ! -f "$COMPOSE_FILE" ]; then
#   echo "Docker Compose file not found!"
#   exit 1
# fi

# STATUS=$(docker compose ps --services --filter "status=running")

# if [ -z "$STATUS" ]; then
#   echo "No containers are running."
#   docker compose -f ./docker-compose.yml up -
# else
#   echo "The following containers are up and running:"
#   echo "$STATUS"
# fi
