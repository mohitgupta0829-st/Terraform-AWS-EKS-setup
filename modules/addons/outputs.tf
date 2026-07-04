output "vpc_cni_addon_arn" {
  description = "VPC CNI Addon ARN"
  value       = aws_eks_addon.vpc_cni.arn
}

output "coredns_addon_arn" {
  description = "CoreDNS Addon ARN"
  value       = aws_eks_addon.coredns.arn
}

output "kube_proxy_addon_arn" {
  description = "Kube Proxy Addon ARN"
  value       = aws_eks_addon.kube_proxy.arn
}
