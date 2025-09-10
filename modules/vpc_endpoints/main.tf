# --- Gateway endpoint for S3 ---
resource "aws_vpc_endpoint" "s3" {
  count             = var.create_s3_endpoint ? 1 : 0
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.route_table_ids

  tags = merge(var.tags, { Name = "${var.cluster_name}-s3-endpoint" })
}

# --- Security group for interface endpoints ---
resource "aws_security_group" "endpoints_sg" {
  count       = var.create_interface_endpoints ? 1 : 0
  name        = "${var.cluster_name}-endpoints-sg"
  description = "Security group for interface endpoints"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr] # Allow only VPC CIDR
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "${var.cluster_name}-endpoints-sg" })
}

# --- Interface endpoints (ECR, DKR, STS, Logs, etc.) ---
resource "aws_vpc_endpoint" "interface_endpoints" {
    for_each = var.create_interface_endpoints ? toset(var.interface_endpoints) : toset([])

  

  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.aws_region}.${each.key}"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = var.private_subnet_ids
  security_group_ids  = [aws_security_group.endpoints_sg[0].id]
  private_dns_enabled = true

  tags = merge(var.tags, { Name = "${var.cluster_name}-${each.key}-endpoint" })
}
