#!/bin/bash

set -e

ENV=$1

if [ -z "$ENV" ]; then
  echo "Usage: ./plan.sh <env>"
  echo "Example: ./plan.sh dev"
  exit 1
fi

WORKDIR="app"
TFVARS_FILE="${WORKDIR}/envs/${ENV}.tfvars"

if [ ! -f "$TFVARS_FILE" ]; then
  echo "❌ tfvars file for environment '$ENV' not found: $TFVARS_FILE"
  exit 1
fi

cd "$WORKDIR"

echo "🧪 Planning Terraform for environment: $ENV"
terraform init -backend-config="key=${ENV}/terraform.tfstate"
terraform workspace select "$ENV" || terraform workspace new "$ENV"
terraform plan -var-file="envs/${ENV}.tfvars"
