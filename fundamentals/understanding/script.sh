#!bin/bash

trap 'echo "🔔 Caught SIGTERM. Gracefully exiting..."; exit' SIGTERM
while true; do
  echo "⏳ Still running..."
  sleep 2
done

