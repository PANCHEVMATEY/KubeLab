#!/bin/bash

set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <env>"
  exit 1
fi

ENV=$1
AWS_REGION="eu-central-1"
NAMESPACE="demo-app"
CLUSTER_NAME="eks-cluster-$ENV"

echo "Updating kubeconfig for EKS cluster..."
aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME

echo "Applying Kubernetes manifests..."

cd app/k8-manifest

kubectl apply -n "$NAMESPACE" -f psql-pvc.yaml
kubectl apply -n "$NAMESPACE" -f psql-deployment.yaml
kubectl apply -n "$NAMESPACE" -f psql-service.yaml

kubectl apply -n "$NAMESPACE" -f app-deployment.yaml
kubectl apply -n "$NAMESPACE" -f app-service.yaml



echo "Deployment complete."
