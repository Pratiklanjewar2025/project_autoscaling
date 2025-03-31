#!/bin/bash

THRESHOLD=500  # Maximum users per server before scaling
CHECK_INTERVAL=30  # Check every 30 seconds

while true; do
    ACTIVE_CONNECTIONS=$(curl -s http://localhost/nginx_status | awk '/Active connections:/ {print $3}')
    
    echo "Current active connections: $ACTIVE_CONNECTIONS"

    if [ "$ACTIVE_CONNECTIONS" -gt "$THRESHOLD" ]; then
        echo "Threshold exceeded! Triggering server scale-up..."
        cd terraform
        terraform apply -auto-approve
    fi

    sleep $CHECK_INTERVAL
done

