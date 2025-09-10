# AWS Region
aws_region = "ap-south-1"

# EKS Cluster
cluster_name = "private-eks"

# VPC & Subnets
vpc_cidr              = "10.0.0.0/16"
public_subnets_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

# VPC Endpoints
create_s3_endpoint         = true
create_interface_endpoints = true
interface_endpoints        = ["ecr.api", "ecr.dkr", "sts", "logs"]

# EKS Node Group Config
desired_capacity = 2
max_capacity     = 3
min_capacity     = 1
instance_types   = ["t3.medium"]
