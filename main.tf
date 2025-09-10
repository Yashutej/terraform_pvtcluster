terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.40.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# ========================
# IAM Module
# ========================
module "iam" {
  source       = "./modules/iam"
  cluster_name = var.cluster_name
}

# ========================
# VPC Module
# ========================
module "vpc" {
  source                = "./modules/vpc"
  cluster_name          = var.cluster_name
  #aws_region            = var.aws_region
  vpc_cidr              = var.vpc_cidr
  public_subnets_cidrs  = var.public_subnets_cidrs
  private_subnets_cidrs = var.private_subnets_cidrs
}

# ========================
# EKS Cluster Module
# ========================
module "eks" {
  source = "./modules/eks"

  cluster_name              = var.cluster_name
  cluster_version           = var.cluster_version
  aws_region                = var.aws_region
  cluster_role_arn          = module.iam.eks_cluster_role_arn
  node_role_arn             = module.iam.node_group_role_arn
  private_subnet_ids        = module.vpc.private_subnet_ids
  node_group_desired        = var.node_group_desired
  node_group_min            = var.node_group_min
  node_group_max            = var.node_group_max
  node_group_instance_types = var.node_group_instance_types
  tags                      = var.tags

  cluster_policy_attachments = module.iam.eks_cluster_policy_attachments
}

# ========================
# Security Groups Module
# ========================
module "security_groups" {
  source       = "./modules/security_groups"
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
  vpc_cidr     = var.vpc_cidr
  tags         = var.tags
}

# ========================
# VPC Endpoints Module
# ========================
module "vpc_endpoints" {
  source              = "./modules/vpc_endpoints"
  cluster_name        = var.cluster_name
  aws_region          = var.aws_region
  vpc_id              = module.vpc.vpc_id
  vpc_cidr            = var.vpc_cidr
  private_subnet_ids  = module.vpc.private_subnet_ids
  route_table_ids     = concat(module.vpc.public_route_table_ids, module.vpc.private_route_table_ids)

  create_s3_endpoint         = var.create_s3_endpoint
  create_interface_endpoints = var.create_interface_endpoints
  interface_endpoints        = var.interface_endpoints
  tags                      = var.tags
}
