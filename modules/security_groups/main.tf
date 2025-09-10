resource "aws_security_group" "workers" {
  name        = "${var.cluster_name}-workers-sg"
  description = "Security group for EKS worker nodes"
  vpc_id      = var.vpc_id

  # Allow nodes to talk to each other
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
    description = "Allow intra-node communication"
  }

  # Allow nodes to talk to cluster control plane (port 443)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
    description = "Allow nodes to reach control plane"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name = "${var.cluster_name}-workers-sg"
    },
    var.tags
  )
}
