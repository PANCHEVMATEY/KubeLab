#!/bin/bash

set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <env>"
  exit 1
fi

ENV=$1
AWS_REGION="eu-central-1"
CLUSTER_NAME="eks-cluster-$ENV"

echo "Updating kubeconfig for EKS cluster..."
aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME

echo "Applying Kubernetes manifests..."

cd app/k8-manifest

kubectl apply -f psql-pvc.yaml
kubectl apply -f psql-deployment.yaml
kubectl apply -f psql-service.yaml

kubectl apply -f app-deployment.yaml
kubectl apply -f app-service.yaml


echo "Deployment complete."
