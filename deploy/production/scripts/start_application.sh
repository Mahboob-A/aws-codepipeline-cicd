#!/bin/bash

set -e

echo "Starting application via Docker Compose..."
cd /home/ubuntu

# Ensure network exists
docker network create production-todo-app-network || true

# Start containers
docker compose -f prod.yml up -d
