#!/bin/bash

set -e

echo "Stopping existing containers..."
cd /home/ubuntu/app-deploy

# Stop and remove containers if running
docker compose -f prod.yml down || true
echo "Existing containers stopped."