#!/bin/bash

WORKER_IP="worker-node"
PORT=80   # Change this to the correct service port if needed

echo " ^=^t^m Checking connectivity to worker node at $WORKER_IP..."

# Step 1: Network-level ping check
if ping -c 1 -W 1 "$WORKER_IP" > /dev/null; then
    echo " ^|^e Worker node is reachable via ping."
else
    echo " ^}^l Worker node is NOT reachable via ping.|Might be killed|"
fi

# Step 2: Service-level HTTP check using curl
#if curl --silent --head --fail "http://$WORKER_IP:$PORT" > /dev/null; then
#   echo " ^|^e Service on worker node is UP and responding on port $PORT."
#else
#    echo " ^}^l Service on port $PORT is NOT responding."
#fi
