# ========================
# Global Variables
# ========================
variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}
variable "availability_zones" {
  description = "Optional list of AZs to use."
  type        = list(string)
  default     = []
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "cluster_version" {
  description = "EKS Cluster Kubernetes version"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnets_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

# ========================
# Node Group Variables
# ========================
variable "node_group_desired" {
  description = "Desired number of nodes in the node group"
  type        = number
}

variable "node_group_min" {
  description = "Minimum number of nodes in the node group"
  type        = number
}

variable "node_group_max" {
  description = "Maximum number of nodes in the node group"
  type        = number
}

variable "node_group_instance_types" {
  description = "EC2 instance types for EKS node group"
  type        = list(string)
}

# ========================
# VPC Endpoints Variables
# ========================
variable "create_s3_endpoint" {
  description = "Whether to create a Gateway VPC Endpoint for S3"
  type        = bool
}

variable "create_interface_endpoints" {
  description = "Whether to create Interface Endpoints"
  type        = bool
}

variable "interface_endpoints" {
  description = "List of interface endpoints to create"
  type        = list(string)
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {}
}
