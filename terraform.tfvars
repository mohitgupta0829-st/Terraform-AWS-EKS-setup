aws_region = "ap-south-1"

project_name = "terraform-eks"

vpc_cidr = "10.0.0.0/16"

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnet_cidrs = [
  "10.0.11.0/24",
  "10.0.12.0/24"
]

capacity_type = "ON_DEMAND"

disk_size = 20

cluster_endpoint_public_access  = true
cluster_endpoint_private_access = true

enabled_cluster_log_types = [
  "api",
  "audit",
  "authenticator"
]
