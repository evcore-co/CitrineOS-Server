#!/usr/bin/env bash

ROOT=$(pwd)

cd $ROOT/citrineos-core/Server

COMPOSE_FILE="docker-compose.yml"

if [ ! -f "$COMPOSE_FILE" ]; then
  echo "Docker Compose file not found!"
  exit 1
fi

STATUS=$(docker compose ps --services --filter "status=running")

if [ -n "$STATUS" ]; then
  docker compose -f ./docker-compose.yml down
fi
