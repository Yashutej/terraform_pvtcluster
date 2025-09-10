variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where EKS is deployed"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block to allow communication with control plane"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to security group"
}
