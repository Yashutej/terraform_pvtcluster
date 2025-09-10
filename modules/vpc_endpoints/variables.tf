variable "cluster_name" {
  type        = string
  description = "Cluster name for tagging"
}

variable "aws_region" {
  type        = string
  description = "AWS region where endpoints are created"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID to attach endpoints to"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block for security group rules"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for interface endpoints"
}

variable "route_table_ids" {
  type        = list(string)
  description = "List of route table IDs for S3 gateway endpoint"
}

variable "create_s3_endpoint" {
  type        = bool
  default     = true
  description = "Whether to create S3 gateway endpoint"
}

variable "create_interface_endpoints" {
  type        = bool
  default     = true
  description = "Whether to create interface endpoints"
}

variable "interface_endpoints" {
  type        = list(string)
  default     = ["ecr.api", "ecr.dkr", "sts", "logs", "ec2"]
  description = "List of interface endpoints to create"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags to apply to resources"
}
