#!/bin/bash
while true; do
    active_users=$(netstat -an | grep ESTABLISHED | wc -l)

    if [ "$active_users" -ge 500 ]; then
        echo "Triggering new server creation..."
        bash scripts/trigger_autoscaling.sh
    fi

    bash scripts/delete_unused_servers.sh
    sleep 60
done
