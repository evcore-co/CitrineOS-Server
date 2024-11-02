#!/usr/bin/env bash

ROOT=$(pwd)

# Step 1: Automatically detect the IP address for the 'wlp4s0' interface or default interface.
# Modify 'wlp4s0' if your system uses a different network interface.
IP_ADDR=$(ip -4 addr show wlp4s0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

# If IP address detection fails, fall back to 'docker0' or prompt the user to input the IP manually.
if [ -z "$IP_ADDR" ]; then
    echo "Could not automatically detect IP address on wlp4s0. Trying docker0."
    IP_ADDR=$(ip -4 addr show docker0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    if [ -z "$IP_ADDR" ]; then
        echo "Could not detect IP address on docker0. Please input an IP address to use for Swarm:"
        read -r IP_ADDR
    fi
fi

echo "Using IP address: $IP_ADDR for Docker Swarm initialization"

# Step 2: Initialize Docker Swarm with the specified IP address.
docker swarm init --advertise-addr "$IP_ADDR" 2>/dev/null

# Check if Swarm initialization was successful
if [ $? -ne 0 ]; then
    echo "Docker Swarm already initialized or failed to initialize. Continuing with deployment."
else
    echo "Docker Swarm initialized successfully."
fi

# Step 3: Deploy the CitrineOS stack using the Docker Swarm compose file
STACK_NAME="citrineos"

cd $ROOT/citrineos-core/Server

echo "Deploying CitrineOS stack using docker-compose.swarm.yml"
docker stack deploy -c docker-compose.swarm.yml $STACK_NAME

# Step 4: Check the status of the deployment
echo "Checking the status of the deployed services:"
docker stack services $STACK_NAME

echo "Deployment complete. To remove the stack, run: docker stack rm $STACK_NAME"
