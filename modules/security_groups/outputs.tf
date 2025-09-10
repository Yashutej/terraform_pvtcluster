output "worker_security_group_id" {
  value       = aws_security_group.workers.id
  description = "Security group ID for EKS worker nodes"
}
