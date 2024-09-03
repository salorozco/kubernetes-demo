#!/bin/bash

# Set the log file path
LOG_FILE="restart-log.txt"

# Get the current timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Start logging
echo "Rolling restart initiated at $TIMESTAMP" >> $LOG_FILE

# Loop through each deployment YAML file in the k8s/ directory
for file in k8s/*-deployment.yaml; do
  # Extract the deployment name using `yq` or a more reliable method
  DEPLOYMENT_NAME=$(grep -A1 'kind: Deployment' $file | grep 'name:' | awk '{print $2}')

  if [ ! -z "$DEPLOYMENT_NAME" ]; then
    # Perform the rolling restart
    kubectl rollout restart deployment $DEPLOYMENT_NAME

    # Log the restart
    echo "Deployment $DEPLOYMENT_NAME restarted." >> $LOG_FILE
  else
    echo "No deployment found in $file" >> $LOG_FILE
  fi
done

# Log completion
echo "Rolling restart completed at $(date "+%Y-%m-%d %H:%M:%S")" >> $LOG_FILE
