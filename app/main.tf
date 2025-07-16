provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source     = "./modules/vpc"
  env        = var.env
  vpc_name   = var.vpc_name
  cidr_block = var.vpc_cidr
  aws_region = var.aws_region
}

module "k8" {
  source             = "./modules/k8"
  env                = var.env
  cluster_name       = var.cluster_name
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
}
