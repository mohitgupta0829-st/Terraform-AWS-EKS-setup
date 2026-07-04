variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
  default     = "eks-cluster"
}

variable "kubernetes_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.33"
}

variable "cluster_endpoint_public_access" {
  description = "Enable public access to the EKS API endpoint"
  type        = bool
  default     = true
}

variable "cluster_endpoint_private_access" {
  description = "Enable private access to the EKS API endpoint"
  type        = bool
  default     = true
}

variable "enabled_cluster_log_types" {
  description = "EKS control plane logs to enable"
  type        = list(string)

  default = [
    "api",
    "audit",
    "authenticator"
  ]
}
