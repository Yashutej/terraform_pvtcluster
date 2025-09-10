variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "cluster_version" {
  type        = string
  default     = "1.27"
  description = "EKS cluster version"
}

variable "aws_region" {
  type        = string
  description = "AWS region for the cluster"
}

variable "cluster_role_arn" {
  type        = string
  description = "IAM role ARN for EKS cluster"
}

variable "node_role_arn" {
  type        = string
  description = "IAM role ARN for EKS node group"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for EKS cluster"
}

variable "node_group_desired" {
  type        = number
  default     = 2
  description = "Desired size of EKS node group"
}

variable "node_group_min" {
  type        = number
  default     = 1
  description = "Minimum size of EKS node group"
}

variable "node_group_max" {
  type        = number
  default     = 3
  description = "Maximum size of EKS node group"
}

variable "node_group_instance_types" {
  type        = list(string)
  default     = ["t3.medium"]
  description = "Instance types for EKS node group"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for EKS resources"
}

variable "cluster_policy_attachments" {
  type        = list(any)
  description = "List of IAM role policy attachments to wait on before creating cluster"
}
