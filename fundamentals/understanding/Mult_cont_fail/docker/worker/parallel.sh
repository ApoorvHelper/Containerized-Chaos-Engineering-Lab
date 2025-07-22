#!/bin/bash

IMAGE_NAME="setup"
NETWORK_NAME="mult-cont"
SHARE_PATH="$PWD/../../share"

# Build Docker image
echo "🔧 Building Docker image '$IMAGE_NAME'..."
sudo docker build -t "$IMAGE_NAME" .

# Function to launch a container in a new terminal
launch_container() {
  local node_name=$1

  # Check if container already exists
  if sudo docker container inspect "$node_name" > /dev/null 2>&1; then
    echo "⚠️ Container '$node_name' already exists. Skipping creation."
  else
    echo "🚀 Launching '$node_name' in a new terminal..."
    gnome-terminal -- bash -c "
      sudo docker container run -it \
        --name $node_name \
        --hostname $node_name \
        --network $NETWORK_NAME \
        -v $SHARE_PATH:/share \
        $IMAGE_NAME
      exec bash"
  fi
}

# Launch both nodes
launch_container "master-node"
launch_container "working-node"
