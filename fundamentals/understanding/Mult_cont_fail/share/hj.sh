#!/bin/bash

WORKER_IP="working-node"   # Replace with actual IP or hostname
PORT=80                   # Change this to the correct service port
INTERVAL=5                # Time in seconds between checks

echo "🔍 Starting continuous scan of $WORKER_IP on port $PORT..."
echo "Press Ctrl+C to stop."

while true; do
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    echo -e "\n[$TIMESTAMP] Checking connectivity..."

    # Step 1: Network-level ping check
    if ping -c 1 -W 1 "$WORKER_IP" > /dev/null; then
        echo "✅ Worker node is reachable via ping."
    else
        echo "❌ Worker node is NOT reachable via ping. | Might be killed |"
	echo "Dead $WORKER_IP" > hosts.txt
    fi

    # Step 2: Service-level HTTP check using curl
#    if curl --silent --head --fail "http://$WORKER_IP:$PORT" > /dev/null; then
#        echo "✅ Service on worker node is UP and responding on port $PORT."
#    else
#        echo "⚠️ Service on port $PORT is NOT responding."
#    fi

    sleep "$INTERVAL"
done
