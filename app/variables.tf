variable "env" {
  description = "Environment name (e.g., dev, stage, prod)"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}
variable "availability_zone_a" {}
variable "availability_zone_b" {}
variable "availability_zone_c" {}
