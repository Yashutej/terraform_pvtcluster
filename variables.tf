#######################################
# Global Configuration
#######################################
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "Cluster name prefix for resources"
  type        = string
  default     = "private-eks"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

#######################################
# Availability Zones
#######################################
variable "availability_zones" {
  description = "Optional list of AZs to use. Leave empty to auto-pick."
  type        = list(string)
  default     = []
}

variable "max_azs" {
  description = "Maximum number of AZs to use"
  type        = number
  default     = 2
}

#######################################
# VPC Subnets
#######################################
variable "public_subnets_cidrs" {
  description = "Map of public subnet CIDRs"
  type        = map(string)
}

variable "private_subnets_cidrs" {
  description = "Map of private subnet CIDRs"
  type        = map(string)
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs (optional if creating subnets here)"
  type        = list(string)
  default     = []
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs (optional if creating subnets here)"
  type        = list(string)
  default     = []
}

variable "public_route_table_ids" {
  description = "List of public route table IDs for S3 endpoints (optional)"
  type        = list(string)
  default     = []
}

variable "private_route_table_ids" {
  description = "List of private route table IDs for S3 endpoints"
  type        = list(string)
  default     = []
}

#######################################
# Node Group Configuration
#######################################
variable "node_group_desired" {
  description = "Desired number of nodes in the node group"
  type        = number
  default     = 2
}

variable "node_group_min" {
  description = "Minimum number of nodes in the node group"
  type        = number
  default     = 1
}

variable "node_group_max" {
  description = "Maximum number of nodes in the node group"
  type        = number
  default     = 3
}

variable "node_group_instance_types" {
  description = "EC2 instance types for the node group"
  type        = list(string)
  default     = ["t3.medium"]
}

#######################################
# VPC Endpoint Configuration
#######################################
variable "create_s3_endpoint" {
  description = "Whether to create S3 Gateway endpoint"
  type        = bool
  default     = true
}

variable "create_interface_endpoints" {
  description = "Whether to create interface endpoints"
  type        = bool
  default     = true
}

variable "interface_endpoints" {
  description = "List of interface endpoint services to create (e.g., ecr.api, ecr.dkr, sts, logs)"
  type        = list(string)
  default     = ["ecr.api", "ecr.dkr", "sts", "logs"]
}
