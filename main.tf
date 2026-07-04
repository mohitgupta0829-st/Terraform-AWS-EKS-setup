module "vpc" {
  source = "./modules/vpc"

  name = local.name

  vpc_cidr = var.vpc_cidr

  azs = local.azs

  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  tags = local.common_tags
}

module "iam" {
  source = "./modules/iam"

  name = local.name
  tags = local.common_tags
}
module "eks" {
  source = "./modules/eks"

  name = local.name

  cluster_name       = local.name
  kubernetes_version = var.kubernetes_version

  cluster_role_arn = module.iam.cluster_role_arn
  node_role_arn    = module.iam.node_role_arn

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids

  cluster_endpoint_public_access  = var.cluster_endpoint_public_access
  cluster_endpoint_private_access = var.cluster_endpoint_private_access
  enabled_cluster_log_types       = var.enabled_cluster_log_types

  instance_types = var.instance_types
  capacity_type  = var.capacity_type

  desired_size = var.desired_size
  min_size     = var.min_size
  max_size     = var.max_size

  disk_size = var.disk_size

  tags = local.common_tags
}
module "addons" {
  source = "./modules/addons"

  cluster_name = module.eks.cluster_name

  tags = local.common_tags

  depends_on = [
    module.eks
  ]
}
