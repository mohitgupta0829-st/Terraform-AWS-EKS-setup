#############################################
# Node Security Group
#############################################

resource "aws_security_group" "node" {
  name        = "${var.name}-node-sg"
  description = "Security group for EKS worker nodes"
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-node-sg"
    }
  )
}

#############################################
# Node SG - Ingress (Node to Node)
#############################################

resource "aws_vpc_security_group_ingress_rule" "node_to_node" {
  security_group_id            = aws_security_group.node.id
  referenced_security_group_id = aws_security_group.node.id

  ip_protocol = "-1"

  description = "Node to Node communication"
}

#############################################
# Node SG - Outbound
#############################################

resource "aws_vpc_security_group_egress_rule" "node_outbound" {
  security_group_id = aws_security_group.node.id

  ip_protocol = "-1"

  cidr_ipv4 = "0.0.0.0/0"

  description = "Allow all outbound traffic"
}

#############################################
# EKS Cluster
#############################################

resource "aws_eks_cluster" "this" {

  name     = var.cluster_name
  role_arn = var.cluster_role_arn
  version  = var.kubernetes_version

  enabled_cluster_log_types = var.enabled_cluster_log_types

  vpc_config {

    subnet_ids = var.private_subnet_ids

    endpoint_public_access  = var.cluster_endpoint_public_access
    endpoint_private_access = var.cluster_endpoint_private_access

    security_group_ids = []
  }

  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

  tags = merge(
    var.tags,
    {
      Name = var.cluster_name
    }
  )
}
#############################################
# Managed Node Group
#############################################

resource "aws_eks_node_group" "this" {

  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.name}-nodegroup"
  node_role_arn   = var.node_role_arn

  subnet_ids = var.private_subnet_ids

  instance_types = var.instance_types
  capacity_type  = var.capacity_type
  disk_size      = var.disk_size

  scaling_config {

    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size

  }

  update_config {

    max_unavailable = 1

  }

  ami_type = "AL2023_x86_64_STANDARD"

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-nodegroup"
    }
  )

  depends_on = [
    aws_eks_cluster.this
  ]
}
#############################################
# OIDC Provider
#############################################

data "tls_certificate" "eks" {
  url = aws_eks_cluster.this.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "this" {

  client_id_list = [
    "sts.amazonaws.com"
  ]

  thumbprint_list = [
    data.tls_certificate.eks.certificates[0].sha1_fingerprint
  ]

  url = aws_eks_cluster.this.identity[0].oidc[0].issuer

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-oidc"
    }
  )
}

