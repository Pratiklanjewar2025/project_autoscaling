#!/bin/bash
instances=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,State.Name]' --output text)

for instance in $instances; do
    instance_id=$(echo $instance | awk '{print $1}')
    state=$(echo $instance | awk '{print $2}')

    if [ "$state" == "running" ]; then
        active_users=$(netstat -an | grep ESTABLISHED | wc -l)
        if [ "$active_users" -eq 0 ]; then
            echo "Terminating instance: $instance_id (No active users)"
            aws ec2 terminate-instances --instance-ids "$instance_id"
        fi
    fi
done
