provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source              = "./modules/vpc"
  env                 = var.env
  vpc_name            = var.vpc_name
  cidr_block          = var.vpc_cidr
  aws_region          = var.aws_region
  availability_zone_a = var.availability_zone_a
  availability_zone_b = var.availability_zone_b
  availability_zone_c = var.availability_zone_c
}

module "k8" {
  source               = "./modules/k8"
  env                  = var.env
  cluster_name         = var.cluster_name
  vpc_id               = module.vpc.vpc_id
  public_1a_subnet_id  = module.vpc.public_1a_subnet_id
  public_1b_subnet_id  = module.vpc.public_1b_subnet_id
  private_1a_subnet_id = module.vpc.private_1a_subnet_id
  private_1b_subnet_id = module.vpc.private_1b_subnet_id
  }
