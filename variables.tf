# 🌍 AWS Region
variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
}

# 🏗️ EKS Cluster
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

# 🌐 VPC & Subnets
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnets_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

# 🔗 VPC Endpoints
variable "create_s3_endpoint" {
  description = "Whether to create an S3 Gateway Endpoint"
  type        = bool
}

variable "create_interface_endpoints" {
  description = "Whether to create interface endpoints for services like ECR, STS, etc."
  type        = bool
}

variable "interface_endpoints" {
  description = "List of interface endpoints to create"
  type        = list(string)
}

# 🖥️ EKS Node Group Config
variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "max_capacity" {
  description = "Maximum number of worker nodes"
  type        = number
}

variable "min_capacity" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "instance_types" {
  description = "EC2 instance types for the EKS node group"
  type        = list(string)
}
