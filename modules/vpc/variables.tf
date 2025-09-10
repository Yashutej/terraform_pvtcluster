variable "cluster_name" {
  type        = string
  description = "EKS cluster name (used for naming VPC and subnets)"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
}

variable "public_subnets_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
}

variable "private_subnets_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private subnets"
}

variable "availability_zones" {
  type        = list(string)
  default     = []
  description = "List of AZs (if empty, first N AZs will be chosen automatically)"
}

variable "max_azs" {
  type        = number
  default     = 2
  description = "Maximum number of AZs to use if availability_zones not specified"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to VPC resources"
}
