#######################################
# Global Configuration
#######################################
aws_region   = "us-west-1"
cluster_name = "private-eks"
vpc_cidr     = "10.0.0.0/16"

#######################################
# Availability Zones
#######################################
# Leave empty to auto-pick AZs from AWS

availability_zones = ["us-west-1a", "ap-west-1b"]
max_azs = 2
#######################################
# VPC Subnets
#######################################
# Public Subnets (used for NAT Gateway + Internet access)
public_subnets_cidrs = {
  "0" = "10.0.1.0/24"
  "1" = "10.0.2.0/24"
}

# Private Subnets (used for EKS worker nodes)
private_subnets_cidrs = {
  "0" = "10.0.3.0/24"
  "1" = "10.0.4.0/24"
}

# Actual subnet IDs (replace after creation or use terraform outputs)
public_subnet_ids  = ["subnet-xxxxxx0", "subnet-xxxxxx1"]
private_subnet_ids = ["subnet-yyyyyy0", "subnet-yyyyyy1"]

# Route table IDs (replace after creation or use terraform outputs)
public_route_table_ids  = ["rtb-aaaaaa0", "rtb-aaaaaa1"]
private_route_table_ids = ["rtb-bbbbbb0", "rtb-bbbbbb1"]

#######################################
# Node Group Configuration
#######################################
node_group_desired        = 2
node_group_min            = 1
node_group_max            = 3
node_group_instance_types = ["t3.medium"]

#######################################
# VPC Endpoint Configuration
#######################################
create_s3_endpoint         = true
create_interface_endpoints = true
interface_endpoints        = ["ecr.api", "ecr.dkr", "sts", "logs"]

#######################################
# Tagging
#######################################
tags = {
  Environment = "dev"
  Project     = "eks-private-cluster"
  ManagedBy   = "Terraform"
}
