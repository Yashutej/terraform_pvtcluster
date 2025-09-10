output "eks_cluster_role_arn" {
  value       = aws_iam_role.eks_cluster.arn
  description = "IAM Role ARN for EKS cluster"
}

output "eks_cluster_policy_attachments" {
  value = [
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSServicePolicy
  ]
}

output "node_group_role_arn" {
  value       = aws_iam_role.node_group.arn
  description = "IAM Role ARN for node group"
}
