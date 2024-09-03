#!/bin/bash

# Delete all Kubernetes resources defined in the k8s/ directory
kubectl delete -f k8s/

# Print a confirmation message
echo "All pods and resources defined in k8s/ have been deleted."
