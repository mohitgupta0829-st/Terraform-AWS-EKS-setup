output "cluster_role_arn" {
  description = "EKS Cluster Role ARN"
  value       = aws_iam_role.eks_cluster.arn
}

output "cluster_role_name" {
  description = "EKS Cluster Role Name"
  value       = aws_iam_role.eks_cluster.name
}

output "node_role_arn" {
  description = "EKS Node Group Role ARN"
  value       = aws_iam_role.node_group.arn
}

output "node_role_name" {
  description = "EKS Node Group Role Name"
  value       = aws_iam_role.node_group.name
}
