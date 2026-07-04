#############################################
# Network
#############################################

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public Subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private Subnet IDs"
  value       = module.vpc.private_subnet_ids
}

#############################################
# IAM
#############################################

output "cluster_role_arn" {
  description = "Cluster IAM Role ARN"
  value       = module.iam.cluster_role_arn
}

output "node_role_arn" {
  description = "Node IAM Role ARN"
  value       = module.iam.node_role_arn
}

#############################################
# EKS
#############################################

output "cluster_name" {
  description = "EKS Cluster Name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS Cluster Endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Cluster Security Group ID"
  value       = module.eks.cluster_security_group_id
}

output "node_security_group_id" {
  description = "Node Security Group ID"
  value       = module.eks.node_security_group_id
}

output "oidc_provider_arn" {
  description = "OIDC Provider ARN"
  value       = module.eks.oidc_provider_arn
}

#############################################
# Addons
#############################################

output "vpc_cni_addon_arn" {
  value = module.addons.vpc_cni_addon_arn
}

output "coredns_addon_arn" {
  value = module.addons.coredns_addon_arn
}

output "kube_proxy_addon_arn" {
  value = module.addons.kube_proxy_addon_arn
}
