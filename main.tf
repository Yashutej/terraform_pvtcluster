module "iam" {
  source       = "./modules/iam"
  cluster_name = "private-eks"
}

module "eks" {
  source = "./modules/eks"

  cluster_name               = "private-eks"
  cluster_version            = "1.27"
  aws_region                 = "ap-south-1"
  cluster_role_arn           = module.iam.eks_cluster_role_arn
  node_role_arn              = module.iam.node_group_role_arn
  private_subnet_ids         = aws_subnet.private[*].id
  node_group_desired         = 2
  node_group_min             = 1
  node_group_max             = 3
  node_group_instance_types  = ["t3.medium"]
  tags                       = { Environment = "dev" }
  cluster_policy_attachments = module.iam.eks_cluster_policy_attachments
}
module "security_groups" {
  source       = "./modules/security_groups"
  cluster_name = "private-eks"
  vpc_id       = aws_vpc.this.id
  vpc_cidr     = var.vpc_cidr
  tags         = { Environment = "dev" }
}

module "vpc_endpoints" {
  source = "./modules/vpc_endpoints"

  cluster_name         = var.cluster_name
  aws_region          = var.aws_region
  vpc_id              = module.vpc.vpc_id
  vpc_cidr            = var.vpc_cidr
  private_subnet_ids  = module.vpc.private_subnet_ids
  route_table_ids     = [module.vpc.public_route_table_id, module.vpc.private_route_table_id]

  create_s3_endpoint          = true
  create_interface_endpoints  = true
  interface_endpoints         = ["ecr.api", "ecr.dkr", "sts", "logs"]
  tags                       = { Environment = "dev" }
}
