variable "cluster_name" {
  type        = string
  description = "Cluster name prefix"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
}

variable "public_subnets_cidrs" {
  type        = map(string)
  description = "CIDR blocks for public subnets"
}

variable "private_subnets_cidrs" {
  type        = map(string)
  description = "CIDR blocks for private subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones (optional, can be empty)"
  default     = []
}

variable "max_azs" {
  type        = number
  default     = 2
}

