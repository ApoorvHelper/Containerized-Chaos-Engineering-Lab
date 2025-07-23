#!/bin/bash

HOSTS_FILE="hosts.txt"

while true; do
    if [[ -f "$HOSTS_FILE" ]]; then
        STATUS=$(awk '{print $1}' "$HOSTS_FILE")
        WORKING_NODE=$(awk '{print $2}' "$HOSTS_FILE")

        if [[ "$STATUS" == "Dead" ]]; then
            # Check if the container is already running
            if ! sudo docker ps --format '{{.Names}}' | grep -q "^$WORKING_NODE\$"; then
                echo "Container $WORKING_NODE is not running. Starting it..."
                sudo docker container start "$WORKING_NODE"
            else
                echo "Container $WORKING_NODE is already running. No action taken."
            fi
        else
            echo "Node is alive. No action taken."
        fi
    else
        echo "hosts.txt not found."
    fi

    sleep 5
done
